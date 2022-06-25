
load "FindOpenImage.m";


for j in known_exceptional_jinvariants do
    b,k,G:=FindAgreeableClosure(j);
    if k notin Keys(X) then continue j; end if;
    if IsAgreeable(G) then
        M:=CreateModularCurveRec0(G);

        k;
        time [r[3]/M`index: r in MaximalAgreeable(M)];
    end if;
end for;





    N:=#BaseRing(G);
    unentangled_index:=1;
    for p in PrimeDivisors(N) do
        Np:=p^Valuation(N,p);
        Gp:=ChangeRing(G,Integers(Np));
        GL2:=GL(2,BaseRing(Gp));
        Gp:=sub<GL2|Generators(Gp) join Generators(Center(GL2))>;
        unentangled_index:=unentangled_index * Index(GL2,Gp);
    end for; 
    exceptional_for_RSZB:=exceptional_for_RSZB cat [<j,unentangled_index>];
end for;
exceptional_for_RSZB;

RSZBindices:=
[
    <64, [ 3, 5 ], [ 9, 6 ]>,
    <1331/8, [ 3, 5 ], [ 6, 6 ]>,
    <-216, [ 3 ], [ 9 ]>,
    <777228872334890625/60523872256, [ 2 ], [ 96 ]>,
    <-160855552000/1594323, [ 13 ], [ 91 ]>,
    <-1680914269/32768, [ 3, 5 ], [ 6, 6 ]>,
    <339071334684521624665810041360384000/480250763996501976790165756943041, [ 2, 3 ], [ 16, 3 ]>,
    <90616364985637924505590372621162077487104/197650497353702094308570556640625, [ 13 ], [ 91 ]>,
    <3375/2, [ 2, 3, 7 ], [ 2, 4, 8 ]>,
    <16974593, [ 2, 3 ], [ 12, 3 ]>,
    <-297756989/2, [ 17 ], [ 18 ]>,
    <2672876978743335041728512000/122130132904968017083, [ 11 ], [ 55 ]>,
    <806764685224507983/56693912375296, [ 2, 3 ], [ 12, 3 ]>,
    <16974593/256, [ 2 ], [ 24 ]>,
    <-44789760, [ 3 ], [ 27 ]>,
    <15786448344, [ 3 ], [ 27 ]>,
    <-189613868625/128, [ 2, 3, 7 ], [ 2, 4, 8 ]>,
    <15084602497088704/8303765625, [ 2, 3 ], [ 6, 3 ]>,
    <24992518538304, [ 3 ], [ 27 ]>,
    <215694547296795302321664/4177248169415651, [ 3, 5 ], [ 3, 15 ]>,
    <2048, [ 2 ], [ 24 ]>,
    <-82944, [], []>,
    <82881856/27, [ 2, 3 ], [ 3, 3 ]>,
    <6225959949099011451/32768, [ 3, 5 ], [ 3, 15 ]>,
    <-35937/4, [ 2, 3 ], [ 8, 4 ]>,
    <-227920097737283556595145924109375/602486784535040403801858901, [ 3, 5 ], [ 3, 10 ]>,
    <419904, [ 3 ], [ 27 ]>,
    <46969655/32768, [ 2, 3, 5 ], [ 2, 4, 6 ]>,
    <-121, [ 2, 11 ], [ 2, 12 ]>,
    <-18234932071051198464000/48661191875666868481, [ 2 ], [ 64 ]>,
    <-24729001, [ 2, 11 ], [ 2, 12 ]>,
    <4913, [ 2, 3 ], [ 12, 3 ]>,
    <-23788477376, [ 3, 5 ], [ 9, 6 ]>,
    <-47675785945529664000/929293739471222707, [ 11 ], [ 55 ]>,
    <2268945/128, [ 2, 7 ], [ 2, 56 ]>,
    <20480/243, [ 5 ], [ 6 ]>,
    <-1159088625/2097152, [ 2, 3, 7 ], [ 2, 4, 8 ]>,
    <-6357235796156406771/32768, [ 3, 5 ], [ 3, 15 ]>,
    <-631595585199146625/218340105584896, [ 2 ], [ 96 ]>,
    <4096, [ 3, 5 ], [ 3, 6 ]>,
    <-425920000/243, [ 5 ], [ 15 ]>,
    <-349938025/8, [ 2, 3, 5 ], [ 2, 4, 6 ]>,
    <-316368, [ 2, 3, 5 ], [ 2, 4, 5 ]>,
    <1906624/729, [ 2, 3 ], [ 3, 3 ]>,
    <-882216989/131072, [ 17 ], [ 18 ]>,
    <351/4, [ 2, 7 ], [ 8, 8 ]>,
    <-35817550197738955933474532061609984000/2301619141096101839813550846721, [ 2 ], [ 64 ]>,
    <-1723025/4, [ 2, 5 ], [ 4, 6 ]>,
    <-138240, [ 2 ], [ 4 ]>,
    <-121945/32, [ 2, 3, 5 ], [ 2, 4, 6 ]>,
    <-131375418677056/177978515625, [ 2, 3 ], [ 6, 3 ]>,
    <110592, [ 3 ], [ 9 ]>,
    <-110349050625/1024, [ 2, 5 ], [ 4, 15 ]>,
    <6838755720062350457411072, [ 3, 7 ], [ 3, 21 ]>,
    <-9317, [ 37 ], [ 38 ]>,
    <3375/64, [ 2, 3 ], [ 4, 6 ]>,
    <11225615440/1594323, [ 13 ], [ 91 ]>,
    <-21024576, [ 2, 3 ], [ 4, 9 ]>,
    <-1815478272, [ 2, 5 ], [ 4, 5 ]>,
    <5088980530576216000/4177248169415651, [ 3, 5 ], [ 3, 10 ]>,
    <-5000, [ 2, 5 ], [ 2, 15 ]>,
    <-140625/8, [ 2, 3, 7 ], [ 2, 4, 8 ]>,
    <-64278657/1024, [ 2, 5 ], [ 8, 5 ]>,
    <66735540581252505802048, [ 3, 7 ], [ 3, 21 ]>,
    <-13824, [ 3 ], [ 3 ]>,
    <-36, [ 2, 5 ], [ 8, 5 ]>,
    <-92515041526500, [ 2, 3 ], [ 4, 27 ]>,
    <68769820673/16, [ 2 ], [ 24 ]>,
    <141526649406897/1973822685184, [ 2, 3 ], [ 12, 3 ]>,
    <432, [ 2, 3, 5 ], [ 2, 4, 5 ]>,
    <-38575685889/16384, [ 2, 7 ], [ 8, 8 ]>,
    <1026895/1024, [ 2, 5 ], [ 4, 6 ]>,
    <210720960000000/16807, [ 5 ], [ 75 ]>,
    <-25/2, [ 2, 3, 5 ], [ 2, 4, 6 ]>,
    <-102400/3, [ 5 ], [ 6 ]>,
    <38477541376, [ 3, 5 ], [ 3, 6 ]>,
    <4374, [ 3 ], [ 27 ]>,
    <30081024/3125, [ 5 ], [ 5 ]>,
    <136878750000, [ 5 ], [ 50 ]>,
    <-162677523113838677, [ 37 ], [ 38 ]>,
    <-9645037507360901960000/79792266297612001, [ 2, 5 ], [ 8, 5 ]>,
    <78608, [ 2 ], [ 24 ]>,
    <550731776, [ 7 ], [ 21 ]>,
    <-1273201875, [ 5 ], [ 10 ]>,
    <109503/64, [ 2, 3 ], [ 8, 4 ]>,
    <4543847424/3125, [ 5 ], [ 5 ]>
];



for r in RSZBindices do
    b,k,G:=FindAgreeableClosure(r[1]);
    assert not b;
    Z:=Center(GL(2,BaseRing(G)));
    if Z subset G eq false then
        G:=sub<GL(2,BaseRing(G)) | Generators(G) join Generators(Z)>;
    end if;
    N:=gl2Level(G);
    G:=ChangeRing(G,Integers(N));

    //M:=CreateModularCurveRec0(G);
    //if M`is_entangled then continue r; end if;
    " ";
    k;
    r[3];

    N:=#BaseRing(G);
    for p in PrimeDivisors(N) do
        Np:=p^Valuation(N,p);
        Gp:=ChangeRing(G,Integers(Np));
        Index( GL(2,Integers(Np)), Gp);
    end for;
        
end for;


    //if k in Keys(X) then continue j; end if;

    //" ";k;
    //M:=CreateModularCurveRec0(G);
    //[M`is_entangled,IsAgreeable(M`G)];
    
    //time [r[3]/M`index: r in MaximalAgreeable(M)];

    //continue j; 
   // [X[k]`index,X[k]`N];
   /* k;
    M:=CreateModularCurveRec0(G);
    M`is_entangled;
    if IsAgreeable(M`G)  then

        time [r[3]/M`index: r in MaximalAgreeable(M)];

    end if;
    continue j;
    
    

    " ";
    continue j;


    E:=EllipticCurveWithjInvariant(j);
    E:=MinimalTwist(E);
    Factorization(Conductor(E));
    */

    //P:=[2,3,5,7,11,13,17,19,37];
    //P:=[P[i]: i in [1..#k] | k[i] ne "1A0-1a"];



    continue r;

    P_:=Set(P) diff {2};
    //if #P_ lt 2 then continue j; end if;
    assert #P_ eq 2 and 3 in P_;
    k;
    P_;

    " ";
    //continue j;
    "---";
    k;
    N:=#BaseRing(G);

    for p in P do
        Gp:=ChangeRing(G,Integers(p^Valuation(N,p)));
        HH:=[H`subgroup: H in NormalSubgroups(Gp)];  
        HH:=[H: H in HH | IsSimple(quo<Gp|H>)];
        [Index(Gp,H): H in HH];
    end for;


    //#Subgroups(G);
    " ";
    //M:=CreateModularCurveRec0(G);
    //M`is_entangled;
    
    //time [r[3]/M`index: r in MaximalAgreeable(M)];

    //[#BaseRing(G),gl2Level(G)];
    //time IndexOfCommutator(G);    
end for;



j:=10^7;

function ht(P)
	if P[1] eq 0 or P[2] eq 0 then return 1; end if;
	a:=P[1]/P[2];
	return Maximum(Numerator(a),Denominator(a));
end function;



A,f:=MordellWeilGroup(X[k]`C);
P0:=f(A.1);

ht_j:=ht([j,1]);
found:=false;
e:=0;
repeat
	Q1:=X[k]`map_to_jline( e*P0 );
	Q2:=X[k]`map_to_jline(-e*P0 );
    if j eq Q1[1]/Q1[2] then
        found:=true;
        Q:=e*P0;
    elif j eq Q2[1]/Q2[2] then
        found:=true;
        Q:=-e*P0;
    end if;		
	e:=e+1;
until found or (e ge 7 and ht(Q1) gt ht_j and ht(Q2) gt h_j);