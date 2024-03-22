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
    T = RBC_basic.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(26, 1);
lhs = y(4);
rhs = (T(3)^(1-params(5))-1)/(1-params(5));
residual(1) = lhs - rhs;
lhs = y(5);
rhs = T(4)*T(5);
residual(2) = lhs - rhs;
lhs = y(6);
rhs = T(6)*T(7);
residual(3) = lhs - rhs;
lhs = y(7);
rhs = params(3)*y(30)/y(5);
residual(4) = lhs - rhs;
lhs = y(5);
rhs = y(30)*params(3)*y(8);
residual(5) = lhs - rhs;
lhs = y(7)*y(9);
rhs = 1;
residual(6) = lhs - rhs;
lhs = (-y(6))/y(5);
rhs = y(11);
residual(7) = lhs - rhs;
lhs = y(13);
rhs = T(8)*T(9);
residual(8) = lhs - rhs;
lhs = y(13)*params(2)/y(12);
rhs = y(11);
residual(9) = lhs - rhs;
lhs = y(9);
rhs = 1+(1-params(2))*y(31)/y(14)-params(4);
residual(10) = lhs - rhs;
lhs = y(13);
rhs = y(10)+y(17)+y(15);
residual(11) = lhs - rhs;
lhs = y(14);
rhs = y(15)+y(1)*(1-params(4));
residual(12) = lhs - rhs;
lhs = log(y(16))-log((steady_state(13)));
rhs = params(12)*(log(y(2))-log((steady_state(13))))+params(14)*x(it_, 1);
residual(13) = lhs - rhs;
lhs = log(y(17))-log((steady_state(14)));
rhs = params(13)*(log(y(3))-log((steady_state(14))))+params(14)*x(it_, 2);
residual(14) = lhs - rhs;
lhs = y(21);
rhs = log(y(13)/(steady_state(10)));
residual(15) = lhs - rhs;
lhs = y(26);
rhs = log(y(14)/(steady_state(11)));
residual(16) = lhs - rhs;
lhs = y(25);
rhs = log(y(15)/(steady_state(12)));
residual(17) = lhs - rhs;
lhs = y(22);
rhs = log(y(10)/(steady_state(7)));
residual(18) = lhs - rhs;
lhs = y(24);
rhs = log(y(11)/(steady_state(8)));
residual(19) = lhs - rhs;
lhs = y(23);
rhs = log(y(12)/(steady_state(9)));
residual(20) = lhs - rhs;
lhs = y(27);
rhs = log(y(8)/(steady_state(5)));
residual(21) = lhs - rhs;
lhs = y(28);
rhs = log(y(16)/(steady_state(13)));
residual(22) = lhs - rhs;
lhs = y(29);
rhs = log(y(17)/(steady_state(14)));
residual(23) = lhs - rhs;
lhs = y(18);
rhs = y(14)/y(13);
residual(24) = lhs - rhs;
lhs = y(19);
rhs = y(15)/y(13);
residual(25) = lhs - rhs;
lhs = y(20);
rhs = y(10)/y(13);
residual(26) = lhs - rhs;

end
