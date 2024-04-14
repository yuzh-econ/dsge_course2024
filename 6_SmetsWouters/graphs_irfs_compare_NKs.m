clear;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%OPTIONS TO BE CHANGED BY THE USER%%%%%%%%%%%%%%%%
%RESULT_names={'NK_results', 'NKlinear_results'}; %%EXACT NAMES OF THE RESULTS FILES TO LOAD
%lin_vs_nonlin=[0,1]; %=0 IF THE CORRESPONDING MODEL IN RESULT_NAMES IS NON-LINEAR, 1 IF IT IS LINEAR
RESULT_names={'NK_SW_results_SPSW_EXT','NK_SW_noUtilization_results'}; %%EXACT NAMES OF THE RESULTS FILES TO LOAD
% RESULT_names={'NK_SW_results_SPSW_EXT','NK_SW_results_SPSW_INT'}; %%EXACT NAMES OF THE RESULTS FILES TO LOAD
% RESULT_names={'NK_SW_results_SPSW_EXT2','NK_SW_results_SPFW_EXT2','NK_SW_results_FPSW_EXT2' }; %%EXACT NAMES OF THE RESULTS FILES TO LOAD
lin_vs_nonlin=[0,0,0]; %=0 IF THE CORRESPONDING MODEL IN RESULT_NAMES IS NON-LINEAR, 1 IF IT IS LINEAR


% VAR_IRFs_nonlin = {'Y', 'C', 'I', 'H', 'Hd', 'W', 'R', 'Rn','Q',  'MC', 'PIE', 'PIEw', 'Deltap',  'Deltaw', 'u', 'V'}; %% NAMES OF ENDOGENOUS VARIABLES OF INTEREST FOR THE IRFS (NON-LINEAR MODELS) - NEED TO HAVE EXACTLY SAME NAME AS IN THE .MOD FILE
VAR_IRFs_nonlin = {'Y', 'C', 'I', 'H', 'Hd', 'W', 'R', 'Rn','Q',  'MC', 'PIE', 'PIEw', 'Deltap',  'Deltaw', 'V'}; %% NAMES OF ENDOGENOUS VARIABLES OF INTEREST FOR THE IRFS (NON-LINEAR MODELS) - NEED TO HAVE EXACTLY SAME NAME AS IN THE .MOD FILE
VAR_IRFs_linear= {'Y','C','I','H','W','ER','Rn','Q','PIE'};

NAME_SHOCKS={'_epsA','_epsG','_epsIS','_epsMPS','_epsMCS','_epsMRSS', '_epsRPS' };%% NAMES OF EXOGENOUS SHOCKS OF INTEREST FOR THE IRFS - NEED TO HAVE EXACTLY SAME NAME AS IN THE .MOD FILE
FIGTITLE_NAME_SHOCKS = {'TFP Shock (Capital Utilization)', 'Govt Spending Shock (Capital Utilization)', 'Capital Quality Shock (Capital Utilization)', 'Monetary Policy Shock (Capital Utilization)', 'Price Markup Shock (Capital Utilization)', 'Wage Markup Shock (Capital Utilization)', 'Risk Premium Shock (Capital Utilization)'};
% FIGTITLE_NAME_SHOCKS = {'TFP Shock (External vs. Internal Habit)', 'Govt Spending Shock (External vs. Internal Habit)', 'Capital Quality Shock (External vs. Internal Habit)', 'Monetary Policy Shock (External vs. Internal Habit)', 'Price Markup Shock (External vs. Internal Habit)', 'Wage Markup Shock (External vs. Internal Habit)', 'Risk Premium Shock (External vs. Internal Habit)'};
% FIGTITLE_NAME_SHOCKS = {'TFP Shock (External Habit)', 'Govt Spending Shock (External Habit)', 'Capital Quality Shock (External Habit)', 'Monetary Policy Shock (External Habit)', 'Price Markup Shock (External Habit)', 'Wage Markup Shock (External Habit)', 'Risk Premium Shock (External Habit)'};
% names = char('Output', 'Consumption', 'Investment',  'Hours Supplied','Hours worked', 'Real wage', 'Real interest rate', 'Nominal interest rate', 'Tobin Q',...
%   'Marginal Cost',  'Price Inflation',  'Wage Inflation', 'Price Dispersion',  'Wage Dispersion', 'Capacity Util', 'Welfare'); % NAMES OF THE EDOGENOUS VARIABLES FOR THE GRAPHS. YOU CAN SPECIFY ANY NAME YOU WANT BUT NEED TO HAVE THE SAME NUMBER OF ELEMENT OF VAR_IRFs
names = char('Output', 'Consumption', 'Investment',  'Hours Supplied','Hours worked', 'Real wage', 'Real interest rate', 'Nominal interest rate', 'Tobin Q',...
  'Marginal Cost',  'Price Inflation',  'Wage Inflation', 'Price Dispersion',  'Wage Dispersion', 'Welfare'); % NAMES OF THE EDOGENOUS VARIABLES FOR THE GRAPHS. YOU CAN SPECIFY ANY NAME YOU WANT BUT NEED TO HAVE THE SAME NUMBER OF ELEMENT OF VAR_IRFs

%Model_names=char( 'NK (non-linear)', 'NK (linear)' ); %NAMES OF THE MODEL VARIANTS TO APPEAR IN THE LEGEND OF THE GRAPHS
Model_names=char( 'Flexible Capital Utilization','Fixed Capital Utilization'  ); %NAMES OF THE MODEL VARIANTS TO APPEAR IN THE LEGEND OF THE GRAPHS
% Model_names=char( 'External Habit', 'Internal Habit'  ); %NAMES OF THE MODEL VARIANTS TO APPEAR IN THE LEGEND OF THE GRAPHS
% Model_names=char( 'Price-Wage Stickiness ', 'Sticky Prices Only','Sticky Wages Only'  ); %NAMES OF THE MODEL VARIANTS TO APPEAR IN THE LEGEND OF THE GRAPHS

Rows_figure=4; % NUMBER OF ROWS IN EACH PLOT
Column_figure=4; % NUMBER OF COLUMNSS IN EACH PLOT
irf_horizon=40; %LENGTH OF THE IRFS GENERATED BY THE .MOD FILE
%%%%%%%%%%%%%%%%%%%%%%%END OF OPTIONS%%%%%%%%%%%%%%%%%%%%%%%%%%



%% DO NOT CHANGE ANYTHING BELOW.
Num_models=length(RESULT_names); %%NUMBER OF MODELS TO COMPARE
NUM_SHOCKS=length(NAME_SHOCKS);  %%NUMBER OF SHOCKS TO COMPARE
NUM_VAR=length(VAR_IRFs_nonlin);%%NUMBER OF VARIABLES TO COMPARE

irfs_matrix=zeros(irf_horizon,NUM_VAR,NUM_SHOCKS,Num_models);
for mm=1:Num_models;
%load Model 
eval(['load ' RESULT_names{mm} ';']);
if lin_vs_nonlin(mm)~=0
    VAR_IRFs=VAR_IRFs_linear;
else
    VAR_IRFs=VAR_IRFs_nonlin;
end
for xx=1:NUM_SHOCKS;
for jj=1:NUM_VAR;
%Rename the IRFs for each variable of interest 
genrate_irf_names=[VAR_IRFs{jj},NAME_SHOCKS{xx},'=','oo_.irfs.',VAR_IRFs{jj},NAME_SHOCKS{xx},';'];
evalin('base', genrate_irf_names);
%generate_irf_matrix=['irf_',num2str(mm),NAME_SHOCKS{xx},'(jj,:)=',VAR_IRFs{jj},NAME_SHOCKS{xx}];
%evalin('base', generate_irf_matrix)
irfs_matrix(:,jj,xx,mm)=eval([VAR_IRFs{jj},NAME_SHOCKS{xx}]);
end
end

end



%%PLOT


color = {'-k','--r','.-g','+b','*y'};%color and line style for the plots


for xx=1:NUM_SHOCKS;

%Options for the plot
h=figure('Position', [600, 0, 1000, 900]);
axes ('position', [0, 0, 1, 1]);

%Figure 
%Loop over the number of endogenous variables to plot
F1=figure(xx);
set(F1, 'numbertitle','off');
set(F1, 'name', ['Impulse response functions to',NAME_SHOCKS{xx}]);
for jj = 1:length(VAR_IRFs);
    for mm=1:Num_models;
                subplot(Rows_figure,Column_figure,jj), plot(irfs_matrix(:,jj,xx,mm),color{mm},'LineWidth',2); hold on;
                    xlabel('Quarters');
                    ylabel('% dev from SS');
                    grid on
                    title(names(jj,:),'FontSize',10)

axis tight;                   
    end;
end;
legend(Model_names)
sgtitle(['Impulse response functions to ', FIGTITLE_NAME_SHOCKS{xx}]) 
end;