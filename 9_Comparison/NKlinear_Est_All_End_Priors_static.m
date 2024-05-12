function [residual, g1, g2, g3] = NKlinear_Est_All_End_Priors_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 35, 1);

%
% Model equations
%

iy__ = (1-params(2))*params(6)/(params(6)+params(20)-1);
cy__ = 1-iy__-params(1);
iyf__ = (1-params(2))*params(6)/(params(6)+params(22)-1);
cyf__ = 1-iyf__-params(1);
varrho__ = (1-params(19))/(1+params(19)*(cy__*(1-params(14))/params(2)-1));
T49 = y(20)/(1-params(14))-y(20)*params(14)/(1-params(14));
T133 = y(11)/(1-params(14))-params(14)/(1-params(14))*y(11);
lhs =y(19);
rhs =((1-varrho__)*(1-params(7))-1)*T49+varrho__*(params(7)-1)*params(21)/(1-params(21))*y(21);
residual(1)= lhs-rhs;
lhs =y(19);
rhs =y(19)-y(22);
residual(2)= lhs-rhs;
lhs =y(23);
rhs =(-y(19))-T49-params(21)/(1-params(21))*y(21);
residual(3)= lhs-rhs;
lhs =y(24);
rhs =(-y(23))-y(19);
residual(4)= lhs-rhs;
lhs =y(25);
rhs =params(2)*(y(21)+y(12))+(1-params(2))*y(26);
residual(5)= lhs-rhs;
lhs =y(24);
rhs =y(25)-y(21);
residual(6)= lhs-rhs;
lhs =y(25);
rhs =y(20)*cyf__+iyf__*y(27)+params(1)*y(28);
residual(7)= lhs-rhs;
lhs =y(26);
rhs =params(6)*y(27)+y(26)*(1-params(6));
residual(8)= lhs-rhs;
lhs =y(29);
rhs =(params(6)+params(22)-1)/params(22)*(y(25)-y(26))+(1-params(6))/params(22)*y(30);
residual(9)= lhs-rhs;
lhs =y(22);
rhs =y(29)-y(30);
residual(10)= lhs-rhs;
lhs =y(27)*(1+1/params(22));
rhs =y(27)+y(27)*1/params(22)+y(30)*1/(2*params(12));
residual(11)= lhs-rhs;
lhs =y(28);
rhs =y(21)+y(24)+y(31);
residual(12)= lhs-rhs;
lhs =y(28);
rhs =y(28)*params(9)+x(2);
residual(13)= lhs-rhs;
lhs =y(1);
rhs =((1-varrho__)*(1-params(7))-1)*T133+varrho__*(params(7)-1)*params(19)/(1-params(19))*y(4);
residual(14)= lhs-rhs;
lhs =y(1);
rhs =y(1)-y(3);
residual(15)= lhs-rhs;
lhs =y(2);
rhs =(-y(1))-T133-params(19)/(1-params(19))*y(4);
residual(16)= lhs-rhs;
lhs =y(5);
rhs =(-y(2))-y(1);
residual(17)= lhs-rhs;
lhs =y(7);
rhs =y(6);
residual(18)= lhs-rhs;
lhs =y(6);
rhs =params(2)*(y(12)+y(4))+(1-params(2))*y(8);
residual(19)= lhs-rhs;
lhs =y(17);
rhs =y(4)+y(5)-y(6);
residual(20)= lhs-rhs;
lhs =y(7);
rhs =cy__*y(11)+iy__*y(9)+params(1)*y(13);
residual(21)= lhs-rhs;
lhs =y(8);
rhs =params(6)*y(9)+(1-params(6))*y(8);
residual(22)= lhs-rhs;
lhs =y(14);
rhs =(params(6)+params(20)-1)/params(20)*(y(6)+y(17)-y(8))+(1-params(6))/params(20)*y(15);
residual(23)= lhs-rhs;
lhs =y(3);
rhs =y(14)-y(15);
residual(24)= lhs-rhs;
lhs =y(9)*(1+1/params(20));
rhs =y(9)+y(9)*1/params(20)+1/(2*params(12))*y(15);
residual(25)= lhs-rhs;
lhs =y(13);
rhs =y(4)+y(5)+y(10);
residual(26)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(5)/(1+params(5)*params(15))+y(16)*params(15)/(1+params(5)*params(15))+(1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))*(y(17)+y(32));
residual(27)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(16)+y(16)*(1-params(16))*params(17)+(1-params(16))*params(18)*(y(7)-y(25))+x(3);
residual(28)= lhs-rhs;
lhs =y(3);
rhs =y(18)-y(16);
residual(29)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(8)+x(1);
residual(30)= lhs-rhs;
lhs =y(13);
rhs =x(2)+params(9)*y(13);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(32)*params(10)+x(4);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =params(24);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(16)+params(25);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(18)+params(26);
residual(35)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(35, 35);

  %
  % Jacobian matrix
  %

T276 = 1/(1-params(14))-params(14)/(1-params(14));
  g1(1,19)=1;
  g1(1,20)=(-(((1-varrho__)*(1-params(7))-1)*T276));
  g1(1,21)=(-(varrho__*(params(7)-1)*params(21)/(1-params(21))));
  g1(2,22)=1;
  g1(3,19)=1;
  g1(3,20)=T276;
  g1(3,21)=params(21)/(1-params(21));
  g1(3,23)=1;
  g1(4,19)=1;
  g1(4,23)=1;
  g1(4,24)=1;
  g1(5,12)=(-params(2));
  g1(5,21)=(-params(2));
  g1(5,25)=1;
  g1(5,26)=(-(1-params(2)));
  g1(6,21)=1;
  g1(6,24)=1;
  g1(6,25)=(-1);
  g1(7,20)=(-cyf__);
  g1(7,25)=1;
  g1(7,27)=(-iyf__);
  g1(7,28)=(-params(1));
  g1(8,26)=1-(1-params(6));
  g1(8,27)=(-params(6));
  g1(9,25)=(-((params(6)+params(22)-1)/params(22)));
  g1(9,26)=(params(6)+params(22)-1)/params(22);
  g1(9,29)=1;
  g1(9,30)=(-((1-params(6))/params(22)));
  g1(10,22)=1;
  g1(10,29)=(-1);
  g1(10,30)=1;
  g1(11,30)=(-(1/(2*params(12))));
  g1(12,21)=(-1);
  g1(12,24)=(-1);
  g1(12,28)=1;
  g1(12,31)=(-1);
  g1(13,28)=1-params(9);
  g1(14,1)=1;
  g1(14,4)=(-(varrho__*(params(7)-1)*params(19)/(1-params(19))));
  g1(14,11)=(-(((1-varrho__)*(1-params(7))-1)*T276));
  g1(15,3)=1;
  g1(16,1)=1;
  g1(16,2)=1;
  g1(16,4)=params(19)/(1-params(19));
  g1(16,11)=T276;
  g1(17,1)=1;
  g1(17,2)=1;
  g1(17,5)=1;
  g1(18,6)=(-1);
  g1(18,7)=1;
  g1(19,4)=(-params(2));
  g1(19,6)=1;
  g1(19,8)=(-(1-params(2)));
  g1(19,12)=(-params(2));
  g1(20,4)=(-1);
  g1(20,5)=(-1);
  g1(20,6)=1;
  g1(20,17)=1;
  g1(21,7)=1;
  g1(21,9)=(-iy__);
  g1(21,11)=(-cy__);
  g1(21,13)=(-params(1));
  g1(22,8)=1-(1-params(6));
  g1(22,9)=(-params(6));
  g1(23,6)=(-((params(6)+params(20)-1)/params(20)));
  g1(23,8)=(params(6)+params(20)-1)/params(20);
  g1(23,14)=1;
  g1(23,15)=(-((1-params(6))/params(20)));
  g1(23,17)=(-((params(6)+params(20)-1)/params(20)));
  g1(24,3)=1;
  g1(24,14)=(-1);
  g1(24,15)=1;
  g1(25,15)=(-(1/(2*params(12))));
  g1(26,4)=(-1);
  g1(26,5)=(-1);
  g1(26,10)=(-1);
  g1(26,13)=1;
  g1(27,16)=1-(params(5)/(1+params(5)*params(15))+params(15)/(1+params(5)*params(15)));
  g1(27,17)=(-((1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))));
  g1(27,32)=(-((1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))));
  g1(28,7)=(-((1-params(16))*params(18)));
  g1(28,16)=(-((1-params(16))*params(17)));
  g1(28,18)=1-params(16);
  g1(28,25)=(1-params(16))*params(18);
  g1(29,3)=1;
  g1(29,16)=1;
  g1(29,18)=(-1);
  g1(30,12)=1-params(8);
  g1(31,13)=1-params(9);
  g1(32,32)=1-params(10);
  g1(33,33)=1;
  g1(34,16)=(-1);
  g1(34,34)=1;
  g1(35,18)=(-1);
  g1(35,35)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],35,1225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],35,42875);
end
end
end
end
