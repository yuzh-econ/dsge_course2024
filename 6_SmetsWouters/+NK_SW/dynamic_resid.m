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
    T = NK_SW.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(43, 1);
lhs = y(18);
rhs = y(19)+y(61)*T(35);
residual(1) = lhs - rhs;
lhs = y(19);
rhs = T(1)*T(37);
residual(2) = lhs - rhs;
lhs = y(22);
rhs = (1-y(23))*y(25)*y(26)+(1-params(3))*y(2)/T(34);
residual(3) = lhs - rhs;
lhs = y(24);
rhs = y(25)*T(34)/y(3);
residual(4) = lhs - rhs;
lhs = y(23);
rhs = params(11)*(y(24)-1-params(7)/100)^2;
residual(5) = lhs - rhs;
lhs = y(27);
rhs = 2*params(11)*(y(24)-1-params(7)/100);
residual(6) = lhs - rhs;
lhs = y(28);
rhs = y(19)*(1-params(9))/T(36);
residual(7) = lhs - rhs;
lhs = y(29);
rhs = T(38)/T(42);
residual(8) = lhs - rhs;
lhs = y(30);
rhs = y(31);
residual(9) = lhs - rhs;
lhs = 1;
rhs = y(32)*y(70)*y(33);
residual(10) = lhs - rhs;
lhs = y(35);
rhs = y(69)*(y(68)*y(72)-y(73)+(1-params(3))*y(71));
residual(11) = lhs - rhs;
lhs = 1;
rhs = y(26)*y(35)*(1-y(23)-y(24)*y(27))+T(4)*y(65);
residual(12) = lhs - rhs;
lhs = y(69);
rhs = y(67)*params(8)*T(39)/y(28);
residual(13) = lhs - rhs;
lhs = y(34);
rhs = y(7)/y(39);
residual(14) = lhs - rhs;
lhs = y(37);
rhs = (y(36)-1)*T(45)+(y(36)-1)^2*T(46);
residual(15) = lhs - rhs;
lhs = y(31);
rhs = T(45)+(y(36)-1)*params(17)/(1-params(17))*T(45);
residual(16) = lhs - rhs;
lhs = y(40);
rhs = y(39)*y(41)*T(34)/y(9);
residual(17) = lhs - rhs;
lhs = y(42);
rhs = y(29)*T(5)*y(43)*y(44)+y(76)*T(8)*y(69)*params(13)*T(34);
residual(18) = lhs - rhs;
lhs = y(45);
rhs = y(43)+y(69)*params(13)*T(11)*y(77);
residual(19) = lhs - rhs;
lhs = y(46);
rhs = y(42)/(y(41)*y(45));
residual(20) = lhs - rhs;
lhs = 1;
rhs = params(13)*T(13)^(1-params(5))+(1-params(13))*y(46)^(1-params(5));
residual(21) = lhs - rhs;
lhs = y(47);
rhs = params(13)*T(14)/T(15)*y(11)+(1-params(13))*y(46)^(-params(5));
residual(22) = lhs - rhs;
lhs = y(48);
rhs = T(16)*T(44)-params(18)*(steady_state(31));
residual(23) = lhs - rhs;
lhs = y(41);
rhs = params(2)*y(50)*(y(48)+params(18)*(steady_state(31)))/y(43);
residual(24) = lhs - rhs;
lhs = y(30);
rhs = (y(48)+params(18)*(steady_state(31)))*(1-params(2))*y(50)/T(43);
residual(25) = lhs - rhs;
lhs = y(51);
rhs = y(50);
residual(26) = lhs - rhs;
lhs = y(52);
rhs = y(51)*T(18)*y(54)+y(78)*T(21)*y(69)*params(12)*T(34);
residual(27) = lhs - rhs;
lhs = y(55);
rhs = y(53)+y(79)*T(24)*y(69)*params(12)*T(34);
residual(28) = lhs - rhs;
lhs = y(56);
rhs = y(52)/y(55);
residual(29) = lhs - rhs;
lhs = 1;
rhs = params(12)*T(26)^(1-params(4))+(1-params(12))*y(56)^(1-params(4));
residual(30) = lhs - rhs;
lhs = y(57);
rhs = params(12)*T(27)/T(28)*y(15)+(1-params(12))*y(56)^(-params(4));
residual(31) = lhs - rhs;
lhs = log(T(29));
rhs = params(19)*log(T(30))+(1-params(19))*(params(20)*log(T(31))+params(21)*log(T(32))+params(22)*log(T(33)))+log(y(58));
residual(32) = lhs - rhs;
lhs = y(53);
rhs = y(25)+y(20)+y(59)+y(2)*y(37)/T(34);
residual(33) = lhs - rhs;
lhs = y(21);
rhs = y(43)*y(47);
residual(34) = lhs - rhs;
lhs = y(48);
rhs = y(53)*y(57);
residual(35) = lhs - rhs;
lhs = y(60);
rhs = (y(30)*y(36)-y(37)+(1-params(3))*y(35))/y(6);
residual(36) = lhs - rhs;
lhs = log(y(49))-log((steady_state(32)));
rhs = params(23)*(log(y(12))-log((steady_state(32))))+x(it_, 1);
residual(37) = lhs - rhs;
lhs = log(y(59))-log((steady_state(42)));
rhs = params(24)*(log(y(17))-log((steady_state(42))))+x(it_, 2);
residual(38) = lhs - rhs;
lhs = log(y(54))-log((steady_state(37)));
rhs = params(25)*(log(y(14))-log((steady_state(37))))+x(it_, 3);
residual(39) = lhs - rhs;
lhs = log(y(44))-log((steady_state(27)));
rhs = params(26)*(log(y(10))-log((steady_state(27))))+x(it_, 6);
residual(40) = lhs - rhs;
lhs = log(y(26))-log((steady_state(9)));
rhs = params(29)*(log(y(4))-log((steady_state(9))))+x(it_, 5);
residual(41) = lhs - rhs;
lhs = log(y(58))-log((steady_state(41)));
rhs = params(27)*(log(y(16))-log((steady_state(41))))+x(it_, 4);
residual(42) = lhs - rhs;
lhs = log(y(32))-log((steady_state(15)));
rhs = params(28)*(log(y(5))-log((steady_state(15))))+x(it_, 7);
residual(43) = lhs - rhs;

end
