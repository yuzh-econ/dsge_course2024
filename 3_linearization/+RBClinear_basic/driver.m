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
M_.fname = 'RBClinear_basic';
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
M_.exo_names_long(1) = {'Labor Augmenting shock'};
M_.exo_names(2) = {'epsG'};
M_.exo_names_tex(2) = {'{\epsilon^{G}}'};
M_.exo_names_long(2) = {'Government Spending shock'};
M_.endo_names = cell(11,1);
M_.endo_names_tex = cell(11,1);
M_.endo_names_long = cell(11,1);
M_.endo_names(1) = {'uc'};
M_.endo_names_tex(1) = {'U^{C}'};
M_.endo_names_long(1) = {'Marginal utility of consumption'};
M_.endo_names(2) = {'ul'};
M_.endo_names_tex(2) = {'U^{L}'};
M_.endo_names_long(2) = {'Marginal utility of labour'};
M_.endo_names(3) = {'r'};
M_.endo_names_tex(3) = {'R'};
M_.endo_names_long(3) = {'Risk free interest rate'};
M_.endo_names(4) = {'h'};
M_.endo_names_tex(4) = {'H'};
M_.endo_names_long(4) = {'Hours'};
M_.endo_names(5) = {'w'};
M_.endo_names_tex(5) = {'W'};
M_.endo_names_long(5) = {'Real wage'};
M_.endo_names(6) = {'y'};
M_.endo_names_tex(6) = {'Y'};
M_.endo_names_long(6) = {'Output'};
M_.endo_names(7) = {'k'};
M_.endo_names_tex(7) = {'K'};
M_.endo_names_long(7) = {'Capital'};
M_.endo_names(8) = {'i'};
M_.endo_names_tex(8) = {'I'};
M_.endo_names_long(8) = {'Investment'};
M_.endo_names(9) = {'c'};
M_.endo_names_tex(9) = {'C'};
M_.endo_names_long(9) = {'Consumption'};
M_.endo_names(10) = {'a'};
M_.endo_names_tex(10) = {'A'};
M_.endo_names_long(10) = {'Technology'};
M_.endo_names(11) = {'g'};
M_.endo_names_tex(11) = {'G'};
M_.endo_names_long(11) = {'Government spending'};
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
M_.endo_nbr = 11;
M_.param_nbr = 14;
M_.orig_endo_nbr = 11;
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
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 11;
M_.eq_nbr = 11;
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
 0 4 15;
 0 5 0;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 16;
 1 10 0;
 0 11 0;
 0 12 0;
 2 13 0;
 3 14 0;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Marginal Utility of Consumption' ;
  2 , 'name' , 'Euler Equations' ;
  3 , 'name' , 'Labor Supply FOC' ;
  4 , 'name' , 'Real Wage' ;
  5 , 'name' , 'Prodution function' ;
  6 , 'name' , 'Wholesale firms FOC' ;
  7 , 'name' , 'Real Wage - firm FOC' ;
  8 , 'name' , 'Resource Constraint' ;
  9 , 'name' , 'Capital law of motion' ;
  10 , 'name' , 'Labour augmenting shock process' ;
  11 , 'name' , 'Government shock process' ;
};
M_.mapping.uc.eqidx = [1 2 3 4 ];
M_.mapping.ul.eqidx = [3 4 ];
M_.mapping.r.eqidx = [2 6 ];
M_.mapping.h.eqidx = [1 3 5 7 ];
M_.mapping.w.eqidx = [4 7 ];
M_.mapping.y.eqidx = [5 6 7 8 ];
M_.mapping.k.eqidx = [5 6 9 ];
M_.mapping.i.eqidx = [8 9 ];
M_.mapping.c.eqidx = [1 3 8 ];
M_.mapping.a.eqidx = [5 10 ];
M_.mapping.g.eqidx = [8 11 ];
M_.mapping.epsA.eqidx = [10 ];
M_.mapping.epsG.eqidx = [11 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [7 10 11 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(14, 1);
M_.endo_trends = struct('deflator', cell(11, 1), 'log_deflator', cell(11, 1), 'growth_factor', cell(11, 1), 'log_growth_factor', cell(11, 1));
M_.NNZDerivatives = [36; 0; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
close all;
M_.params(8) = 0.2;
gy = M_.params(8);
M_.params(1) = 0.689169;
varrho = M_.params(1);
M_.params(2) = 0.70;
alp = M_.params(2);
M_.params(3) = 0.99;
betta = M_.params(3);
M_.params(4) = 0.0250;
delta = M_.params(4);
M_.params(5) = 2.0;
sigma_c = M_.params(5);
M_.params(11) = 1;
A_bar = M_.params(11);
M_.params(12) = 0.75;
rhoA = M_.params(12);
M_.params(13) = 0.75;
rhoG = M_.params(13);
M_.params(14) = 1.0;
sigma = M_.params(14);
M_.params(10) = 1.0/M_.params(3);
R_bar = M_.params(10);
M_.params(7) = (1-M_.params(2))*M_.params(4)/(M_.params(4)+M_.params(10)-1);
iy = M_.params(7);
M_.params(6) = 1-M_.params(7)-M_.params(8);
cy = M_.params(6);
M_.params(9) = M_.params(2)*(1-M_.params(1))/(M_.params(2)*(1-M_.params(1))+M_.params(1)*M_.params(6));
H_bar = M_.params(9);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.TeX = true;
options_.irf = 40;
options_.order = 1;
var_list_ = {'y';'c';'i';'h';'w';'r'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
write_latex_definitions;
write_latex_parameter_table;
collect_latex_files;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RBClinear_basic_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBClinear_basic_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBClinear_basic_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBClinear_basic_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBClinear_basic_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBClinear_basic_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBClinear_basic_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
