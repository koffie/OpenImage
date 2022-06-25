// INCOMPLETE

for j in known_exceptional_jinvariants do

    b,k,G:=FindAgreeableClosure(j : use_exceptional_data:=true);
    
    if b then
        " "; j;
        E:=EllipticCurve(EllipticCurveWithjInvariant(j));
        E:=MinimalTwist(E);
        G:=FindOpenImage(E);
        G;
        
    end if;
end for;
