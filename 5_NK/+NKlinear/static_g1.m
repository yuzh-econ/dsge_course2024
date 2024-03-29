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
    T = NKlinear.static_g1_tt(T, y, x, params);
end
g1 = zeros(32, 32);
g1(1,19)=1;
g1(1,22)=(-(params(6)*(params(5)-1)*params(20)/(1-params(20))));
g1(1,28)=(-(((1-params(6))*(1-params(5))-1)*T(3)));
g1(2,21)=1;
g1(3,19)=1;
g1(3,20)=1;
g1(3,22)=params(20)/(1-params(20));
g1(3,28)=T(3);
g1(4,19)=1;
g1(4,20)=1;
g1(4,27)=1;
g1(5,11)=(-params(2));
g1(5,22)=(-params(2));
g1(5,23)=1;
g1(5,24)=(-(1-params(2)));
g1(6,22)=1;
g1(6,23)=(-1);
g1(6,27)=1;
g1(7,23)=1;
g1(7,25)=(-params(26));
g1(7,26)=(-params(25));
g1(7,28)=(-params(27));
g1(8,24)=1-(1-params(4));
g1(8,25)=(-params(4));
g1(9,23)=(-((params(4)+params(21)-1)/params(21)));
g1(9,24)=(params(4)+params(21)-1)/params(21);
g1(9,29)=(-((1-params(4))/params(21)));
g1(9,30)=1;
g1(10,21)=1;
g1(10,29)=1;
g1(10,30)=(-1);
g1(11,29)=(-(1/(2*params(11))));
g1(12,22)=(-1);
g1(12,26)=1;
g1(12,27)=(-1);
g1(12,31)=(-1);
g1(13,26)=1-params(8);
g1(14,1)=1;
g1(14,6)=(-(params(6)*(params(5)-1)*params(18)/(1-params(18))));
g1(14,13)=(-(((1-params(6))*(1-params(5))-1)*T(3)));
g1(15,3)=1;
g1(16,1)=1;
g1(16,2)=1;
g1(16,6)=params(18)/(1-params(18));
g1(16,13)=T(3);
g1(17,1)=1;
g1(17,2)=1;
g1(17,5)=1;
g1(18,6)=(-params(2));
g1(18,7)=1;
g1(18,8)=(-(1-params(2)));
g1(18,11)=(-params(2));
g1(19,5)=(-1);
g1(19,6)=(-1);
g1(19,7)=1;
g1(19,17)=1;
g1(20,7)=1;
g1(20,9)=(-params(24));
g1(20,12)=(-params(25));
g1(20,13)=(-params(23));
g1(21,8)=1-(1-params(4));
g1(21,9)=(-params(4));
g1(22,7)=(-((params(4)+params(19)-1)/params(19)));
g1(22,8)=(params(4)+params(19)-1)/params(19);
g1(22,14)=(-((1-params(4))/params(19)));
g1(22,15)=1;
g1(22,17)=(-((params(4)+params(19)-1)/params(19)));
g1(23,3)=1;
g1(23,14)=1;
g1(23,15)=(-1);
g1(24,14)=(-(1/(2*params(11))));
g1(25,5)=(-1);
g1(25,6)=(-1);
g1(25,10)=(-1);
g1(25,12)=1;
g1(26,16)=1-(params(3)/(1+params(3)*params(14))+params(14)/(1+params(3)*params(14)));
g1(26,17)=(-((1-params(3)*params(12))*(1-params(12))/((1+params(3)*params(14))*params(12))));
g1(26,32)=(-((1-params(3)*params(12))*(1-params(12))/((1+params(3)*params(14))*params(12))));
g1(27,7)=(-((1-params(15))*params(17)));
g1(27,16)=(-((1-params(15))*params(16)));
g1(27,18)=1-params(15);
g1(28,3)=1;
g1(28,16)=1;
g1(28,18)=(-1);
g1(29,4)=1;
g1(29,16)=1;
g1(29,18)=(-1);
g1(30,11)=1-params(7);
g1(31,12)=1-params(8);
g1(32,32)=1-params(9);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
