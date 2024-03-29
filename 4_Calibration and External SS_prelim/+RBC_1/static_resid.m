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
    T = RBC_1.static_resid_tt(T, y, x, params);
end
residual = zeros(27, 1);
lhs = y(1);
rhs = (T(3)^(1-params(5))-1)/(1-params(5));
residual(1) = lhs - rhs;
lhs = y(2);
rhs = T(4)*T(5);
residual(2) = lhs - rhs;
lhs = y(3);
rhs = T(6)*T(7);
residual(3) = lhs - rhs;
lhs = y(4)*y(5);
rhs = 1;
residual(4) = lhs - rhs;
lhs = (-y(3))/y(2);
rhs = y(9);
residual(5) = lhs - rhs;
lhs = y(11);
rhs = T(8)*T(9);
residual(6) = lhs - rhs;
lhs = y(11)*params(2)/y(10);
rhs = y(9);
residual(7) = lhs - rhs;
lhs = y(11);
rhs = y(8)+y(15)+y(13);
residual(8) = lhs - rhs;
lhs = y(12);
rhs = y(13)+y(12)*(1-params(4));
residual(9) = lhs - rhs;
lhs = y(4);
rhs = params(3);
residual(10) = lhs - rhs;
lhs = 1;
rhs = y(17);
residual(11) = lhs - rhs;
lhs = y(7);
rhs = y(11)*(1-params(2))/y(12);
residual(12) = lhs - rhs;
lhs = y(6);
rhs = (y(7)+(1-params(4))*y(17))/y(17);
residual(13) = lhs - rhs;
lhs = y(4)*y(6);
rhs = 1;
residual(14) = lhs - rhs;
lhs = y(15);
rhs = y(16);
residual(15) = lhs - rhs;
lhs = log(y(14))-log((y(14)));
rhs = (log(y(14))-log((y(14))))*params(6)+params(8)*x(1);
residual(16) = lhs - rhs;
lhs = log(y(15))-log((y(15)));
rhs = (log(y(15))-log((y(15))))*params(7)+params(8)*x(2);
residual(17) = lhs - rhs;
lhs = y(22);
rhs = y(11)/(y(11));
residual(18) = lhs - rhs;
lhs = y(27);
rhs = y(12)/(y(12));
residual(19) = lhs - rhs;
lhs = y(26);
rhs = y(13)/(y(13));
residual(20) = lhs - rhs;
lhs = y(23);
rhs = y(8)/(y(8));
residual(21) = lhs - rhs;
lhs = y(25);
rhs = y(9)/(y(9));
residual(22) = lhs - rhs;
lhs = y(24);
rhs = y(10)/(y(10));
residual(23) = lhs - rhs;
lhs = y(21);
rhs = y(5)/(y(5));
residual(24) = lhs - rhs;
lhs = y(18);
rhs = y(12)/y(11);
residual(25) = lhs - rhs;
lhs = y(19);
rhs = y(13)/y(11);
residual(26) = lhs - rhs;
lhs = y(20);
rhs = y(8)/y(11);
residual(27) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
