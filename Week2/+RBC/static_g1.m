function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = RBC.static_g1_tt(T, y, x, params);
end
g1 = zeros(28, 28);
g1(1,1)=1;
g1(1,7)=(-(T(2)*getPowerDeriv(y(7),1-params(1),1)*T(13)/(1-params(5))));
g1(1,9)=(-(T(13)*T(1)*(-(getPowerDeriv(1-y(9),params(1),1)))/(1-params(5))));
g1(2,2)=1;
g1(2,7)=(-(T(5)*(1-params(1))*getPowerDeriv(y(7),(1-params(1))*(1-params(5))-1,1)));
g1(2,9)=(-(T(4)*(-(getPowerDeriv(1-y(9),params(1)*(1-params(5)),1)))));
g1(3,3)=1;
g1(3,7)=(-(T(7)*(-params(1))*getPowerDeriv(y(7),(1-params(1))*(1-params(5)),1)));
g1(3,9)=(-(T(6)*(-(getPowerDeriv(1-y(9),params(1)*(1-params(5))-1,1)))));
g1(4,2)=1-params(3)*y(5);
g1(4,5)=(-(y(2)*params(3)));
g1(5,2)=y(3)/(y(2)*y(2));
g1(5,3)=(-1)/y(2);
g1(5,8)=(-1);
g1(6,9)=(-(T(9)*y(13)*T(14)));
g1(6,10)=1;
g1(6,11)=(-(T(8)*getPowerDeriv(y(11),1-params(2),1)));
g1(6,13)=(-(T(9)*y(9)*T(14)));
g1(7,8)=(-1);
g1(7,9)=(-(y(10)*params(2)))/(y(9)*y(9));
g1(7,10)=params(2)/y(9);
g1(8,7)=(-1);
g1(8,10)=1;
g1(8,12)=(-1);
g1(8,14)=(-1);
g1(9,11)=1-(1-params(4));
g1(9,12)=(-T(10));
g1(9,16)=(-(y(12)*(-(params(9)*2*(y(16)-1)))));
g1(10,16)=1;
g1(11,4)=1;
g1(12,4)=(-T(12));
g1(12,16)=(-(y(4)*y(17)*(2*params(9)*T(11)+(y(16)-1)*2*params(9)*2*y(16))));
g1(12,17)=(-(y(4)*(y(16)-1)*2*params(9)*T(11)));
g1(12,18)=1;
g1(13,16)=y(17)*((-(params(9)*2*(y(16)-1)))-((y(16)-1)*2*params(9)+params(9)*2*y(16)));
g1(13,17)=T(10)-(y(16)-1)*params(9)*2*y(16);
g1(13,18)=1;
g1(14,6)=1;
g1(14,10)=(-((1-params(2))/y(11)/y(17)));
g1(14,11)=(-((-(y(10)*(1-params(2))))/(y(11)*y(11))/y(17)));
g1(14,17)=(-(((1-params(4))*y(17)-(y(10)*(1-params(2))/y(11)+(1-params(4))*y(17)))/(y(17)*y(17))));
g1(15,4)=y(6)-y(5);
g1(15,5)=(-y(4));
g1(15,6)=y(4);
g1(16,8)=(-(y(9)*y(15)));
g1(16,9)=(-(y(8)*y(15)));
g1(16,14)=1;
g1(16,15)=(-(y(9)*y(8)));
g1(17,13)=T(15)-params(6)*T(15);
g1(18,14)=T(16)-params(7)*T(16);
g1(19,10)=(-(((y(10))-y(10))/((y(10))*(y(10)))));
g1(19,23)=1;
g1(20,11)=(-(((y(11))-y(11))/((y(11))*(y(11)))));
g1(20,28)=1;
g1(21,12)=(-(((y(12))-y(12))/((y(12))*(y(12)))));
g1(21,27)=1;
g1(22,7)=(-(((y(7))-y(7))/((y(7))*(y(7)))));
g1(22,24)=1;
g1(23,8)=(-(((y(8))-y(8))/((y(8))*(y(8)))));
g1(23,26)=1;
g1(24,9)=(-(((y(9))-y(9))/((y(9))*(y(9)))));
g1(24,25)=1;
g1(25,5)=(-(((y(5))-y(5))/((y(5))*(y(5)))));
g1(25,22)=1;
g1(26,10)=(-((-y(11))/(y(10)*y(10))));
g1(26,11)=(-(1/y(10)));
g1(26,19)=1;
g1(27,10)=(-((-y(12))/(y(10)*y(10))));
g1(27,12)=(-(1/y(10)));
g1(27,20)=1;
g1(28,7)=(-(1/y(10)));
g1(28,10)=(-((-y(7))/(y(10)*y(10))));
g1(28,21)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
