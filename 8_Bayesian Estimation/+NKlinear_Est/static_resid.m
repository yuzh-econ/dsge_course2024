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
    T = NKlinear_Est.static_resid_tt(T, y, x, params);
end
residual = zeros(35, 1);
lhs = y(19);
rhs = T(4)*((1-params(7))*(1-T(3))-1)+y(21)*params(21)/(1-params(21))*T(3)*(params(7)-1);
residual(1) = lhs - rhs;
lhs = y(19);
rhs = y(19)-y(22);
residual(2) = lhs - rhs;
lhs = y(23);
rhs = (-y(19))-T(4)-y(21)*params(21)/(1-params(21));
residual(3) = lhs - rhs;
lhs = y(24);
rhs = (-y(23))-y(19);
residual(4) = lhs - rhs;
lhs = y(25);
rhs = params(2)*(y(21)+y(12))+(1-params(2))*y(26);
residual(5) = lhs - rhs;
lhs = y(24);
rhs = y(25)-y(21);
residual(6) = lhs - rhs;
lhs = y(25);
rhs = params(1)*y(28)+T(2)*y(27)+(1-T(2)-params(1))*y(20);
residual(7) = lhs - rhs;
lhs = y(26);
rhs = params(6)*y(27)+y(26)*(1-params(6));
residual(8) = lhs - rhs;
lhs = y(29);
rhs = (params(6)+params(22)-1)/params(22)*(y(25)-y(26))+(1-params(6))/params(22)*y(30);
residual(9) = lhs - rhs;
lhs = y(22);
rhs = y(29)-y(30);
residual(10) = lhs - rhs;
lhs = y(27)*(1+1/params(22));
rhs = y(27)+y(27)*1/params(22)+y(30)*1/(2*params(12));
residual(11) = lhs - rhs;
lhs = y(28);
rhs = y(21)+y(24)+y(31);
residual(12) = lhs - rhs;
lhs = y(28);
rhs = y(28)*params(9)+x(2);
residual(13) = lhs - rhs;
lhs = y(1);
rhs = ((1-params(7))*(1-T(3))-1)*T(5)+y(4)*T(3)*(params(7)-1)*params(19)/(1-params(19));
residual(14) = lhs - rhs;
lhs = y(1);
rhs = y(1)-y(3);
residual(15) = lhs - rhs;
lhs = y(2);
rhs = (-y(1))-T(5)-y(4)*params(19)/(1-params(19));
residual(16) = lhs - rhs;
lhs = y(5);
rhs = (-y(2))-y(1);
residual(17) = lhs - rhs;
lhs = y(7);
rhs = y(6);
residual(18) = lhs - rhs;
lhs = y(6);
rhs = params(2)*(y(12)+y(4))+(1-params(2))*y(8);
residual(19) = lhs - rhs;
lhs = y(17);
rhs = y(4)+y(5)-y(6);
residual(20) = lhs - rhs;
lhs = y(7);
rhs = params(1)*y(13)+T(1)*y(9)+(1-T(1)-params(1))*y(11);
residual(21) = lhs - rhs;
lhs = y(8);
rhs = params(6)*y(9)+(1-params(6))*y(8);
residual(22) = lhs - rhs;
lhs = y(14);
rhs = (params(6)+params(20)-1)/params(20)*(y(6)+y(17)-y(8))+(1-params(6))/params(20)*y(15);
residual(23) = lhs - rhs;
lhs = y(3);
rhs = y(14)-y(15);
residual(24) = lhs - rhs;
lhs = y(9)*(1+1/params(20));
rhs = y(9)+y(9)*1/params(20)+1/(2*params(12))*y(15);
residual(25) = lhs - rhs;
lhs = y(13);
rhs = y(4)+y(5)+y(10);
residual(26) = lhs - rhs;
lhs = y(16);
rhs = y(16)*params(5)/(1+params(5)*params(15))+y(16)*params(15)/(1+params(5)*params(15))+(1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))*(y(17)+y(32));
residual(27) = lhs - rhs;
lhs = y(18);
rhs = y(18)*params(16)+y(16)*(1-params(16))*params(17)+y(7)*(1-params(16))*params(18)+x(3);
residual(28) = lhs - rhs;
lhs = y(3);
rhs = y(18)-y(16);
residual(29) = lhs - rhs;
lhs = y(12);
rhs = y(12)*params(8)+x(1);
residual(30) = lhs - rhs;
lhs = y(13);
rhs = x(2)+params(9)*y(13);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(32)*params(10)+x(4);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = params(24);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = y(16)+params(25);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(18)+params(26);
residual(35) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
