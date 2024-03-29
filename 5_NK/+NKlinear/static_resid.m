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
    T = NKlinear.static_resid_tt(T, y, x, params);
end
residual = zeros(32, 1);
lhs = y(19);
rhs = ((1-params(6))*(1-params(5))-1)*T(1)+params(6)*(params(5)-1)*params(20)/(1-params(20))*y(22);
residual(1) = lhs - rhs;
lhs = y(19);
rhs = y(19)-y(21);
residual(2) = lhs - rhs;
lhs = y(20);
rhs = (-y(19))-T(1)-params(20)/(1-params(20))*y(22);
residual(3) = lhs - rhs;
lhs = y(27);
rhs = (-y(20))-y(19);
residual(4) = lhs - rhs;
lhs = y(23);
rhs = params(2)*(y(22)+y(11))+(1-params(2))*y(24);
residual(5) = lhs - rhs;
lhs = y(27);
rhs = y(23)-y(22);
residual(6) = lhs - rhs;
lhs = y(23);
rhs = y(28)*params(27)+params(26)*y(25)+params(25)*y(26);
residual(7) = lhs - rhs;
lhs = y(24);
rhs = y(25)*params(4)+y(24)*(1-params(4));
residual(8) = lhs - rhs;
lhs = y(30);
rhs = (params(4)+params(21)-1)/params(21)*(y(23)-y(24))+(1-params(4))/params(21)*y(29);
residual(9) = lhs - rhs;
lhs = y(21);
rhs = y(30)-y(29);
residual(10) = lhs - rhs;
lhs = y(25)*(1+1/params(21));
rhs = y(25)+y(25)*1/params(21)+y(29)*1/(2*params(11));
residual(11) = lhs - rhs;
lhs = y(26);
rhs = y(22)+y(27)+y(31);
residual(12) = lhs - rhs;
lhs = y(26);
rhs = y(26)*params(8)+x(2);
residual(13) = lhs - rhs;
lhs = y(1);
rhs = ((1-params(6))*(1-params(5))-1)*T(2)+params(6)*(params(5)-1)*params(18)/(1-params(18))*y(6);
residual(14) = lhs - rhs;
lhs = y(1);
rhs = y(1)-y(3);
residual(15) = lhs - rhs;
lhs = y(2);
rhs = (-y(1))-T(2)-params(18)/(1-params(18))*y(6);
residual(16) = lhs - rhs;
lhs = y(5);
rhs = (-y(2))-y(1);
residual(17) = lhs - rhs;
lhs = y(7);
rhs = params(2)*(y(11)+y(6))+(1-params(2))*y(8);
residual(18) = lhs - rhs;
lhs = y(17);
rhs = y(6)+y(5)-y(7);
residual(19) = lhs - rhs;
lhs = y(7);
rhs = y(13)*params(23)+params(24)*y(9)+params(25)*y(12);
residual(20) = lhs - rhs;
lhs = y(8);
rhs = params(4)*y(9)+(1-params(4))*y(8);
residual(21) = lhs - rhs;
lhs = y(15);
rhs = (params(4)+params(19)-1)/params(19)*(y(7)+y(17)-y(8))+(1-params(4))/params(19)*y(14);
residual(22) = lhs - rhs;
lhs = y(3);
rhs = y(15)-y(14);
residual(23) = lhs - rhs;
lhs = y(9)*(1+1/params(19));
rhs = y(9)+y(9)*1/params(19)+1/(2*params(11))*y(14);
residual(24) = lhs - rhs;
lhs = y(12);
rhs = y(6)+y(5)+y(10);
residual(25) = lhs - rhs;
lhs = y(16);
rhs = y(16)*params(3)/(1+params(3)*params(14))+y(16)*params(14)/(1+params(3)*params(14))+(1-params(3)*params(12))*(1-params(12))/((1+params(3)*params(14))*params(12))*(y(17)+y(32));
residual(26) = lhs - rhs;
lhs = y(18);
rhs = y(18)*params(15)+y(16)*(1-params(15))*params(16)+y(7)*(1-params(15))*params(17)+x(4);
residual(27) = lhs - rhs;
lhs = y(3);
rhs = y(18)-y(16);
residual(28) = lhs - rhs;
lhs = y(4);
rhs = y(18)-y(16);
residual(29) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(7)+x(1);
residual(30) = lhs - rhs;
lhs = y(12);
rhs = x(2)+params(8)*y(12);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(32)*params(9)+x(3);
residual(32) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
