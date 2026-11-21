#!/usr/bin/env python3
"""Build the mathematical website from handwritten pages and the actual Lean statement."""
import html
import json
import os
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
PAGES = {"index": "Overview", "statement": "Statement", "proof": "Proof guide",
         "library": "Library", "api": "API", "verification": "Verification"}
DECLARATIONS = [
    ("theoremA", "Criterion/TheoremA", "Theorem A (Theorem 4.5): an essentially small k-linear extriangulated category with no triangulated embedding, with countable local algebraic realizations"),
    ("theoremB", "Criterion/TheoremB", "Theorem B (Theorem 3.1): C(D) has a triangulated embedding iff every projection lim D → D_i is surjective iff it has an algebraic realization"),
    ("theoremB_necessity", "Criterion/Necessity", "Theorem 3.1, (1) ⇒ (2): a triangulated embedding into a category in any universe forces the projections to be surjective"),
    ("proposition_2_3", "Realization/Proposition", "Proposition 2.3: compatible surjections from one vector space give an algebraic realization of C_J"),
    ("corollary_2_4", "Realization/Extriangulated", "Corollary 2.4: C(D) is an essentially small extriangulated category; C_J is extension-closed and realized when J has a largest element"),
    ("proposition_4_4", "CD/Structure", "Proposition 4.4: idempotent complete, Krull–Schmidt, indecomposables X, Y, A_i, P_i with endomorphism ring k, table (4.1), enough injectives, E² = 0"),
    ("proposition_4_6", "Criterion/Bounds", "Proposition 4.6: a countable cofinal subset or finite-dimensional D_i give an algebraic realization"),
    ("Injections.example_4_2", "InverseSystems/Injections", "Example 4.2: injections of countable ordinals into ℕ give a category with no triangulated embedding"),
    ("isAlgebraicTriangulated_homotopyCategory", "Complexes/Frobenius", "The homotopy category of an additive category is algebraic triangulated"),
    ("cd_exists_realizes", "CD/Existence", "Every extension of C(D) is realized (Construction 2.2, Lemma 2.1)"),
    ("isIdempotentComplete_CD", "CD/Idempotents", "C(D) is idempotent complete, by splitting triangular idempotents"),
    ("rank_ext_single", "CD/Indecomposables", "Table (4.1): the dimensions of E between indecomposables"),
    ("linearize_compatible_eq_zero", "InverseSystems/Linearization", "Lemma 4.1: lim k^(S_i) = 0 when lim S = ∅ and countable index sets are bounded"),
    ("Aronszajn.good", "InverseSystems/Aronszajn", "Construction 4.3: the levels of Jech's tree are countable, closed under restriction and have the extension property"),
    ("Aronszajn.system_no_branch", "InverseSystems/Aronszajn", "Construction 4.3: the tree has no branch"),
]


def main():
    subprocess.run(["python3", str(ROOT / "scripts/generate_challenge.py"), "--check"], check=True)
    commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
    dirty = bool(subprocess.check_output(["git", "status", "--porcelain"], cwd=ROOT, text=True))
    repo_url = "https://github.com/haruhisa-enomoto/extriangulated-triangulated-embedding"
    source_url = repo_url + "/blob/" + ("main" if dirty else commit)
    statement = (ROOT / "Challenge.lean").read_text()
    output = ROOT / "_site"
    output.mkdir(exist_ok=True)
    shutil.copytree(ROOT / "website/assets", output / "assets", dirs_exist_ok=True)
    api = ROOT / "docbuild/.lake/build/doc"
    api_state_path = ROOT / "docbuild/.lake/build/api-build.json"
    api_state = json.loads(api_state_path.read_text()) if api_state_path.exists() else {}
    has_api = (api / "index.html").exists() and api_state.get("complete", False)
    if has_api:
        for revisions in ([api_state["source_commit"], "HEAD"], ["HEAD"]):
            subprocess.run(["git", "diff", "--exit-code", *revisions, "--",
                            "ExtriangulatedRealization.lean", "ExtriangulatedRealization",
                            "lean-toolchain", "lake-manifest.json"],
                           cwd=ROOT, check=True)
        # A source migration can delete modules; discard stale generated pages.
        if (output / "api").exists():
            shutil.rmtree(output / "api")
        shutil.copytree(api, output / "api")
        for page in (output / "api").rglob("*.html"):
            overview = Path(os.path.relpath(output / "index.html", page.parent)).as_posix()
            page.write_text(page.read_text().replace(
                "<span>Documentation</span>",
                f'<span><a href="{overview}">An extriangulated category with no triangulated embedding</a></span>', 1))
    elif (output / "api").exists():
        shutil.rmtree(output / "api")
    status_file = ROOT / "verification-status.json"
    status = json.loads(status_file.read_text()) if status_file.exists() else {}
    rows = []
    for declaration, module, description in DECLARATIONS:
        path = "ExtriangulatedRealization/" + module
        target = ("api/" + path + ".html#ExtriangulatedRealization." + declaration) if has_api else source_url + "/" + path + ".lean"
        rows.append(f'<tr><td><a href="{target}"><code>{declaration}</code></a></td><td>{description}</td></tr>')
    replacements = {
        "source_url": source_url,
        "repo_url": repo_url,
        "statement": html.escape(statement).replace("{", "&#123;"),
        "statement_lines": str(len(statement.splitlines())),
        "declaration_rows": "".join(rows),
        "api_link": '<p><a href="api/index.html">Browse and search the generated API</a></p>' if has_api else
                    '<p>The API has not been generated in this preview. Follow <code>docbuild/README.md</code> to build the documentation tool, run <code>python3 scripts/build_api.py</code>, then rebuild this site.</p>',
        "verification_status": html.escape(status.get("summary", "Verification records are available in the repository.")),
    }
    nav = "".join(f'<a href="{slug}.html">{label}</a>' for slug, label in PAGES.items())
    nav += f'<a href="{repo_url}">GitHub</a>'
    revision = f'<a href="{repo_url}/tree/{commit}">{commit[:7]}</a>' + (" (preview)" if dirty else "")
    api_revision = (f' · API: <a href="{repo_url}/tree/{api_state["source_commit"]}">{api_state["source_commit"][:7]}</a>') if has_api else ""
    for slug, title in PAGES.items():
        body = (ROOT / f"website/pages/{slug}.html").read_text()
        for key, value in replacements.items():
            body = body.replace("{{" + key + "}}", value)
        if "{{" in body:
            raise SystemExit(f"Unresolved template value in {slug}")
        page = f'''<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{title} · An extriangulated category with no triangulated embedding</title><link rel="stylesheet" href="assets/site.css"></head>
<body><a class="skip" href="#main">Skip to content</a><header class="site-header"><nav class="nav" aria-label="Main"><a class="brand" href="index.html">An extriangulated category with no triangulated embedding</a>{nav}</nav></header>
<main id="main">{body}</main><footer class="site-footer">Source: {revision}{api_revision}<br>Haruhisa Enomoto · Lean formalization · Apache-2.0</footer></body></html>'''
        (output / f"{slug}.html").write_text(page)
    (output / "build.json").write_text(json.dumps({"commit": commit, "dirty": dirty,
        "api_generated": has_api, "api_source_commit": api_state.get("source_commit") if has_api else None,
        "statement_lines": len(statement.splitlines())}, indent=2) + "\n")
    print(f"Built {len(PAGES)} pages in {output}")


if __name__ == "__main__":
    main()
