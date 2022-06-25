# OpenImage

This is code for the preprint: [Explicit open images for elliptic curves over Q](https://pi.math.cornell.edu/~zywina/papers/ExplicitOpenImage.pdf)

The main function is `FindOpenImage` in `main\FindOpenImage.m` which takes as input a non-CM elliptic curve E over Q and returns the image of its adelic Galois image; this is an open subgroup G of GL(2,Zhat) that is uniquely determined up to conjugacy.  The group G is returned as image in GL(2,Z/MZ) for some positive integer M that is divisible by the level of G.

Results outputed are guaranteed to be correct.   Errors will always occur if we come across an unknown exceptional point on some high genus modular curve.

**Currently we are also excluding E/Q which have 81 specific j-invariants; they will be included in a future version**

Please contact me with any suggestions or issues.



