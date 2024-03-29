% ------------------------------------------------------
% This program defines the conditions needed to find the
% steady state value of hours worked using fsolve
% ------------------------------------------------------

function y=fun_RBC(x)

%% Load model parameters
global M_
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
 
end
%%
%%Define hours as unknown
H=exp(x(1))/(1+exp(x(1)));


%Define only the steady state relationships needed to find the value of hours worked that supports the resource constraint relationship Y=C+I+G
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
%tax=G/(W*H);

%Resource constraint 
%this is the equation for which fsolve will find the solution
y=[Y-C-I-G];



