This folder contains the code use to precompute modular curve/data for our open image algorithm.
Here is a short description of the files, in the order they are ran.  See the relevant files for details.  *Warning*: running all of these together takes around 8 hours on the good machine I am using.

`FindUnentangledAgreeable.m` : computes needed agreeable groups of genus at most 1 that are unentangled; also computes models of the modular curves and morphisms to the j-line.

`FindAgreeable.m` : continues the previous code but now allows entanglement and groups of higher genus.

`FindHighGenusModels.m` : finds, possibly singular, models for all our relevant modular curves of genus at least 2.

`FindCommutatorInfo.m`:  computes commutator subgroups, works out remaining group theory.

`FindAbelianCovers.m`:  we compute some particular cover of modular curves with an abelian Galois group that acts explicitly.

`ComputeFrobData.m`:  functions for computing Frobenius data used to identify our group.
    
`FindOpenImage.m`:  search for rational points on high genus curves and makes sure our singular models are not hiding relevant points.







