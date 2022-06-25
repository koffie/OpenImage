load "FindOpenImage.m";
D:=CremonaDatabase();   
LargestConductor(D);
  
t:=Cputime();

N:=1;
while N lt LargestConductor(D) do
    N:=N+1;
    if N mod 1000 eq 0 then 
        N/500000.;
        Cputime(t); 
        t:=Cputime(t);
    end if;
	for E in EllipticCurves(D,N) do
        j:=jInvariant(E);
        if j in CM_jInvariants or j in known_exceptional_jinvariants then continue E; end if;

        GE:=FindOpenImage(E);

	end for;
end while;