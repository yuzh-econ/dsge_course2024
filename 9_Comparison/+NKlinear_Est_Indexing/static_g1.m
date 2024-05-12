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
    T = NKlinear_Est_Indexing.static_g1_tt(T, y, x, params);
end
g1 = zeros(35, 35);
g1(1,19)=1;
g1(1,20)=(-(((1-params(7))*(1-T(3))-1)*T(6)));
g1(1,21)=(-(params(21)/(1-params(21))*T(3)*(params(7)-1)));
g1(2,22)=1;
g1(3,19)=1;
g1(3,20)=T(6);
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
g1(7,20)=(-(1-T(2)-params(1)));
g1(7,25)=1;
g1(7,27)=(-T(2));
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
g1(14,4)=(-(T(3)*(params(7)-1)*params(19)/(1-params(19))));
g1(14,11)=(-(((1-params(7))*(1-T(3))-1)*T(6)));
g1(15,3)=1;
g1(16,1)=1;
g1(16,2)=1;
g1(16,4)=params(19)/(1-params(19));
g1(16,11)=T(6);
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
g1(21,9)=(-T(1));
g1(21,11)=(-(1-T(1)-params(1)));
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
end
