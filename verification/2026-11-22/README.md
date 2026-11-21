# Verification record, November 22, 2026: first release

Commit `151dff065bde0a68d92861e89f7077fef763d6a2`. Lean `v4.36.0-rc2`, Mathlib
`2ddf59c8f14245864e6c0ed227a2dab76b9efea2`, Lean module system.

This commit follows the manuscript identified in
[docs/MANUSCRIPT.md](../../docs/MANUSCRIPT.md). The checks below ran on a fresh clone
of this commit: the library was built from scratch, with Mathlib's compiled files
taken from the shared cache. Later commits add the website and change no Lean file,
`lakefile.toml`, `lake-manifest.json`, `lean-toolchain` or `comparator.json`.

## Local checks

| Check | Result |
| --- | --- |
| Lean source check | `scripts/check-lean-sources.py` passes |
| Statement sync | `scripts/generate_challenge.py --check` passes |
| Build | `lake build ExtriangulatedRealization Challenge Solution`: 4,518 jobs, 401 seconds wall time on 20 hardware threads with Mathlib's cache, peak memory 3.1 GB; no warnings except the seven Challenge placeholders |
| Axiom audit | `scripts/audit_axioms.py`: 26 declarations, only `propext`, `Classical.choice`, `Quot.sound` |
| Declaration scan | `scripts/scan_axioms.py`: all 1,551 declarations of the library and Solution; no other axiom |
| `lake comparator` | `scripts/verify-comparator.sh` in a `bwrap` sandbox, 7.5 minutes: con-ron (30,168 declarations, `--verified`), NanoDa and the Lean kernel accept; [`comparator-tail.log`](comparator-tail.log) |

Not run: Palomar's own `formalization.yaml` loader (the template validator
`scripts/validate-formalization.rb` passes), and the hosted Palomar preflight.

| File | SHA-256 |
| --- | --- |
| `Challenge.lean` | `cd9af35d26d55b62d56c5e0a70603402d4b303d6d1ef06507e201a0a6e2bda11` |
| `Solution.lean` | `1a65ed8cfead389005aa67afcca4b5f199bec04ae90f0ad9923fe22025c7bf07` |
| `comparator.json` | `4769ea32569dd7ccca7e93e818bb59a1d1090a836b63c7da8bdaecee54ac33b2` |
| `comparator-tail.log` | `03a4f6bb419b9f1db6d0c0b497759a3f1d19cc1f3339f61c0b31b89d1bea41ac` |
