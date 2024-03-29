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
    T = NKlinear.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(32, 1);
lhs = y(31);
rhs = ((1-params(6))*(1-params(5))-1)*T(1)+params(6)*(params(5)-1)*params(20)/(1-params(20))*y(34);
residual(1) = lhs - rhs;
lhs = y(50);
rhs = y(31)-y(33);
residual(2) = lhs - rhs;
lhs = y(32);
rhs = (-y(31))-T(1)-params(20)/(1-params(20))*y(34);
residual(3) = lhs - rhs;
lhs = y(39);
rhs = (-y(32))-y(31);
residual(4) = lhs - rhs;
lhs = y(35);
rhs = params(2)*(y(34)+y(23))+(1-params(2))*y(8);
residual(5) = lhs - rhs;
lhs = y(39);
rhs = y(35)-y(34);
residual(6) = lhs - rhs;
lhs = y(35);
rhs = y(40)*params(27)+params(26)*y(37)+params(25)*y(38);
residual(7) = lhs - rhs;
lhs = y(36);
rhs = y(37)*params(4)+y(8)*(1-params(4));
residual(8) = lhs - rhs;
lhs = y(42);
rhs = (params(4)+params(21)-1)/params(21)*(y(35)-y(8))+(1-params(4))/params(21)*y(41);
residual(9) = lhs - rhs;
lhs = y(33);
rhs = y(52)-y(41);
residual(10) = lhs - rhs;
lhs = y(37)*(1+1/params(21));
rhs = 1/params(21)*y(51)+y(9)+y(41)*1/(2*params(11));
residual(11) = lhs - rhs;
lhs = y(38);
rhs = y(34)+y(39)+y(43);
residual(12) = lhs - rhs;
lhs = y(38);
rhs = params(8)*y(10)+x(it_, 2);
residual(13) = lhs - rhs;
lhs = y(13);
rhs = ((1-params(6))*(1-params(5))-1)*T(2)+params(6)*(params(5)-1)*params(18)/(1-params(18))*y(18);
residual(14) = lhs - rhs;
lhs = y(45);
rhs = y(13)-y(46);
residual(15) = lhs - rhs;
lhs = y(14);
rhs = (-y(13))-T(2)-params(18)/(1-params(18))*y(18);
residual(16) = lhs - rhs;
lhs = y(17);
rhs = (-y(14))-y(13);
residual(17) = lhs - rhs;
lhs = y(19);
rhs = params(2)*(y(23)+y(18))+(1-params(2))*y(1);
residual(18) = lhs - rhs;
lhs = y(29);
rhs = y(18)+y(17)-y(19);
residual(19) = lhs - rhs;
lhs = y(19);
rhs = y(25)*params(23)+params(24)*y(21)+params(25)*y(24);
residual(20) = lhs - rhs;
lhs = y(20);
rhs = params(4)*y(21)+(1-params(4))*y(1);
residual(21) = lhs - rhs;
lhs = y(27);
rhs = (params(4)+params(19)-1)/params(19)*(y(19)+y(29)-y(1))+(1-params(4))/params(19)*y(26);
residual(22) = lhs - rhs;
lhs = y(46);
rhs = y(48)-y(26);
residual(23) = lhs - rhs;
lhs = y(21)*(1+1/params(19));
rhs = 1/params(19)*y(47)+y(2)+1/(2*params(11))*y(26);
residual(24) = lhs - rhs;
lhs = y(24);
rhs = y(18)+y(17)+y(22);
residual(25) = lhs - rhs;
lhs = y(28);
rhs = params(3)/(1+params(3)*params(14))*y(49)+params(14)/(1+params(3)*params(14))*y(6)+(1-params(3)*params(12))*(1-params(12))/((1+params(3)*params(14))*params(12))*(y(29)+y(44));
residual(26) = lhs - rhs;
lhs = y(30);
rhs = params(15)*y(7)+y(28)*(1-params(15))*params(16)+y(19)*(1-params(15))*params(17)+x(it_, 4);
residual(27) = lhs - rhs;
lhs = y(15);
rhs = y(7)-y(28);
residual(28) = lhs - rhs;
lhs = y(16);
rhs = y(30)-y(49);
residual(29) = lhs - rhs;
lhs = y(23);
rhs = params(7)*y(3)+x(it_, 1);
residual(30) = lhs - rhs;
lhs = y(24);
rhs = x(it_, 2)+params(8)*y(4);
residual(31) = lhs - rhs;
lhs = y(44);
rhs = params(9)*y(12)+x(it_, 3);
residual(32) = lhs - rhs;

end
