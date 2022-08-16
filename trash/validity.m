Attach("../../other/ell-adic-galois-images/groups/gl2.m");
load "../../other/ell-adic-galois-images/groups/gl2data.m";
time RSZB:=GL2Load(0);
V:=GL2LoadExamples();


load "../main/FindOpenImage.m";

/*
load "../main/FindOpenImage.m";
D:=CremonaDatabase();   
LargestConductor(D);
  
t:=Realtime();
indices:={*  *};

max_t0:=0;
N:=1;
while N lt LargestConductor(D) do
    N:=N+1;
    if N mod 1000 eq 0 then 
        N/500000.;
        indices;
        Realtime(t); 
        " ";
        t:=Realtime();
    end if;

	for E in EllipticCurves(D,N) do
        j:=jInvariant(E);
        if j in CM_jInvariants then continue E; end if;

        
        t0:=Realtime();
            GE,ind,lev:=FindOpenImage(E);
        t0:=Realtime(t0); 







        
        if t0 gt max_t0 then
            max_t0:=t0;
            
            "------";
            time GE,ind,lev:=FindOpenImage(E);
            t0," ",jInvariant(E)," ", aInvariants(E);" ";
        end if;



        NE:=#BaseRing(GE);
        P:=[p: p in PrimeDivisors(NE) | ChangeRing(GE,Integers(p^Valuation(NE,p))) 
                    ne GL(2,Integers(p^Valuation(NE,p)))  ];
        HH:=[ ChangeRing(GE,Integers(p^Valuation(NE,p))) : p in P];
        HH:=[ ChangeRing(H,Integers(gl2Level(H))): H in HH];


        v:=GL2EllAdicImages(E,RSZB);
        GG:=[* RSZB[a]`subgroup: a in v *];

        if (#HH ne #GG) or
            not ( &and [#BaseRing(HH[i]) eq #BaseRing(GG[i]) : i in [1..#GG]] ) or
            not  &and[IsConjugate(GL(2,BaseRing(HH[i])), HH[i], GG[i]  ) :  i in [1..#GG]] then

            j;            
            j in known_exceptional_jinvariants;
            aInvariants(E);
            assert false;
        end if;            
    

        indices:=indices join {* ind *};
	end for;

end while;
*/


for j in known_exceptional_jinvariants do
    " "; 
    j;

    E:=MinimalModel(EllipticCurveWithjInvariant(j));
    aInvariants(E);
    time v:=GL2EllAdicImages(E,RSZB);
    v;

    GG:=[* RSZB[a]`subgroup: a in v *];
    assert &and [gl2Level(G) eq #BaseRing(G) : G in GG];

    //E:=V[v];
    //j:=jInvariant(E);

    

    time GE,index,HE:=FindOpenImage(E);
    N:=#BaseRing(GE);
    time P:=[p: p in PrimeDivisors(#BaseRing(HE)) | ChangeRing(GE,Integers(p^Valuation(N,p))) 
                ne GL(2,Integers(p^Valuation(N,p)))  ];
    time HH:=[ ChangeRing(GE,Integers(p^Valuation(N,p))) : p in P];


    " ";P;
    [#GL(2,BaseRing(H))/#H : H in HH ];

    time HH:=[ ChangeRing(H,Integers(gl2Level(H))): H in HH];
    
    if (#HH ne #GG) or
       not ( &and [#BaseRing(HH[i]) eq #BaseRing(GG[i]) : i in [1..#GG]] ) or
       not  &and[IsConjugate(GL(2,BaseRing(HH[i])), HH[i], GG[i]  ) :  i in [1..#GG]] then

       j;
       j in known_exceptional_jinvariants;
       aInvariants(E);
       assert false;
    end if;


end for;



