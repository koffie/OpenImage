# OpenImage

This is a modified version of David Zywina's repository that repackages the code to expose public interfaces as intrinsics and removes the dependence on relative path names. To compute adelic images of non-CM elliptic curves over Q you proceed as follows:

```
AttachSpec("OpenImage.spec");
Z := OpenImageContext(datadir); // takes about 20s, datadir should point to the data-files directory in this repo
FindOpenImage(Z, EllipticCurve("11a1"));
H,i,S := FindOpenImage(Z, EllipticCurve("14a1"));
FindLevels(H,i,S);
```

Currently there are intrinsics for the `CreateModularCurveRec`, `FindCanonicalModel`, and `FindRelations` functions in `ModularCurves.m`.  Feel free to submit a PR if there are other functions you would like to have exposed as intrinsics.

-----

This is code for the preprint: [Explicit open images for elliptic curves over Q](https://arxiv.org/abs/2206.14959v1)

The main function is `FindOpenImage` in `main\FindOpenImage.m` which takes as input a non-CM elliptic curve E over Q and returns the image of its adelic Galois image; this is an open subgroup G of GL(2,Zhat) that is uniquely determined up to conjugacy.  The group G is returned as its image in GL(2,Z/NZ), where N is the level of G.   It also returns the index of G in GL(2,Zhat) and a group giving the intersection of G with SL(2,Zhat).

Results returned are guaranteed to be correct.   Errors will always occur if E gives rise to an unknown exceptional rational point on certain high genus modular curves.

Magma version at least 2.27 is required to read the data files.

Please contact me with any suggestions or issues.
