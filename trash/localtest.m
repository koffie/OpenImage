load "../main/FindOpenImage.m";



keys:=[k: k in Keys(X) | X[k]`genus ge 2];
#keys;
// #[k: k in keys | IsUnentangled(X[k]`G)];   // is 0

//Sort([X[k]`genus: k in keys]);
//Sort([X[k]`N: k in keys]);


for k in keys do

    k1:=X[k]`pi[1];
    ind:= X[k]`degree/X[k1]`degree;

    if ind ne 2 or X[k1]`genus ne 1 then continue k; end if;

    E:=X[k1]`C;
    F<x,y>:=FunctionField(E);
    neg_y:=(NegationMap(E)([x,y,1]))[2];
    f:=hom<F->F | [x,neg_y]>;

    Pol<u>:=PolynomialRing(F);




    
        model:=X[k]`high_genus_model;
        assert IsEven(#model);

        P:=[];
        while #model ne 0 do
            c:=Evaluate(model[1],[x,y,1])/Evaluate(model[2],[x,y,1]);
            P:= P cat [c];
            model:=[model[j]: j in [3..#model]];
        end while;

        if X[k]`is_serre_type_model then
            assert #P eq 3 and P[2] eq 0 and P[3] eq 1;
            J:=(X[k1]`map_to_jline[1])([x,y,1]);
            J:=J[1]/J[2];
            
            P[1]:=P[1]*(J-1728);
        end if;

        P_:=[f(a): a in P];

        P:=&+[P[i]*u^(i-1): i in [1..#P]];
        P_:=&+[P_[i]*u^(i-1): i in [1..#P_]];
        Q:=P*P_;

        Q:=[Coefficient(Q,i): i in [0..Degree(Q)]];
        
        K<t>:=FunctionField(Rationals());
        Pol<V>:=PolynomialRing(K);
        L<v>:=quo<Pol| [ Evaluate(DefiningPolynomial(E),[t,V,1])  ]>;
        Q0:=[];
        for q in Q do
            phi:=ProjectiveRationalFunction(q);
            q0:=Evaluate(Numerator(phi),([L!t,L!v,L!1]))/Evaluate(Denominator(phi),([L!t,L!v,L!1]));
            q0:=L!q0;
            q0:=K!q0;
            Q0:=Q0 cat [q0];
            //Q0;
        end for;

        Pol<u>:=PolynomialRing(K);
        Q:=&+[Q0[i]*u^(i-1): i in [1..#Q0]];

        assert Degree(Q) eq 4 and IsMonic(Q);
        for i in [0..Degree(Q)-1] do
            c:=Denominator(Coefficient(Q,i));
            for f in Factorization(c) do
                // m (d-i) - f[2] ge 0,      m ge f[2]/(d-i)
                m:=Ceiling(f[2]/(Degree(Q)-i));
                g:=K!(f[1]^m);
                Q:=g^Degree(Q) * Evaluate(Q,u/g);   // g^(d-i)
            end for;
        end for;
        assert &and[Denominator(c) eq 1 : c in Coefficients(Q)];
        
        Q;
        for f in Factorization(Numerator(Coefficient(Q,0))) do
            pi:=f[1];
            [ Floor(Valuation(Coefficient(Q,i),pi)/(4-i)): i in [0..Degree(Q)-1]  ];

        end for;



        a:=Coefficient(Q,0);
        //[f[2]: f in Factorization(Numerator(a))];

        //b:=IsIrreducible(Q);
        //Factorization(Q);


    

end for;



assert false;

S:=[];
count:=[0,0,0,0,0,0];
for k in keys do
    k1:=X[k]`pi[1];
    if X[k1]`genus ne 0 or X[k]`is_serre_type_model then continue k; end if;

    
    //N:=X[k]`N;
    //G:=X[k]`G;
    //Q:=[p^Valuation(N,p): p in PrimeDivisors(N)];
    //ind:=(&*[#ChangeRing(G,Integers(q)): q in Q])/#G;
    ind:= X[k]`degree/X[k1]`degree;
    

    model:=X[k]`high_genus_model;
    // hyperelliptic model case



    if #model eq 3 and model[2] eq 0 and model[3] eq 1 then

        


        f:=-model[1];
        C:=HyperellipticCurve(f);
        C1:=ReducedModel(C);

        if HasPointsEverywhereLocally(f,2) eq false then
            continue k;
        end if;

        //" ";
        //G:=AutomorphismGroup(C);
        //Genus(C); BadPrimes(C);
        
        if  Genus(C) le 2 then 
            " "; Genus(C);
            //J:=Jacobian(C);
            //time l,r:=RankBounds(J);
        
            time l,r:=RankBounds(f,2);
           
          
            
            count[r+1]:=count[r+1]+1;
        end if;
    end if;

    assert not X[k]`is_serre_type_model;
end for;
count;



for k in K do
    X[k]`degree/X[ X[k]`pi[1] ]`degree;



end for;


keys0:=Sort([k: k in keys | X[k]`N lt 70]);

for k in Keys(X) do
    prec:=60;

    time Y:=FindModelOfXG(X[k], prec);


end for;