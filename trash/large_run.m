
// nohup /net/apps/magma-2.27-2/magma -t 32 "large_run.m" &

// nohup magma -t 32 "large_run.m" &

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
        if j in CM_jInvariants or j in known_exceptional_jinvariants then continue E; end if;

        
        t0:=Realtime();
            GE,ind,lev:=FindOpenImage(E);
        t0:=Realtime(t0); 
        
        if t0 gt max_t0 then
            max_t0:=t0;
            
            "------";
            time GE,ind,lev:=FindOpenImage(E);
            t0," ",jInvariant(E)," ", aInvariants(E);" ";
        end if;
        



        indices:=indices join {* ind *};
	end for;

end while;