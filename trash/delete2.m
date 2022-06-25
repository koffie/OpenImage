



G:=sub<GL(2,Integers(11))| [[1,0,1,1],[1,0,0,2],[-1,0,0,-1]]>; // transpose?
H:=sub<GL(2,Integers(11))| [[1,0,1,1],[2,0,0,1]]>;

M:=CreateModularCurveRec0(G);

M:=FindModelOfXG(M,100);

//M:=FindModularForms(3,M,50); 

base:=Rep({k: k in Keys(X) | X[k]`N eq 1});
M0:=X[base];

psi:=FindMorphismBetweenModularCurves(M,M0,[1,0,0,1]);
//phi:=map< M`C->M0`C | psi >;

L<t,s>:=FunctionField(M`C);
j:=Evaluate(psi[1],[t,s,1])/Evaluate(psi[2],[t,s,1]);

E:=EllipticCurve([-s*t+t-s^2, -s*(s+1)*(s+t)*t, -s*(s+1)*(s+t)*t^2, 0, 0]);

// E6/j
_<q>:=LaurentSeriesRing(Rationals());
u:=[Eisenstein(6,q+O(q^100))/jInvariant(q+O(q^100))];   


            assert exists(base){k: k in Keys(X) | X[k]`N eq 1};
            E6:=ConvertModularFormExpansions(X[k],X[base],[1,0,0,1],E6);

            
E6:=[Eisenstein(6,q1+O(q1^100))];   
            assert exists(base){k: k in Keys(X) | X[k]`N eq 1};
            E6:=ConvertModularFormExpansions(X[k],X[base],[1,0,0,1],E6);
