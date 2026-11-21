module

public import ExtriangulatedRealization.CD.Indecomposables

/-!
# Heredity of `C(D)` (Proposition 4.4, `E² = 0`)

Split an object `M` into the summand `M_A` formed by its entries `A i` and the summand `M_R` of
its other entries, so that `1_M = ι_A π_A + ι_R π_R`. By (4.1), `E(M_A, -) = 0` and
`E(-, M_R) = 0`. Hence for `α ∈ E(M, A)` and `β ∈ E(C, M)` the generator `α ⊗ β` of the tensor
square of Gorsky, Nakaoka and Palu equals `(π_R)^*(ι_R)^* α ⊗ β ≡ (ι_R)^* α ⊗ (π_R)_* β = 0`
modulo the defining relations.
-/

@[expose] public section

namespace ExtriangulatedRealization

open CategoryTheory Limits Opposite Statement IntervalLabel

universe u

variable {k : Type u} [Field k] {I : Type u} [LinearOrder I] (D : Iᵒᵖ ⥤ ModuleCat.{u} k)

attribute [local instance] HasExt.standard

/-- Whether a label is some `A i`. -/
def isALabel : IndCat D → Bool
  | some (A _) => true
  | _ => false

lemma not_isExtPair_of_isALabel {c : IndCat D} (hc : isALabel D c = true) (a : IndCat D) :
    ¬ IsExtPair c a := by
  rcases c with _ | _ | j | j <;> rcases a with _ | _ | i | i <;> simp_all [isALabel, IsExtPair]

lemma not_isExtPair_of_not_isALabel {a : IndCat D} (ha : (!isALabel D a) = true) (c : IndCat D) :
    ¬ IsExtPair c a := by
  rcases c with _ | _ | j | j <;> rcases a with _ | _ | i | i <;> simp_all [isALabel, IsExtPair]

/-- Generators with a zero factor lie in the subgroup of relations. -/
lemma of_zero_left_mem {C' A : CD D} (N : CD D) (β : (cdData D).Ext C' N) :
    FreeAbelianGroup.of (⟨N, 0, β⟩ : (cdData D).TensorGenerator C' A) ∈
      AddSubgroup.closure ((cdData D).tensorRelations C' A) := by
  have hr := AddSubgroup.subset_closure (k := (cdData D).tensorRelations C' A)
    (Or.inl ⟨N, 0, 0, β, rfl⟩)
  rw [add_zero, sub_self, zero_sub] at hr
  exact neg_mem_iff.mp hr

lemma of_zero_right_mem {C' A : CD D} (N : CD D) (α : (cdData D).Ext N A) :
    FreeAbelianGroup.of (⟨N, α, 0⟩ : (cdData D).TensorGenerator C' A) ∈
      AddSubgroup.closure ((cdData D).tensorRelations C' A) := by
  have hr := AddSubgroup.subset_closure (k := (cdData D).tensorRelations C' A)
    (Or.inr (Or.inl ⟨N, α, 0, 0, rfl⟩))
  rw [add_zero, sub_self, zero_sub] at hr
  exact neg_mem_iff.mp hr

/-- **Proposition 4.4**, heredity: `E² = 0`. -/
theorem cdData_isHereditary : (cdData D).IsHereditary := by
  classical
  rintro C' A ⟨M, α, β⟩
  let p : M.ι → Bool := fun i => isALabel D (M.X i)
  let q : M.ι → Bool := fun i => !isALabel D (M.X i)
  have hdisj : ∀ i, p i = true → q i = true → False := fun i hp hq => by
    simp_all [p, q]
  have hcov : ∀ i, p i = true ∨ q i = true := fun i => by
    cases h : isALabel D (M.X i) <;> simp [p, q, h]
  have hα : α = (cdData D).pull (subProj M p) ((cdData D).pull (subIncl M p) α) +
      (cdData D).pull (subProj M q) ((cdData D).pull (subIncl M q) α) := by
    rw [cdData_pull_comp, cdData_pull_comp, ← cdData_pull_add, subProj_subIncl_add M p q hcov hdisj,
      cdData_pull_id]
  have h₁ : (cdData D).pull (subIncl M p) α = 0 :=
    cdExt_eq_zero D (C := subObj M p) (fun i j => not_isExtPair_of_isALabel D i.2 _) _
  rw [h₁, map_zero, zero_add] at hα
  have h₂ : (cdData D).push (subProj M q) β = 0 :=
    cdExt_eq_zero D (A := subObj M q) (fun i j => not_isExtPair_of_not_isALabel D j.2 _) _
  have hbal := AddSubgroup.subset_closure (k := (cdData D).tensorRelations C' A)
    (Or.inr (Or.inr ⟨M, subObj M q, subProj M q, (cdData D).pull (subIncl M q) α, β, rfl⟩))
  rw [h₂] at hbal
  have h := AddSubgroup.add_mem _ hbal
    (of_zero_right_mem D (C' := C') (subObj M q) ((cdData D).pull (subIncl M q) α))
  rw [sub_add_cancel, ← hα] at h
  exact h

end ExtriangulatedRealization
