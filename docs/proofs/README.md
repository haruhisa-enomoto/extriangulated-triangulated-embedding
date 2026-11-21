# Arguments that differ from the paper

The endpoints are the paper's statements. These intermediate arguments follow a
different route, or a more general form, than the paper.

- **The extension bifunctor.** `E(C, A)` is `Ext¹(ρC, ρA)` computed in the category
  `Rep k I` of all representations of `I_*`. The paper defines `E_J` with `Ext¹` in
  `B_J` and identifies the two in the proof of Corollary 2.4, using Lemma 2.1.
- **Algebraic triangulated categories.** `Statement.IsAlgebraicTriangulated` asks for a
  Frobenius exact category `B` and a full, essentially surjective additive functor
  `Φ : B ⥤ T` that kills exactly the morphisms factoring through projective-injective
  objects and sends conflations to distinguished triangles through natural connecting
  morphisms. The homotopy category of an additive category is algebraic in this sense
  through the degreewise split exact structure on complexes
  (`Complexes/DegreewiseSplit.lean`, `Complexes/Frobenius.lean`). This formulation is
  equivalent to the paper's (a triangle equivalence with Happel's stable category), by
  the following argument, which is not formalized. The kernel condition makes `Φ` induce
  an equivalence from the additive quotient of `B` by the projective-injectives. For a
  conflation `A → I → ΣA` with `I` injective, `Φ I = 0`, so the connecting morphism is an
  isomorphism `Φ(ΣA) ≅ (Φ A)[1]`, natural by the naturality of connecting morphisms; it
  identifies Happel's suspension with the shift, and his standard triangles with the
  images of conflations, which are distinguished. The nonembedding results do not use
  this comparison.
- **Proposition 2.3, the target.** The realization functor takes values in the homotopy
  category `K(Q)` of all complexes over `Q`, not in its full triangulated subcategory
  `Kᵇ(Q)` of bounded complexes. Both are algebraic, and the endpoint states the existence
  of an algebraic realization, which is what the rest of the paper uses.
- **Proposition 2.3, Corollary 2.4, the structure of `C_J`.** The induced structure on
  `C_J` uses the restricted extension bifunctor and realizations, and the biproducts of
  `C(D)` (`Statement.ExtriangulatedData.IsExtriangulatedSubcategory`). The biproducts
  chosen in `C_J` are isomorphic, not equal, to those of `C(D)`, so the axiom (ET2) on
  direct sums uses that realizations of `C(D)` are invariant under isomorphisms of their
  end terms (`cd_realizes_transport`), proved through the triangulated realization of
  some `C_{≤ m}` containing the finitely many objects involved
  (`Realization/Subcategory.lean`).
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
- **Proposition 4.4, heredity.** `Eⁿ` is presented by the words `α₁ ⊗ ⋯ ⊗ αₙ` and the
  relations of additivity in each factor and balance at each junction
  (`Statement.ExtriangulatedData.TensorWord`, `TensorRel`). A word `α ⊗ w` with `n ≥ 2`
  is reduced at its first junction with two summands of the middle object (the entries
  `A i`, and the others) instead of all indecomposable summands (`CD/Heredity.lean`).
- **Lemma 4.1.** Proved for any linearly ordered index set in which countable subsets
  are bounded: the support sizes of a compatible family are monotone, hence eventually
  constant, after which the transition maps are bijections between supports
  (`InverseSystems/Linearization.lean`).
- **Construction 4.3.** A node of level `α` of Jech's tree is a function `ω₁ → ℚ`
  that vanishes from `α` on and is strictly increasing and bounded below `α`. The
  levels are defined by well-founded recursion on `ω₁`; one induction proves that they
  are countable, closed under restriction and have the extension property (9.10)
  (`InverseSystems/Aronszajn.lean`).
