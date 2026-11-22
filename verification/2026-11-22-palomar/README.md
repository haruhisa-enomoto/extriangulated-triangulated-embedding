# Verification record, November 22, 2026: Palomar registration

Commit `55753837fae8ae68dcaae3f1b366ae9c1dfc7e02`. Lean `v4.36.0-rc2`, Mathlib
`2ddf59c8f14245864e6c0ed227a2dab76b9efea2`, Lean module system. Registered on Palomar as
[PALOMAR-2026-11-22-000005](https://palomar-registry.org/entry.html?id=PALOMAR-2026-11-22-000005&version=1)
(version 1, November 22, 2026).

This commit cites the posted paper [hexagon:2611.00805v1](https://hexagonmath.org/2611.00805v1)
and answers the blocking finding of Palomar's review of an earlier submission: the compared
Theorem A now fixes one witness `C(D)` with not every projection `lim D → D_i` surjective,
so that, with the compared necessity part of Theorem B (all target universes), this one category
has no triangulated embedding in any universes.

## Local checks (fresh clone of this commit)

| Check | Result |
| --- | --- |
| Lean source check | `scripts/check-lean-sources.py` passes |
| Statement sync | `scripts/generate_challenge.py --check` passes; `Challenge.lean` has 916 lines and 57,133 bytes |
| Build | `lake build ExtriangulatedRealization Challenge Solution`: 4,520 jobs, 324 seconds wall time with Mathlib's cache, peak memory 3.1 GB; no warnings except the seven Challenge placeholders |
| Axiom audit | `scripts/audit_axioms.py`: 28 declarations, only `propext`, `Classical.choice`, `Quot.sound` |
| Declaration scan | `scripts/scan_axioms.py`: all 1,621 declarations of the library and Solution; no other axiom |
| `lake comparator` | `scripts/verify-comparator.sh` in a `bwrap` sandbox, 6 minutes: con-ron (30,308 declarations, `--verified`), NanoDa and the Lean kernel accept; [`comparator-tail.log`](comparator-tail.log) |

## Palomar

- Hosted preflight run
  [44986251481](https://github.com/haruhisa-enomoto/extriangulated-triangulated-embedding/actions/runs/44986251481),
  pipeline `PalomarRegistry/PalomarSubmission@14aa8d6`, profile `palomar-standard-v1`:
  `status: pass`, checked at 2026-11-22 04:57:56 UTC; one non-blocking warning (the Challenge
  exceeds the preferred 32 KiB / 300-line review surface). Report:
  [`mechanical-report.json`](mechanical-report.json).
- Submission `l03w2iw8g82r` (relationship `maintainer`, proof by repository tag and secret
  gist): mechanical verification run
  [44987518317](https://github.com/PalomarRegistry/PalomarSubmission/actions/runs/44987518317)
  succeeded; the automated editorial review (codex:gpt-6-sol, 06:04 UTC) found no blocking
  problem and no warning; registered at 06:20 UTC.
- Earlier submissions: `r8900p05x2da` (commit `bd2180e`, before the paper was cited from
  Hexagon) and `sj2mscguhn2f` (commit `6754a8b`, whose review asked for the fixed witness in
  Theorem A) were withdrawn.

| File | SHA-256 |
| --- | --- |
| `Challenge.lean` | `2b1a21935cf24e68414b793c006de3f50e865e00f4ac390cacd8eb5f5ea9869b` |
| `Solution.lean` | `9788da251ae092d54bbd4649dd41349c1a50bb4494acb888cdfddd8183756ee0` |
| `comparator.json` | `4769ea32569dd7ccca7e93e818bb59a1d1090a836b63c7da8bdaecee54ac33b2` |
| `comparator-tail.log` | `b9fa991765d6044a964292c6d132b240b735c6bdb24fa56ba7e56dff32609534` |
| `mechanical-report.json` | `2c25128dde9a1add35532f43dadb382af7f9ec31291899f9968bd3f84f6f78fd` |
