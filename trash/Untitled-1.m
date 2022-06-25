load "../main/FindOpenImage.m";


I:=Open("../data-files/exceptional_agreeable_closures.dat", "r");
ExceptionalImages:=AssociativeArray();
repeat
	b,j:=ReadObjectCheck(I);
	if b then
        b,y:=ReadObjectCheck(I);
		ExceptionalImages[j]:=y;
	end if;
until not b;

Remove(~ExceptionalImages, -40960/27); // TODO
Keys(ExceptionalImages) eq known_exceptional_jinvariants;


for j in known_exceptional_jinvariants do
    b,k,G0:=FindAgreeableClosure(j);
    assert not b;
    G:=ExceptionalImages[j];
    M:=LCM([#BaseRing(G),#BaseRing(G0)]);
    G:=gl2Lift(G,M);
    G0:=gl2Lift(G0,M);
    if #G0/#G lt 1 then
        j;
        #G0/#G;
        k;
        X[k]`is_agreeable;
        X[k]`genus;
        " ";
        //assert X[k]`is_agreeable eq false;
    else
        assert G subset G0;
    end if;
end for;


to_study:=known_exceptional_jinvariants;

for j in known_exceptional_jinvariants do
    b,G:=FindAgreeableClosure(j);
    if b then
        to_study:=to_study diff {j};
        "j-invariant ",j," is fine for agreeable closure.";
    end if;
end for;


"==========";
"j-invariants which may not lead to an exceptional agreeable group";
for j in to_study do
    b,k,G:=FindAgreeableClosure(j);
    assert not b;
    if not IsAgreeable(G) then
        j;
        k;
        assert k in Keys(X) and X[k]`is_agreeable eq false;
        to_study:=to_study diff {j};
    end if;
end for;



for j in to_study do
    b,k,G:=FindAgreeableClosure(j);
    N:=#BaseRing(G);
    P:=[p^Valuation(N,p): p in PrimeDivisors(N)];
    agreeable:=&*[#ChangeRing(G,Integers(q)): q in P] eq #G;
    if agreeable then
        if #P eq 1 then continue j; end if;
        //P; 
        continue j; 
        for q in P do
            if IsOdd(q) then
                Gq:=ChangeRing(G,Integers(q));
                D:=CommutatorSubgroup(Gq);
                GL(2,BaseRing(D))![-1,0,0,-1] in D;
            end if;
        end for;
        
        genus:=[ GL2Genus(ChangeRing(G,Integers(q))): q in P];
        assert #genus eq 1 or Set(genus) subset {0,1};
    else
        if X[k]`genus ge 2 then
            //continue j;
            assert G eq X[k]`G;
            
            b:=X[k]`pi[1]; //X[k]`degree/X[b]`degree;

            if GCD(X[b]`N,11*13) ne 1 then "dumb"; X[b]`N; " "; continue j; end if;

            //ind;
            " "; k; b; 
            if IsEven(X[k]`N) eq false then
                G:=gl2Lift(G,2*X[k]`N);
            end if;
            G1:=X[b]`G;
            if IsEven(X[b]`N) eq false then
                G1:=gl2Lift(G1,2*X[b]`N);
            end if;

            time N0,gens0,ind0:=FindCommutatorSubgroup(G);  
            X[k]`Hc:=sub<SL(2,Integers(N0)) | gens0>;   // gives the group [G,G]
            X[k]`commutator_index:=ind0; // index in SL(2,Zhat)

            _,_,ind1:=FindCommutatorSubgroup(G1);
            if assigned X[b]`commutator_index then
                assert ind1 eq X[b]`commutator_index;
            end if;

            if ind0/ind1 ne 1 then
                X[b]`N;
                X[k]`N;
            end if;
            //G1:=gl2Lift(G1,#BaseRing(G));
            //IsNormal(G1,G);
            //#Normalizer(G1,G meet SL(2,BaseRing(G)))/#G;
            //#G1/#G;
            " "; 
        end if;
    end if;
end for;

/*
for j in to_study do
    b,k,G:=FindAgreeableClosure(j);
    assert ContainsScalars(G);
end for;
*/