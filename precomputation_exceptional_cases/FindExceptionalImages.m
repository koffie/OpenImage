load "../main/FindOpenImage.m";

total_time:=Realtime();

exceptional_images:=[];

load "exceptional_image_unentangled_cases.m";
load "exceptional_image_entangled_cases.m";

load "exceptional_level_power_of_two.m";
load "exceptional_prime_level_borel.m";
load "exceptional_prime_level_misc.m";

J:={a[1]: a in exceptional_images};
assert #J eq #exceptional_images and J subset known_exceptional_jinvariants;
J0:=known_exceptional_jinvariants diff J;
assert {j: j in J0 | not FindAgreeableClosure(j)} eq {};


function NaiveGeneratorChoice(G)
    // G subgroup of SL(2,Z/N)
    N:=#BaseRing(G);
    gens:=[];

    repeat
        m:=Maximum([#sub<GL(2,Integers(N))| gens cat [a]> : a in G]);
        assert exists(b){b: b in G | #sub<GL(2,Integers(N))| gens cat [b]> eq m};
        gens:=gens cat [b];
        GG:=sub<GL(2,Integers(N))| gens>;
    until GG eq G;
    return GG;
end function;


exceptional_images1:=[];
for v in exceptional_images do
    //output:=[* j, aInvariants(E), GE, index, CommutatorSubgroup(G) *]; 

    j:=v[1];
    j;
    a_invariants:=v[2];
    G:=v[3];
    index:=v[4];
    H:=v[5];

    H:=ChangeRing(H,Integers(sl2Level(H)));
    H:=NaiveGeneratorChoice(H);
    
    output:=[* j, a_invariants, #BaseRing(G), [Eltseq(g): g in Generators(G)], index, #BaseRing(H), [Eltseq(g): g in Generators(H)] *];
    
    output;

    exceptional_images1:=exceptional_images1 cat [output];
end for;


// Write modular curves to a file.
I:=Open("../data-files/exceptional_images.dat", "w");
for y in exceptional_images1 do
    WriteObject(I, y);
end for;

Realtime(total_time);

//735.330