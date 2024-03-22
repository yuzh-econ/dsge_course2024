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
    T = RBC_JR.static_g1_tt(T, y, x, params);
end
g1 = zeros(31, 31);
g1(1,1)=1;
g1(1,10)=(-(T(12)/(1-params(2))));
g1(1,11)=(-(T(12)*(-(params(3)*T(1)))/(1-params(2))));
g1(1,13)=(-(T(12)*T(15)/(1-params(2))));
g1(2,10)=(-(T(4)*getPowerDeriv(y(10),params(4),1)));
g1(2,11)=1-T(3)*getPowerDeriv(y(11),1-params(4),1);
g1(3,2)=1;
g1(3,10)=(-T(13));
g1(3,11)=(-(T(13)*(-(params(3)*T(1)))));
g1(3,13)=(-(T(13)*T(15)));
g1(4,2)=(-T(6));
g1(4,3)=1;
g1(4,11)=(-(y(2)*T(5)));
g1(4,13)=(-(y(2)*y(11)*params(3)*(-params(1))*getPowerDeriv(y(13),params(1)-1,1)));
g1(5,2)=(-(T(1)*(-params(3))));
g1(5,4)=1;
g1(5,13)=(-(y(2)*(-params(3))*T(14)));
g1(6,5)=1-params(6)*y(8);
g1(6,8)=(-(y(5)*params(6)));
g1(7,2)=(-1);
g1(7,5)=1;
g1(7,6)=y(11)*params(4)/y(10);
g1(7,10)=(-(y(11)*params(4)*y(6)))/(y(10)*y(10));
g1(7,11)=params(4)*y(6)/y(10);
g1(8,4)=1;
g1(8,6)=1-(1-params(4))*params(6);
g1(9,3)=(-1)/y(5);
g1(9,5)=y(3)/(y(5)*y(5));
g1(9,12)=(-1);
g1(10,13)=(-(T(8)*y(17)*T(16)));
g1(10,14)=1;
g1(10,15)=(-(T(7)*getPowerDeriv(y(15),1-params(5),1)));
g1(10,17)=(-(T(8)*y(13)*T(16)));
g1(11,12)=(-1);
g1(11,13)=(-(y(14)*params(5)))/(y(13)*y(13));
g1(11,14)=params(5)/y(13);
g1(12,10)=(-1);
g1(12,14)=1;
g1(12,16)=(-1);
g1(12,18)=(-1);
g1(13,15)=1-(1-params(7));
g1(13,16)=(-T(9));
g1(13,20)=(-(y(16)*(-(params(11)*2*(y(20)-1)))));
g1(14,20)=1;
g1(15,7)=1;
g1(16,7)=T(11);
g1(16,20)=y(21)*((-(params(11)*2*(y(20)-1)))-(params(11)*2*y(20)+(y(20)-1)*2*params(11)))+y(7)*y(21)*(2*params(11)*T(10)+2*y(20)*(y(20)-1)*2*params(11));
g1(16,21)=T(9)-(y(20)-1)*params(11)*2*y(20)+y(7)*(y(20)-1)*2*params(11)*T(10);
g1(17,9)=1;
g1(17,14)=(-((1-params(5))/y(15)/y(21)));
g1(17,15)=(-((-(y(14)*(1-params(5))))/(y(15)*y(15))/y(21)));
g1(17,21)=(-(((1-params(7))*y(21)-(y(14)*(1-params(5))/y(15)+(1-params(7))*y(21)))/(y(21)*y(21))));
g1(18,7)=y(9)-y(8);
g1(18,8)=(-y(7));
g1(18,9)=y(7);
g1(19,12)=(-(y(13)*y(19)));
g1(19,13)=(-(y(12)*y(19)));
g1(19,18)=1;
g1(19,19)=(-(y(13)*y(12)));
g1(20,17)=T(17)-params(8)*T(17);
g1(21,18)=T(18)-params(9)*T(18);
g1(22,14)=(-(((y(14))-y(14))/((y(14))*(y(14)))));
g1(22,26)=1;
g1(23,15)=(-(((y(15))-y(15))/((y(15))*(y(15)))));
g1(23,31)=1;
g1(24,16)=(-(((y(16))-y(16))/((y(16))*(y(16)))));
g1(24,30)=1;
g1(25,10)=(-(((y(10))-y(10))/((y(10))*(y(10)))));
g1(25,27)=1;
g1(26,12)=(-(((y(12))-y(12))/((y(12))*(y(12)))));
g1(26,29)=1;
g1(27,13)=(-(((y(13))-y(13))/((y(13))*(y(13)))));
g1(27,28)=1;
g1(28,8)=(-(((y(8))-y(8))/((y(8))*(y(8)))));
g1(28,25)=1;
g1(29,14)=(-((-y(15))/(y(14)*y(14))));
g1(29,15)=(-(1/y(14)));
g1(29,22)=1;
g1(30,14)=(-((-y(16))/(y(14)*y(14))));
g1(30,16)=(-(1/y(14)));
g1(30,23)=1;
g1(31,10)=(-(1/y(14)));
g1(31,14)=(-((-y(10))/(y(14)*y(14))));
g1(31,24)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
