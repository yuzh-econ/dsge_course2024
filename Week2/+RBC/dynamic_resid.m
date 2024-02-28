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
    T = RBC.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(28, 1);
lhs = y(7);
rhs = (T(3)^(1-params(5))-1)/(1-params(5));
residual(1) = lhs - rhs;
lhs = y(8);
rhs = T(4)*T(5);
residual(2) = lhs - rhs;
lhs = y(9);
rhs = T(6)*T(7);
residual(3) = lhs - rhs;
lhs = y(8);
rhs = params(3)*y(11)*y(35);
residual(4) = lhs - rhs;
lhs = (-y(9))/y(8);
rhs = y(14);
residual(5) = lhs - rhs;
lhs = y(16);
rhs = T(8)*T(9);
residual(6) = lhs - rhs;
lhs = y(16)*params(2)/y(15);
rhs = y(14);
residual(7) = lhs - rhs;
lhs = y(16);
rhs = y(13)+y(20)+y(18);
residual(8) = lhs - rhs;
lhs = y(17);
rhs = y(18)*T(10)+y(2)*(1-params(4));
residual(9) = lhs - rhs;
lhs = y(22);
rhs = y(18)/y(3);
residual(10) = lhs - rhs;
lhs = y(10);
rhs = y(8)*params(3)/y(1);
residual(11) = lhs - rhs;
lhs = y(24);
rhs = y(10)*T(12);
residual(12) = lhs - rhs;
lhs = y(23)*(T(10)-(y(22)-1)*params(9)*2*y(22))+y(38);
rhs = 1;
residual(13) = lhs - rhs;
lhs = y(12);
rhs = (y(16)*(1-params(2))/y(2)+(1-params(4))*y(23))/y(6);
residual(14) = lhs - rhs;
lhs = y(36)*y(37);
rhs = y(11)*y(36);
residual(15) = lhs - rhs;
lhs = y(20);
rhs = y(15)*y(14)*y(21);
residual(16) = lhs - rhs;
lhs = log(y(19))-log((steady_state(13)));
rhs = params(6)*(log(y(4))-log((steady_state(13))))+params(8)*x(it_, 1);
residual(17) = lhs - rhs;
lhs = log(y(20))-log((steady_state(14)));
rhs = params(7)*(log(y(5))-log((steady_state(14))))+params(8)*x(it_, 2);
residual(18) = lhs - rhs;
lhs = y(29);
rhs = y(16)/(steady_state(10));
residual(19) = lhs - rhs;
lhs = y(34);
rhs = y(17)/(steady_state(11));
residual(20) = lhs - rhs;
lhs = y(33);
rhs = y(18)/(steady_state(12));
residual(21) = lhs - rhs;
lhs = y(30);
rhs = y(13)/(steady_state(7));
residual(22) = lhs - rhs;
lhs = y(32);
rhs = y(14)/(steady_state(8));
residual(23) = lhs - rhs;
lhs = y(31);
rhs = y(15)/(steady_state(9));
residual(24) = lhs - rhs;
lhs = y(28);
rhs = y(11)/(steady_state(5));
residual(25) = lhs - rhs;
lhs = y(25);
rhs = y(17)/y(16);
residual(26) = lhs - rhs;
lhs = y(26);
rhs = y(18)/y(16);
residual(27) = lhs - rhs;
lhs = y(27);
rhs = y(13)/y(16);
residual(28) = lhs - rhs;

end
