function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = NK_moreShocks.static_resid_tt(T, y, x, params);
end
residual = zeros(72, 1);
lhs = y(72);
rhs = (y(72));
residual(1) = lhs - rhs;
lhs = y(1);
rhs = T(4)*y(59);
residual(2) = lhs - rhs;
lhs = y(2);
rhs = T(6)*T(7);
residual(3) = lhs - rhs;
lhs = y(3);
rhs = T(9)*T(10);
residual(4) = lhs - rhs;
lhs = y(4);
rhs = params(4);
residual(5) = lhs - rhs;
lhs = y(4)*y(5);
rhs = 1;
residual(6) = lhs - rhs;
lhs = y(5);
rhs = y(24)/y(26);
residual(7) = lhs - rhs;
lhs = y(25);
rhs = y(24)/y(26);
residual(8) = lhs - rhs;
lhs = (-y(3))/y(2);
rhs = y(8);
residual(9) = lhs - rhs;
lhs = y(33);
rhs = y(33)*params(11)*T(11)+(1-params(11))*T(12)^(-params(2));
residual(10) = lhs - rhs;
lhs = y(10);
rhs = T(13)*T(14)/y(33);
residual(11) = lhs - rhs;
lhs = y(6);
rhs = (y(33)*y(10)*(1-params(3))*y(11)/y(12)+(1-params(5))*y(22))/y(22);
residual(12) = lhs - rhs;
lhs = y(22)*(1-y(20)-y(23)*y(21))+y(21)*y(4)*y(22)*T(15);
rhs = 1;
residual(13) = lhs - rhs;
lhs = y(4)*y(6);
rhs = 1;
residual(14) = lhs - rhs;
lhs = y(11)*y(33)*y(10)*params(3)/y(9);
rhs = y(8);
residual(15) = lhs - rhs;
lhs = y(10);
rhs = y(7)+y(16)+y(13);
residual(16) = lhs - rhs;
lhs = y(12);
rhs = (1-y(20))*y(13)*y(58)+y(12)*(1-params(5));
residual(17) = lhs - rhs;
lhs = y(23);
rhs = 1;
residual(18) = lhs - rhs;
lhs = y(20);
rhs = params(10)*(y(23)-1)^2;
residual(19) = lhs - rhs;
lhs = y(21);
rhs = (y(23)-1)*2*params(10);
residual(20) = lhs - rhs;
lhs = y(16);
rhs = y(14);
residual(21) = lhs - rhs;
lhs = y(28)-params(4)*params(11)*y(29);
rhs = y(2)*y(10);
residual(22) = lhs - rhs;
lhs = y(30)-params(4)*params(11)*y(31);
rhs = y(2)*T(17)*y(27)*y(34);
residual(23) = lhs - rhs;
lhs = y(29);
rhs = y(28)*T(18);
residual(24) = lhs - rhs;
lhs = y(31);
rhs = T(11)*y(30);
residual(25) = lhs - rhs;
lhs = 1;
rhs = params(11)*T(18)+(1-params(11))*T(12)^(1-params(2));
residual(26) = lhs - rhs;
lhs = y(32);
rhs = y(26)/T(19);
residual(27) = lhs - rhs;
lhs = log(y(24)/(y(24)));
rhs = log(y(24)/(y(24)))*params(12)+(1-params(12))*params(13)*log(y(26)/(y(26)))+(1-params(12))*params(14)*log(y(10)/(y(10)))+params(24)*x(4);
residual(28) = lhs - rhs;
lhs = y(27);
rhs = y(11);
residual(29) = lhs - rhs;
lhs = log(y(15))-log((y(15)));
rhs = (log(y(15))-log((y(15))))*params(7)+params(21)*x(1);
residual(30) = lhs - rhs;
lhs = log(y(16))-log((y(16)));
rhs = (log(y(16))-log((y(16))))*params(8)+params(22)*x(2);
residual(31) = lhs - rhs;
lhs = log(y(39))-log((y(39)));
rhs = params(22)*x(2)+params(8)*(log(y(39))-log((y(39))));
residual(32) = lhs - rhs;
lhs = log(y(34))-log((y(34)));
rhs = (log(y(34))-log((y(34))))*params(15)+params(23)*x(3);
residual(33) = lhs - rhs;
lhs = log(y(59))-log((y(59)));
rhs = (log(y(59))-log((y(59))))*params(19)+params(25)*x(6);
residual(34) = lhs - rhs;
lhs = log(y(58))-log((y(58)));
rhs = (log(y(58))-log((y(58))))*params(20)+params(26)*x(5);
residual(35) = lhs - rhs;
lhs = y(63);
rhs = y(10)/(y(10));
residual(36) = lhs - rhs;
lhs = y(68);
rhs = y(12)/(y(12));
residual(37) = lhs - rhs;
lhs = y(67);
rhs = y(13)/(y(13));
residual(38) = lhs - rhs;
lhs = y(64);
rhs = y(7)/(y(7));
residual(39) = lhs - rhs;
lhs = y(66);
rhs = y(8)/(y(8));
residual(40) = lhs - rhs;
lhs = y(65);
rhs = y(9)/(y(9));
residual(41) = lhs - rhs;
lhs = y(69);
rhs = y(22)/(y(22));
residual(42) = lhs - rhs;
lhs = y(60);
rhs = y(5)/(y(5));
residual(43) = lhs - rhs;
lhs = y(62);
rhs = y(25)/(y(25));
residual(44) = lhs - rhs;
lhs = y(61);
rhs = y(24)/(y(24));
residual(45) = lhs - rhs;
lhs = y(70);
rhs = y(26)/(y(26));
residual(46) = lhs - rhs;
lhs = y(71);
rhs = y(57)/(y(57));
residual(47) = lhs - rhs;
lhs = y(17);
rhs = y(12)/y(10);
residual(48) = lhs - rhs;
lhs = y(18);
rhs = y(13)/y(10);
residual(49) = lhs - rhs;
lhs = y(19);
rhs = y(7)/y(10);
residual(50) = lhs - rhs;
lhs = y(35);
rhs = (T(22)^(1-params(6))-1)/(1-params(6));
residual(51) = lhs - rhs;
lhs = y(36);
rhs = T(24)*T(25);
residual(52) = lhs - rhs;
lhs = y(37);
rhs = T(27)*T(28);
residual(53) = lhs - rhs;
lhs = y(51);
rhs = params(4);
residual(54) = lhs - rhs;
lhs = y(51)*y(38);
rhs = 1;
residual(55) = lhs - rhs;
lhs = (-y(37))/y(36);
rhs = y(45);
residual(56) = lhs - rhs;
lhs = y(42);
rhs = T(29)*T(30);
residual(57) = lhs - rhs;
lhs = y(52);
rhs = (y(42)*(1-params(3))*y(40)/y(43)+(1-params(5))*y(55))/y(55);
residual(58) = lhs - rhs;
lhs = y(55)*(1-y(53)-y(56)*y(54))+y(54)*y(51)*y(55)*T(31);
rhs = 1;
residual(59) = lhs - rhs;
lhs = y(51)*y(52);
rhs = 1;
residual(60) = lhs - rhs;
lhs = y(40)*params(3)*y(42)/y(41);
rhs = y(45);
residual(61) = lhs - rhs;
lhs = y(42);
rhs = y(39)+y(46)+y(44);
residual(62) = lhs - rhs;
lhs = y(43);
rhs = (1-y(53))*y(44)+(1-params(5))*y(43);
residual(63) = lhs - rhs;
lhs = y(56);
rhs = 1;
residual(64) = lhs - rhs;
lhs = y(53);
rhs = params(10)*(y(56)-1)^2;
residual(65) = lhs - rhs;
lhs = y(54);
rhs = 2*params(10)*(y(56)-1);
residual(66) = lhs - rhs;
lhs = y(50);
rhs = y(39);
residual(67) = lhs - rhs;
lhs = y(40);
rhs = 1-1/params(2);
residual(68) = lhs - rhs;
lhs = y(57);
rhs = y(42)/y(10);
residual(69) = lhs - rhs;
lhs = y(47);
rhs = y(43)/y(42);
residual(70) = lhs - rhs;
lhs = y(48);
rhs = y(44)/y(42);
residual(71) = lhs - rhs;
lhs = y(49);
rhs = y(46)/y(42);
residual(72) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
