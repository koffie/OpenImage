// nohup /net/apps/magma_2.26-12/magma -t 32 "run_all.m" &

global_time:=Cputime();

load "FindUnentangledAgreeable.m";
load "FindAgreeable.m";

load "FindHighGenusModels.m";

load "FindCommutatorInfo.m";
load "FindAbelianCovers.m";

load "ComputeFrobData.m";
time PreComputationOfFrobData("../data-files/frob_data.dat",101);

load "PointSearch.m";

Cputime(global_time);
"End.";
exit;



