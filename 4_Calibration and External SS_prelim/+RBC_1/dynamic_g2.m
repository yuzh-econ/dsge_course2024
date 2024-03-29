function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
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
%   g2
%

if T_flag
    T = RBC_1.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(80,1);
g2_j = zeros(80,1);
g2_v = zeros(80,1);

g2_i(1)=1;
g2_i(2)=1;
g2_i(3)=1;
g2_i(4)=1;
g2_i(5)=2;
g2_i(6)=2;
g2_i(7)=2;
g2_i(8)=2;
g2_i(9)=3;
g2_i(10)=3;
g2_i(11)=3;
g2_i(12)=3;
g2_i(13)=4;
g2_i(14)=4;
g2_i(15)=5;
g2_i(16)=5;
g2_i(17)=5;
g2_i(18)=6;
g2_i(19)=6;
g2_i(20)=6;
g2_i(21)=6;
g2_i(22)=6;
g2_i(23)=6;
g2_i(24)=6;
g2_i(25)=6;
g2_i(26)=6;
g2_i(27)=7;
g2_i(28)=7;
g2_i(29)=7;
g2_i(30)=9;
g2_i(31)=9;
g2_i(32)=9;
g2_i(33)=9;
g2_i(34)=10;
g2_i(35)=10;
g2_i(36)=10;
g2_i(37)=11;
g2_i(38)=11;
g2_i(39)=11;
g2_i(40)=11;
g2_i(41)=11;
g2_i(42)=11;
g2_i(43)=11;
g2_i(44)=11;
g2_i(45)=11;
g2_i(46)=11;
g2_i(47)=11;
g2_i(48)=11;
g2_i(49)=11;
g2_i(50)=11;
g2_i(51)=11;
g2_i(52)=11;
g2_i(53)=11;
g2_i(54)=11;
g2_i(55)=11;
g2_i(56)=11;
g2_i(57)=11;
g2_i(58)=12;
g2_i(59)=12;
g2_i(60)=12;
g2_i(61)=13;
g2_i(62)=13;
g2_i(63)=13;
g2_i(64)=13;
g2_i(65)=13;
g2_i(66)=14;
g2_i(67)=14;
g2_i(68)=16;
g2_i(69)=16;
g2_i(70)=17;
g2_i(71)=17;
g2_i(72)=25;
g2_i(73)=25;
g2_i(74)=25;
g2_i(75)=26;
g2_i(76)=26;
g2_i(77)=26;
g2_i(78)=27;
g2_i(79)=27;
g2_i(80)=27;
g2_j(1)=419;
g2_j(2)=421;
g2_j(3)=493;
g2_j(4)=495;
g2_j(5)=419;
g2_j(6)=421;
g2_j(7)=493;
g2_j(8)=495;
g2_j(9)=419;
g2_j(10)=421;
g2_j(11)=493;
g2_j(12)=495;
g2_j(13)=268;
g2_j(14)=304;
g2_j(15)=191;
g2_j(16)=192;
g2_j(17)=228;
g2_j(18)=495;
g2_j(19)=482;
g2_j(20)=14;
g2_j(21)=499;
g2_j(22)=643;
g2_j(23)=1;
g2_j(24)=18;
g2_j(25)=630;
g2_j(26)=647;
g2_j(27)=495;
g2_j(28)=496;
g2_j(29)=532;
g2_j(30)=39;
g2_j(31)=54;
g2_j(32)=594;
g2_j(33)=609;
g2_j(34)=191;
g2_j(35)=217;
g2_j(36)=1153;
g2_j(37)=276;
g2_j(38)=600;
g2_j(39)=293;
g2_j(40)=1229;
g2_j(41)=294;
g2_j(42)=1266;
g2_j(43)=39;
g2_j(44)=54;
g2_j(45)=594;
g2_j(46)=58;
g2_j(47)=742;
g2_j(48)=609;
g2_j(49)=626;
g2_j(50)=1238;
g2_j(51)=613;
g2_j(52)=757;
g2_j(53)=627;
g2_j(54)=1275;
g2_j(55)=1255;
g2_j(56)=1256;
g2_j(57)=1292;
g2_j(58)=519;
g2_j(59)=15;
g2_j(60)=1;
g2_j(61)=1205;
g2_j(62)=773;
g2_j(63)=761;
g2_j(64)=775;
g2_j(65)=1279;
g2_j(66)=269;
g2_j(67)=341;
g2_j(68)=77;
g2_j(69)=647;
g2_j(70)=115;
g2_j(71)=685;
g2_j(72)=533;
g2_j(73)=534;
g2_j(74)=570;
g2_j(75)=533;
g2_j(76)=535;
g2_j(77)=607;
g2_j(78)=422;
g2_j(79)=530;
g2_j(80)=533;
g2_v(1)=(-((T(19)*T(2)*getPowerDeriv(y(12),1-params(1),2)+T(18)*T(18)*T(36))/(1-params(5))));
g2_v(2)=(-((T(19)*T(17)*T(22)+T(18)*T(1)*T(22)*T(36))/(1-params(5))));
g2_v(3)=g2_v(2);
g2_v(4)=(-((T(1)*T(22)*T(1)*T(22)*T(36)+T(19)*T(1)*getPowerDeriv(1-y(14),params(1),2))/(1-params(5))));
g2_v(5)=(-(T(5)*(1-params(1))*getPowerDeriv(y(12),(1-params(1))*(1-params(5))-1,2)));
g2_v(6)=(-(T(20)*T(23)));
g2_v(7)=g2_v(6);
g2_v(8)=(-(T(4)*getPowerDeriv(1-y(14),params(1)*(1-params(5)),2)));
g2_v(9)=(-(T(7)*(-params(1))*getPowerDeriv(y(12),(1-params(1))*(1-params(5)),2)));
g2_v(10)=(-(T(21)*T(24)));
g2_v(11)=g2_v(10);
g2_v(12)=(-(T(6)*getPowerDeriv(1-y(14),params(1)*(1-params(5))-1,2)));
g2_v(13)=1;
g2_v(14)=g2_v(13);
g2_v(15)=(-(y(7)*(y(6)+y(6))))/(y(6)*y(6)*y(6)*y(6));
g2_v(16)=1/(y(6)*y(6));
g2_v(17)=g2_v(16);
g2_v(18)=(-(T(9)*y(18)*y(18)*T(37)));
g2_v(19)=(-(y(18)*T(25)*T(26)));
g2_v(20)=g2_v(19);
g2_v(21)=(-(T(9)*(T(25)+y(18)*y(14)*T(37))));
g2_v(22)=g2_v(21);
g2_v(23)=(-(T(8)*getPowerDeriv(y(1),1-params(2),2)));
g2_v(24)=(-(T(26)*y(14)*T(25)));
g2_v(25)=g2_v(24);
g2_v(26)=(-(T(9)*y(14)*y(14)*T(37)));
g2_v(27)=(-((-(y(15)*params(2)))*(y(14)+y(14))))/(y(14)*y(14)*y(14)*y(14));
g2_v(28)=(-params(2))/(y(14)*y(14));
g2_v(29)=g2_v(28);
g2_v(30)=(-(y(17)*T(39)));
g2_v(31)=(-(y(17)*(-(params(9)*(2*(T(10)-1)*(-1)/(y(2)*y(2))+T(27)*2*T(29))))-params(9)*T(27)*2*(T(10)-1)));
g2_v(32)=g2_v(31);
g2_v(33)=(-(y(17)*(-(params(9)*T(29)*2*T(29)))-params(9)*2*(T(10)-1)*T(29)-params(9)*2*(T(10)-1)*T(29)));
g2_v(34)=(-((-((-(params(3)*y(32)))*(y(6)+y(6))))/(y(6)*y(6)*y(6)*y(6))));
g2_v(35)=(-((-params(3))/(y(6)*y(6))));
g2_v(36)=g2_v(35);
g2_v(37)=(-(T(16)*T(33)+T(15)*params(9)*2*y(35)*T(31)));
g2_v(38)=g2_v(37);
g2_v(39)=(-(T(16)*T(35)+T(15)*params(9)*2*y(35)*T(34)));
g2_v(40)=g2_v(39);
g2_v(41)=(-(T(15)*2*params(9)*T(13)));
g2_v(42)=g2_v(41);
g2_v(43)=(-(y(21)*(T(39)-(T(27)*2*params(9)*T(27)+T(12)*T(38)+T(27)*2*params(9)*T(27)+T(10)*2*params(9)*T(38)))));
g2_v(44)=(-(y(21)*((-(params(9)*(2*(T(10)-1)*(-1)/(y(2)*y(2))+T(27)*2*T(29))))-(T(27)*2*params(9)*T(29)+T(12)*(-1)/(y(2)*y(2))+2*params(9)*T(27)*T(29)+T(10)*2*params(9)*(-1)/(y(2)*y(2))))));
g2_v(45)=g2_v(44);
g2_v(46)=(-(T(28)-(T(12)*T(27)+T(10)*2*params(9)*T(27))));
g2_v(47)=g2_v(46);
g2_v(48)=(-(y(21)*((-(params(9)*T(29)*2*T(29)))-(T(29)*2*params(9)*T(29)+T(29)*2*params(9)*T(29)))+params(9)*2*y(8)*y(35)*T(31)*T(33)+T(15)*params(9)*2*y(8)*y(35)*(-((-y(34))*(y(17)+y(17))))/(y(17)*y(17)*y(17)*y(17))+params(9)*2*y(8)*y(35)*T(31)*T(33)+T(14)*(T(32)*(-((-y(34))*(y(17)+y(17))))/(y(17)*y(17)*y(17)*y(17))+T(31)*2*T(31))));
g2_v(49)=(-(params(9)*2*y(8)*y(35)*T(31)*T(35)+T(15)*params(9)*2*y(8)*y(35)*(-1)/(y(17)*y(17))+T(33)*params(9)*2*y(8)*y(35)*T(34)+T(14)*(T(32)*(-1)/(y(17)*y(17))+T(31)*2*T(34))));
g2_v(50)=g2_v(49);
g2_v(51)=(-(T(30)-(T(12)*T(29)+T(10)*2*params(9)*T(29))));
g2_v(52)=g2_v(51);
g2_v(53)=(-(T(15)*T(31)*params(9)*2*y(8)+T(33)*T(13)*params(9)*2*y(8)));
g2_v(54)=g2_v(53);
g2_v(55)=(-(params(9)*2*y(8)*y(35)*T(34)*T(35)+params(9)*2*y(8)*y(35)*T(34)*T(35)+T(14)*T(34)*2*T(34)));
g2_v(56)=(-(T(15)*T(34)*params(9)*2*y(8)+T(35)*T(13)*params(9)*2*y(8)));
g2_v(57)=g2_v(56);
g2_v(58)=(-((-(1-params(2)))/(y(1)*y(1))));
g2_v(59)=g2_v(58);
g2_v(60)=(-((-((-(y(15)*(1-params(2))))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
g2_v(61)=(-((-1)/(y(21)*y(21))));
g2_v(62)=g2_v(61);
g2_v(63)=(-((-((-(y(33)+(1-params(4))*y(35)))*(y(21)+y(21))))/(y(21)*y(21)*y(21)*y(21))));
g2_v(64)=(-((-(1-params(4)))/(y(21)*y(21))));
g2_v(65)=g2_v(64);
g2_v(66)=1;
g2_v(67)=g2_v(66);
g2_v(68)=(-(params(6)*(-1)/(y(3)*y(3))));
g2_v(69)=(-1)/(y(18)*y(18));
g2_v(70)=(-(params(7)*(-1)/(y(4)*y(4))));
g2_v(71)=(-1)/(y(19)*y(19));
g2_v(72)=(-((-((-y(16))*(y(15)+y(15))))/(y(15)*y(15)*y(15)*y(15))));
g2_v(73)=(-((-1)/(y(15)*y(15))));
g2_v(74)=g2_v(73);
g2_v(75)=(-((-((-y(17))*(y(15)+y(15))))/(y(15)*y(15)*y(15)*y(15))));
g2_v(76)=(-((-1)/(y(15)*y(15))));
g2_v(77)=g2_v(76);
g2_v(78)=(-((-1)/(y(15)*y(15))));
g2_v(79)=g2_v(78);
g2_v(80)=(-((-((-y(12))*(y(15)+y(15))))/(y(15)*y(15)*y(15)*y(15))));
g2 = sparse(g2_i,g2_j,g2_v,27,1369);
end