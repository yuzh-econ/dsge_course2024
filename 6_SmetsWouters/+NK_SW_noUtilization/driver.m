%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'NK_SW_noUtilization';
M_.dynare_version = '5.0';
oo_.dynare_version = '5.0';
options_.dynare_version = '5.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(7,1);
M_.exo_names_tex = cell(7,1);
M_.exo_names_long = cell(7,1);
M_.exo_names(1) = {'epsA'};
M_.exo_names_tex(1) = {'epsA'};
M_.exo_names_long(1) = {'epsA'};
M_.exo_names(2) = {'epsG'};
M_.exo_names_tex(2) = {'epsG'};
M_.exo_names_long(2) = {'epsG'};
M_.exo_names(3) = {'epsMCS'};
M_.exo_names_tex(3) = {'epsMCS'};
M_.exo_names_long(3) = {'epsMCS'};
M_.exo_names(4) = {'epsMPS'};
M_.exo_names_tex(4) = {'epsMPS'};
M_.exo_names_long(4) = {'epsMPS'};
M_.exo_names(5) = {'epsIS'};
M_.exo_names_tex(5) = {'epsIS'};
M_.exo_names_long(5) = {'epsIS'};
M_.exo_names(6) = {'epsMRSS'};
M_.exo_names_tex(6) = {'epsMRSS'};
M_.exo_names_long(6) = {'epsMRSS'};
M_.exo_names(7) = {'epsRPS'};
M_.exo_names_tex(7) = {'epsRPS'};
M_.exo_names_long(7) = {'epsRPS'};
M_.endo_names = cell(42,1);
M_.endo_names_tex = cell(42,1);
M_.endo_names_long = cell(42,1);
M_.endo_names(1) = {'V'};
M_.endo_names_tex(1) = {'V'};
M_.endo_names_long(1) = {'V'};
M_.endo_names(2) = {'U'};
M_.endo_names_tex(2) = {'U'};
M_.endo_names_long(2) = {'U'};
M_.endo_names(3) = {'C'};
M_.endo_names_tex(3) = {'C'};
M_.endo_names_long(3) = {'C'};
M_.endo_names(4) = {'H'};
M_.endo_names_tex(4) = {'H'};
M_.endo_names_long(4) = {'H'};
M_.endo_names(5) = {'K'};
M_.endo_names_tex(5) = {'K'};
M_.endo_names_long(5) = {'K'};
M_.endo_names(6) = {'S'};
M_.endo_names_tex(6) = {'S'};
M_.endo_names_long(6) = {'S'};
M_.endo_names(7) = {'X'};
M_.endo_names_tex(7) = {'X'};
M_.endo_names_long(7) = {'X'};
M_.endo_names(8) = {'I'};
M_.endo_names_tex(8) = {'I'};
M_.endo_names_long(8) = {'I'};
M_.endo_names(9) = {'IS'};
M_.endo_names_tex(9) = {'IS'};
M_.endo_names_long(9) = {'IS'};
M_.endo_names(10) = {'Sdash'};
M_.endo_names_tex(10) = {'Sdash'};
M_.endo_names_long(10) = {'Sdash'};
M_.endo_names(11) = {'lambda'};
M_.endo_names_tex(11) = {'lambda'};
M_.endo_names_long(11) = {'lambda'};
M_.endo_names(12) = {'Wh'};
M_.endo_names_tex(12) = {'Wh'};
M_.endo_names_long(12) = {'Wh'};
M_.endo_names(13) = {'rK'};
M_.endo_names_tex(13) = {'rK'};
M_.endo_names_long(13) = {'rK'};
M_.endo_names(14) = {'adash'};
M_.endo_names_tex(14) = {'adash'};
M_.endo_names_long(14) = {'adash'};
M_.endo_names(15) = {'RPS'};
M_.endo_names_tex(15) = {'RPS'};
M_.endo_names_long(15) = {'RPS'};
M_.endo_names(16) = {'LAMBDA'};
M_.endo_names_tex(16) = {'LAMBDA'};
M_.endo_names_long(16) = {'LAMBDA'};
M_.endo_names(17) = {'R'};
M_.endo_names_tex(17) = {'R'};
M_.endo_names_long(17) = {'R'};
M_.endo_names(18) = {'Q'};
M_.endo_names_tex(18) = {'Q'};
M_.endo_names_long(18) = {'Q'};
M_.endo_names(19) = {'au'};
M_.endo_names_tex(19) = {'au'};
M_.endo_names_long(19) = {'au'};
M_.endo_names(20) = {'Rn'};
M_.endo_names_tex(20) = {'Rn'};
M_.endo_names_long(20) = {'Rn'};
M_.endo_names(21) = {'PIE'};
M_.endo_names_tex(21) = {'PIE'};
M_.endo_names_long(21) = {'PIE'};
M_.endo_names(22) = {'PIEw'};
M_.endo_names_tex(22) = {'PIEw'};
M_.endo_names_long(22) = {'PIEw'};
M_.endo_names(23) = {'W'};
M_.endo_names_tex(23) = {'W'};
M_.endo_names_long(23) = {'W'};
M_.endo_names(24) = {'Jw'};
M_.endo_names_tex(24) = {'Jw'};
M_.endo_names_long(24) = {'Jw'};
M_.endo_names(25) = {'Hd'};
M_.endo_names_tex(25) = {'Hd'};
M_.endo_names_long(25) = {'Hd'};
M_.endo_names(26) = {'MRSS'};
M_.endo_names_tex(26) = {'MRSS'};
M_.endo_names_long(26) = {'MRSS'};
M_.endo_names(27) = {'JJw'};
M_.endo_names_tex(27) = {'JJw'};
M_.endo_names_long(27) = {'JJw'};
M_.endo_names(28) = {'WO'};
M_.endo_names_tex(28) = {'WO'};
M_.endo_names_long(28) = {'WO'};
M_.endo_names(29) = {'Deltaw'};
M_.endo_names_tex(29) = {'Deltaw'};
M_.endo_names_long(29) = {'Deltaw'};
M_.endo_names(30) = {'YW'};
M_.endo_names_tex(30) = {'YW'};
M_.endo_names_long(30) = {'YW'};
M_.endo_names(31) = {'A'};
M_.endo_names_tex(31) = {'A'};
M_.endo_names_long(31) = {'A'};
M_.endo_names(32) = {'PWP'};
M_.endo_names_tex(32) = {'PWP'};
M_.endo_names_long(32) = {'PWP'};
M_.endo_names(33) = {'MC'};
M_.endo_names_tex(33) = {'MC'};
M_.endo_names_long(33) = {'MC'};
M_.endo_names(34) = {'Jp'};
M_.endo_names_tex(34) = {'Jp'};
M_.endo_names_long(34) = {'Jp'};
M_.endo_names(35) = {'Y'};
M_.endo_names_tex(35) = {'Y'};
M_.endo_names_long(35) = {'Y'};
M_.endo_names(36) = {'MCS'};
M_.endo_names_tex(36) = {'MCS'};
M_.endo_names_long(36) = {'MCS'};
M_.endo_names(37) = {'JJp'};
M_.endo_names_tex(37) = {'JJp'};
M_.endo_names_long(37) = {'JJp'};
M_.endo_names(38) = {'PO'};
M_.endo_names_tex(38) = {'PO'};
M_.endo_names_long(38) = {'PO'};
M_.endo_names(39) = {'Deltap'};
M_.endo_names_tex(39) = {'Deltap'};
M_.endo_names_long(39) = {'Deltap'};
M_.endo_names(40) = {'MPS'};
M_.endo_names_tex(40) = {'MPS'};
M_.endo_names_long(40) = {'MPS'};
M_.endo_names(41) = {'G'};
M_.endo_names_tex(41) = {'G'};
M_.endo_names_long(41) = {'G'};
M_.endo_names(42) = {'RK'};
M_.endo_names_tex(42) = {'RK'};
M_.endo_names_long(42) = {'RK'};
M_.endo_partitions = struct();
M_.param_names = cell(31,1);
M_.param_names_tex = cell(31,1);
M_.param_names_long = cell(31,1);
M_.param_names(1) = {'gy'};
M_.param_names_tex(1) = {'gy'};
M_.param_names_long(1) = {'gy'};
M_.param_names(2) = {'alp'};
M_.param_names_tex(2) = {'alp'};
M_.param_names_long(2) = {'alp'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'zzetap'};
M_.param_names_tex(4) = {'zzetap'};
M_.param_names_long(4) = {'zzetap'};
M_.param_names(5) = {'zzetaw'};
M_.param_names_tex(5) = {'zzetaw'};
M_.param_names_long(5) = {'zzetaw'};
M_.param_names(6) = {'PIE_bar'};
M_.param_names_tex(6) = {'PIE\_bar'};
M_.param_names_long(6) = {'PIE_bar'};
M_.param_names(7) = {'g_bar'};
M_.param_names_tex(7) = {'g\_bar'};
M_.param_names_long(7) = {'g_bar'};
M_.param_names(8) = {'betta'};
M_.param_names_tex(8) = {'betta'};
M_.param_names_long(8) = {'betta'};
M_.param_names(9) = {'sigma_c'};
M_.param_names_tex(9) = {'sigma\_c'};
M_.param_names_long(9) = {'sigma_c'};
M_.param_names(10) = {'chi'};
M_.param_names_tex(10) = {'chi'};
M_.param_names_long(10) = {'chi'};
M_.param_names(11) = {'phiX'};
M_.param_names_tex(11) = {'phiX'};
M_.param_names_long(11) = {'phiX'};
M_.param_names(12) = {'xip'};
M_.param_names_tex(12) = {'xip'};
M_.param_names_long(12) = {'xip'};
M_.param_names(13) = {'xiw'};
M_.param_names_tex(13) = {'xiw'};
M_.param_names_long(13) = {'xiw'};
M_.param_names(14) = {'gammap'};
M_.param_names_tex(14) = {'gammap'};
M_.param_names_long(14) = {'gammap'};
M_.param_names(15) = {'gammaw'};
M_.param_names_tex(15) = {'gammaw'};
M_.param_names_long(15) = {'gammaw'};
M_.param_names(16) = {'pssi'};
M_.param_names_tex(16) = {'pssi'};
M_.param_names_long(16) = {'pssi'};
M_.param_names(17) = {'gamma2'};
M_.param_names_tex(17) = {'gamma2'};
M_.param_names_long(17) = {'gamma2'};
M_.param_names(18) = {'F'};
M_.param_names_tex(18) = {'F'};
M_.param_names_long(18) = {'F'};
M_.param_names(19) = {'rho_r'};
M_.param_names_tex(19) = {'rho\_r'};
M_.param_names_long(19) = {'rho_r'};
M_.param_names(20) = {'theta_pie'};
M_.param_names_tex(20) = {'theta\_pie'};
M_.param_names_long(20) = {'theta_pie'};
M_.param_names(21) = {'theta_y'};
M_.param_names_tex(21) = {'theta\_y'};
M_.param_names_long(21) = {'theta_y'};
M_.param_names(22) = {'theta_dy'};
M_.param_names_tex(22) = {'theta\_dy'};
M_.param_names_long(22) = {'theta_dy'};
M_.param_names(23) = {'rhoA'};
M_.param_names_tex(23) = {'rhoA'};
M_.param_names_long(23) = {'rhoA'};
M_.param_names(24) = {'rhoG'};
M_.param_names_tex(24) = {'rhoG'};
M_.param_names_long(24) = {'rhoG'};
M_.param_names(25) = {'rhoMCS'};
M_.param_names_tex(25) = {'rhoMCS'};
M_.param_names_long(25) = {'rhoMCS'};
M_.param_names(26) = {'rhoMRSS'};
M_.param_names_tex(26) = {'rhoMRSS'};
M_.param_names_long(26) = {'rhoMRSS'};
M_.param_names(27) = {'rhoMPS'};
M_.param_names_tex(27) = {'rhoMPS'};
M_.param_names_long(27) = {'rhoMPS'};
M_.param_names(28) = {'rhoRPS'};
M_.param_names_tex(28) = {'rhoRPS'};
M_.param_names_long(28) = {'rhoRPS'};
M_.param_names(29) = {'rhoIS'};
M_.param_names_tex(29) = {'rhoIS'};
M_.param_names_long(29) = {'rhoIS'};
M_.param_names(30) = {'sigma_s'};
M_.param_names_tex(30) = {'sigma\_s'};
M_.param_names_long(30) = {'sigma_s'};
M_.param_names(31) = {'habit'};
M_.param_names_tex(31) = {'habit'};
M_.param_names_long(31) = {'habit'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 7;
M_.endo_nbr = 42;
M_.param_nbr = 31;
M_.orig_endo_nbr = 42;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(7, 7);
M_.Correlation_matrix = eye(7, 7);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.nonzero_hessian_eqs = [2 3 4 5 7 8 9 10 11 12 13 16 17 18 19 20 21 22 23 24 26 27 28 29 30 31 33 34 35 36 37 38 39 40 41 42];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 42;
M_.eq_nbr = 42;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 18 60;
 0 19 61;
 1 20 62;
 0 21 0;
 2 22 0;
 0 23 0;
 0 24 63;
 3 25 0;
 4 26 64;
 0 27 65;
 0 28 66;
 0 29 0;
 0 30 67;
 0 31 0;
 5 32 0;
 0 33 68;
 0 34 69;
 6 35 70;
 0 36 0;
 7 37 0;
 8 38 71;
 0 39 72;
 9 40 0;
 0 41 73;
 0 42 0;
 10 43 0;
 0 44 74;
 0 45 0;
 11 46 0;
 0 47 0;
 12 48 0;
 0 49 0;
 0 50 0;
 0 51 75;
 13 52 0;
 14 53 0;
 0 54 76;
 0 55 0;
 15 56 0;
 16 57 0;
 17 58 0;
 0 59 0;]';
M_.nstatic = 12;
M_.nfwrd   = 13;
M_.npred   = 13;
M_.nboth   = 4;
M_.nsfwrd   = 17;
M_.nspred   = 17;
M_.ndynamic   = 30;
M_.dynamic_tmp_nbr = [44; 51; 10; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , ' Intertemporal welfare' ;
  2 , 'name' , ' Period utility' ;
  3 , 'name' , ' Law of motion for capital' ;
  4 , 'name' , ' Investment' ;
  5 , 'name' , ' Capital adjustment cost' ;
  6 , 'name' , ' Capital adjustment cost' ;
  7 , 'name' , ' Consumption foc with external habit' ;
  8 , 'name' , ' Household foc for hours' ;
  9 , 'name' , ' Euler equation' ;
  10 , 'name' , ' Household foc for capital' ;
  11 , 'name' , ' Household foc for investment' ;
  12 , 'name' , ' Stochastic discount factor' ;
  13 , 'name' , ' Ex-post real return' ;
  14 , 'name' , ' Capital utilisation adjustment function' ;
  15 , 'name' , ' Capital utilisation adjustment function derivative' ;
  16 , 'name' , ' Wage inflation' ;
  17 , 'name' , ' Wage setting condition' ;
  18 , 'name' , ' Wage setting condition' ;
  19 , 'name' , ' Wage setting condition' ;
  20 , 'name' , ' Law of motion for wage level' ;
  21 , 'name' , ' Law of motion for wage dispersion' ;
  22 , 'name' , ' Production function' ;
  23 , 'name' , ' Firm for for labour' ;
  24 , 'name' , ' Firm foc: return on capital' ;
  25 , 'name' , ' Marginal cost' ;
  26 , 'name' , ' Price setting condition' ;
  27 , 'name' , ' Price setting condition' ;
  28 , 'name' , ' Price setting condition' ;
  29 , 'name' , ' Law of motion for price level' ;
  30 , 'name' , ' Law of motion for price dispersion' ;
  31 , 'name' , ' Taylor rule' ;
  32 , 'name' , ' Resource constraint' ;
  33 , 'name' , ' Market clearing for labor' ;
  34 , 'name' , ' Market clearing for goods' ;
  35 , 'name' , ' Gross real return on capital' ;
  36 , 'name' , ' Law of motion for productivity' ;
  37 , 'name' , ' Law of motion for government expenditure' ;
  38 , 'name' , ' Law of motion for price markup shock' ;
  39 , 'name' , ' Law of motion for wage markup shock' ;
  40 , 'name' , ' Law of motion for capital quality shock' ;
  41 , 'name' , ' Law of motion for monetary policy shock' ;
  42 , 'name' , ' Law of motion for risk premium shock' ;
};
M_.mapping.V.eqidx = [1 ];
M_.mapping.U.eqidx = [1 2 7 8 ];
M_.mapping.C.eqidx = [2 7 8 32 ];
M_.mapping.H.eqidx = [2 8 33 ];
M_.mapping.K.eqidx = [3 22 24 ];
M_.mapping.S.eqidx = [3 5 11 ];
M_.mapping.X.eqidx = [4 5 6 11 ];
M_.mapping.I.eqidx = [3 4 32 ];
M_.mapping.IS.eqidx = [3 11 40 ];
M_.mapping.Sdash.eqidx = [6 11 ];
M_.mapping.lambda.eqidx = [7 12 ];
M_.mapping.Wh.eqidx = [8 17 ];
M_.mapping.rK.eqidx = [10 24 35 ];
M_.mapping.adash.eqidx = [15 ];
M_.mapping.RPS.eqidx = [9 42 ];
M_.mapping.LAMBDA.eqidx = [9 10 11 12 17 18 26 27 ];
M_.mapping.R.eqidx = [9 13 ];
M_.mapping.Q.eqidx = [10 11 35 ];
M_.mapping.au.eqidx = [14 ];
M_.mapping.Rn.eqidx = [13 31 ];
M_.mapping.PIE.eqidx = [13 16 17 18 20 21 26 27 29 30 31 ];
M_.mapping.PIEw.eqidx = [16 17 18 20 21 ];
M_.mapping.W.eqidx = [16 19 23 ];
M_.mapping.Jw.eqidx = [17 19 ];
M_.mapping.Hd.eqidx = [17 18 22 23 33 ];
M_.mapping.MRSS.eqidx = [17 39 ];
M_.mapping.JJw.eqidx = [18 19 ];
M_.mapping.WO.eqidx = [19 20 21 ];
M_.mapping.Deltaw.eqidx = [21 33 ];
M_.mapping.YW.eqidx = [22 23 24 34 ];
M_.mapping.A.eqidx = [22 36 ];
M_.mapping.PWP.eqidx = [23 24 25 ];
M_.mapping.MC.eqidx = [25 26 ];
M_.mapping.Jp.eqidx = [26 28 ];
M_.mapping.Y.eqidx = [26 27 31 32 34 ];
M_.mapping.MCS.eqidx = [26 38 ];
M_.mapping.JJp.eqidx = [27 28 ];
M_.mapping.PO.eqidx = [28 29 30 ];
M_.mapping.Deltap.eqidx = [30 34 ];
M_.mapping.MPS.eqidx = [31 41 ];
M_.mapping.G.eqidx = [32 37 ];
M_.mapping.RK.eqidx = [35 ];
M_.mapping.epsA.eqidx = [36 ];
M_.mapping.epsG.eqidx = [37 ];
M_.mapping.epsMCS.eqidx = [38 ];
M_.mapping.epsMPS.eqidx = [41 ];
M_.mapping.epsIS.eqidx = [40 ];
M_.mapping.epsMRSS.eqidx = [39 ];
M_.mapping.epsRPS.eqidx = [42 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 5 8 9 15 18 20 21 23 26 29 31 35 36 39 40 41 ];
M_.exo_names_orig_ord = [1:7];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(42, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(7, 1);
M_.params = NaN(31, 1);
M_.endo_trends = struct('deflator', cell(42, 1), 'log_deflator', cell(42, 1), 'growth_factor', cell(42, 1), 'log_growth_factor', cell(42, 1));
M_.NNZDerivatives = [166; 293; -1; ];
M_.static_tmp_nbr = [29; 13; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(31) = 1;
habit = M_.params(31);
M_.params(1) = 0.18;
gy = M_.params(1);
M_.params(2) = 0.67;
alp = M_.params(2);
M_.params(3) = 0.0250;
delta = M_.params(3);
M_.params(4) = 7.0;
zzetap = M_.params(4);
M_.params(5) = 3.0;
zzetaw = M_.params(5);
M_.params(6) = 0.472907;
PIE_bar = M_.params(6);
M_.params(7) = 0.2750617;
g_bar = M_.params(7);
M_.params(8) = 0.99;
betta = M_.params(8);
M_.params(9) = 1.5;
sigma_c = M_.params(9);
M_.params(10) = 0.7;
chi = M_.params(10);
M_.params(11) = 2.0;
phiX = M_.params(11);
M_.params(12) = 0.7;
xip = M_.params(12);
M_.params(13) = 0.7;
xiw = M_.params(13);
M_.params(14) = 0.5;
gammap = M_.params(14);
M_.params(15) = 0.5;
gammaw = M_.params(15);
M_.params(16) = 2;
pssi = M_.params(16);
M_.params(17) = .5;
gamma2 = M_.params(17);
M_.params(18) = 0.25;
F = M_.params(18);
M_.params(19) = 0.7;
rho_r = M_.params(19);
M_.params(20) = 1.5;
theta_pie = M_.params(20);
M_.params(21) = 0.3;
theta_y = M_.params(21);
M_.params(22) = 0.3;
theta_dy = M_.params(22);
M_.params(23) = 0.7;
rhoA = M_.params(23);
M_.params(24) = 0.7;
rhoG = M_.params(24);
M_.params(25) = 0.7;
rhoMCS = M_.params(25);
M_.params(26) = 0.7;
rhoMRSS = M_.params(26);
M_.params(27) = 0.7;
rhoMPS = M_.params(27);
M_.params(28) = 0.7;
rhoRPS = M_.params(28);
M_.params(29) = 0.7;
rhoIS = M_.params(29);
M_.params(30) = 0.001;
sigma_s = M_.params(30);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(30))^2;
M_.Sigma_e(2, 2) = (M_.params(30))^2;
M_.Sigma_e(3, 3) = (M_.params(30))^2;
M_.Sigma_e(4, 4) = (M_.params(30))^2;
M_.Sigma_e(5, 5) = (M_.params(30))^2;
M_.Sigma_e(6, 6) = (M_.params(30))^2;
M_.Sigma_e(7, 7) = (M_.params(30))^2;
options_.irf = 40;
options_.order = 2;
options_.pruning = true;
var_list_ = {'Y';'C';'I';'H';'Hd';'W';'R';'Q';'Rn';'MC';'PIE';'PIEw';'V';'Deltap';'Deltaw'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
oo_.dr.eigval = check(M_,options_,oo_);
steady;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'NK_SW_noUtilization_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_noUtilization_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_noUtilization_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_noUtilization_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_noUtilization_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_noUtilization_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_noUtilization_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
