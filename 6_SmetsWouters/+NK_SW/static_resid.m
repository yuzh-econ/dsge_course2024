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
    T = NK_SW.static_resid_tt(T, y, x, params);
end
residual = zeros(43, 1);
lhs = y(1);
rhs = y(2)+y(1)*T(4);
residual(1) = lhs - rhs;
lhs = y(2);
rhs = T(5)*T(7);
residual(2) = lhs - rhs;
lhs = y(5);
rhs = (1-y(6))*y(8)*y(9)+(1-params(3))*y(5)/T(1);
residual(3) = lhs - rhs;
lhs = y(7);
rhs = T(1);
residual(4) = lhs - rhs;
lhs = y(6);
rhs = params(11)*(y(7)-1-params(7)/100)^2;
residual(5) = lhs - rhs;
lhs = y(10);
rhs = (y(7)-1-params(7)/100)*2*params(11);
residual(6) = lhs - rhs;
lhs = y(11);
rhs = y(2)*(1-params(9))/T(6);
residual(7) = lhs - rhs;
lhs = y(12);
rhs = T(6)*T(8)/(1-T(2)*params(8)*params(10));
residual(8) = lhs - rhs;
lhs = y(13);
rhs = y(14);
residual(9) = lhs - rhs;
lhs = 1;
rhs = y(15)*y(17)*y(16);
residual(10) = lhs - rhs;
lhs = y(18);
rhs = y(16)*(y(13)*y(19)-y(20)+(1-params(3))*y(18));
residual(11) = lhs - rhs;
lhs = 1;
rhs = y(9)*y(18)*(1-y(6)-y(7)*y(10))+y(9)*T(10);
residual(12) = lhs - rhs;
lhs = y(16);
rhs = params(8)*T(2);
residual(13) = lhs - rhs;
lhs = y(17);
rhs = y(21)/y(22);
residual(14) = lhs - rhs;
lhs = y(20);
rhs = T(3)*(y(19)-1)+(y(19)-1)^2*T(11);
residual(15) = lhs - rhs;
lhs = y(14);
rhs = T(3)+(y(19)-1)*T(3)*params(17)/(1-params(17));
residual(16) = lhs - rhs;
lhs = y(23);
rhs = T(1)*y(22);
residual(17) = lhs - rhs;
lhs = y(25);
rhs = y(12)*T(12)*y(26)*y(27)+y(25)*T(15)*y(16)*T(1)*params(13);
residual(18) = lhs - rhs;
lhs = y(28);
rhs = y(26)+y(28)*y(16)*params(13)*T(17);
residual(19) = lhs - rhs;
lhs = y(29);
rhs = y(25)/(y(24)*y(28));
residual(20) = lhs - rhs;
lhs = 1;
rhs = params(13)*T(19)^(1-params(5))+(1-params(13))*y(29)^(1-params(5));
residual(21) = lhs - rhs;
lhs = y(30);
rhs = y(30)*T(15)*params(13)+(1-params(13))*y(29)^(-params(5));
residual(22) = lhs - rhs;
lhs = y(31);
rhs = T(20)*T(22)-params(18)*(y(31));
residual(23) = lhs - rhs;
lhs = y(24);
rhs = params(2)*y(33)*(y(31)+params(18)*(y(31)))/y(26);
residual(24) = lhs - rhs;
lhs = y(13);
rhs = (y(31)+params(18)*(y(31)))*(1-params(2))*y(33)/T(21);
residual(25) = lhs - rhs;
lhs = y(34);
rhs = y(33);
residual(26) = lhs - rhs;
lhs = y(35);
rhs = y(34)*T(24)*y(37)+y(35)*T(27)*y(16)*T(1)*params(12);
residual(27) = lhs - rhs;
lhs = y(38);
rhs = y(36)+y(38)*y(16)*T(1)*params(12)*T(30);
residual(28) = lhs - rhs;
lhs = y(39);
rhs = y(35)/y(38);
residual(29) = lhs - rhs;
lhs = 1;
rhs = params(12)*(T(31)/y(22))^(1-params(4))+(1-params(12))*y(39)^(1-params(4));
residual(30) = lhs - rhs;
lhs = y(40);
rhs = y(40)*T(27)*params(12)+(1-params(12))*y(39)^(-params(4));
residual(31) = lhs - rhs;
lhs = log(y(21)/(y(21)));
rhs = log(y(21)/(y(21)))*params(19)+(1-params(19))*(params(20)*log(y(22)/(y(22)))+params(21)*log(y(36)/(y(36))))+log(y(41));
residual(32) = lhs - rhs;
lhs = y(36);
rhs = y(8)+y(3)+y(42)+y(5)*y(20)/T(1);
residual(33) = lhs - rhs;
lhs = y(4);
rhs = y(26)*y(30);
residual(34) = lhs - rhs;
lhs = y(31);
rhs = y(36)*y(40);
residual(35) = lhs - rhs;
lhs = y(43);
rhs = (y(13)*y(19)-y(20)+(1-params(3))*y(18))/y(18);
residual(36) = lhs - rhs;
lhs = log(y(32))-log((y(32)));
rhs = (log(y(32))-log((y(32))))*params(23)+x(1);
residual(37) = lhs - rhs;
lhs = log(y(42))-log((y(42)));
rhs = (log(y(42))-log((y(42))))*params(24)+x(2);
residual(38) = lhs - rhs;
lhs = log(y(37))-log((y(37)));
rhs = (log(y(37))-log((y(37))))*params(25)+x(3);
residual(39) = lhs - rhs;
lhs = log(y(27))-log((y(27)));
rhs = (log(y(27))-log((y(27))))*params(26)+x(6);
residual(40) = lhs - rhs;
lhs = log(y(9))-log((y(9)));
rhs = (log(y(9))-log((y(9))))*params(29)+x(5);
residual(41) = lhs - rhs;
lhs = log(y(41))-log((y(41)));
rhs = (log(y(41))-log((y(41))))*params(27)+x(4);
residual(42) = lhs - rhs;
lhs = log(y(15))-log((y(15)));
rhs = (log(y(15))-log((y(15))))*params(28)+x(7);
residual(43) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
