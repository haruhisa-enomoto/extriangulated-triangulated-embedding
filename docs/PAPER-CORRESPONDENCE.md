# Paper correspondence

One row per numbered statement of [the formalized manuscript](MANUSCRIPT.md), in
source order, plus the cited inputs. Numbers and line numbers refer to
[`manuscript/main.tex`](manuscript/main.tex) (two-pass `pdflatex` build).
Status words: `defined`; `covered`; `covered (different route)`; `not needed`;
`not formalized`. Arguments that differ from the paper are described in
[proofs](proofs/README.md).

Lean names are in namespace `ExtriangulatedRealization`; paths are relative to
[`ExtriangulatedRealization/`](../ExtriangulatedRealization).

## Numbered statements

| No. | Kind | Label | Source | Status | Lean |
|---|---|---|---|---|---|
| Thm A | theorem | `intro:example` | `main.tex:130` | covered (= Theorem 4.5) | `theoremA` (`Criterion/TheoremA.lean`); endpoint `Statement.TheoremA` |
| Thm B | theorem | `intro:criterion` | `main.tex:181` | covered (= Theorem 3.1) | `theoremB` (`Criterion/TheoremB.lean`); endpoint `Statement.TheoremB` |
| (2.1) | diagram | `eq:rows` | `main.tex:299` | covered | `aMap`, `pMap`, `bMap`, `cMap` and their composites (`Intervals/Maps.lean`); `intervalSeq_shortExact` (`Intervals/Exact.lean`) |
| 2.1 | lemma | `lem:intervals` | `main.tex:310` | covered (different route: Step 2 splits off one interval at a time) | `injective_P`, `injective_Y` (`Intervals/Injective.lean`); `IsGood.of_shortExact` (`Intervals/Good.lean`); `IsGood.decompose` (`Intervals/Decomposition.lean`) |
| (2.2) | table | `eq:hom` | `main.tex:399` | covered (the entries used later) | `eq_coeffRep_smul_aMap`, `eq_zero_of_not_le`, `coeffBot_eq_zero_of_P` (`Intervals/Homs.lean`); `intervalRep_endo_eq_smul`, `hom_A_Y_eq_zero`, `hom_Y_P_eq_zero`, `hom_to_Y_eq_smul` (`Intervals/Endomorphisms.lean`) |
| 2.2 | construction | `con:category` | `main.tex:417` | defined | `Statement.CD`, `Statement.cdData`, `Statement.Realizes` (`Statement.lean`) |
| (2.3) | equation | `eq:X` | `main.tex:422` | defined | `Statement.OnePointExtension.homModule`, `Statement.psi` (`Statement.lean`) |
| 2.3 | proposition | `prop:complex` | `main.tex:459` | covered (different route: the realization takes values in the homotopy category `K(Q)` of all complexes instead of its full triangulated subcategory `Kᵇ(Q)`; the endpoint states that `C_J` with the induced structure is extriangulated and has an algebraic realization) | `proposition_2_3`, `subcatJ_isExtriangulatedSubcategory` (`Realization/Subcategory.lean`); `hasAlgebraicRealization_subcatJ` (`Realization/Proposition.lean`); endpoint `Statement.Proposition_2_3` |
| (2.4) | equation | `eq:quotient` | `main.tex:533` | covered | `RealizationData.xLin`, `xMor_eq_zero` (`Realization/XPart.lean`); `ιA_surj`, `ιA_inj` (`Realization/FullyFaithful.lean`) |
| 2.4 | corollary | `cor:axioms` | `main.tex:607` | covered (each `C_J` with the induced extension bifunctor, realizations and biproducts satisfies all axioms) | `corollary_2_4`, `subcatJ_isExtriangulatedSubcategory`, `cd_realizes_transport` (`Realization/Subcategory.lean`); `cdData_isExtriangulated` (`Realization/Extriangulated.lean`); transfer lemmas (`Realization/Transfer.lean`); `subcatJ_isExtensionClosed`, `essentiallySmall_CD` (`CD/Closure.lean`); endpoint `Statement.Corollary_2_4` |
| (3.1) | equation | `eq:push` | `main.tex:680` | covered | `push_epsClass` (`CD/Singles.lean`) |
| 3.1 | theorem | `thm:criterion` | `main.tex:684` | covered | `theoremB_necessity` (`Criterion/Necessity.lean`, all universes); `hasAlgebraicRealization_of_projectionsSurjective`, `theoremB` (`Criterion/TheoremB.lean`) |
| (3.2) | diagram | `eq:triangles` | `main.tex:705` | covered (inside the proof) | `projectionsSurjective_of_embedding` (`Criterion/Necessity.lean`) |
| 4.1 | lemma | `lem:linear` | `main.tex:758` | covered (for any index order whose countable subsets are bounded) | `linearize_hasSurjectiveTransitions`, `linearize_compatible_eq_zero`, `linearize_not_projectionsSurjective` (`InverseSystems/Linearization.lean`) |
| 4.2 | example | `ex:injections` | `main.tex:768` | covered | `Injections.example_4_2`, `Injections.system_map_surjective`, `Injections.system_no_branch`, `Injections.system_obj_bot` (`InverseSystems/Injections.lean`) |
| 4.3 | construction | `con:tree` | `main.tex:802` | covered (nodes modelled as functions `ω₁ → ℚ` vanishing from their level on) | `Aronszajn.tree`, `Aronszajn.good`, `Aronszajn.system`, `Aronszajn.system_map_surjective`, `Aronszajn.system_no_branch`, `Aronszajn.countable_system_obj` (`InverseSystems/Aronszajn.lean`); `Omega1` facts (`InverseSystems/Omega1.lean`); `treeSystem`, `rank_treeSystem_le` (`Criterion/TheoremA.lean`) |
| 4.4 | proposition | `prop:size` | `main.tex:827` | covered (different route for idempotent completeness: triangular splitting instead of Krause; `Eⁿ = 0` for every `n ≥ 2`) | `proposition_4_4` (`CD/Structure.lean`); `isIdempotentComplete_CD` (`CD/Idempotents.lean`); `isKrullSchmidt_CD`, `exists_iso_single_of_isIndecomposable`, `eq_of_single_iso`, `single_existsUnique_smul` (`CD/Indecomposables.lean`); `cd_hasEnoughInjectives` (`CD/Injectives.lean`); `cdData_isHereditary` (`CD/Heredity.lean`); endpoint `Statement.Proposition_4_4` |
| (4.1) | equation | `eq:extensions` | `main.tex:836` | covered | `ext_one_Y_A`, `ext_one_P_A`, `ext_one_A_A_eq_zero`, `ext_one_P_A_eq_zero` (`Intervals/Ext.lean`); `rank_ext_single` (`CD/Indecomposables.lean`) |
| 4.5 | theorem | `thm:example` | `main.tex:894` | covered | `theoremA` (`Criterion/TheoremA.lean`); `exists_labelsIn_Iic_of_countable` (`CD/Subcategory.lean`); `mk_indecomposableClasses`, `rank_hom_le_aleph0`, `rank_ext_le_one_of_isIndecomposable` (`CD/Counting.lean`) |
| 4.6 | proposition | `prop:bounds` | `main.tex:959` | covered ((1), (2); the closing bounds, `#I ≥ ℵ₁` and some `dim D_i ≥ ℵ₀` for a category with no embedding, follow from (1), (2) and Theorem B; for the tree system `dim D_i ≤ ℵ₀` is `rank_treeSystem_le`) | `proposition_4_6`, `projectionsSurjective_of_countable_cofinal`, `projectionsSurjective_of_finiteDimensional` (`Criterion/Bounds.lean`) |

## Cited inputs

| Source | Use | Status | Lean |
|---|---|---|---|
| Nakaoka–Palu, Definition 2.12 | definition of extriangulated category | defined | `Statement.ExtriangulatedData.IsExtriangulated` |
| Bennett-Tennenhaus–Shah, Definition 2.32 (`n = 1`) | extriangulated functor | defined | `Statement.ExtriangulatedFunctor` |
| Nakaoka–Palu, Remark 2.18 | extension-closed subcategories of triangulated categories | covered (for `C_J` in `K(Q)`) | `Realization/Transfer.lean` (`realizes_of_distinguished`, `et4`, `et4_op`, ...) |
| Nakaoka–Palu, Proposition 3.24 and dual | injectives and projectives via `E` | covered (the direction used: `E(-, U) = 0` implies `U` injective) | `isInjectiveObject_of_ext_eq_zero` (`Extriangulated/Injectives.lean`) |
| Gorsky–Nakaoka–Palu, Definition 3.1, Remarks 3.2–3.3; GNP2 Proposition 2.1 | `Eⁿ`, hereditary | covered (`Eⁿ` for `n ≥ 2` by words α₁ ⊗ ⋯ ⊗ αₙ and the relations of additivity and balance) | `Statement.ExtriangulatedData.IsHereditary`; `cdData_isHereditary` (`CD/Heredity.lean`) |
| Happel; Keller §2.3 | stable categories of Frobenius categories; complexes | covered (different route: algebraicity in the quotient-functor formulation of `Statement.IsAlgebraicTriangulated`; its equivalence with Happel's stable-category definition is argued in [proofs](proofs/README.md) and not formalized) | `isAlgebraicTriangulated_homotopyCategory` (`Complexes/DegreewiseSplit.lean`, `Complexes/Frobenius.lean`) |
| Stacks Tag 05TG | Proposition 2.3, Step 1 | covered (Mathlib) | `CochainComplex.IsKInjective.Qh_map_bijective`; used in `Gfun_map_bijective` (`Realization/Comparison.lean`) |
| Krause, Corollary 4.4 | Proposition 4.4, Step 1 | not needed (replaced by a direct splitting argument) | `split_biprod_of_triangular`, `Matrix.exists_factor_of_mul_self` (`Categories/Idempotents.lean`); `isIdempotentComplete_CD` (`CD/Idempotents.lean`) |
| Bergman, Lemma 3 (Higman–Stone) | Lemma 4.1 | covered (direct finite-support proof) | `linearize_compatible_eq_zero` (`InverseSystems/Linearization.lean`) |
| Jech, proof of Theorem 9.16 | Construction 4.3 | covered | `Aronszajn.tree`, `Aronszajn.good` (`InverseSystems/Aronszajn.lean`) |
| Henkin (Tukey) | Proposition 4.6(1) | covered | `projectionsSurjective_of_countable_cofinal` (`Criterion/Bounds.lean`) |
| Botnan–Crawley-Boevey; Ghandour | alternatives only | not needed | — |
