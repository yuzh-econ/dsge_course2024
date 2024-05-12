function [residual, g1, g2, g3] = NKlinear_Est_None_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(35, 1);
iy__ = (1-params(2))*params(6)/(params(6)+params(20)-1);
cy__ = 1-iy__-params(1);
iyf__ = (1-params(2))*params(6)/(params(6)+params(22)-1);
cyf__ = 1-iyf__-params(1);
varrho__ = (1-params(19))/(1+params(19)*(cy__*(1-params(14))/params(2)-1));
T50 = y(33)/(1-params(14))-params(14)/(1-params(14))*y(9);
T141 = y(24)/(1-params(14))-params(14)/(1-params(14))*y(4);
lhs =y(32);
rhs =((1-varrho__)*(1-params(7))-1)*T50+varrho__*(params(7)-1)*params(21)/(1-params(21))*y(34);
residual(1)= lhs-rhs;
lhs =y(54);
rhs =y(32)-y(35);
residual(2)= lhs-rhs;
lhs =y(36);
rhs =(-y(32))-T50-params(21)/(1-params(21))*y(34);
residual(3)= lhs-rhs;
lhs =y(37);
rhs =(-y(36))-y(32);
residual(4)= lhs-rhs;
lhs =y(38);
rhs =params(2)*(y(34)+y(25))+(1-params(2))*y(10);
residual(5)= lhs-rhs;
lhs =y(37);
rhs =y(38)-y(34);
residual(6)= lhs-rhs;
lhs =y(38);
rhs =y(33)*cyf__+iyf__*y(40)+params(1)*y(41);
residual(7)= lhs-rhs;
lhs =y(39);
rhs =params(6)*y(40)+y(10)*(1-params(6));
residual(8)= lhs-rhs;
lhs =y(42);
rhs =(params(6)+params(22)-1)/params(22)*(y(38)-y(10))+(1-params(6))/params(22)*y(43);
residual(9)= lhs-rhs;
lhs =y(35);
rhs =y(56)-y(43);
residual(10)= lhs-rhs;
lhs =y(40)*(1+1/params(22));
rhs =1/params(22)*y(55)+y(11)+y(43)*1/(2*params(12));
residual(11)= lhs-rhs;
lhs =y(41);
rhs =y(34)+y(37)+y(44);
residual(12)= lhs-rhs;
lhs =y(41);
rhs =params(9)*y(12)+x(it_, 2);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =((1-varrho__)*(1-params(7))-1)*T141+varrho__*(params(7)-1)*params(19)/(1-params(19))*y(17);
residual(14)= lhs-rhs;
lhs =y(49);
rhs =y(14)-y(50);
residual(15)= lhs-rhs;
lhs =y(15);
rhs =(-y(14))-T141-params(19)/(1-params(19))*y(17);
residual(16)= lhs-rhs;
lhs =y(18);
rhs =(-y(15))-y(14);
residual(17)= lhs-rhs;
lhs =y(20);
rhs =y(19);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =params(2)*(y(25)+y(17))+(1-params(2))*y(2);
residual(19)= lhs-rhs;
lhs =y(30);
rhs =y(17)+y(18)-y(19);
residual(20)= lhs-rhs;
lhs =y(20);
rhs =cy__*y(24)+iy__*y(22)+params(1)*y(26);
residual(21)= lhs-rhs;
lhs =y(21);
rhs =params(6)*y(22)+(1-params(6))*y(2);
residual(22)= lhs-rhs;
lhs =y(27);
rhs =(params(6)+params(20)-1)/params(20)*(y(19)+y(30)-y(2))+(1-params(6))/params(20)*y(28);
residual(23)= lhs-rhs;
lhs =y(50);
rhs =y(52)-y(28);
residual(24)= lhs-rhs;
lhs =y(22)*(1+1/params(20));
rhs =1/params(20)*y(51)+y(3)+1/(2*params(12))*y(28);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(17)+y(18)+y(23);
residual(26)= lhs-rhs;
lhs =y(29);
rhs =params(5)/(1+params(5)*params(15))*y(53)+params(15)/(1+params(5)*params(15))*y(7)+(1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))*(y(30)+y(45));
residual(27)= lhs-rhs;
lhs =y(31);
rhs =params(16)*y(8)+y(29)*(1-params(16))*params(17)+(1-params(16))*params(18)*(y(20)-y(38))+x(it_, 3);
residual(28)= lhs-rhs;
lhs =y(16);
rhs =y(8)-y(29);
residual(29)= lhs-rhs;
lhs =y(25);
rhs =params(8)*y(5)+x(it_, 1);
residual(30)= lhs-rhs;
lhs =y(26);
rhs =x(it_, 2)+params(9)*y(6);
residual(31)= lhs-rhs;
lhs =y(45);
rhs =params(10)*y(13)+x(it_, 4);
residual(32)= lhs-rhs;
lhs =y(46);
rhs =y(20)-y(1)+params(24);
residual(33)= lhs-rhs;
lhs =y(47);
rhs =y(29)+params(25);
residual(34)= lhs-rhs;
lhs =y(48);
rhs =y(31)+params(26);
residual(35)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(35, 60);

  %
  % Jacobian matrix
  %

  g1(1,32)=1;
  g1(1,9)=(-(((1-varrho__)*(1-params(7))-1)*(-(params(14)/(1-params(14))))));
  g1(1,33)=(-(((1-varrho__)*(1-params(7))-1)*1/(1-params(14))));
  g1(1,34)=(-(varrho__*(params(7)-1)*params(21)/(1-params(21))));
  g1(2,32)=(-1);
  g1(2,54)=1;
  g1(2,35)=1;
  g1(3,32)=1;
  g1(3,9)=(-(params(14)/(1-params(14))));
  g1(3,33)=1/(1-params(14));
  g1(3,34)=params(21)/(1-params(21));
  g1(3,36)=1;
  g1(4,32)=1;
  g1(4,36)=1;
  g1(4,37)=1;
  g1(5,25)=(-params(2));
  g1(5,34)=(-params(2));
  g1(5,38)=1;
  g1(5,10)=(-(1-params(2)));
  g1(6,34)=1;
  g1(6,37)=1;
  g1(6,38)=(-1);
  g1(7,33)=(-cyf__);
  g1(7,38)=1;
  g1(7,40)=(-iyf__);
  g1(7,41)=(-params(1));
  g1(8,10)=(-(1-params(6)));
  g1(8,39)=1;
  g1(8,40)=(-params(6));
  g1(9,38)=(-((params(6)+params(22)-1)/params(22)));
  g1(9,10)=(params(6)+params(22)-1)/params(22);
  g1(9,42)=1;
  g1(9,43)=(-((1-params(6))/params(22)));
  g1(10,35)=1;
  g1(10,56)=(-1);
  g1(10,43)=1;
  g1(11,11)=(-1);
  g1(11,40)=1+1/params(22);
  g1(11,55)=(-(1/params(22)));
  g1(11,43)=(-(1/(2*params(12))));
  g1(12,34)=(-1);
  g1(12,37)=(-1);
  g1(12,41)=1;
  g1(12,44)=(-1);
  g1(13,12)=(-params(9));
  g1(13,41)=1;
  g1(13,58)=(-1);
  g1(14,14)=1;
  g1(14,17)=(-(varrho__*(params(7)-1)*params(19)/(1-params(19))));
  g1(14,4)=(-(((1-varrho__)*(1-params(7))-1)*(-(params(14)/(1-params(14))))));
  g1(14,24)=(-(((1-varrho__)*(1-params(7))-1)*1/(1-params(14))));
  g1(15,14)=(-1);
  g1(15,49)=1;
  g1(15,50)=1;
  g1(16,14)=1;
  g1(16,15)=1;
  g1(16,17)=params(19)/(1-params(19));
  g1(16,4)=(-(params(14)/(1-params(14))));
  g1(16,24)=1/(1-params(14));
  g1(17,14)=1;
  g1(17,15)=1;
  g1(17,18)=1;
  g1(18,19)=(-1);
  g1(18,20)=1;
  g1(19,17)=(-params(2));
  g1(19,19)=1;
  g1(19,2)=(-(1-params(2)));
  g1(19,25)=(-params(2));
  g1(20,17)=(-1);
  g1(20,18)=(-1);
  g1(20,19)=1;
  g1(20,30)=1;
  g1(21,20)=1;
  g1(21,22)=(-iy__);
  g1(21,24)=(-cy__);
  g1(21,26)=(-params(1));
  g1(22,2)=(-(1-params(6)));
  g1(22,21)=1;
  g1(22,22)=(-params(6));
  g1(23,19)=(-((params(6)+params(20)-1)/params(20)));
  g1(23,2)=(params(6)+params(20)-1)/params(20);
  g1(23,27)=1;
  g1(23,28)=(-((1-params(6))/params(20)));
  g1(23,30)=(-((params(6)+params(20)-1)/params(20)));
  g1(24,50)=1;
  g1(24,52)=(-1);
  g1(24,28)=1;
  g1(25,3)=(-1);
  g1(25,22)=1+1/params(20);
  g1(25,51)=(-(1/params(20)));
  g1(25,28)=(-(1/(2*params(12))));
  g1(26,17)=(-1);
  g1(26,18)=(-1);
  g1(26,23)=(-1);
  g1(26,26)=1;
  g1(27,7)=(-(params(15)/(1+params(5)*params(15))));
  g1(27,29)=1;
  g1(27,53)=(-(params(5)/(1+params(5)*params(15))));
  g1(27,30)=(-((1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))));
  g1(27,45)=(-((1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))));
  g1(28,20)=(-((1-params(16))*params(18)));
  g1(28,29)=(-((1-params(16))*params(17)));
  g1(28,8)=(-params(16));
  g1(28,31)=1;
  g1(28,38)=(1-params(16))*params(18);
  g1(28,59)=(-1);
  g1(29,16)=1;
  g1(29,29)=1;
  g1(29,8)=(-1);
  g1(30,5)=(-params(8));
  g1(30,25)=1;
  g1(30,57)=(-1);
  g1(31,6)=(-params(9));
  g1(31,26)=1;
  g1(31,58)=(-1);
  g1(32,13)=(-params(10));
  g1(32,45)=1;
  g1(32,60)=(-1);
  g1(33,1)=1;
  g1(33,20)=(-1);
  g1(33,46)=1;
  g1(34,29)=(-1);
  g1(34,47)=1;
  g1(35,31)=(-1);
  g1(35,48)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],35,3600);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],35,216000);
end
end
end
end
