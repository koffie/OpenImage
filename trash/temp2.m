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


//Keys(ExceptionalImages) eq known_exceptional_jinvariants;

for j in Keys(ExceptionalImages) do

	G:=ExceptionalImages[j];
	b,k,G0:=FindAgreeableClosure(j: use_exceptional_data:=false);
	assert not b;
	
	N:=LCM([#BaseRing(G),#BaseRing(G0)]);
	
	G_:=gl2Lift(G,N);
	G0:=gl2Lift(G0,N);

	if #G0/#G_ lt 1  then 
		"non-exceptional";
		G:=ExceptionalImages[j];

		continue j;
	end if;

	if k in Keys(X) then	
		assert X[k]`genus ge 2 or X[k]`has_infinitely_many_points eq false;
		b:=X[k]`pi[1];
		//b; X[b]`cover_with_same_commutator_subgroup;
		if not X[b]`is_agreeable then b:=X[b]`pi[1]; end if;
		
		if IndexOfCommutator(G) eq X[b]`commutator_index then

			continue j;
		end if;

		if IsUnentangled(G) eq false then
			j; #BaseRing(G);" ";
		end if;
	end if;
	
	//IsUnentangled(G);

end for;

