function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = RBClinear_hab.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(11, 1);
lhs = y(5);
rhs = ((1-params(1))*(1-params(5))-1)*(y(13)-params(15)*y(2))/(1-params(15))+params(1)*(params(5)-1)*params(9)/(1-params(9))*y(8);
residual(1) = lhs - rhs;
lhs = y(16);
rhs = y(5)-y(7);
residual(2) = lhs - rhs;
lhs = y(6);
rhs = y(5)+y(13)+params(9)/(1-params(9))*y(8);
residual(3) = lhs - rhs;
lhs = y(9);
rhs = y(6)-y(5);
residual(4) = lhs - rhs;
lhs = y(10);
rhs = params(2)*(y(8)+y(14))+(1-params(2))*y(1);
residual(5) = lhs - rhs;
lhs = y(17)-y(11);
rhs = y(7)*params(10)/(params(10)-1+params(4));
residual(6) = lhs - rhs;
lhs = y(9);
rhs = y(10)-y(8);
residual(7) = lhs - rhs;
lhs = y(10);
rhs = y(13)*params(6)+params(7)*y(12)+params(8)*y(15);
residual(8) = lhs - rhs;
lhs = y(11);
rhs = params(4)*y(12)+y(1)*(1-params(4));
residual(9) = lhs - rhs;
lhs = y(14);
rhs = params(12)*y(3)+params(14)*x(it_, 1);
residual(10) = lhs - rhs;
lhs = y(15);
rhs = params(13)*y(4)+params(14)*x(it_, 2);
residual(11) = lhs - rhs;

end
