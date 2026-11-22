# Verification

The library proves Theorem A, Theorem B, Propositions 2.3, 4.4 and 4.6, Corollary 2.4
and Example 4.2 of [the paper](MANUSCRIPT.md), every other numbered statement, and the
cited inputs that the proofs use. The [correspondence](PAPER-CORRESPONDENCE.md) lists
the declarations. Records are in [`verification/`](../verification/README.md).

## Independent statement

`ExtriangulatedRealization/Statement.lean` states the results with Mathlib alone:
extriangulated data and the axioms of Nakaoka and Palu; extriangulated functors;
triangulated embeddings and realizations; exact and Frobenius structures and
algebraic triangulated categories; injective objects, enough injectives and the
tensor powers of Gorsky, Nakaoka and Palu; Krull–Schmidt categories and
indecomposables; the category `C(D)` and its subcategories `C_J`. `Challenge.lean` is
generated from it with seven deliberate `sorry` placeholders, without blank lines (one is
kept before each section header) to stay within Palomar's limit of 1,000 lines. `Solution.lean` proves
them and does not import the Challenge.

## Results

The [record of the Palomar registration](../verification/2026-11-22-palomar/README.md) gives
the current local results, the hosted Palomar preflight and the hashes for commit `5575383`,
registered as
[PALOMAR-2026-11-22-000005](https://palomar-registry.org/entry.html?id=PALOMAR-2026-11-22-000005&version=1).
Earlier records are listed in [`verification/`](../verification/README.md).

No human expert has reviewed the Lean statements or the proofs. Lean checks the
proofs; whether `Challenge.lean` says what the paper says is a human judgement.

## Reproduce the checks

```sh
python3 scripts/check-lean-sources.py
lake exe cache get
lake build
python3 scripts/audit_axioms.py
python3 scripts/scan_axioms.py
python3 scripts/generate_challenge.py --check
lake build Challenge Solution
./scripts/verify-comparator.sh
```

`audit_axioms.py` and `scan_axioms.py` generate non-module Lean files, because a
`module` file sees theorems without their proofs. `verify-comparator.sh` follows the
Palomar template: it runs the `lake comparator` bundled with the toolchain, with the
Lean kernel and the bundled NanoDa and con-ron checkers, inside a `bwrap`
(bubblewrap) sandbox. `bwrap` must be on the path, and `.lake/packages` must be a real
directory, not a symlink.

The workflow [Palomar preflight](../.github/workflows/palomar-preflight.yml) runs
Palomar's mechanical verification for a chosen commit.
