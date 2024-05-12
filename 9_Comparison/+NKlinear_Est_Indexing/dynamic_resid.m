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
    T = NKlinear_Est_Indexing.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(35, 1);
lhs = y(32);
rhs = T(3)*((1-params(7))*(1-T(5))-1)+y(34)*params(21)/(1-params(21))*(params(7)-1)*T(5);
residual(1) = lhs - rhs;
lhs = y(54);
rhs = y(32)-y(35);
residual(2) = lhs - rhs;
lhs = y(36);
rhs = (-y(32))-T(3)-params(21)/(1-params(21))*y(34);
residual(3) = lhs - rhs;
lhs = y(37);
rhs = (-y(36))-y(32);
residual(4) = lhs - rhs;
lhs = y(38);
rhs = params(2)*(y(34)+y(25))+(1-params(2))*y(10);
residual(5) = lhs - rhs;
lhs = y(37);
rhs = y(38)-y(34);
residual(6) = lhs - rhs;
lhs = y(38);
rhs = params(1)*y(41)+T(2)*y(40)+y(33)*(1-T(2)-params(1));
residual(7) = lhs - rhs;
lhs = y(39);
rhs = params(6)*y(40)+y(10)*(1-params(6));
residual(8) = lhs - rhs;
lhs = y(42);
rhs = (params(6)+params(22)-1)/params(22)*(y(38)-y(10))+(1-params(6))/params(22)*y(43);
residual(9) = lhs - rhs;
lhs = y(35);
rhs = y(56)-y(43);
residual(10) = lhs - rhs;
lhs = y(40)*(1+1/params(22));
rhs = 1/params(22)*y(55)+y(11)+y(43)*1/(2*params(12));
residual(11) = lhs - rhs;
lhs = y(41);
rhs = y(34)+y(37)+y(44);
residual(12) = lhs - rhs;
lhs = y(41);
rhs = params(9)*y(12)+x(it_, 2);
residual(13) = lhs - rhs;
lhs = y(14);
rhs = T(4)*((1-params(7))*(1-T(5))-1)+y(17)*params(19)/(1-params(19))*(params(7)-1)*T(5);
residual(14) = lhs - rhs;
lhs = y(49);
rhs = y(14)-y(50);
residual(15) = lhs - rhs;
lhs = y(15);
rhs = (-y(14))-T(4)-params(19)/(1-params(19))*y(17);
residual(16) = lhs - rhs;
lhs = y(18);
rhs = (-y(15))-y(14);
residual(17) = lhs - rhs;
lhs = y(20);
rhs = y(19);
residual(18) = lhs - rhs;
lhs = y(19);
rhs = params(2)*(y(25)+y(17))+(1-params(2))*y(2);
residual(19) = lhs - rhs;
lhs = y(30);
rhs = y(17)+y(18)-y(19);
residual(20) = lhs - rhs;
lhs = y(20);
rhs = params(1)*y(26)+T(1)*y(22)+y(24)*(1-T(1)-params(1));
residual(21) = lhs - rhs;
lhs = y(21);
rhs = params(6)*y(22)+(1-params(6))*y(2);
residual(22) = lhs - rhs;
lhs = y(27);
rhs = (params(6)+params(20)-1)/params(20)*(y(19)+y(30)-y(2))+(1-params(6))/params(20)*y(28);
residual(23) = lhs - rhs;
lhs = y(50);
rhs = y(52)-y(28);
residual(24) = lhs - rhs;
lhs = y(22)*(1+1/params(20));
rhs = 1/params(20)*y(51)+y(3)+1/(2*params(12))*y(28);
residual(25) = lhs - rhs;
lhs = y(26);
rhs = y(17)+y(18)+y(23);
residual(26) = lhs - rhs;
lhs = y(29);
rhs = params(5)/(1+params(5)*params(15))*y(53)+params(15)/(1+params(5)*params(15))*y(7)+(1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))*(y(30)+y(45));
residual(27) = lhs - rhs;
lhs = y(31);
rhs = params(16)*y(8)+y(29)*(1-params(16))*params(17)+y(20)*(1-params(16))*params(18)+x(it_, 3);
residual(28) = lhs - rhs;
lhs = y(16);
rhs = y(8)-y(29);
residual(29) = lhs - rhs;
lhs = y(25);
rhs = params(8)*y(5)+x(it_, 1);
residual(30) = lhs - rhs;
lhs = y(26);
rhs = x(it_, 2)+params(9)*y(6);
residual(31) = lhs - rhs;
lhs = y(45);
rhs = params(10)*y(13)+x(it_, 4);
residual(32) = lhs - rhs;
lhs = y(46);
rhs = y(20)-y(1)+params(24);
residual(33) = lhs - rhs;
lhs = y(47);
rhs = y(29)+params(25);
residual(34) = lhs - rhs;
lhs = y(48);
rhs = y(31)+params(26);
residual(35) = lhs - rhs;

end
