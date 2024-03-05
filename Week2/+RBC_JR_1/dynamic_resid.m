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
    T = RBC_JR_1.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(31, 1);
lhs = y(8);
rhs = (T(2)^(1-params(2))-1)/(1-params(2));
residual(1) = lhs - rhs;
lhs = y(18);
rhs = T(3)*T(4);
residual(2) = lhs - rhs;
lhs = y(9);
rhs = T(2)^(-params(2));
residual(3) = lhs - rhs;
lhs = y(10);
rhs = y(9)*T(6);
residual(4) = lhs - rhs;
lhs = y(11);
rhs = y(9)*T(1)*(-params(3));
residual(5) = lhs - rhs;
lhs = y(12);
rhs = params(6)*y(15)*y(39);
residual(6) = lhs - rhs;
lhs = y(12);
rhs = y(9)-y(18)*params(4)*y(13)/y(17);
residual(7) = lhs - rhs;
lhs = y(13);
rhs = (1-params(4))*params(6)*y(40)*y(43)/y(18)-y(11);
residual(8) = lhs - rhs;
lhs = (-y(10))/y(12);
rhs = y(19);
residual(9) = lhs - rhs;
lhs = y(21);
rhs = T(7)*T(8);
residual(10) = lhs - rhs;
lhs = y(21)*params(5)/y(20);
rhs = y(19);
residual(11) = lhs - rhs;
lhs = y(21);
rhs = y(17)+y(25)+y(23);
residual(12) = lhs - rhs;
lhs = y(22);
rhs = y(23)*T(9)+y(3)*(1-params(7));
residual(13) = lhs - rhs;
lhs = y(27);
rhs = y(23)/y(4);
residual(14) = lhs - rhs;
lhs = y(14);
rhs = y(9)*params(6)/y(1);
residual(15) = lhs - rhs;
lhs = y(28)*(T(9)-(y(27)-1)*params(11)*2*y(27))+T(11)*y(41);
rhs = 1;
residual(16) = lhs - rhs;
lhs = y(16);
rhs = (y(21)*(1-params(5))/y(3)+(1-params(7))*y(28))/y(7);
residual(17) = lhs - rhs;
lhs = y(41)*y(42);
rhs = y(15)*y(41);
residual(18) = lhs - rhs;
lhs = y(25);
rhs = y(20)*y(19)*y(26);
residual(19) = lhs - rhs;
lhs = log(y(24))-log((steady_state(17)));
rhs = params(8)*(log(y(5))-log((steady_state(17))))+params(10)*x(it_, 1);
residual(20) = lhs - rhs;
lhs = log(y(25))-log((steady_state(18)));
rhs = params(9)*(log(y(6))-log((steady_state(18))))+params(10)*x(it_, 2);
residual(21) = lhs - rhs;
lhs = y(33);
rhs = y(21)/(steady_state(14));
residual(22) = lhs - rhs;
lhs = y(38);
rhs = y(22)/(steady_state(15));
residual(23) = lhs - rhs;
lhs = y(37);
rhs = y(23)/(steady_state(16));
residual(24) = lhs - rhs;
lhs = y(34);
rhs = y(17)/(steady_state(10));
residual(25) = lhs - rhs;
lhs = y(36);
rhs = y(19)/(steady_state(12));
residual(26) = lhs - rhs;
lhs = y(35);
rhs = y(20)/(steady_state(13));
residual(27) = lhs - rhs;
lhs = y(32);
rhs = y(15)/(steady_state(8));
residual(28) = lhs - rhs;
lhs = y(29);
rhs = y(22)/y(21);
residual(29) = lhs - rhs;
lhs = y(30);
rhs = y(23)/y(21);
residual(30) = lhs - rhs;
lhs = y(31);
rhs = y(17)/y(21);
residual(31) = lhs - rhs;

end
