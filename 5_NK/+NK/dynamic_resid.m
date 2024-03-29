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
    T = NK.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(70, 1);
lhs = y(87);
rhs = (steady_state(70));
residual(1) = lhs - rhs;
lhs = y(18);
rhs = (T(3)^(1-params(6))-1)/(1-params(6));
residual(2) = lhs - rhs;
lhs = y(19);
rhs = T(5)*T(6);
residual(3) = lhs - rhs;
lhs = y(20);
rhs = T(8)*T(9);
residual(4) = lhs - rhs;
lhs = y(21);
rhs = y(19)*params(4)/y(1);
residual(5) = lhs - rhs;
lhs = y(89)*y(88);
rhs = 1;
residual(6) = lhs - rhs;
lhs = y(22);
rhs = y(8)/y(43);
residual(7) = lhs - rhs;
lhs = y(42);
rhs = y(41)/y(94);
residual(8) = lhs - rhs;
lhs = (-y(20))/y(19);
rhs = y(25);
residual(9) = lhs - rhs;
lhs = y(50);
rhs = params(11)*T(10)*y(10)+(1-params(11))*T(11)^(-params(2));
residual(10) = lhs - rhs;
lhs = y(27);
rhs = T(12)*T(13)/y(50);
residual(11) = lhs - rhs;
lhs = y(23);
rhs = (y(50)*y(27)*(1-params(3))*y(28)/y(3)+(1-params(5))*y(39))/y(7);
residual(12) = lhs - rhs;
lhs = y(39)*(1-y(37)-y(40)*y(38))+y(88)*y(92)*y(91)*T(14);
rhs = 1;
residual(13) = lhs - rhs;
lhs = y(88)*y(90);
rhs = 1;
residual(14) = lhs - rhs;
lhs = y(28)*y(50)*y(27)*params(3)/y(26);
rhs = y(25);
residual(15) = lhs - rhs;
lhs = y(27);
rhs = y(24)+y(33)+y(30);
residual(16) = lhs - rhs;
lhs = y(29);
rhs = (1-y(37))*y(30)+y(3)*(1-params(5));
residual(17) = lhs - rhs;
lhs = y(40);
rhs = y(30)/y(4);
residual(18) = lhs - rhs;
lhs = y(37);
rhs = params(10)*(y(40)-1)^2;
residual(19) = lhs - rhs;
lhs = y(38);
rhs = (y(40)-1)*2*params(10);
residual(20) = lhs - rhs;
lhs = y(33);
rhs = y(31);
residual(21) = lhs - rhs;
lhs = y(45)-params(4)*params(11)*y(95);
rhs = y(19)*y(27);
residual(22) = lhs - rhs;
lhs = y(47)-params(4)*params(11)*y(96);
rhs = y(19)*T(16)*y(44)*y(51);
residual(23) = lhs - rhs;
lhs = y(46);
rhs = y(45)*T(17);
residual(24) = lhs - rhs;
lhs = y(48);
rhs = T(10)*y(47);
residual(25) = lhs - rhs;
lhs = 1;
rhs = params(11)*T(17)+(1-params(11))*T(11)^(1-params(2));
residual(26) = lhs - rhs;
lhs = y(49);
rhs = y(43)/T(18);
residual(27) = lhs - rhs;
lhs = log(y(41)/(steady_state(24)));
rhs = params(12)*log(y(8)/(steady_state(24)))+(1-params(12))*params(13)*log(y(43)/(steady_state(26)))+(1-params(12))*params(14)*log(y(27)/(steady_state(10)))+params(22)*x(it_, 4);
residual(28) = lhs - rhs;
lhs = y(44);
rhs = y(28);
residual(29) = lhs - rhs;
lhs = log(y(32))-log((steady_state(15)));
rhs = params(7)*(log(y(5))-log((steady_state(15))))+params(19)*x(it_, 1);
residual(30) = lhs - rhs;
lhs = log(y(33))-log((steady_state(16)));
rhs = params(8)*(log(y(6))-log((steady_state(16))))+params(20)*x(it_, 2);
residual(31) = lhs - rhs;
lhs = log(y(56))-log((steady_state(39)));
rhs = params(20)*x(it_, 2)+params(8)*(log(y(13))-log((steady_state(39))));
residual(32) = lhs - rhs;
lhs = log(y(51))-log((steady_state(34)));
rhs = params(15)*(log(y(11))-log((steady_state(34))))+params(21)*x(it_, 3);
residual(33) = lhs - rhs;
lhs = y(78);
rhs = y(27)/(steady_state(10));
residual(34) = lhs - rhs;
lhs = y(83);
rhs = y(29)/(steady_state(12));
residual(35) = lhs - rhs;
lhs = y(82);
rhs = y(30)/(steady_state(13));
residual(36) = lhs - rhs;
lhs = y(79);
rhs = y(24)/(steady_state(7));
residual(37) = lhs - rhs;
lhs = y(81);
rhs = y(25)/(steady_state(8));
residual(38) = lhs - rhs;
lhs = y(80);
rhs = y(26)/(steady_state(9));
residual(39) = lhs - rhs;
lhs = y(84);
rhs = y(39)/(steady_state(22));
residual(40) = lhs - rhs;
lhs = y(75);
rhs = y(22)/(steady_state(5));
residual(41) = lhs - rhs;
lhs = y(77);
rhs = y(42)/(steady_state(25));
residual(42) = lhs - rhs;
lhs = y(76);
rhs = y(41)/(steady_state(24));
residual(43) = lhs - rhs;
lhs = y(85);
rhs = y(43)/(steady_state(26));
residual(44) = lhs - rhs;
lhs = y(86);
rhs = y(74)/(steady_state(57));
residual(45) = lhs - rhs;
lhs = y(34);
rhs = y(29)/y(27);
residual(46) = lhs - rhs;
lhs = y(35);
rhs = y(30)/y(27);
residual(47) = lhs - rhs;
lhs = y(36);
rhs = y(24)/y(27);
residual(48) = lhs - rhs;
lhs = y(52);
rhs = (T(21)^(1-params(6))-1)/(1-params(6));
residual(49) = lhs - rhs;
lhs = y(53);
rhs = T(23)*T(24);
residual(50) = lhs - rhs;
lhs = y(54);
rhs = T(26)*T(27);
residual(51) = lhs - rhs;
lhs = y(68);
rhs = params(4)*y(53)/y(12);
residual(52) = lhs - rhs;
lhs = y(55)*y(97);
rhs = 1;
residual(53) = lhs - rhs;
lhs = (-y(54))/y(53);
rhs = y(62);
residual(54) = lhs - rhs;
lhs = y(59);
rhs = T(28)*T(29);
residual(55) = lhs - rhs;
lhs = y(69);
rhs = (y(59)*(1-params(3))*y(57)/y(14)+(1-params(5))*y(72))/y(17);
residual(56) = lhs - rhs;
lhs = y(72)*(1-y(70)-y(73)*y(71))+y(97)*y(100)*y(99)*T(30);
rhs = 1;
residual(57) = lhs - rhs;
lhs = y(97)*y(98);
rhs = 1;
residual(58) = lhs - rhs;
lhs = y(57)*params(3)*y(59)/y(58);
rhs = y(62);
residual(59) = lhs - rhs;
lhs = y(59);
rhs = y(56)+y(63)+y(61);
residual(60) = lhs - rhs;
lhs = y(60);
rhs = (1-y(70))*y(61)+(1-params(5))*y(14);
residual(61) = lhs - rhs;
lhs = y(73);
rhs = y(61)/y(15);
residual(62) = lhs - rhs;
lhs = y(70);
rhs = params(10)*(y(73)-1)^2;
residual(63) = lhs - rhs;
lhs = y(71);
rhs = 2*params(10)*(y(73)-1);
residual(64) = lhs - rhs;
lhs = y(67);
rhs = y(56);
residual(65) = lhs - rhs;
lhs = y(57);
rhs = 1-1/params(2);
residual(66) = lhs - rhs;
lhs = y(74);
rhs = y(59)/y(27);
residual(67) = lhs - rhs;
lhs = y(64);
rhs = y(60)/y(59);
residual(68) = lhs - rhs;
lhs = y(65);
rhs = y(61)/y(59);
residual(69) = lhs - rhs;
lhs = y(66);
rhs = y(63)/y(59);
residual(70) = lhs - rhs;

end
