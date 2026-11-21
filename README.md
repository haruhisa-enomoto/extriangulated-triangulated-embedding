# An extriangulated category with no triangulated embedding

[Paper (formalized version)](docs/MANUSCRIPT.md) ·
[Main theorems in Lean](ExtriangulatedRealization/MainTheorems.lean) ·
[Independent statement](ExtriangulatedRealization/Statement.lean) ·
[Paper correspondence](docs/PAPER-CORRESPONDENCE.md) ·
[Verification](docs/VERIFICATION.md)

This repository contains a Lean 4 formalization of the paper *An extriangulated
category with no triangulated embedding* by Haruhisa Enomoto, including the cited
inputs that it uses. The formalized version is identified in
[MANUSCRIPT.md](docs/MANUSCRIPT.md). Mathlib is the only dependency.

Gorsky, Nakaoka and Palu asked whether every extriangulated category is an
extension-closed subcategory of a triangulated category. The paper answers this
negatively.

**Theorem A.** Over every field `k` there is an essentially small `k`-linear
extriangulated category `C` such that

1. `C` has no triangulated embedding (into a triangulated category in any universe);
2. every countable family of objects of `C` lies in a full extension-closed
   subcategory that has an algebraic realization;
3. `C` is hereditary (`Eⁿ = 0` for `n ≥ 2`) and Krull–Schmidt, has enough injectives and `ℵ₁`
   isomorphism classes of indecomposables, each with endomorphism ring `k`;
   `dim E(C, A) ≤ 1` for indecomposables `A`, `C`; and every morphism space has at most
   countable dimension.

The category is `C(D)` for an inverse system `D = (D_i)_{i ∈ I}` of vector spaces with
surjective transition maps over an ordinal `I`. Take the interval representations
`Y`, `A_i`, `P_i` of `I` with a new least point `*`, adjoin one object `X` with
`Hom(X, A_i) = D_i`, and pull back `E = Ext¹` from the representations.

**Theorem B.** `C(D)` has a triangulated embedding if and only if every projection
`lim D → D_i` is surjective, if and only if `C(D)` has an algebraic realization.

Theorem A takes for `D` the linearization `D_i = k^(T_i)` of the levels of an Aronszajn
tree over `ω₁` (Construction 4.3, after Jech): the levels are countable, so the
morphism spaces have countable dimension, and the tree has no branch, so
`lim D = 0` (Lemma 4.1, after Bergman and Higman–Stone) while `D_0 = k`.

The library also proves Proposition 2.3 (compatible surjections from one vector space
make `C_J` an extriangulated category with an algebraic realization), Corollary 2.4
(`C(D)` is extriangulated, and so is every `C_J`),
Proposition 4.4 (the structure of `C(D)`), Proposition 4.6 (realizations for a
countable cofinal subset or finite-dimensional `D_i`) and Example 4.2 (injections of
countable ordinals into `ℕ`).

## What is compared

[`Challenge.lean`](Challenge.lean) is generated from
[`Statement.lean`](ExtriangulatedRealization/Statement.lean), which uses Mathlib alone.
It states seven endpoints: Theorem A, Theorem B, the necessity part of Theorem B for
triangulated targets in all universes, Proposition 2.3, Corollary 2.4,
Proposition 4.4 and Proposition 4.6. [`Solution.lean`](Solution.lean) proves them from
the library. The statement file defines, with Mathlib only: extriangulated data and the
axioms of Nakaoka and Palu; extriangulated functors (Bennett-Tennenhaus and Shah);
triangulated embeddings and realizations; exact and Frobenius structures and algebraic
triangulated categories; the category `C(D)` and its subcategories `C_J`; and the
tensor powers `Eⁿ` of Gorsky, Nakaoka and Palu for heredity. `Challenge.lean` is
`Statement.lean` without blank lines (one is kept before each section header), to stay
within Palomar's limit of 1,000 lines; it has 910 lines.

## Axioms

Every endpoint, and every declaration of the library and of `Solution.lean`, depends
only on `propext`, `Classical.choice` and `Quot.sound`. There is no `sorry`.

## Cited inputs

The cited inputs that the proofs use are proved: Nakaoka–Palu Proposition 3.24 (in the
direction used), the algebraicity of homotopy categories of additive categories
(Happel, Keller), Bergman's Lemma 3 (by a direct finite-support proof), Jech's
Aronszajn tree, and Henkin's (Tukey's) lifting along a countable cofinal sequence.
Krause's Corollary 4.4 is replaced by a direct splitting argument. Two points are
recorded as divergences rather than formalized: the realization of Proposition 2.3 lands
in the homotopy category of all complexes instead of bounded ones, and the comparison of
our definition of algebraic triangulated categories with Happel's is argued in
[docs/proofs](docs/proofs/README.md). The Stacks Project
Tag 05TG is in Mathlib. The [correspondence](docs/PAPER-CORRESPONDENCE.md) lists the
declarations.

## Review

No human expert has reviewed the Lean statements or the proofs. An independent agent
audit (Codex, November 22, 2026) confirmed the main results and found that the Challenge
exceeded Palomar's line limit, that Propositions 2.3 and 4.4 were stated more weakly than
in the paper, and two encoding differences; the first three are fixed in this version
and the last two are recorded as divergences. Lean checks the proofs; whether `Challenge.lean` says what the
paper says is a human judgement.

## Start reading

- [`Statement.lean`](ExtriangulatedRealization/Statement.lean): the definitions and the
  endpoints.
- [`MainTheorems.lean`](ExtriangulatedRealization/MainTheorems.lean): where each
  endpoint is proved.
- [`Criterion/TheoremA.lean`](ExtriangulatedRealization/Criterion/TheoremA.lean): the
  assembly of Theorem A.
- [`docs/proofs`](docs/proofs/README.md): the arguments that differ from the paper.

## Layout

| Directory | Content |
| --- | --- |
| `Categories` | one-point extensions and functors out of `Mat_`, biproducts, idempotent splitting, objects with scalar endomorphisms |
| `Complexes` | the degreewise split exact structure on complexes; `K(C)` is algebraic triangulated |
| `Triangulated` | reflection and direct sums of distinguished triangles |
| `Extriangulated` | injective objects of an extriangulated category |
| `Intervals` | interval representations of `I_*`: maps, homomorphisms, injectivity, good representations and their decomposition, `Ext¹` table |
| `CD` | the category `C(D)`: single objects, parts, realizations, closure, indecomposables, idempotents, injectives, heredity, counting |
| `Realization` | the realization functor into `K(Q)` (Proposition 2.3) and Corollary 2.4 |
| `Criterion` | Theorem B, Proposition 4.6, Theorem A |
| `InverseSystems` | `ω₁`, linearization (Lemma 4.1), the Aronszajn tree (Construction 4.3), Example 4.2 |

## Licence

[Apache License 2.0](LICENSE). See [PROVENANCE.md](PROVENANCE.md).
