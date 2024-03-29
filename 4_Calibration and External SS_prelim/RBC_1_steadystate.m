function [ys,params,check] = RBC_1_prelim_steadystate(ys,exo,M_,options_)

 
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
%
%%


%% THIS BLOCK IS MODEL SPECIFIC.
%%
%% Here the user has to define the steady state.
%%
	A=A_bar;
	q=1;
	LAMBDA=betta;
	R=1.0/betta;
	RK=R;
	rk=RK-1+delta;
	KY=(1-alp)/rk;
	IY=delta*KY;
	CY=1-IY-gy;
	H=(1-varrho)*alp/(varrho*CY+(1-varrho)*alp);
	Y=A*H*KY^((1-alp)/alp);
	K=KY*Y;
	I=IY*Y;
	C=CY*Y;
	G=gy*Y;
	W=alp*Y/H;
	tax=G;

	U=1/(1-sigma_c)*(C^((1-varrho)*(1-sigma_c))*(1-H)^(varrho*(1-sigma_c))-1);
	UC=(1-varrho)*C^((1-varrho)*(1-sigma_c)-1)*(1-H)^(varrho*(1-sigma_c));
	UH=-varrho*(C^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));

	%U=(1-varrho)*log(C)+varrho*log(1-H);
	%UC=(1-varrho)/C;
	%H=-varrho/(1-H);

	YY=1;
	CC=1;
	HH=1;
	WW=1; 
	II=1; 
	KK=1;
	RR=1;


  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
end

                                                           % End of the loop.
%%