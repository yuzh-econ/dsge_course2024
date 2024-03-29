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
    T = RBC_1.static_g1_tt(T, y, x, params);
end
g1 = zeros(27, 27);
g1(1,1)=1;
g1(1,8)=(-(T(2)*getPowerDeriv(y(8),1-params(1),1)*T(10)/(1-params(5))));
g1(1,10)=(-(T(10)*T(1)*(-(getPowerDeriv(1-y(10),params(1),1)))/(1-params(5))));
g1(2,2)=1;
g1(2,8)=(-(T(5)*(1-params(1))*getPowerDeriv(y(8),(1-params(1))*(1-params(5))-1,1)));
g1(2,10)=(-(T(4)*(-(getPowerDeriv(1-y(10),params(1)*(1-params(5)),1)))));
g1(3,3)=1;
g1(3,8)=(-(T(7)*(-params(1))*getPowerDeriv(y(8),(1-params(1))*(1-params(5)),1)));
g1(3,10)=(-(T(6)*(-(getPowerDeriv(1-y(10),params(1)*(1-params(5))-1,1)))));
g1(4,4)=y(5);
g1(4,5)=y(4);
g1(5,2)=y(3)/(y(2)*y(2));
g1(5,3)=(-1)/y(2);
g1(5,9)=(-1);
g1(6,10)=(-(T(9)*y(14)*T(11)));
g1(6,11)=1;
g1(6,12)=(-(T(8)*getPowerDeriv(y(12),1-params(2),1)));
g1(6,14)=(-(T(9)*y(10)*T(11)));
g1(7,9)=(-1);
g1(7,10)=(-(y(11)*params(2)))/(y(10)*y(10));
g1(7,11)=params(2)/y(10);
g1(8,8)=(-1);
g1(8,11)=1;
g1(8,13)=(-1);
g1(8,15)=(-1);
g1(9,12)=1-(1-params(4));
g1(9,13)=(-1);
g1(10,4)=1;
g1(11,17)=(-1);
g1(12,7)=1;
g1(12,11)=(-((1-params(2))/y(12)));
g1(12,12)=(-((-(y(11)*(1-params(2))))/(y(12)*y(12))));
g1(13,6)=1;
g1(13,7)=(-(1/y(17)));
g1(13,17)=(-(((1-params(4))*y(17)-(y(7)+(1-params(4))*y(17)))/(y(17)*y(17))));
g1(14,4)=y(6);
g1(14,6)=y(4);
g1(15,15)=1;
g1(15,16)=(-1);
g1(16,14)=T(12)-params(6)*T(12);
g1(17,15)=T(13)-params(7)*T(13);
g1(18,11)=(-(((y(11))-y(11))/((y(11))*(y(11)))));
g1(18,22)=1;
g1(19,12)=(-(((y(12))-y(12))/((y(12))*(y(12)))));
g1(19,27)=1;
g1(20,13)=(-(((y(13))-y(13))/((y(13))*(y(13)))));
g1(20,26)=1;
g1(21,8)=(-(((y(8))-y(8))/((y(8))*(y(8)))));
g1(21,23)=1;
g1(22,9)=(-(((y(9))-y(9))/((y(9))*(y(9)))));
g1(22,25)=1;
g1(23,10)=(-(((y(10))-y(10))/((y(10))*(y(10)))));
g1(23,24)=1;
g1(24,5)=(-(((y(5))-y(5))/((y(5))*(y(5)))));
g1(24,21)=1;
g1(25,11)=(-((-y(12))/(y(11)*y(11))));
g1(25,12)=(-(1/y(11)));
g1(25,18)=1;
g1(26,11)=(-((-y(13))/(y(11)*y(11))));
g1(26,13)=(-(1/y(11)));
g1(26,19)=1;
g1(27,8)=(-(1/y(11)));
g1(27,11)=(-((-y(8))/(y(11)*y(11))));
g1(27,20)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
