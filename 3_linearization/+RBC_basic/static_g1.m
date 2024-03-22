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
    T = RBC_basic.static_g1_tt(T, y, x, params);
end
g1 = zeros(26, 26);
g1(1,1)=1;
g1(1,7)=(-(T(2)*getPowerDeriv(y(7),1-params(1),1)*T(10)/(1-params(5))));
g1(1,9)=(-(T(10)*T(1)*(-(getPowerDeriv(1-y(9),params(1),1)))/(1-params(5))));
g1(2,2)=1;
g1(2,7)=(-(T(5)*(1-params(1))*getPowerDeriv(y(7),(1-params(1))*(1-params(5))-1,1)));
g1(2,9)=(-(T(4)*(-(getPowerDeriv(1-y(9),params(1)*(1-params(5)),1)))));
g1(3,3)=1;
g1(3,7)=(-(T(7)*(-params(1))*getPowerDeriv(y(7),(1-params(1))*(1-params(5)),1)));
g1(3,9)=(-(T(6)*(-(getPowerDeriv(1-y(9),params(1)*(1-params(5))-1,1)))));
g1(4,4)=1;
g1(5,2)=1-params(3)*y(5);
g1(5,5)=(-(y(2)*params(3)));
g1(6,4)=y(6);
g1(6,6)=y(4);
g1(7,2)=y(3)/(y(2)*y(2));
g1(7,3)=(-1)/y(2);
g1(7,8)=(-1);
g1(8,9)=(-(T(9)*y(13)*T(11)));
g1(8,10)=1;
g1(8,11)=(-(T(8)*getPowerDeriv(y(11),1-params(2),1)));
g1(8,13)=(-(T(9)*y(9)*T(11)));
g1(9,8)=(-1);
g1(9,9)=(-(y(10)*params(2)))/(y(9)*y(9));
g1(9,10)=params(2)/y(9);
g1(10,6)=1;
g1(10,10)=(-((1-params(2))/y(11)));
g1(10,11)=(-((-(y(10)*(1-params(2))))/(y(11)*y(11))));
g1(11,7)=(-1);
g1(11,10)=1;
g1(11,12)=(-1);
g1(11,14)=(-1);
g1(12,11)=1-(1-params(4));
g1(12,12)=(-1);
g1(13,13)=T(12)-params(12)*T(12);
g1(14,14)=T(13)-params(13)*T(13);
g1(15,10)=(-(((y(10))-y(10))/((y(10))*(y(10)))/(y(10)/(y(10)))));
g1(15,18)=1;
g1(16,11)=(-(((y(11))-y(11))/((y(11))*(y(11)))/(y(11)/(y(11)))));
g1(16,23)=1;
g1(17,12)=(-(((y(12))-y(12))/((y(12))*(y(12)))/(y(12)/(y(12)))));
g1(17,22)=1;
g1(18,7)=(-(((y(7))-y(7))/((y(7))*(y(7)))/(y(7)/(y(7)))));
g1(18,19)=1;
g1(19,8)=(-(((y(8))-y(8))/((y(8))*(y(8)))/(y(8)/(y(8)))));
g1(19,21)=1;
g1(20,9)=(-(((y(9))-y(9))/((y(9))*(y(9)))/(y(9)/(y(9)))));
g1(20,20)=1;
g1(21,5)=(-(((y(5))-y(5))/((y(5))*(y(5)))/(y(5)/(y(5)))));
g1(21,24)=1;
g1(22,13)=(-(((y(13))-y(13))/((y(13))*(y(13)))/(y(13)/(y(13)))));
g1(22,25)=1;
g1(23,14)=(-(((y(14))-y(14))/((y(14))*(y(14)))/(y(14)/(y(14)))));
g1(23,26)=1;
g1(24,10)=(-((-y(11))/(y(10)*y(10))));
g1(24,11)=(-(1/y(10)));
g1(24,15)=1;
g1(25,10)=(-((-y(12))/(y(10)*y(10))));
g1(25,12)=(-(1/y(10)));
g1(25,16)=1;
g1(26,7)=(-(1/y(10)));
g1(26,10)=(-((-y(7))/(y(10)*y(10))));
g1(26,17)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
