clear;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%OPTIONS TO BE CHANGED BY THE USER%%%%%%%%%%%%%%%%
%RESULT_names={'NK_results', 'NKlinear_results'}; %%EXACT NAMES OF THE RESULTS FILES TO LOAD
%lin_vs_nonlin=[0,1]; %=0 IF THE CORRESPONDING MODEL IN RESULT_NAMES IS NON-LINEAR, 1 IF IT IS LINEAR
RESULT_names={'NK_moreShocks_001','NK_moreShocks_500', 'NK_moreShocks_999'}; %%EXACT NAMES OF THE RESULTS FILES TO LOAD
lin_vs_nonlin=[0,0,0]; %=0 IF THE CORRESPONDING MODEL IN RESULT_NAMES IS NON-LINEAR, 1 IF IT IS LINEAR


VAR_IRFs_nonlin = {'YY','CC','II','HH','WW','ERER','RnRn','QQ','PIEPIE'}; %% NAMES OF ENDOGENOUS VARIABLES OF INTEREST FOR THE IRFS (NON-LINEAR MODELS) - NEED TO HAVE EXACTLY SAME NAME AS IN THE .MOD FILE
VAR_IRFs_linear= {'Y','C','I','H','W','ER','Rn','Q','PIE'};

NAME_SHOCKS={'_epsIS','_epsPS'};%% NAMES OF EXOGENOUS SHOCKS OF INTEREST FOR THE IRFS - NEED TO HAVE EXACTLY SAME NAME AS IN THE .MOD FILE
FIGTITLE_NAME_SHOCKS = {'Investment Shock', 'Preference Shock'};
names = char('Output', 'Consumption', 'Investment', 'Hours worked', 'Real wage', 'Expected real interest rate', 'Nominal interest rate', 'Tobin Q', 'Inflation'); % NAMES OF THE EDOGENOUS VARIABLES FOR THE GRAPHS. YOU CAN SPECIFY ANY NAME YOU WANT BUT NEED TO HAVE THE SAME NUMBER OF ELEMENT OF VAR_IRFs


%Model_names=char( 'NK (non-linear)', 'NK (linear)' ); %NAMES OF THE MODEL VARIANTS TO APPEAR IN THE LEGEND OF THE GRAPHS
Model_names=char( 'Transitory ', 'Medium', 'Persistent' ); %NAMES OF THE MODEL VARIANTS TO APPEAR IN THE LEGEND OF THE GRAPHS

Rows_figure=3; % NUMBER OF ROWS IN EACH PLOT
Column_figure=3; % NUMBER OF COLUMNSS IN EACH PLOT
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
