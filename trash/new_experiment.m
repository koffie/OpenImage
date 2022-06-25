


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

Keys(ExceptionalImages);


for j in Keys(ExceptionalImages) do
    G:=ExceptionalImages[j];
    if not IsAgreeable(G) then

        PrimeDivisors(gl2Level(G));
        PrimeDivisors(sl2Level(G meet SL(2,BaseRing(G))));

        GG:=G;

        for g in Transversal(GL(2,BaseRing(GG)),GG) do
            GG_:=sub<GL(2,BaseRing(GG)) | Generators(GG) join {g}>;
            if IsAgreeable(GG_) then
                #GG_/#GG;
            end if;
        end for;

        " ";        
    end if;
end for;



Ind:={};

for j in Keys(ExceptionalImages) do
    G:=ExceptionalImages[j];
    ind:=IndexOfCommutator(G);
    ind0:=Index(SL(2,BaseRing(G)), G meet SL(2,BaseRing(G)));
    ind,"     ",ind/ind0,"       ",j;



    Ind:=Ind join {ind};
end for;

Ind;


assert exists(base){k:k in Keys(X)| X[k]`N eq 1};

for j in Keys(ExceptionalImages) do
    G:=ExceptionalImages[j];
    //if not IsAgreeable(G) then j; end if;  // TODO???
    N:=#BaseRing(G);
    
    P:=PrimeDivisors(N);
    P:=[p^Valuation(N,p): p in P];

    _,k,_:=FindAgreeableClosure(j);
    if #P ge 2 and #G eq &*[#ChangeRing(G,Integers(q)): q in P] then
        //[GL2Genus(ChangeRing(G,Integers(q))): q in P];
        assert #k eq #base;
        keys:=[];
        for i in [1..#k] do
            if k[i] eq base[i] then continue i; end if;
            k0:=base;
            k0[i]:=k[i];
            keys:=keys cat [k0];
        end for;
        //keys;
        //[k in Keys(X) : k in keys];
        #k;
    else
        //" ";//k;
    end if;
end for;






