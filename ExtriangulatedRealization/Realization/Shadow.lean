module

public import ExtriangulatedRealization.Realization.FullyFaithful
public import ExtriangulatedRealization.Realization.Model

/-!
# The shadow functor `Γ : K(Q) ⥤ D(Rep k I)`

Killing the adjoined object `L` gives an additive functor `κ : Q ⥤ Rep k I` extending
`ι₀ : Q₀ ⥤ Rep k I` along `e₀ : Q₀ ⥤ Q`. The induced triangulated functor
`Γ = κ ⋙ Qh : K(Q) ⥤ D(Rep k I)` restricts to the comparison functor `G` on `K(Q₀)`.
-/

@[expose] public section

namespace ExtriangulatedRealization

open CategoryTheory Limits Opposite Statement IntervalLabel ZeroObject DerivedCategory

universe u

variable {k : Type u} [Field k] {I : Type u} [LinearOrder I]

attribute [local instance] HasDerivedCategory.standard

namespace RealizationData

variable {D : Iᵒᵖ ⥤ ModuleCat.{u} k} {J : Set I} (R : RealizationData D J)

/-- The lift data killing `L`. -/
noncomputable def killData : OnePointExtension.LiftData R.phi (Rep k I) where
  FB := inducedFunctor (IntervalLabel.rep k (I := I))
  Xt := 0
  sc _ := 0
  ι _ _ := 0
  sc_one := (isZero_zero _).eq_of_src _ _
  sc_mul _ _ := (isZero_zero _).eq_of_src _ _
  sc_add _ _ := (add_zero 0).symm
  ι_add _ _ _ := (add_zero 0).symm
  ι_nat _ _ := (isZero_zero _).eq_of_src _ _
  ι_sc _ _ _ := (isZero_zero _).eq_of_src _ _

/-- The functor `κ : Q ⥤ Rep k I` killing `L`. -/
noncomputable def kill : R.Q ⥤ Rep k I := matLift (OnePointExtension.lift R.killData)

instance : R.kill.Additive := by
  unfold kill
  infer_instance

lemma e₀_comp_kill : R.e₀ ⋙ R.kill = ι₀ := rfl

/-- The shadow functor `Γ : K(Q) ⥤ D(Rep k I)`. -/
noncomputable def shadow : HomotopyCategory R.Q (ComplexShape.up ℤ) ⥤ DerivedCategory (Rep k I) :=
  R.kill.mapHomotopyCategory (ComplexShape.up ℤ) ⋙ Qh

noncomputable instance : R.shadow.CommShift ℤ :=
  inferInstanceAs ((R.kill.mapHomotopyCategory (ComplexShape.up ℤ) ⋙ Qh).CommShift ℤ)

instance : R.shadow.IsTriangulated :=
  inferInstanceAs (R.kill.mapHomotopyCategory (ComplexShape.up ℤ) ⋙ Qh).IsTriangulated

instance : R.shadow.Additive :=
  inferInstanceAs (R.kill.mapHomotopyCategory (ComplexShape.up ℤ) ⋙ Qh).Additive

lemma e₀_comp_shadow_obj (X : HomotopyCategory (Q₀ k I) (ComplexShape.up ℤ)) :
    R.shadow.obj ((R.e₀.mapHomotopyCategory _).obj X) = (Gfun k I).obj X := rfl

lemma e₀_comp_shadow_map {X Y : CochainComplex (Q₀ k I) ℤ}
    (φ : (HomotopyCategory.quotient _ _).obj X ⟶ (HomotopyCategory.quotient _ _).obj Y) :
    R.shadow.map ((R.e₀.mapHomotopyCategory _).map φ) = (Gfun k I).map φ := by
  obtain ⟨φ, rfl⟩ := (HomotopyCategory.quotient _ _).map_surjective φ
  rfl

lemma isZero_kill_Lobj : IsZero (R.kill.obj R.Lobj) := by
  rw [IsZero.iff_id_eq_zero]
  apply biproduct.hom_ext
  intro j
  apply biproduct.hom_ext'
  intro i
  exact (isZero_zero (Rep k I)).eq_of_src _ _

lemma isZero_shadow_Xc : IsZero (R.shadow.obj ((HomotopyCategory.quotient _ _).obj R.Xc)) := by
  have h : IsZero ((R.kill.mapHomologicalComplex (ComplexShape.up ℤ)).obj R.Xc) :=
    IsZero.of_iso ((HomologicalComplex.single _ _ 1).map_isZero R.isZero_kill_Lobj)
      ((HomologicalComplex.singleMapHomologicalComplex R.kill (ComplexShape.up ℤ) 1).app R.Lobj)
  exact Qh.map_isZero ((HomotopyCategory.quotient _ _).map_isZero h)

variable (hR : R.IsCompatible)

/-- `Γ ∘ F₁ ≅ single ∘ ρ` on the indecomposables of `C_J`. -/
noncomputable def shadowF₁Iso :
    R.F₁ hR ⋙ R.shadow ≅ indJIncl J D ⋙ rho0 D ⋙ singleFunctor (Rep k I) 0 :=
  NatIso.ofComponents
    (fun x => match x with
      | none => IsZero.iso R.isZero_shadow_Xc
          ((singleFunctor (Rep k I) 0).map_isZero (isZero_zero _))
      | some a => eIso a.obj)
    (by
      intro x y f
      rcases x with _ | a <;> rcases y with _ | b
      · exact R.isZero_shadow_Xc.eq_of_src _ _
      · exact R.isZero_shadow_Xc.eq_of_src _ _
      · exact ((singleFunctor (Rep k I) 0).map_isZero (isZero_zero _)).eq_of_tgt _ _
      · let g : a ⟶ b := f
        change R.shadow.map ((R.e₀.mapHomotopyCategory _).map (resFunctor.map g.hom)) ≫
          (eIso b.obj).hom = (eIso a.obj).hom ≫ (singleFunctor (Rep k I) 0).map g.hom.hom
        refine (congrArg (· ≫ (eIso b.obj).hom) (R.e₀_comp_shadow_map (resFunctor.map g.hom))).trans
          ?_
        exact Gfun_map_resFunctor_comp_eIso g.hom)

/-- `Γ ∘ F ≅ single ∘ ρ` on `C_J`. -/
noncomputable def shadowRealIso :
    R.realF hR ⋙ R.shadow ≅ cdjIncl J D ⋙ rho D ⋙ singleFunctor (Rep k I) 0 :=
  matLiftCompIso (R.F₁ hR) R.shadow ≪≫ matLiftMapIso (R.shadowF₁Iso hR) ≪≫
    (matLiftCompIso (indJIncl J D ⋙ rho0 D) (singleFunctor (Rep k I) 0)).symm ≪≫ Iso.refl _

end RealizationData

end ExtriangulatedRealization

