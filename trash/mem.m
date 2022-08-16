
load "../main/FindOpenImage.m";


D:=CremonaDatabase();
E:=EllipticCurve(D,"399003h1");

G:=FindOpenImage(E); [GetMemoryUsage(), GetMaximumMemoryUsage()]; 

m:=1000; for i in [1..m] do  G:=FindOpenImage(E); end for; [GetMemoryUsage(), GetMaximumMemoryUsage()]; 

m:=2000; for i in [1..m] do  G:=FindOpenImage(E); end for; [GetMemoryUsage(), GetMaximumMemoryUsage()]; 

m:=3000; for i in [1..m] do  G:=FindOpenImage(E); end for; [GetMemoryUsage(), GetMaximumMemoryUsage()]; 

