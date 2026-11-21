module

public import ExtriangulatedRealization.Realization.Realizations
public import ExtriangulatedRealization.Complexes.Frobenius

/-!
# Proposition 2.3: `C_J` has an algebraic realization

Given `W` mapping compatibly and surjectively onto the `D_i`, `i ∈ J`, the realization functor
`C_J ⥤ K(Q)` with the maps `η` is a triangulated realization, and `K(Q)` is algebraic.
-/

@[expose] public section

namespace ExtriangulatedRealization

open CategoryTheory Limits Opposite Statement IntervalLabel ZeroObject DerivedCategory
  Pretriangulated

universe u

attribute [local instance] HasDerivedCategory.standard HasExt.standard

namespace RealizationData

variable {k : Type u} [Field k] {I : Type u} [LinearOrder I] {D : Iᵒᵖ ⥤ ModuleCat.{u} k}
  {J : Set I} (R : RealizationData D J) (hR : R.IsCompatible)

/-- The realization of `C_J` in `K(Q)` as an extriangulated functor. -/
noncomputable def extriangulatedFunctor :
    ExtriangulatedFunctor (dataJ (D := D) (J := J)) (HomotopyCategory R.Q (ComplexShape.up ℤ)) where
  F := R.realP hR
  additive := inferInstance
  η {C A} := R.eta hR C A
  η_push a δ := R.eta_push' hR a δ
  η_pull c δ := R.eta_pull' hR c δ
  distinguished h := R.realTriangle_distinguished hR h

lemma extriangulatedFunctor_isTriangulatedRealization :
    (R.extriangulatedFunctor hR).IsTriangulatedRealization :=
  ⟨⟨inferInstanceAs (R.realP hR).Full, inferInstanceAs (R.realP hR).Faithful⟩,
    fun C A => R.eta_bijective hR C A⟩

end RealizationData

/-- **Proposition 2.3.** -/
theorem proposition_2_3 : Proposition_2_3.{u} := by
  intro k _ I _ _ _ D _ J W q hsurj hcomm
  let R : RealizationData D J := ⟨W, q⟩
  have hR : R.IsCompatible := ⟨hsurj, hcomm⟩
  rw [subcatJ_eq_labelsIn]
  exact ⟨HomotopyCategory R.Q (ComplexShape.up ℤ), inferInstance, inferInstance, inferInstance,
    inferInstance, inferInstance, inferInstance, inferInstance,
    isAlgebraicTriangulated_homotopyCategory R.Q, R.extriangulatedFunctor hR,
    R.extriangulatedFunctor_isTriangulatedRealization hR⟩

end ExtriangulatedRealization
