

E := EllipticCurve([1, -1, 1, -93701832, -349092134751]);

load "FindOpenImage.m";  GE:=FindOpenImage(E); 
_,k,_:=FindAgreeableClosure(jInvariant(E));
k;

J:=Expand(X[k]`map_to_jline);
_:=exists(base){k: k in Keys(X) | X[k]`N eq 1};

Z:=Pullback(J,X[base]`C![jInvariant(E),1]);

u:=Rep(Points(Z));

G:=sub<GL(2,Integers(7)) | [[1,0,1,1],[1,0,0,3],[-1,0,0,-1]]>;
M:=CreateModularCurveRec0(G);
M:=FindModelOfXG(M, 40); 

C:=Curve(ProjectiveSpace(GF(p),1));
R<x,y>:=PolynomialRing(Integers(),2);
psi:=[R!f: f in FindMorphismBetweenModularCurves(M,X[k],[1,0,0,1])];



phi:=map< M`C->X[k]`C | psi >;


psi0:=[R!f: f in FindMorphismBetweenModularCurves(M,M,[2,0,1,4])];
f:=map< M`C->M`C | psi0 >;


p:=31;
q:=p^3;
C:=Curve(ProjectiveSpace(GF(q),1));

up:=C![GF(q)!a: a in Eltseq(u)];

phi:=map< C->C | psi >;
f:=map< C->C | psi0 >;

Z:=Pullback(phi,up);
y:=Rep(Points(Z));

yp:=C![a^p: a in Eltseq(y)];

yp eq f(y);
