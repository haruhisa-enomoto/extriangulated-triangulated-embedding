# Vendored code

No module of this repository is copied from another library. Every Lean file in
`ExtriangulatedRealization/` was written for this formalization; Mathlib is the only
dependency. [`verification/module-origins.json`](verification/module-origins.json)
records this for each module.

The decomposition of good interval representations (`Intervals/Peeling.lean`,
`Intervals/Decomposition.lean`) follows the route, splitting off one interval at a
time, of the linear-quiver decomposition in
[pretorsion-image-closed](https://github.com/haruhisa-enomoto/pretorsion-image-closed),
by the same maintainer; the code is new.
