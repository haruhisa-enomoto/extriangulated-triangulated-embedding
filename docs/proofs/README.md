# Arguments that differ from the paper

The endpoints are the paper's statements. These intermediate arguments follow a
different route, or a more general form, than the paper.

- **The extension bifunctor.** `E(C, A)` is `Ext¹(ρC, ρA)` computed in the category
  `Rep k I` of all representations of `I_*`. The paper defines `E_J` with `Ext¹` in
  `B_J` and identifies the two in the proof of Corollary 2.4, using Lemma 2.1.
- **Algebraic triangulated categories.** `Statement.IsAlgebraicTriangulated` asks for a
  Frobenius exact category `B` and a full, essentially surjective additive functor
  `B ⥤ T` that kills exactly the morphisms factoring through projective-injective
  objects and sends conflations to distinguished triangles through natural connecting
  morphisms. Such a functor induces a triangle equivalence from Happel's stable
  category, and conversely. The homotopy category of an additive category is
  algebraic in this sense through the degreewise split exact structure on complexes
  (`Complexes/DegreewiseSplit.lean`, `Complexes/Frobenius.lean`).
- **Lemma 2.1, Step 2.** A good representation is decomposed by splitting off one
  interval at a time (`Intervals/Peeling.lean`, `Intervals/Decomposition.lean`), not
  through adapted bases.
- **Proposition 4.4, idempotent completeness.** Instead of Krause's Corollary 4.4: an
  idempotent on `M = bPart M ⊞ xPart M` has no component from the `X`-free part to the
  `X`-part, so it splits once its diagonal blocks split
  (`split_biprod_of_triangular`). On the `X`-free part, `ρ` is fully faithful and the
  image of the idempotent in `Rep k I` is a good representation; on the `X`-part the
  idempotent is an idempotent matrix over `k`, which factors through its rank
  (`CD/Idempotents.lean`).
- **Proposition 4.4, heredity.** The generators `α ⊗ β` of `E ⊗ E` are reduced with two
  summands of `M` (the entries `A i`, and the others) instead of all indecomposable
  summands (`CD/Heredity.lean`). Only `E² = 0` is stated; the higher `Eⁿ` are not.
- **Lemma 4.1.** Proved for any linearly ordered index set in which countable subsets
  are bounded: the support sizes of a compatible family are monotone, hence eventually
  constant, after which the transition maps are bijections between supports
  (`InverseSystems/Linearization.lean`).
- **Construction 4.3.** A node of level `α` of Jech's tree is a function `ω₁ → ℚ`
  that vanishes from `α` on and is strictly increasing and bounded below `α`. The
  levels are defined by well-founded recursion on `ω₁`; one induction proves that they
  are countable, closed under restriction and have the extension property (9.10)
  (`InverseSystems/Aronszajn.lean`).
