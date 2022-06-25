load "../main/FindOpenImage.m";

for k in Keys(X) do
    if X[k]`genus le 1 and X[k]`has_infinitely_many_points and not X[k]`extraneous then
        if X[k]`cyclic_invariants eq [] then continue k; end if;
    
        if X[k]`genus eq 0 then
            P:=X[k]`C![1,0];
        else
            P:=X[k]`C![0,1,0];
        end if;

        Q:=Eltseq(X[k]`map_to_jline(P));
        if Q[2] eq 0 then continue k; end if;  //cusp
        j:=Q[1]/Q[2];
        if j in CM_jInvariants then continue k; end if;  //CM j-invariant
        if j in known_exceptional_jinvariants then continue k; end if;  
        // these will be treated specially anyway

        _:=exists(base){k: k in Keys(X) | X[k]`degree eq 1};
        S:=LiftQpoints(X[k]`map_to_jline,{X[base]`C![j,1]});

        assert {Eltseq(a): a in S} ne {[1,0]};      

    end if;
end for;
