# Verification record, November 22, 2026: audit fixes

Commit `97e6532a51b38aaeadd674c862b1d03b92a12ecc`. Lean `v4.36.0-rc2`, Mathlib
`2ddf59c8f14245864e6c0ed227a2dab76b9efea2`, Lean module system.

This version answers the independent audit of November 22, 2026: heredity is stated as
`Eⁿ = 0` for every `n ≥ 2`; Proposition 2.3 and Corollary 2.4 state that each `C_J`,
with the induced structure, is extriangulated; and `Challenge.lean` is generated without
blank lines, at 910 lines and 56,557 bytes, within the pinned verifier's limits of 1,000
lines and 100 KiB. The checks below ran on a fresh clone of this commit, with the library
built from scratch and Mathlib's compiled files from the shared cache.

## Local checks

| Check | Result |
| --- | --- |
| Lean source check | `scripts/check-lean-sources.py` passes |
| Statement sync | `scripts/generate_challenge.py --check` passes |
| Build | `lake build ExtriangulatedRealization Challenge Solution`: 4,520 jobs, 315 seconds wall time on 20 hardware threads with Mathlib's cache, peak memory 3.1 GB; no warnings except the seven Challenge placeholders |
| Axiom audit | `scripts/audit_axioms.py`: 28 declarations, only `propext`, `Classical.choice`, `Quot.sound` |
| Declaration scan | `scripts/scan_axioms.py`: all 1,621 declarations of the library and Solution; no other axiom |
| `lake comparator` | `scripts/verify-comparator.sh` in a `bwrap` sandbox, 6 minutes: con-ron (30,308 declarations, `--verified`), NanoDa and the Lean kernel accept; [`comparator-tail.log`](comparator-tail.log) |

Not run here: Palomar's own `formalization.yaml` loader and the hosted Palomar preflight.

| File | SHA-256 |
| --- | --- |
| `Challenge.lean` | `b80d678b7a99775763eaa054faaf618463090e9a3b1fb35e5f96da09a5835d17` |
| `Solution.lean` | `63a3a6a0053d0968341528f0fe4a1c0829b643496b40a86d44eef3cfe9990290` |
| `comparator.json` | `4769ea32569dd7ccca7e93e818bb59a1d1090a836b63c7da8bdaecee54ac33b2` |
| `comparator-tail.log` | `b9fa991765d6044a964292c6d132b240b735c6bdb24fa56ba7e56dff32609534` |
