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
M_.fname = 'RBC_JR_2';
M_.dynare_version = '5.0';
oo_.dynare_version = '5.0';
options_.dynare_version = '5.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'epsA'};
M_.exo_names_tex(1) = {'epsA'};
M_.exo_names_long(1) = {'epsA'};
M_.exo_names(2) = {'epsG'};
M_.exo_names_tex(2) = {'epsG'};
M_.exo_names_long(2) = {'epsG'};
M_.endo_names = cell(31,1);
M_.endo_names_tex = cell(31,1);
M_.endo_names_long = cell(31,1);
M_.endo_names(1) = {'U'};
M_.endo_names_tex(1) = {'U'};
M_.endo_names_long(1) = {'Utility function'};
M_.endo_names(2) = {'UC'};
M_.endo_names_tex(2) = {'UC'};
M_.endo_names_long(2) = {'Marginal utility of consumption'};
M_.endo_names(3) = {'UH'};
M_.endo_names_tex(3) = {'UL'};
M_.endo_names_long(3) = {'Marginal utility of labor'};
M_.endo_names(4) = {'UXi'};
M_.endo_names_tex(4) = {'{\Lambda^{\Xi}}'};
M_.endo_names_long(4) = {'Marginal Utility of $\Xi$'};
M_.endo_names(5) = {'lam'};
M_.endo_names_tex(5) = {'{\lambda}'};
M_.endo_names_long(5) = {'lagarange multiplier'};
M_.endo_names(6) = {'mu'};
M_.endo_names_tex(6) = {'{\mu}'};
M_.endo_names_long(6) = {'JR preferences auxiliary variable 2'};
M_.endo_names(7) = {'LAMBDA'};
M_.endo_names_tex(7) = {'\lambda'};
M_.endo_names_long(7) = {'Stochastic discount factor'};
M_.endo_names(8) = {'R'};
M_.endo_names_tex(8) = {'R'};
M_.endo_names_long(8) = {'Risk free interest rate'};
M_.endo_names(9) = {'RK'};
M_.endo_names_tex(9) = {'R^{K}'};
M_.endo_names_long(9) = {'Return on capital'};
M_.endo_names(10) = {'C'};
M_.endo_names_tex(10) = {'C'};
M_.endo_names_long(10) = {'Consumption'};
M_.endo_names(11) = {'Xi'};
M_.endo_names_tex(11) = {'{\Xi}'};
M_.endo_names_long(11) = {'JR preferences auxiliary variable 1'};
M_.endo_names(12) = {'W'};
M_.endo_names_tex(12) = {'W'};
M_.endo_names_long(12) = {'Real wage'};
M_.endo_names(13) = {'H'};
M_.endo_names_tex(13) = {'H'};
M_.endo_names_long(13) = {'Hours'};
M_.endo_names(14) = {'Y'};
M_.endo_names_tex(14) = {'Y'};
M_.endo_names_long(14) = {'Output'};
M_.endo_names(15) = {'K'};
M_.endo_names_tex(15) = {'K'};
M_.endo_names_long(15) = {'Capital'};
M_.endo_names(16) = {'I'};
M_.endo_names_tex(16) = {'I'};
M_.endo_names_long(16) = {'Investment'};
M_.endo_names(17) = {'A'};
M_.endo_names_tex(17) = {'A'};
M_.endo_names_long(17) = {'Technology'};
M_.endo_names(18) = {'G'};
M_.endo_names_tex(18) = {'G'};
M_.endo_names_long(18) = {'Government spending'};
M_.endo_names(19) = {'tax'};
M_.endo_names_tex(19) = {'T'};
M_.endo_names_long(19) = {'Tax'};
M_.endo_names(20) = {'X'};
M_.endo_names_tex(20) = {'X'};
M_.endo_names_long(20) = {'Gross investment growth rate'};
M_.endo_names(21) = {'Q'};
M_.endo_names_tex(21) = {'Q'};
M_.endo_names_long(21) = {'Tobin s Q'};
M_.endo_names(22) = {'KY'};
M_.endo_names_tex(22) = {'\frac{\bar{K}}{\bar{Y}}'};
M_.endo_names_long(22) = {'Capital output ratio in steady state'};
M_.endo_names(23) = {'IY'};
M_.endo_names_tex(23) = {'\frac{\bar{I}}{\bar{Y}}'};
M_.endo_names_long(23) = {'Investment output ratio in steady state'};
M_.endo_names(24) = {'CY'};
M_.endo_names_tex(24) = {'\frac{\bar{C}}{\bar{Y}}'};
M_.endo_names_long(24) = {'Consumption output ratio in steady state'};
M_.endo_names(25) = {'RR'};
M_.endo_names_tex(25) = {'RR'};
M_.endo_names_long(25) = {'Risk free interest rate - deviation from the steady state'};
M_.endo_names(26) = {'YY'};
M_.endo_names_tex(26) = {'YY'};
M_.endo_names_long(26) = {'Output - deviation from the steady state'};
M_.endo_names(27) = {'CC'};
M_.endo_names_tex(27) = {'CC'};
M_.endo_names_long(27) = {'Consumption - deviation from the steady state'};
M_.endo_names(28) = {'HH'};
M_.endo_names_tex(28) = {'HH'};
M_.endo_names_long(28) = {'Hours - deviation from the steady state'};
M_.endo_names(29) = {'WW'};
M_.endo_names_tex(29) = {'WW'};
M_.endo_names_long(29) = {'Real wage - deviation from the steady state'};
M_.endo_names(30) = {'II'};
M_.endo_names_tex(30) = {'II'};
M_.endo_names_long(30) = {'Investment - deviation from the steady state'};
M_.endo_names(31) = {'KK'};
M_.endo_names_tex(31) = {'KK'};
M_.endo_names_long(31) = {'Capital - deviation from the steady state'};
M_.endo_partitions = struct();
M_.param_names = cell(16,1);
M_.param_names_tex = cell(16,1);
M_.param_names_long = cell(16,1);
M_.param_names(1) = {'theta'};
M_.param_names_tex(1) = {'{\theta}'};
M_.param_names_long(1) = {'Inverse of the Frish Elasticity of Labor Supply'};
M_.param_names(2) = {'sigma_es'};
M_.param_names_tex(2) = {'{\sigma_{es}}'};
M_.param_names_long(2) = {'Intertemporal elasticity of substitution'};
M_.param_names(3) = {'kappa'};
M_.param_names_tex(3) = {'{\kappa}'};
M_.param_names_long(3) = {'Weight on Leisure in Utility'};
M_.param_names(4) = {'gamma'};
M_.param_names_tex(4) = {'{\gamma}'};
M_.param_names_long(4) = {'Wealth effect parameter'};
M_.param_names(5) = {'alp'};
M_.param_names_tex(5) = {'{\alpha}'};
M_.param_names_long(5) = {'Labor share'};
M_.param_names(6) = {'betta'};
M_.param_names_tex(6) = {'{\beta}'};
M_.param_names_long(6) = {'Discount factor'};
M_.param_names(7) = {'delta'};
M_.param_names_tex(7) = {'{\delta}'};
M_.param_names_long(7) = {'Capital depreciation'};
M_.param_names(8) = {'rhoA'};
M_.param_names_tex(8) = {'{\rho_{A}}'};
M_.param_names_long(8) = {'Persistence of labor augmentig shock'};
M_.param_names(9) = {'rhoG'};
M_.param_names_tex(9) = {'{\rho_{G}}'};
M_.param_names_long(9) = {'Persistence of government spending shock'};
M_.param_names(10) = {'sigma'};
M_.param_names_tex(10) = {'{\sigma}'};
M_.param_names_long(10) = {'Shock scaling parameter'};
M_.param_names(11) = {'phiX'};
M_.param_names_tex(11) = {'{\phi^X}'};
M_.param_names_long(11) = {'Investment adjustment costs'};
M_.param_names(12) = {'H_bar'};
M_.param_names_tex(12) = {'\bar{H}'};
M_.param_names_long(12) = {'Steady state hours'};
M_.param_names(13) = {'A_bar'};
M_.param_names_tex(13) = {'\bar{A}'};
M_.param_names_long(13) = {'Steady state technology'};
M_.param_names(14) = {'cy'};
M_.param_names_tex(14) = {'\frac{\bar{C}}{\bar{Y}}'};
M_.param_names_long(14) = {'Consumption output ratio in steady state'};
M_.param_names(15) = {'iy'};
M_.param_names_tex(15) = {'\frac{\bar{I}}{\bar{Y}}'};
M_.param_names_long(15) = {'Investment output ratio in steady state'};
M_.param_names(16) = {'gy'};
M_.param_names_tex(16) = {'\frac{\bar{G}}{\bar{Y}}'};
M_.param_names_long(16) = {'Government output ratio'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 31;
M_.param_nbr = 16;
M_.orig_endo_nbr = 31;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
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
M_.nonzero_hessian_eqs = [1 2 3 4 5 6 7 8 9 10 11 13 14 15 16 17 18 19 20 21 29 30 31];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 31;
M_.eq_nbr = 31;
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
 0 8 0;
 1 9 0;
 0 10 0;
 0 11 0;
 0 12 39;
 0 13 40;
 0 14 41;
 0 15 0;
 0 16 42;
 0 17 0;
 2 18 43;
 0 19 0;
 0 20 0;
 0 21 0;
 3 22 0;
 4 23 0;
 5 24 0;
 6 25 0;
 0 26 0;
 0 27 44;
 7 28 45;
 0 29 0;
 0 30 0;
 0 31 0;
 0 32 0;
 0 33 0;
 0 34 0;
 0 35 0;
 0 36 0;
 0 37 0;
 0 38 0;]';
M_.nstatic = 19;
M_.nfwrd   = 5;
M_.npred   = 5;
M_.nboth   = 2;
M_.nsfwrd   = 7;
M_.nspred   = 7;
M_.ndynamic   = 12;
M_.dynamic_tmp_nbr = [11; 10; 5; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Single period utility' ;
  2 , 'name' , 'Consumption - auxiliary variable' ;
  3 , 'name' , 'Marginal Utility of Consumption' ;
  4 , 'name' , 'Marginal Utility of Labor' ;
  5 , 'name' , 'Marginal Utility of auxiliary variable' ;
  6 , 'name' , 'Stochastic discount factor - 1' ;
  7 , 'name' , 'Stochastic discount factor - 1' ;
  8 , 'name' , 'Utility function parameter' ;
  9 , 'name' , 'Labor Supply FOC' ;
  10 , 'name' , 'Prodution function' ;
  11 , 'name' , 'Wholesale firms FOCs' ;
  12 , 'name' , 'Output equilibrium' ;
  13 , 'name' , 'Capital law of motion with investment costs' ;
  14 , 'name' , 'Gross investment growth rate' ;
  15 , 'name' , 'Stochastic discount factor - 2' ;
  16 , 'name' , 'Tobin s Q - 1' ;
  17 , 'name' , 'Returns on capital with adjustment costs - 1' ;
  18 , 'name' , 'Returns on capital with adjustment costs - 2' ;
  19 , 'name' , 'Balance budget constraint' ;
  20 , 'name' , 'Technology shock process' ;
  21 , 'name' , 'Government spending shock process' ;
  22 , 'name' , 'YY' ;
  23 , 'name' , 'KK' ;
  24 , 'name' , 'II' ;
  25 , 'name' , 'CC' ;
  26 , 'name' , 'WW' ;
  27 , 'name' , 'HH' ;
  28 , 'name' , 'RR' ;
  29 , 'name' , 'KY' ;
  30 , 'name' , 'IY' ;
  31 , 'name' , 'CY' ;
};
M_.mapping.U.eqidx = [1 ];
M_.mapping.UC.eqidx = [3 4 5 7 15 ];
M_.mapping.UH.eqidx = [4 9 ];
M_.mapping.UXi.eqidx = [5 8 ];
M_.mapping.lam.eqidx = [6 7 9 ];
M_.mapping.mu.eqidx = [7 8 ];
M_.mapping.LAMBDA.eqidx = [15 16 18 ];
M_.mapping.R.eqidx = [6 18 28 ];
M_.mapping.RK.eqidx = [17 18 ];
M_.mapping.C.eqidx = [1 2 3 7 12 25 31 ];
M_.mapping.Xi.eqidx = [1 2 3 4 7 8 ];
M_.mapping.W.eqidx = [9 11 19 26 ];
M_.mapping.H.eqidx = [1 3 4 5 10 11 19 27 ];
M_.mapping.Y.eqidx = [10 11 12 17 22 29 30 31 ];
M_.mapping.K.eqidx = [10 13 17 23 29 ];
M_.mapping.I.eqidx = [12 13 14 24 30 ];
M_.mapping.A.eqidx = [10 20 ];
M_.mapping.G.eqidx = [12 19 21 ];
M_.mapping.tax.eqidx = [19 ];
M_.mapping.X.eqidx = [13 14 16 ];
M_.mapping.Q.eqidx = [16 17 ];
M_.mapping.KY.eqidx = [29 ];
M_.mapping.IY.eqidx = [30 ];
M_.mapping.CY.eqidx = [31 ];
M_.mapping.RR.eqidx = [28 ];
M_.mapping.YY.eqidx = [22 ];
M_.mapping.CC.eqidx = [25 ];
M_.mapping.HH.eqidx = [27 ];
M_.mapping.WW.eqidx = [26 ];
M_.mapping.II.eqidx = [24 ];
M_.mapping.KK.eqidx = [23 ];
M_.mapping.epsA.eqidx = [20 ];
M_.mapping.epsG.eqidx = [21 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 11 15 16 17 18 21 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(31, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(16, 1);
M_.endo_trends = struct('deflator', cell(31, 1), 'log_deflator', cell(31, 1), 'growth_factor', cell(31, 1), 'log_growth_factor', cell(31, 1));
M_.NNZDerivatives = [101; 115; -1; ];
M_.static_tmp_nbr = [11; 7; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
close all;
M_.params(4) = 0.1;
gamma = M_.params(4);
M_.params(1) = 1.4;
theta = M_.params(1);
M_.params(5) = 0.70;
alp = M_.params(5);
M_.params(6) = 0.99;
betta = M_.params(6);
M_.params(16) = 0.2;
gy = M_.params(16);
M_.params(14) = 0.6;
cy = M_.params(14);
M_.params(15) = 0.2;
iy = M_.params(15);
M_.params(12) = 0.35;
H_bar = M_.params(12);
M_.params(3) = M_.params(5)*(1-M_.params(6)*(1-M_.params(4)))/((1-M_.params(6)*(1-M_.params(4)))*M_.params(1)*M_.params(14)+M_.params(5)*M_.params(4))/M_.params(12)^M_.params(1);
kappa = M_.params(3);
M_.params(7) = (1/M_.params(6)-1)*M_.params(15)/(1-M_.params(5)-M_.params(15));
delta = M_.params(7);
M_.params(2) = 2.0;
sigma_es = M_.params(2);
M_.params(11) = 2.0;
phiX = M_.params(11);
M_.params(11) = 2.0;
phiX = M_.params(11);
M_.params(13) = 1;
A_bar = M_.params(13);
M_.params(8) = 0.75;
rhoA = M_.params(8);
M_.params(9) = 0.75;
rhoG = M_.params(9);
M_.params(10) = 0.01;
sigma = M_.params(10);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
write_latex_definitions;
write_latex_parameter_table;
options_.irf = 40;
options_.order = 2;
var_list_ = {'YY';'CC';'II';'HH';'WW';'RR';'Q'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
collect_latex_files;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RBC_JR_2_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_JR_2_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_JR_2_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_JR_2_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_JR_2_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_JR_2_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_JR_2_results.mat'], 'oo_recursive_', '-append');
end
disp('Note: 2 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
