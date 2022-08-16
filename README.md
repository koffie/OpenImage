# OpenImage

This is code for the preprint: [Explicit open images for elliptic curves over Q](https://arxiv.org/abs/2206.14959v1)

<<<<<<< HEAD
The main function is `FindOpenImage` in `main\FindOpenImage.m` which takes as input a non-CM elliptic curve E over Q and returns the image of its adelic Galois image; this is an open subgroup G of GL(2,Zhat) that is uniquely determined up to conjugacy.  The group G is returned as image in GL(2,Z/MZ) for some positive integer M that is divisible by the level of G.  
It also returns the index of G in GL(2,Zhat) and a group giving the intersection of G with SL(2,Zhat).
=======
The main function is `FindOpenImage` in the file `main\FindOpenImage.m` which takes as input a non-CM elliptic curve E over Q.  It computes the image of the adelic Galois representation of E; this is an open subgroup G of GL(2,Zhat) that is uniquely determined up to conjugacy.  The function returns:
* the group G given by its image in GL(2,Z/MZ) for some positive integer M that is divisible by the level of G,
* the index of G in GL(2,Zhat),
* the level in SL(2,Zhat) of the intersection of G and SL(2,Zhat).
>>>>>>> c1e81c48ef2aeb309f291b127024ca5b84870603

Results returned are guaranteed to be correct.   Errors will always occur if we come across an unknown exceptional point on some high genus modular curve.

<<<<<<< HEAD
Magma version at least 2.27 is required to read the data files.
=======
**Currently we are also excluding E/Q which have 81 specific j-invariants; they will be included in the next update**
>>>>>>> c1e81c48ef2aeb309f291b127024ca5b84870603

Please contact me with any suggestions or issues.



