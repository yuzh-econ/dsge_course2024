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
    T = RBClinear_hab.static_resid_tt(T, y, x, params);
end
residual = zeros(11, 1);
lhs = y(1);
rhs = ((1-params(1))*(1-params(5))-1)*(y(9)-y(9)*params(15))/(1-params(15))+params(1)*(params(5)-1)*params(9)/(1-params(9))*y(4);
residual(1) = lhs - rhs;
lhs = y(1);
rhs = y(1)-y(3);
residual(2) = lhs - rhs;
lhs = y(2);
rhs = y(1)+y(9)+params(9)/(1-params(9))*y(4);
residual(3) = lhs - rhs;
lhs = y(5);
rhs = y(2)-y(1);
residual(4) = lhs - rhs;
lhs = y(6);
rhs = params(2)*(y(4)+y(10))+(1-params(2))*y(7);
residual(5) = lhs - rhs;
lhs = y(6)-y(7);
rhs = y(3)*params(10)/(params(10)-1+params(4));
residual(6) = lhs - rhs;
lhs = y(5);
rhs = y(6)-y(4);
residual(7) = lhs - rhs;
lhs = y(6);
rhs = y(9)*params(6)+params(7)*y(8)+params(8)*y(11);
residual(8) = lhs - rhs;
lhs = y(7);
rhs = params(4)*y(8)+y(7)*(1-params(4));
residual(9) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(12)+params(14)*x(1);
residual(10) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(13)+params(14)*x(2);
residual(11) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
