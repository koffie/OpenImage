
// nohup /net/apps/magma-2.27-2/magma -t 32 "run_all.m" &
AttachSpec("../OpenImage.spec");
import "../main/ModularCurves.m" : low_genus, HasLowGenus, FindSerreTypeModel, FindMorphismBetweenModularCurves, CreateModularCurveRec0, FindCoverOfModularCurve, AutomorphismOfModularForms, SimplifyModularFormBasis, FindRelationRationalBruteForce, FindRelationEllipticBruteForce;
import "../main/GL2GroupTheory.m" : IsAgreeable, MaximalAgreeable, FindCommutatorSubgroup, GL2DetIndex, IsUnentangled;
import "../main/FindOpenImage.m" : known_exceptional_jinvariants, FindAgreeableClosure;

global_time:=Realtime();

load "FindUnentangledAgreeable.m";

load "FindAgreeable.m";

load "FindHighGenusModels.m";

load "FindCommutatorInfo.m";

load "FindAbelianCovers.m";

//load "PointSearch.m";

Realtime(global_time);

exit;



