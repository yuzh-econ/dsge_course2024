function [ys,params,check] = RBC_2_steadystate(ys,exo,M_,options_)% for dynare 4.5.6

 
%% DO NOT CHANGE THIS PART.
%%
%% Here we load the values of the deep parameters in a loop.
%%
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;



%%

%% THIS BLOCK IS MODEL SPECIFIC.
%%
%% Here the user has to define the steady state.


 %This part calls the function fun_RBC_2.m
 %Use fsolve to find the steady state values of hours worked
 %initial values
 x0=[0.0];
 [x,fval] =fsolve(@fun_RBC_2,x0,optimset('Display','off'));
 
%Derived variables (cut and paste from fun_RBC.m)
H=exp(x(1))/(1+exp(x(1)));
A=A_bar;
R=1.0/betta;
KY=(1-alp)/(R-1+delta);
Y=A*H*KY^((1-alp)/alp);
K=KY*Y;
I=(delta)*K;
G=gy*Y;
W=alp*Y/H;
C=W*((1-varrho)*(1-H))/varrho;
tax=G;

%Post recursive Steady state relationship
U=1/(1-sigma_c)*(C^((1-varrho)*(1-sigma_c))*(1-H)^(varrho*(1-sigma_c))-1);
UC=(1-varrho)*C^((1-varrho)*(1-sigma_c)-1)*(1-H)^(varrho*(1-sigma_c));
UH=-varrho*(C^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));

LAMBDA=betta;

YY=1;
CC=1;
HH=1;
WW=1; 
II=1; 
KK=1;
RR=1;
IY=I/Y;
CY=C/Y;

%-----------------------------------------------
%Additional ss for Invest Costs
%-----------------------------------------------

	q=1;
	RK=R;
	rk=RK-1+delta;
	YY=1;
	CC=1;
	HH=1;
	WW=1; 
	II=1; 
	KK=1;
	RR=1;

   %% END OF THE MODEL SPECIFIC BLOCK.

%% DO NOT CHANGE THIS PART.
%%
%% Here we define the steady state values of the endogenous variables of
%% the model.
%%
% %%
params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end                                                       % End of the loop.
%%