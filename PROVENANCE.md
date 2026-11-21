# Provenance

The Lean development is maintained by Haruhisa Enomoto. It formalizes *An
extriangulated category with no triangulated embedding* by Haruhisa Enomoto
([hexagon:2611.00805v1](https://hexagonmath.org/2611.00805v1)), following the version
identified in [docs/MANUSCRIPT.md](docs/MANUSCRIPT.md). The
[correspondence](docs/PAPER-CORRESPONDENCE.md) describes formal coverage.

## Contributions

According to the paper's statement on AI use, the author posed the problem and
directed the research; the counterexample, the embedding criterion and the proofs
were developed by GPT-6.2 Astra under the author's direction, which also wrote the
initial manuscript and carried out the citation check and mathematical audits;
independent exposition reviews were performed by Claude Opus 5.5; and the
exposition was polished with Gemini 4 Neon.

The formalization was developed by an AI coding agent (Claude Code with Claude
Opus 5.5) under Haruhisa Enomoto's direction, on November 21–22, 2026. This
includes the proofs that differ from the paper, described in
[docs/proofs](docs/proofs/README.md). No module is copied from another library (see
[VENDORED.md](VENDORED.md)); the decomposition of good interval representations follows
the route of an earlier formalization by the same maintainer.

## Dependencies and licences

The package pins Lean `v4.36.0-rc2` and Mathlib commit
`2ddf59c8f14245864e6c0ed227a2dab76b9efea2`. Mathlib is the only external Lake
dependency. This repository is released under the [Apache License 2.0](LICENSE).
