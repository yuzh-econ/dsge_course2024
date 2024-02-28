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
M_.fname = 'hw';
M_.dynare_version = '5.0';
oo_.dynare_version = '5.0';
options_.dynare_version = '5.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'ex'};
M_.exo_names_tex(1) = {'e_x'};
M_.exo_names_long(1) = {'innovation of x'};
M_.exo_names(2) = {'ey'};
M_.exo_names_tex(2) = {'e_y'};
M_.exo_names_long(2) = {'innovation of y'};
M_.exo_names(3) = {'ez'};
M_.exo_names_tex(3) = {'e_z'};
M_.exo_names_long(3) = {'innovation of z'};
M_.endo_names = cell(3,1);
M_.endo_names_tex = cell(3,1);
M_.endo_names_long = cell(3,1);
M_.endo_names(1) = {'x'};
M_.endo_names_tex(1) = {'x'};
M_.endo_names_long(1) = {'x'};
M_.endo_names(2) = {'y'};
M_.endo_names_tex(2) = {'y'};
M_.endo_names_long(2) = {'y'};
M_.endo_names(3) = {'z'};
M_.endo_names_tex(3) = {'z'};
M_.endo_names_long(3) = {'z'};
M_.endo_partitions = struct();
M_.param_names = cell(9,1);
M_.param_names_tex = cell(9,1);
M_.param_names_long = cell(9,1);
M_.param_names(1) = {'rhoxx'};
M_.param_names_tex(1) = {'\rho_{xx}'};
M_.param_names_long(1) = {'rhoxx'};
M_.param_names(2) = {'rhoxy'};
M_.param_names_tex(2) = {'\rho_{xy}'};
M_.param_names_long(2) = {'rhoxy'};
M_.param_names(3) = {'rhoxz'};
M_.param_names_tex(3) = {'\rho_{xz}'};
M_.param_names_long(3) = {'rhoxz'};
M_.param_names(4) = {'rhoyx'};
M_.param_names_tex(4) = {'\rho_{yx}'};
M_.param_names_long(4) = {'rhoyx'};
M_.param_names(5) = {'rhoyy'};
M_.param_names_tex(5) = {'\rho_{yy}'};
M_.param_names_long(5) = {'rhoyy'};
M_.param_names(6) = {'rhoyz'};
M_.param_names_tex(6) = {'\rho_{yz}'};
M_.param_names_long(6) = {'rhoyz'};
M_.param_names(7) = {'rhozx'};
M_.param_names_tex(7) = {'\rho_{zx}'};
M_.param_names_long(7) = {'rhozx'};
M_.param_names(8) = {'rhozy'};
M_.param_names_tex(8) = {'\rho_{zy}'};
M_.param_names_long(8) = {'rhozy'};
M_.param_names(9) = {'rhozz'};
M_.param_names_tex(9) = {'\rho_{zz}'};
M_.param_names_long(9) = {'rhozz'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 3;
M_.param_nbr = 9;
M_.orig_endo_nbr = 3;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
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
M_.orig_eq_nbr = 3;
M_.eq_nbr = 3;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 0;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 0;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 4;
 2 5;
 3 6;]';
M_.nstatic = 0;
M_.nfwrd   = 0;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 3;
M_.ndynamic   = 3;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Equation for x' ;
  2 , 'name' , 'Equation for y' ;
  3 , 'name' , 'Equation for z' ;
};
M_.mapping.x.eqidx = [1 2 3 ];
M_.mapping.y.eqidx = [1 2 3 ];
M_.mapping.z.eqidx = [1 2 3 ];
M_.mapping.ex.eqidx = [1 ];
M_.mapping.ey.eqidx = [2 ];
M_.mapping.ez.eqidx = [3 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 3 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(3, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(9, 1);
M_.endo_trends = struct('deflator', cell(3, 1), 'log_deflator', cell(3, 1), 'growth_factor', cell(3, 1), 'log_growth_factor', cell(3, 1));
M_.NNZDerivatives = [15; -1; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.5;
rhoxx = M_.params(1);
M_.params(2) = (-0.05);
rhoxy = M_.params(2);
M_.params(3) = 0.2;
rhoxz = M_.params(3);
M_.params(4) = 0.2;
rhoyx = M_.params(4);
M_.params(5) = (-0.3);
rhoyy = M_.params(5);
M_.params(6) = 0.2;
rhoyz = M_.params(6);
M_.params(7) = 0.1;
rhozx = M_.params(7);
M_.params(8) = 0.1;
rhozy = M_.params(8);
M_.params(9) = 0.1;
rhozz = M_.params(9);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 40;
options_.order = 1;
var_list_ = {'x';'y';'z'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
write_latex_parameter_table;
collect_latex_files;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'hw_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hw_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hw_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hw_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hw_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hw_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hw_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
