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
    T = RBC_JR_0.static_resid_tt(T, y, x, params);
end
residual = zeros(31, 1);
lhs = y(1);
rhs = (T(2)^(1-params(2))-1)/(1-params(2));
residual(1) = lhs - rhs;
lhs = y(11);
rhs = T(3)*T(4);
residual(2) = lhs - rhs;
lhs = y(2);
rhs = T(2)^(-params(2));
residual(3) = lhs - rhs;
lhs = y(3);
rhs = y(2)*T(6);
residual(4) = lhs - rhs;
lhs = y(4);
rhs = y(2)*T(1)*(-params(3));
residual(5) = lhs - rhs;
lhs = y(5);
rhs = y(5)*params(6)*y(8);
residual(6) = lhs - rhs;
lhs = y(5);
rhs = y(2)-y(11)*params(4)*y(6)/y(10);
residual(7) = lhs - rhs;
lhs = y(6);
rhs = y(6)*(1-params(4))*params(6)-y(4);
residual(8) = lhs - rhs;
lhs = (-y(3))/y(5);
rhs = y(12);
residual(9) = lhs - rhs;
lhs = y(14);
rhs = T(7)*T(8);
residual(10) = lhs - rhs;
lhs = y(14)*params(5)/y(13);
rhs = y(12);
residual(11) = lhs - rhs;
lhs = y(14);
rhs = y(10)+y(18)+y(16);
residual(12) = lhs - rhs;
lhs = y(15);
rhs = y(16)*T(9)+y(15)*(1-params(7));
residual(13) = lhs - rhs;
lhs = y(20);
rhs = 1;
residual(14) = lhs - rhs;
lhs = y(7);
rhs = params(6);
residual(15) = lhs - rhs;
lhs = y(21)*(T(9)-(y(20)-1)*params(11)*2*y(20))+y(7)*T(11);
rhs = 1;
residual(16) = lhs - rhs;
lhs = y(9);
rhs = (y(14)*(1-params(5))/y(15)+(1-params(7))*y(21))/y(21);
residual(17) = lhs - rhs;
lhs = y(7)*y(9);
rhs = y(8)*y(7);
residual(18) = lhs - rhs;
lhs = y(18);
rhs = y(13)*y(12)*y(19);
residual(19) = lhs - rhs;
lhs = log(y(17))-log((y(17)));
rhs = (log(y(17))-log((y(17))))*params(8)+params(10)*x(1);
residual(20) = lhs - rhs;
lhs = log(y(18))-log((y(18)));
rhs = (log(y(18))-log((y(18))))*params(9)+params(10)*x(2);
residual(21) = lhs - rhs;
lhs = y(26);
rhs = y(14)/(y(14));
residual(22) = lhs - rhs;
lhs = y(31);
rhs = y(15)/(y(15));
residual(23) = lhs - rhs;
lhs = y(30);
rhs = y(16)/(y(16));
residual(24) = lhs - rhs;
lhs = y(27);
rhs = y(10)/(y(10));
residual(25) = lhs - rhs;
lhs = y(29);
rhs = y(12)/(y(12));
residual(26) = lhs - rhs;
lhs = y(28);
rhs = y(13)/(y(13));
residual(27) = lhs - rhs;
lhs = y(25);
rhs = y(8)/(y(8));
residual(28) = lhs - rhs;
lhs = y(22);
rhs = y(15)/y(14);
residual(29) = lhs - rhs;
lhs = y(23);
rhs = y(16)/y(14);
residual(30) = lhs - rhs;
lhs = y(24);
rhs = y(10)/y(14);
residual(31) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
