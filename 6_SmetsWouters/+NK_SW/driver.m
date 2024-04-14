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
M_.fname = 'NK_SW';
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
M_.endo_names = cell(43,1);
M_.endo_names_tex = cell(43,1);
M_.endo_names_long = cell(43,1);
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
M_.endo_names(19) = {'u'};
M_.endo_names_tex(19) = {'u'};
M_.endo_names_long(19) = {'u'};
M_.endo_names(20) = {'au'};
M_.endo_names_tex(20) = {'au'};
M_.endo_names_long(20) = {'au'};
M_.endo_names(21) = {'Rn'};
M_.endo_names_tex(21) = {'Rn'};
M_.endo_names_long(21) = {'Rn'};
M_.endo_names(22) = {'PIE'};
M_.endo_names_tex(22) = {'PIE'};
M_.endo_names_long(22) = {'PIE'};
M_.endo_names(23) = {'PIEw'};
M_.endo_names_tex(23) = {'PIEw'};
M_.endo_names_long(23) = {'PIEw'};
M_.endo_names(24) = {'W'};
M_.endo_names_tex(24) = {'W'};
M_.endo_names_long(24) = {'W'};
M_.endo_names(25) = {'Jw'};
M_.endo_names_tex(25) = {'Jw'};
M_.endo_names_long(25) = {'Jw'};
M_.endo_names(26) = {'Hd'};
M_.endo_names_tex(26) = {'Hd'};
M_.endo_names_long(26) = {'Hd'};
M_.endo_names(27) = {'MRSS'};
M_.endo_names_tex(27) = {'MRSS'};
M_.endo_names_long(27) = {'MRSS'};
M_.endo_names(28) = {'JJw'};
M_.endo_names_tex(28) = {'JJw'};
M_.endo_names_long(28) = {'JJw'};
M_.endo_names(29) = {'WO'};
M_.endo_names_tex(29) = {'WO'};
M_.endo_names_long(29) = {'WO'};
M_.endo_names(30) = {'Deltaw'};
M_.endo_names_tex(30) = {'Deltaw'};
M_.endo_names_long(30) = {'Deltaw'};
M_.endo_names(31) = {'YW'};
M_.endo_names_tex(31) = {'YW'};
M_.endo_names_long(31) = {'YW'};
M_.endo_names(32) = {'A'};
M_.endo_names_tex(32) = {'A'};
M_.endo_names_long(32) = {'A'};
M_.endo_names(33) = {'PWP'};
M_.endo_names_tex(33) = {'PWP'};
M_.endo_names_long(33) = {'PWP'};
M_.endo_names(34) = {'MC'};
M_.endo_names_tex(34) = {'MC'};
M_.endo_names_long(34) = {'MC'};
M_.endo_names(35) = {'Jp'};
M_.endo_names_tex(35) = {'Jp'};
M_.endo_names_long(35) = {'Jp'};
M_.endo_names(36) = {'Y'};
M_.endo_names_tex(36) = {'Y'};
M_.endo_names_long(36) = {'Y'};
M_.endo_names(37) = {'MCS'};
M_.endo_names_tex(37) = {'MCS'};
M_.endo_names_long(37) = {'MCS'};
M_.endo_names(38) = {'JJp'};
M_.endo_names_tex(38) = {'JJp'};
M_.endo_names_long(38) = {'JJp'};
M_.endo_names(39) = {'PO'};
M_.endo_names_tex(39) = {'PO'};
M_.endo_names_long(39) = {'PO'};
M_.endo_names(40) = {'Deltap'};
M_.endo_names_tex(40) = {'Deltap'};
M_.endo_names_long(40) = {'Deltap'};
M_.endo_names(41) = {'MPS'};
M_.endo_names_tex(41) = {'MPS'};
M_.endo_names_long(41) = {'MPS'};
M_.endo_names(42) = {'G'};
M_.endo_names_tex(42) = {'G'};
M_.endo_names_long(42) = {'G'};
M_.endo_names(43) = {'RK'};
M_.endo_names_tex(43) = {'RK'};
M_.endo_names_long(43) = {'RK'};
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
M_.endo_nbr = 43;
M_.param_nbr = 31;
M_.orig_endo_nbr = 43;
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
M_.nonzero_hessian_eqs = [2 3 4 5 7 8 10 11 12 13 14 15 17 18 19 20 21 22 23 24 25 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 43;
M_.eq_nbr = 43;
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
 0 18 61;
 0 19 62;
 1 20 63;
 0 21 0;
 2 22 0;
 0 23 0;
 0 24 64;
 3 25 0;
 4 26 65;
 0 27 66;
 0 28 67;
 0 29 0;
 0 30 68;
 0 31 0;
 5 32 0;
 0 33 69;
 0 34 70;
 6 35 71;
 0 36 72;
 0 37 73;
 7 38 0;
 8 39 74;
 0 40 75;
 9 41 0;
 0 42 76;
 0 43 0;
 10 44 0;
 0 45 77;
 0 46 0;
 11 47 0;
 0 48 0;
 12 49 0;
 0 50 0;
 0 51 0;
 0 52 78;
 13 53 0;
 14 54 0;
 0 55 79;
 0 56 0;
 15 57 0;
 16 58 0;
 17 59 0;
 0 60 0;]';
M_.nstatic = 11;
M_.nfwrd   = 15;
M_.npred   = 13;
M_.nboth   = 4;
M_.nsfwrd   = 19;
M_.nspred   = 17;
M_.ndynamic   = 32;
M_.dynamic_tmp_nbr = [46; 52; 11; 0; ];
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
  9 , 'name' , ' Household foc for capital' ;
  10 , 'name' , ' Euler equation' ;
  11 , 'name' , ' Household foc for capital' ;
  12 , 'name' , ' Household foc for investment' ;
  13 , 'name' , ' Stochastic discount factor' ;
  14 , 'name' , ' Ex-post real return' ;
  15 , 'name' , ' Capital utilisation adjustment function' ;
  16 , 'name' , ' Capital utilisation adjustment function derivative' ;
  17 , 'name' , ' Wage inflation' ;
  18 , 'name' , ' Wage setting condition' ;
  19 , 'name' , ' Wage setting condition' ;
  20 , 'name' , ' Wage setting condition' ;
  21 , 'name' , ' Law of motion for wage level' ;
  22 , 'name' , ' Law of motion for wage dispersion' ;
  23 , 'name' , ' Production function' ;
  24 , 'name' , ' Firm for for labour' ;
  25 , 'name' , ' Firm foc: return on capital' ;
  26 , 'name' , ' Marginal cost' ;
  27 , 'name' , ' Price setting condition' ;
  28 , 'name' , ' Price setting condition' ;
  29 , 'name' , ' Price setting condition' ;
  30 , 'name' , ' Law of motion for price level' ;
  31 , 'name' , ' Law of motion for price dispersion' ;
  32 , 'name' , ' Taylor rule' ;
  33 , 'name' , ' Resource constraint' ;
  34 , 'name' , ' Market clearing for labor' ;
  35 , 'name' , ' Market clearing for goods' ;
  36 , 'name' , ' Gross real return on capital' ;
  37 , 'name' , ' Law of motion for productivity' ;
  38 , 'name' , ' Law of motion for government expenditure' ;
  39 , 'name' , ' Law of motion for price markup shock' ;
  40 , 'name' , ' Law of motion for wage markup shock' ;
  41 , 'name' , ' Law of motion for capital quality shock' ;
  42 , 'name' , ' Law of motion for monetary policy shock' ;
  43 , 'name' , ' Law of motion for risk premium shock' ;
};
M_.mapping.V.eqidx = [1 ];
M_.mapping.U.eqidx = [1 2 7 8 ];
M_.mapping.C.eqidx = [2 7 8 33 ];
M_.mapping.H.eqidx = [2 8 34 ];
M_.mapping.K.eqidx = [3 23 25 33 ];
M_.mapping.S.eqidx = [3 5 12 ];
M_.mapping.X.eqidx = [4 5 6 12 ];
M_.mapping.I.eqidx = [3 4 33 ];
M_.mapping.IS.eqidx = [3 12 41 ];
M_.mapping.Sdash.eqidx = [6 12 ];
M_.mapping.lambda.eqidx = [7 13 ];
M_.mapping.Wh.eqidx = [8 18 ];
M_.mapping.rK.eqidx = [9 11 25 36 ];
M_.mapping.adash.eqidx = [9 16 ];
M_.mapping.RPS.eqidx = [10 43 ];
M_.mapping.LAMBDA.eqidx = [10 11 12 13 18 19 27 28 ];
M_.mapping.R.eqidx = [10 14 ];
M_.mapping.Q.eqidx = [11 12 36 ];
M_.mapping.u.eqidx = [11 15 16 23 25 36 ];
M_.mapping.au.eqidx = [11 15 33 36 ];
M_.mapping.Rn.eqidx = [14 32 ];
M_.mapping.PIE.eqidx = [14 17 18 19 21 22 27 28 30 31 32 ];
M_.mapping.PIEw.eqidx = [17 18 19 21 22 ];
M_.mapping.W.eqidx = [17 20 24 ];
M_.mapping.Jw.eqidx = [18 20 ];
M_.mapping.Hd.eqidx = [18 19 23 24 34 ];
M_.mapping.MRSS.eqidx = [18 40 ];
M_.mapping.JJw.eqidx = [19 20 ];
M_.mapping.WO.eqidx = [20 21 22 ];
M_.mapping.Deltaw.eqidx = [22 34 ];
M_.mapping.YW.eqidx = [23 24 25 35 ];
M_.mapping.A.eqidx = [23 37 ];
M_.mapping.PWP.eqidx = [24 25 26 ];
M_.mapping.MC.eqidx = [26 27 ];
M_.mapping.Jp.eqidx = [27 29 ];
M_.mapping.Y.eqidx = [27 28 32 33 35 ];
M_.mapping.MCS.eqidx = [27 39 ];
M_.mapping.JJp.eqidx = [28 29 ];
M_.mapping.PO.eqidx = [29 30 31 ];
M_.mapping.Deltap.eqidx = [31 35 ];
M_.mapping.MPS.eqidx = [32 42 ];
M_.mapping.G.eqidx = [33 38 ];
M_.mapping.RK.eqidx = [36 ];
M_.mapping.epsA.eqidx = [37 ];
M_.mapping.epsG.eqidx = [38 ];
M_.mapping.epsMCS.eqidx = [39 ];
M_.mapping.epsMPS.eqidx = [42 ];
M_.mapping.epsIS.eqidx = [41 ];
M_.mapping.epsMRSS.eqidx = [40 ];
M_.mapping.epsRPS.eqidx = [43 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 5 8 9 15 18 21 22 24 27 30 32 36 37 40 41 42 ];
M_.exo_names_orig_ord = [1:7];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(43, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(7, 1);
M_.params = NaN(31, 1);
M_.endo_trends = struct('deflator', cell(43, 1), 'log_deflator', cell(43, 1), 'growth_factor', cell(43, 1), 'log_growth_factor', cell(43, 1));
M_.NNZDerivatives = [178; 322; -1; ];
M_.static_tmp_nbr = [31; 14; 0; 0; ];
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
M_.params(13) = 0.;
xiw = M_.params(13);
M_.params(14) = 0.5;
gammap = M_.params(14);
M_.params(15) = 0.5;
gammaw = M_.params(15);
M_.params(16) = 2;
pssi = M_.params(16);
M_.params(17) = 0.5;
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
var_list_ = {'Y';'C';'I';'H';'Hd';'W';'R';'Q';'Rn';'MC';'PIE';'PIEw';'u';'V';'Deltap';'Deltaw'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
oo_.dr.eigval = check(M_,options_,oo_);
steady;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'NK_SW_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK_SW_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end