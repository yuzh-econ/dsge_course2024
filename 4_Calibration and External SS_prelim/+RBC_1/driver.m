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
M_.fname = 'RBC_1';
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
M_.exo_names_tex(1) = {'{\epsilon^{A}}'};
M_.exo_names_long(1) = {'Labor augmenting shock'};
M_.exo_names(2) = {'epsG'};
M_.exo_names_tex(2) = {'{\epsilon^{G}}'};
M_.exo_names_long(2) = {'Government spending shock'};
M_.endo_names = cell(27,1);
M_.endo_names_tex = cell(27,1);
M_.endo_names_long = cell(27,1);
M_.endo_names(1) = {'U'};
M_.endo_names_tex(1) = {'U'};
M_.endo_names_long(1) = {'Utility function'};
M_.endo_names(2) = {'UC'};
M_.endo_names_tex(2) = {'U_C'};
M_.endo_names_long(2) = {'Marginal utility of consumption'};
M_.endo_names(3) = {'UH'};
M_.endo_names_tex(3) = {'U_H'};
M_.endo_names_long(3) = {'Marginal utility of labor'};
M_.endo_names(4) = {'LAMBDA'};
M_.endo_names_tex(4) = {'\Lambda'};
M_.endo_names_long(4) = {'Stochastic discount factor'};
M_.endo_names(5) = {'R'};
M_.endo_names_tex(5) = {'R'};
M_.endo_names_long(5) = {'Risk free interest rate'};
M_.endo_names(6) = {'RK'};
M_.endo_names_tex(6) = {'R^{K}'};
M_.endo_names_long(6) = {'Gross return on capital'};
M_.endo_names(7) = {'rk'};
M_.endo_names_tex(7) = {'r^{K}'};
M_.endo_names_long(7) = {'Return on capital'};
M_.endo_names(8) = {'C'};
M_.endo_names_tex(8) = {'C'};
M_.endo_names_long(8) = {'Consumption'};
M_.endo_names(9) = {'W'};
M_.endo_names_tex(9) = {'W'};
M_.endo_names_long(9) = {'Real wage'};
M_.endo_names(10) = {'H'};
M_.endo_names_tex(10) = {'H'};
M_.endo_names_long(10) = {'Hours'};
M_.endo_names(11) = {'Y'};
M_.endo_names_tex(11) = {'Y'};
M_.endo_names_long(11) = {'Output'};
M_.endo_names(12) = {'K'};
M_.endo_names_tex(12) = {'K'};
M_.endo_names_long(12) = {'Capital'};
M_.endo_names(13) = {'I'};
M_.endo_names_tex(13) = {'I'};
M_.endo_names_long(13) = {'Investment'};
M_.endo_names(14) = {'A'};
M_.endo_names_tex(14) = {'A'};
M_.endo_names_long(14) = {'Technology'};
M_.endo_names(15) = {'G'};
M_.endo_names_tex(15) = {'G'};
M_.endo_names_long(15) = {'Government spending'};
M_.endo_names(16) = {'tax'};
M_.endo_names_tex(16) = {'T'};
M_.endo_names_long(16) = {'Tax'};
M_.endo_names(17) = {'q'};
M_.endo_names_tex(17) = {'q'};
M_.endo_names_long(17) = {'Tobin s marginal Q '};
M_.endo_names(18) = {'KY'};
M_.endo_names_tex(18) = {'\frac{\bar{K}}{\bar{Y}}'};
M_.endo_names_long(18) = {'Capital output ratio in steady state'};
M_.endo_names(19) = {'IY'};
M_.endo_names_tex(19) = {'\frac{\bar{I}}{\bar{Y}}'};
M_.endo_names_long(19) = {'Investment output ratio in steady state'};
M_.endo_names(20) = {'CY'};
M_.endo_names_tex(20) = {'\frac{\bar{C}}{\bar{Y}}'};
M_.endo_names_long(20) = {'Consumption output ratio in steady state'};
M_.endo_names(21) = {'RR'};
M_.endo_names_tex(21) = {'RR'};
M_.endo_names_long(21) = {'Risk free interest rate - deviation from the steady state'};
M_.endo_names(22) = {'YY'};
M_.endo_names_tex(22) = {'YY'};
M_.endo_names_long(22) = {'Output - deviation from the steady state'};
M_.endo_names(23) = {'CC'};
M_.endo_names_tex(23) = {'CC'};
M_.endo_names_long(23) = {'Consumption - deviation from the steady state'};
M_.endo_names(24) = {'HH'};
M_.endo_names_tex(24) = {'HH'};
M_.endo_names_long(24) = {'Hours - deviation from the steady state'};
M_.endo_names(25) = {'WW'};
M_.endo_names_tex(25) = {'WW'};
M_.endo_names_long(25) = {'Real wage - deviation from the steady state'};
M_.endo_names(26) = {'II'};
M_.endo_names_tex(26) = {'II'};
M_.endo_names_long(26) = {'Investment - deviation from the steady state'};
M_.endo_names(27) = {'KK'};
M_.endo_names_tex(27) = {'KK'};
M_.endo_names_long(27) = {'Capital - deviation from the steady state'};
M_.endo_partitions = struct();
M_.param_names = cell(14,1);
M_.param_names_tex = cell(14,1);
M_.param_names_long = cell(14,1);
M_.param_names(1) = {'varrho'};
M_.param_names_tex(1) = {'{\varrho}'};
M_.param_names_long(1) = {'Weight on Leisure in utility'};
M_.param_names(2) = {'alp'};
M_.param_names_tex(2) = {'{\alpha}'};
M_.param_names_long(2) = {'Labor share'};
M_.param_names(3) = {'betta'};
M_.param_names_tex(3) = {'{\beta}'};
M_.param_names_long(3) = {'Discount factor'};
M_.param_names(4) = {'delta'};
M_.param_names_tex(4) = {'{\delta}'};
M_.param_names_long(4) = {'Capital depreciation'};
M_.param_names(5) = {'sigma_c'};
M_.param_names_tex(5) = {'{\sigma_{C}}'};
M_.param_names_long(5) = {'Inverse of the elasticity of substitution'};
M_.param_names(6) = {'rhoA'};
M_.param_names_tex(6) = {'{\rho_{A}}'};
M_.param_names_long(6) = {'Persistence of labor augmentig shock'};
M_.param_names(7) = {'rhoG'};
M_.param_names_tex(7) = {'{\rho_{G}}'};
M_.param_names_long(7) = {'Persistence of government spending shock'};
M_.param_names(8) = {'sigma'};
M_.param_names_tex(8) = {'{\sigma}'};
M_.param_names_long(8) = {'Shock scaling parameter'};
M_.param_names(9) = {'phiX'};
M_.param_names_tex(9) = {'{\phi^X}'};
M_.param_names_long(9) = {'Investment Adjustment costs'};
M_.param_names(10) = {'H_bar'};
M_.param_names_tex(10) = {'\bar{H}'};
M_.param_names_long(10) = {'Steady state hours'};
M_.param_names(11) = {'A_bar'};
M_.param_names_tex(11) = {'\bar{A}'};
M_.param_names_long(11) = {'Steady state technology'};
M_.param_names(12) = {'cy'};
M_.param_names_tex(12) = {'\frac{\bar{C}}{\bar{Y}}'};
M_.param_names_long(12) = {'Consumption output ratio in steady state'};
M_.param_names(13) = {'iy'};
M_.param_names_tex(13) = {'\frac{\bar{I}}{\bar{Y}}'};
M_.param_names_long(13) = {'Investment output ratio in steady state'};
M_.param_names(14) = {'gy'};
M_.param_names_tex(14) = {'\frac{\bar{G}}{\bar{Y}}'};
M_.param_names_long(14) = {'Government output ratio'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 27;
M_.param_nbr = 14;
M_.orig_endo_nbr = 27;
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
M_.nonzero_hessian_eqs = [1 2 3 4 5 6 7 9 10 11 12 13 14 16 17 25 26 27];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 27;
M_.eq_nbr = 27;
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
 0 5 0;
 0 6 32;
 0 7 0;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 33;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 1 16 0;
 2 17 34;
 3 18 0;
 4 19 0;
 0 20 0;
 0 21 35;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;]';
M_.nstatic = 20;
M_.nfwrd   = 3;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 4;
M_.ndynamic   = 7;
M_.dynamic_tmp_nbr = [15; 20; 4; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Single period utility' ;
  2 , 'name' , 'Marginal Utility of Consumption' ;
  3 , 'name' , 'Marginal Utility of Labor' ;
  4 , 'name' , 'Stochastic discount factor - 1' ;
  5 , 'name' , 'Labor Supply FOC' ;
  6 , 'name' , 'Prodution function' ;
  7 , 'name' , 'Wholesale firms FOCs' ;
  8 , 'name' , 'Output equilibrium' ;
  9 , 'name' , 'Capital law of motion with investment costs' ;
  10 , 'name' , 'Stochastic discount factor - 2' ;
  11 , 'name' , 'Investment' ;
  12 , 'name' , 'Returns on capital' ;
  13 , 'name' , 'Gross returns on capital' ;
  14 , 'name' , 'Capital FOC' ;
  15 , 'name' , 'Balance budget constraint' ;
  16 , 'name' , 'Technology shock process' ;
  17 , 'name' , 'Government spending shock process' ;
  18 , 'name' , 'YY' ;
  19 , 'name' , 'KK' ;
  20 , 'name' , 'II' ;
  21 , 'name' , 'CC' ;
  22 , 'name' , 'WW' ;
  23 , 'name' , 'HH' ;
  24 , 'name' , 'RR' ;
  25 , 'name' , 'KY' ;
  26 , 'name' , 'IY' ;
  27 , 'name' , 'CY' ;
};
M_.mapping.U.eqidx = [1 ];
M_.mapping.UC.eqidx = [2 5 10 ];
M_.mapping.UH.eqidx = [3 5 ];
M_.mapping.LAMBDA.eqidx = [4 10 11 14 ];
M_.mapping.R.eqidx = [4 24 ];
M_.mapping.RK.eqidx = [13 14 ];
M_.mapping.rk.eqidx = [12 13 ];
M_.mapping.C.eqidx = [1 2 3 8 21 27 ];
M_.mapping.W.eqidx = [5 7 22 ];
M_.mapping.H.eqidx = [1 2 3 6 7 23 ];
M_.mapping.Y.eqidx = [6 7 8 12 18 25 26 27 ];
M_.mapping.K.eqidx = [6 9 12 19 25 ];
M_.mapping.I.eqidx = [8 9 11 20 26 ];
M_.mapping.A.eqidx = [6 16 ];
M_.mapping.G.eqidx = [8 15 17 ];
M_.mapping.tax.eqidx = [15 ];
M_.mapping.q.eqidx = [11 13 ];
M_.mapping.KY.eqidx = [25 ];
M_.mapping.IY.eqidx = [26 ];
M_.mapping.CY.eqidx = [27 ];
M_.mapping.RR.eqidx = [24 ];
M_.mapping.YY.eqidx = [18 ];
M_.mapping.CC.eqidx = [21 ];
M_.mapping.HH.eqidx = [23 ];
M_.mapping.WW.eqidx = [22 ];
M_.mapping.II.eqidx = [20 ];
M_.mapping.KK.eqidx = [19 ];
M_.mapping.epsA.eqidx = [16 ];
M_.mapping.epsG.eqidx = [17 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [12 13 14 15 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(27, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(14, 1);
M_.endo_trends = struct('deflator', cell(27, 1), 'log_deflator', cell(27, 1), 'growth_factor', cell(27, 1), 'log_growth_factor', cell(27, 1));
M_.NNZDerivatives = [78; 80; -1; ];
M_.static_tmp_nbr = [9; 4; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
close all;
M_.params(2) = 0.70;
alp = M_.params(2);
M_.params(3) = 0.99;
betta = M_.params(3);
M_.params(14) = 0.2;
gy = M_.params(14);
M_.params(12) = 0.6;
cy = M_.params(12);
M_.params(13) = 0.2;
iy = M_.params(13);
M_.params(10) = 0.35;
H_bar = M_.params(10);
M_.params(1) = M_.params(2)*(1-M_.params(10))/(M_.params(2)*(1-M_.params(10))+M_.params(10)*M_.params(12));
varrho = M_.params(1);
M_.params(4) = (1/M_.params(3)-1)*M_.params(13)/(1-M_.params(2)-M_.params(13));
delta = M_.params(4);
M_.params(5) = 2.0;
sigma_c = M_.params(5);
M_.params(9) = 2.0;
phiX = M_.params(9);
M_.params(11) = 1;
A_bar = M_.params(11);
M_.params(6) = 0.75;
rhoA = M_.params(6);
M_.params(7) = 0.75;
rhoG = M_.params(7);
M_.params(8) = 0.01;
sigma = M_.params(8);
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
options_.order = 2;
var_list_ = {'YY';'CC';'II';'HH';'WW';'RR';'q'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
model_diagnostics(M_,options_,oo_);
collect_latex_files;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RBC_1_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_1_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_1_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_1_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_1_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_1_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_1_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
