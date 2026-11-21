module

public import ExtriangulatedRealization

@[expose] public section

universe u v' u'

/-- **Theorem A** (Theorem 4.5). Over every field there is an essentially small linear
extriangulated category with no triangulated embedding, whose countable families of objects lie in
extension-closed subcategories with algebraic realizations, and which is hereditary,
Krull–Schmidt, with enough injectives and `ℵ₁` indecomposables. -/
theorem ExtriangulatedRealization.Challenge.theoremA :
    ExtriangulatedRealization.Statement.TheoremA.{u, v', u'} :=
  ExtriangulatedRealization.theoremA

/-- **Theorem B** (Theorem 3.1). `C(D)` admits a triangulated embedding if and only if every
projection `lim D → D_i` is surjective, if and only if `C(D)` has an algebraic realization. -/
theorem ExtriangulatedRealization.Challenge.theoremB :
    ExtriangulatedRealization.Statement.TheoremB.{u} :=
  ExtriangulatedRealization.theoremB

/-- **Theorem B**, (1) ⇒ (2), for triangulated targets in all universes. -/
theorem ExtriangulatedRealization.Challenge.theoremB_necessity :
    ExtriangulatedRealization.Statement.TheoremB_necessity.{u, v', u'} :=
  ExtriangulatedRealization.theoremB_necessity

/-- **Proposition 2.3.** Compatible surjections from one vector space make `C_J`, with the
induced structure, an extriangulated category with an algebraic realization. -/
theorem ExtriangulatedRealization.Challenge.proposition_2_3 :
    ExtriangulatedRealization.Statement.Proposition_2_3.{u} :=
  ExtriangulatedRealization.proposition_2_3

/-- **Corollary 2.4.** `C(D)` is an essentially small extriangulated category; each `C_J` is
extension-closed and extriangulated; `C_J` is algebraically realized when `J` has a largest
element. -/
theorem ExtriangulatedRealization.Challenge.corollary_2_4 :
    ExtriangulatedRealization.Statement.Corollary_2_4.{u} :=
  ExtriangulatedRealization.corollary_2_4

/-- **Proposition 4.4.** Krull–Schmidt, indecomposables, extension spaces, enough injectives
and heredity (`Eⁿ = 0` for `n ≥ 2`) of `C(D)`. -/
theorem ExtriangulatedRealization.Challenge.proposition_4_4 :
    ExtriangulatedRealization.Statement.Proposition_4_4.{u} :=
  ExtriangulatedRealization.proposition_4_4

/-- **Proposition 4.6** (1), (2). Countable cofinality or finite-dimensional terms give an
algebraic realization. -/
theorem ExtriangulatedRealization.Challenge.proposition_4_6 :
    ExtriangulatedRealization.Statement.Proposition_4_6.{u} :=
  ExtriangulatedRealization.proposition_4_6
