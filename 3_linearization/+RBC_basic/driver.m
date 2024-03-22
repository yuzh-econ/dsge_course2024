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
M_.fname = 'RBC_basic';
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
M_.exo_names_long(1) = {'Labor saugmenting shock'};
M_.exo_names(2) = {'epsG'};
M_.exo_names_tex(2) = {'{\epsilon^{G}}'};
M_.exo_names_long(2) = {'Government spending shock'};
M_.endo_names = cell(26,1);
M_.endo_names_tex = cell(26,1);
M_.endo_names_long = cell(26,1);
M_.endo_names(1) = {'U'};
M_.endo_names_tex(1) = {'U'};
M_.endo_names_long(1) = {'U'};
M_.endo_names(2) = {'UC'};
M_.endo_names_tex(2) = {'UC'};
M_.endo_names_long(2) = {'Marginal utility of consumption'};
M_.endo_names(3) = {'UH'};
M_.endo_names_tex(3) = {'UL'};
M_.endo_names_long(3) = {'Marginal utility of labour'};
M_.endo_names(4) = {'LAMBDA'};
M_.endo_names_tex(4) = {'\lambda'};
M_.endo_names_long(4) = {'Stochastic discount factor'};
M_.endo_names(5) = {'R'};
M_.endo_names_tex(5) = {'R'};
M_.endo_names_long(5) = {'Risk free interest rate'};
M_.endo_names(6) = {'RK'};
M_.endo_names_tex(6) = {'R^{K}'};
M_.endo_names_long(6) = {'Return on capital'};
M_.endo_names(7) = {'C'};
M_.endo_names_tex(7) = {'C'};
M_.endo_names_long(7) = {'Consumption'};
M_.endo_names(8) = {'W'};
M_.endo_names_tex(8) = {'W'};
M_.endo_names_long(8) = {'Real wage'};
M_.endo_names(9) = {'H'};
M_.endo_names_tex(9) = {'H'};
M_.endo_names_long(9) = {'Hours'};
M_.endo_names(10) = {'Y'};
M_.endo_names_tex(10) = {'Y'};
M_.endo_names_long(10) = {'Output'};
M_.endo_names(11) = {'K'};
M_.endo_names_tex(11) = {'K'};
M_.endo_names_long(11) = {'Capital'};
M_.endo_names(12) = {'I'};
M_.endo_names_tex(12) = {'I'};
M_.endo_names_long(12) = {'Investment'};
M_.endo_names(13) = {'A'};
M_.endo_names_tex(13) = {'A'};
M_.endo_names_long(13) = {'Technology'};
M_.endo_names(14) = {'G'};
M_.endo_names_tex(14) = {'G'};
M_.endo_names_long(14) = {'Government spending'};
M_.endo_names(15) = {'KY'};
M_.endo_names_tex(15) = {'\frac{\bar{K}}{\bar{Y}}'};
M_.endo_names_long(15) = {'Capital output ratio in steady state'};
M_.endo_names(16) = {'IY'};
M_.endo_names_tex(16) = {'\frac{\bar{I}}{\bar{Y}}'};
M_.endo_names_long(16) = {'Investment output ratio in steady state'};
M_.endo_names(17) = {'CY'};
M_.endo_names_tex(17) = {'\frac{\bar{C}}{\bar{Y}}'};
M_.endo_names_long(17) = {'Consumption output ratio in steady state'};
M_.endo_names(18) = {'y'};
M_.endo_names_tex(18) = {'y'};
M_.endo_names_long(18) = {'Output - deviation from the steady state'};
M_.endo_names(19) = {'c'};
M_.endo_names_tex(19) = {'c'};
M_.endo_names_long(19) = {'Consumption - deviation from the steady state'};
M_.endo_names(20) = {'h'};
M_.endo_names_tex(20) = {'h'};
M_.endo_names_long(20) = {'Hours - deviation from the steady state'};
M_.endo_names(21) = {'w'};
M_.endo_names_tex(21) = {'w'};
M_.endo_names_long(21) = {'Real wage - deviation from the steady state'};
M_.endo_names(22) = {'i'};
M_.endo_names_tex(22) = {'i'};
M_.endo_names_long(22) = {'Investment - deviation from the steady state'};
M_.endo_names(23) = {'k'};
M_.endo_names_tex(23) = {'k'};
M_.endo_names_long(23) = {'Capital - deviation from the steady state'};
M_.endo_names(24) = {'r'};
M_.endo_names_tex(24) = {'r'};
M_.endo_names_long(24) = {'Risk free interest rate - deviation from the steady state'};
M_.endo_names(25) = {'a'};
M_.endo_names_tex(25) = {'a'};
M_.endo_names_long(25) = {'Technology - deviation from the steady state'};
M_.endo_names(26) = {'g'};
M_.endo_names_tex(26) = {'g'};
M_.endo_names_long(26) = {'Government spending - deviation from the steady state'};
M_.endo_partitions = struct();
M_.param_names = cell(14,1);
M_.param_names_tex = cell(14,1);
M_.param_names_long = cell(14,1);
M_.param_names(1) = {'varrho'};
M_.param_names_tex(1) = {'{\varrho}'};
M_.param_names_long(1) = {'Weight on Leisure in utility'};
M_.param_names(2) = {'alp'};
M_.param_names_tex(2) = {'{\alpha}'};
M_.param_names_long(2) = {'Labour share'};
M_.param_names(3) = {'betta'};
M_.param_names_tex(3) = {'{\beta}'};
M_.param_names_long(3) = {'Discount factor'};
M_.param_names(4) = {'delta'};
M_.param_names_tex(4) = {'{\delta}'};
M_.param_names_long(4) = {'Capital depreciation'};
M_.param_names(5) = {'sigma_c'};
M_.param_names_tex(5) = {'{\sigma_{C}}'};
M_.param_names_long(5) = {'Inverse of the elasticity of substitution'};
M_.param_names(6) = {'cy'};
M_.param_names_tex(6) = {'\frac{\bar{C}}{\bar{Y}}'};
M_.param_names_long(6) = {'Consumption output ratio in steady state'};
M_.param_names(7) = {'iy'};
M_.param_names_tex(7) = {'\frac{\bar{I}}{\bar{Y}}'};
M_.param_names_long(7) = {'Investment output ratio in steady state'};
M_.param_names(8) = {'gy'};
M_.param_names_tex(8) = {'\frac{\bar{G}}{\bar{Y}}'};
M_.param_names_long(8) = {'Government output ratio'};
M_.param_names(9) = {'H_bar'};
M_.param_names_tex(9) = {'\bar{H}'};
M_.param_names_long(9) = {'Steady state hours'};
M_.param_names(10) = {'R_bar'};
M_.param_names_tex(10) = {'\bar{R}'};
M_.param_names_long(10) = {'Steady state risk free interest rate'};
M_.param_names(11) = {'A_bar'};
M_.param_names_tex(11) = {'\bar{A}'};
M_.param_names_long(11) = {'Steady state technology'};
M_.param_names(12) = {'rhoA'};
M_.param_names_tex(12) = {'{\rho_{A}}'};
M_.param_names_long(12) = {'Persistence of labor augmentig shock'};
M_.param_names(13) = {'rhoG'};
M_.param_names_tex(13) = {'{\rho_{G}}'};
M_.param_names_long(13) = {'Persistence of government spending shock'};
M_.param_names(14) = {'sigma'};
M_.param_names_tex(14) = {'{\sigma}'};
M_.param_names_long(14) = {'Shock scaling parameter'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 26;
M_.param_nbr = 14;
M_.orig_endo_nbr = 26;
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
M_.orig_eq_nbr = 26;
M_.eq_nbr = 26;
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
 0 4 0;
 0 5 30;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 31;
 1 14 0;
 0 15 0;
 2 16 0;
 3 17 0;
 0 18 0;
 0 19 0;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 0 29 0;]';
M_.nstatic = 21;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [9; 2; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Single period utility' ;
  2 , 'name' , 'Marginal Utility of Consumption' ;
  3 , 'name' , 'Marginal Utility of Labour' ;
  4 , 'name' , 'Stochastic discount factor - 1' ;
  5 , 'name' , 'Stochastic discount factor - 2' ;
  6 , 'name' , 'Stochastic discount factor - 3' ;
  7 , 'name' , 'Labor Supply FOC' ;
  8 , 'name' , 'Prodution function' ;
  9 , 'name' , 'Wholesale firms FOCs' ;
  10 , 'name' , 'Returns on capital' ;
  11 , 'name' , 'Output equilibrium' ;
  12 , 'name' , 'Capital law of motion' ;
  13 , 'name' , 'Labour augmenting shock process' ;
  14 , 'name' , 'Government shock process' ;
  15 , 'name' , 'y' ;
  16 , 'name' , 'k' ;
  17 , 'name' , 'i' ;
  18 , 'name' , 'c' ;
  19 , 'name' , 'w' ;
  20 , 'name' , 'h' ;
  21 , 'name' , 'r' ;
  22 , 'name' , 'a' ;
  23 , 'name' , 'g' ;
  24 , 'name' , 'KY' ;
  25 , 'name' , 'IY' ;
  26 , 'name' , 'CY' ;
};
M_.mapping.U.eqidx = [1 ];
M_.mapping.UC.eqidx = [2 4 5 7 ];
M_.mapping.UH.eqidx = [3 7 ];
M_.mapping.LAMBDA.eqidx = [4 6 ];
M_.mapping.R.eqidx = [5 21 ];
M_.mapping.RK.eqidx = [6 10 ];
M_.mapping.C.eqidx = [1 2 3 11 18 26 ];
M_.mapping.W.eqidx = [7 9 19 ];
M_.mapping.H.eqidx = [1 2 3 8 9 20 ];
M_.mapping.Y.eqidx = [8 9 10 11 15 24 25 26 ];
M_.mapping.K.eqidx = [8 10 12 16 24 ];
M_.mapping.I.eqidx = [11 12 17 25 ];
M_.mapping.A.eqidx = [8 13 22 ];
M_.mapping.G.eqidx = [11 14 23 ];
M_.mapping.KY.eqidx = [24 ];
M_.mapping.IY.eqidx = [25 ];
M_.mapping.CY.eqidx = [26 ];
M_.mapping.y.eqidx = [15 ];
M_.mapping.c.eqidx = [18 ];
M_.mapping.h.eqidx = [20 ];
M_.mapping.w.eqidx = [19 ];
M_.mapping.i.eqidx = [17 ];
M_.mapping.k.eqidx = [16 ];
M_.mapping.r.eqidx = [21 ];
M_.mapping.a.eqidx = [22 ];
M_.mapping.g.eqidx = [23 ];
M_.mapping.epsA.eqidx = [13 ];
M_.mapping.epsG.eqidx = [14 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [11 13 14 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(26, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(14, 1);
M_.endo_trends = struct('deflator', cell(26, 1), 'log_deflator', cell(26, 1), 'growth_factor', cell(26, 1), 'log_growth_factor', cell(26, 1));
M_.NNZDerivatives = [70; -1; -1; ];
M_.static_tmp_nbr = [9; 4; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
close all;
M_.params(8) = 0.2;
gy = M_.params(8);
M_.params(2) = 0.70;
alp = M_.params(2);
M_.params(3) = 0.99;
betta = M_.params(3);
M_.params(4) = 0.0250;
delta = M_.params(4);
M_.params(5) = 2.0;
sigma_c = M_.params(5);
M_.params(9) = 0.35;
H_bar = M_.params(9);
M_.params(10) = 1.0/M_.params(3);
R_bar = M_.params(10);
M_.params(7) = (1-M_.params(2))*M_.params(4)/(M_.params(4)+M_.params(10)-1);
iy = M_.params(7);
M_.params(6) = 1-M_.params(7)-M_.params(8);
cy = M_.params(6);
M_.params(1) = M_.params(2)*(1-M_.params(9))/(M_.params(2)*(1-M_.params(9))+M_.params(9)*M_.params(6));
varrho = M_.params(1);
M_.params(11) = 1;
A_bar = M_.params(11);
M_.params(12) = 0.75;
rhoA = M_.params(12);
M_.params(13) = 0.75;
rhoG = M_.params(13);
M_.params(14) = 1.0;
sigma = M_.params(14);
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
options_.TeX = true;
options_.irf = 40;
options_.order = 1;
var_list_ = {'Y';'y';'C';'c';'I';'i';'H';'h';'W';'w';'R';'r';'K';'k';'A';'a';'G';'g'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
collect_latex_files;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RBC_basic_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_basic_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_basic_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_basic_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_basic_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_basic_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_basic_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
