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
M_.fname = 'Dynare_Example_1_det';
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
M_.exo_names(1) = {'ex'};
M_.exo_names_tex(1) = {'ex'};
M_.exo_names_long(1) = {'ex'};
M_.exo_names(2) = {'ey'};
M_.exo_names_tex(2) = {'ey'};
M_.exo_names_long(2) = {'ey'};
M_.endo_names = cell(2,1);
M_.endo_names_tex = cell(2,1);
M_.endo_names_long = cell(2,1);
M_.endo_names(1) = {'x'};
M_.endo_names_tex(1) = {'x'};
M_.endo_names_long(1) = {'x'};
M_.endo_names(2) = {'y'};
M_.endo_names_tex(2) = {'y'};
M_.endo_names_long(2) = {'y'};
M_.endo_partitions = struct();
M_.param_names = cell(2,1);
M_.param_names_tex = cell(2,1);
M_.param_names_long = cell(2,1);
M_.param_names(1) = {'rhox'};
M_.param_names_tex(1) = {'rhox'};
M_.param_names_long(1) = {'rhox'};
M_.param_names(2) = {'rhoy'};
M_.param_names_tex(2) = {'rhoy'};
M_.param_names_long(2) = {'rhoy'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 2;
M_.param_nbr = 2;
M_.orig_endo_nbr = 2;
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
M_.orig_eq_nbr = 2;
M_.eq_nbr = 2;
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
 1 3;
 2 4;]';
M_.nstatic = 0;
M_.nfwrd   = 0;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 2;
M_.ndynamic   = 2;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'x' ;
  2 , 'name' , 'y' ;
};
M_.mapping.x.eqidx = [1 ];
M_.mapping.y.eqidx = [2 ];
M_.mapping.ex.eqidx = [1 ];
M_.mapping.ey.eqidx = [2 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(2, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(2, 1);
M_.endo_trends = struct('deflator', cell(2, 1), 'log_deflator', cell(2, 1), 'growth_factor', cell(2, 1), 'log_growth_factor', cell(2, 1));
M_.NNZDerivatives = [6; -1; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.5;
rhox = M_.params(1);
M_.params(2) = (-0.3);
rhoy = M_.params(2);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = 1;
oo_.steady_state(2) = 1;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
options_.periods = 10;
perfect_foresight_setup;
perfect_foresight_solver;
var_list_ = {'x';'y'};
rplot(var_list_);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = 0;
oo_.steady_state(2) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',5:5,'value',1) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',2,'multiplicative',0,'periods',5:5,'value',1) ];
M_.exo_det_length = 0;
options_.periods = 10;
perfect_foresight_setup;
perfect_foresight_solver;
var_list_ = {'x';'y'};
rplot(var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'Dynare_Example_1_det_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Dynare_Example_1_det_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Dynare_Example_1_det_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Dynare_Example_1_det_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Dynare_Example_1_det_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Dynare_Example_1_det_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Dynare_Example_1_det_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
