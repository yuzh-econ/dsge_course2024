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
    T = RBC_1.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(27, 1);
lhs = y(5);
rhs = (T(3)^(1-params(5))-1)/(1-params(5));
residual(1) = lhs - rhs;
lhs = y(6);
rhs = T(4)*T(5);
residual(2) = lhs - rhs;
lhs = y(7);
rhs = T(6)*T(7);
residual(3) = lhs - rhs;
lhs = y(8)*y(9);
rhs = 1;
residual(4) = lhs - rhs;
lhs = (-y(7))/y(6);
rhs = y(13);
residual(5) = lhs - rhs;
lhs = y(15);
rhs = T(8)*T(9);
residual(6) = lhs - rhs;
lhs = y(15)*params(2)/y(14);
rhs = y(13);
residual(7) = lhs - rhs;
lhs = y(15);
rhs = y(12)+y(19)+y(17);
residual(8) = lhs - rhs;
lhs = y(16);
rhs = y(17)*T(11)+y(1)*(1-params(4));
residual(9) = lhs - rhs;
lhs = y(8);
rhs = params(3)*y(32)/y(6);
residual(10) = lhs - rhs;
lhs = 1;
rhs = y(21)*(T(11)-T(10)*T(12))+T(14)*T(15);
residual(11) = lhs - rhs;
lhs = y(11);
rhs = y(15)*(1-params(2))/y(1);
residual(12) = lhs - rhs;
lhs = y(10);
rhs = (y(33)+(1-params(4))*y(35))/y(21);
residual(13) = lhs - rhs;
lhs = y(8)*y(10);
rhs = 1;
residual(14) = lhs - rhs;
lhs = y(19);
rhs = y(20);
residual(15) = lhs - rhs;
lhs = log(y(18))-log((steady_state(14)));
rhs = params(6)*(log(y(3))-log((steady_state(14))))+params(8)*x(it_, 1);
residual(16) = lhs - rhs;
lhs = log(y(19))-log((steady_state(15)));
rhs = params(7)*(log(y(4))-log((steady_state(15))))+params(8)*x(it_, 2);
residual(17) = lhs - rhs;
lhs = y(26);
rhs = y(15)/(steady_state(11));
residual(18) = lhs - rhs;
lhs = y(31);
rhs = y(16)/(steady_state(12));
residual(19) = lhs - rhs;
lhs = y(30);
rhs = y(17)/(steady_state(13));
residual(20) = lhs - rhs;
lhs = y(27);
rhs = y(12)/(steady_state(8));
residual(21) = lhs - rhs;
lhs = y(29);
rhs = y(13)/(steady_state(9));
residual(22) = lhs - rhs;
lhs = y(28);
rhs = y(14)/(steady_state(10));
residual(23) = lhs - rhs;
lhs = y(25);
rhs = y(9)/(steady_state(5));
residual(24) = lhs - rhs;
lhs = y(22);
rhs = y(16)/y(15);
residual(25) = lhs - rhs;
lhs = y(23);
rhs = y(17)/y(15);
residual(26) = lhs - rhs;
lhs = y(24);
rhs = y(12)/y(15);
residual(27) = lhs - rhs;

end
