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
    T = RBC_JR_0.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(115,1);
g2_j = zeros(115,1);
g2_v = zeros(115,1);

g2_i(1)=1;
g2_i(2)=1;
g2_i(3)=1;
g2_i(4)=1;
g2_i(5)=1;
g2_i(6)=1;
g2_i(7)=1;
g2_i(8)=1;
g2_i(9)=1;
g2_i(10)=2;
g2_i(11)=2;
g2_i(12)=2;
g2_i(13)=2;
g2_i(14)=3;
g2_i(15)=3;
g2_i(16)=3;
g2_i(17)=3;
g2_i(18)=3;
g2_i(19)=3;
g2_i(20)=3;
g2_i(21)=3;
g2_i(22)=3;
g2_i(23)=4;
g2_i(24)=4;
g2_i(25)=4;
g2_i(26)=4;
g2_i(27)=4;
g2_i(28)=4;
g2_i(29)=4;
g2_i(30)=5;
g2_i(31)=5;
g2_i(32)=5;
g2_i(33)=6;
g2_i(34)=6;
g2_i(35)=7;
g2_i(36)=7;
g2_i(37)=7;
g2_i(38)=7;
g2_i(39)=7;
g2_i(40)=7;
g2_i(41)=7;
g2_i(42)=8;
g2_i(43)=8;
g2_i(44)=8;
g2_i(45)=8;
g2_i(46)=8;
g2_i(47)=8;
g2_i(48)=8;
g2_i(49)=9;
g2_i(50)=9;
g2_i(51)=9;
g2_i(52)=10;
g2_i(53)=10;
g2_i(54)=10;
g2_i(55)=10;
g2_i(56)=10;
g2_i(57)=10;
g2_i(58)=10;
g2_i(59)=10;
g2_i(60)=10;
g2_i(61)=11;
g2_i(62)=11;
g2_i(63)=11;
g2_i(64)=13;
g2_i(65)=13;
g2_i(66)=13;
g2_i(67)=14;
g2_i(68)=14;
g2_i(69)=14;
g2_i(70)=15;
g2_i(71)=15;
g2_i(72)=15;
g2_i(73)=16;
g2_i(74)=16;
g2_i(75)=16;
g2_i(76)=16;
g2_i(77)=16;
g2_i(78)=16;
g2_i(79)=16;
g2_i(80)=16;
g2_i(81)=16;
g2_i(82)=16;
g2_i(83)=17;
g2_i(84)=17;
g2_i(85)=17;
g2_i(86)=17;
g2_i(87)=17;
g2_i(88)=17;
g2_i(89)=17;
g2_i(90)=17;
g2_i(91)=17;
g2_i(92)=17;
g2_i(93)=18;
g2_i(94)=18;
g2_i(95)=18;
g2_i(96)=18;
g2_i(97)=19;
g2_i(98)=19;
g2_i(99)=19;
g2_i(100)=19;
g2_i(101)=19;
g2_i(102)=19;
g2_i(103)=20;
g2_i(104)=20;
g2_i(105)=21;
g2_i(106)=21;
g2_i(107)=29;
g2_i(108)=29;
g2_i(109)=29;
g2_i(110)=30;
g2_i(111)=30;
g2_i(112)=30;
g2_i(113)=31;
g2_i(114)=31;
g2_i(115)=31;
g2_j(1)=769;
g2_j(2)=770;
g2_j(3)=816;
g2_j(4)=772;
g2_j(5)=910;
g2_j(6)=817;
g2_j(7)=819;
g2_j(8)=911;
g2_j(9)=913;
g2_j(10)=769;
g2_j(11)=754;
g2_j(12)=64;
g2_j(13)=49;
g2_j(14)=769;
g2_j(15)=770;
g2_j(16)=816;
g2_j(17)=772;
g2_j(18)=910;
g2_j(19)=817;
g2_j(20)=819;
g2_j(21)=911;
g2_j(22)=913;
g2_j(23)=394;
g2_j(24)=808;
g2_j(25)=396;
g2_j(26)=902;
g2_j(27)=819;
g2_j(28)=911;
g2_j(29)=913;
g2_j(30)=396;
g2_j(31)=902;
g2_j(32)=913;
g2_j(33)=1801;
g2_j(34)=697;
g2_j(35)=581;
g2_j(36)=765;
g2_j(37)=582;
g2_j(38)=812;
g2_j(39)=769;
g2_j(40)=770;
g2_j(41)=816;
g2_j(42)=1851;
g2_j(43)=839;
g2_j(44)=1876;
g2_j(45)=2014;
g2_j(46)=817;
g2_j(47)=842;
g2_j(48)=1992;
g2_j(49)=435;
g2_j(50)=527;
g2_j(51)=529;
g2_j(52)=913;
g2_j(53)=896;
g2_j(54)=114;
g2_j(55)=917;
g2_j(56)=1101;
g2_j(57)=97;
g2_j(58)=118;
g2_j(59)=1084;
g2_j(60)=1105;
g2_j(61)=913;
g2_j(62)=914;
g2_j(63)=960;
g2_j(64)=1061;
g2_j(65)=1245;
g2_j(66)=1249;
g2_j(67)=145;
g2_j(68)=164;
g2_j(69)=1038;
g2_j(70)=1;
g2_j(71)=9;
g2_j(72)=377;
g2_j(73)=1924;
g2_j(74)=2062;
g2_j(75)=1925;
g2_j(76)=2109;
g2_j(77)=1249;
g2_j(78)=1250;
g2_j(79)=1296;
g2_j(80)=2065;
g2_j(81)=2066;
g2_j(82)=2112;
g2_j(83)=943;
g2_j(84)=115;
g2_j(85)=947;
g2_j(86)=303;
g2_j(87)=97;
g2_j(88)=101;
g2_j(89)=285;
g2_j(90)=289;
g2_j(91)=310;
g2_j(92)=1276;
g2_j(93)=1895;
g2_j(94)=699;
g2_j(95)=1922;
g2_j(96)=1968;
g2_j(97)=866;
g2_j(98)=912;
g2_j(99)=872;
g2_j(100)=1194;
g2_j(101)=919;
g2_j(102)=1195;
g2_j(103)=193;
g2_j(104)=1105;
g2_j(105)=241;
g2_j(106)=1153;
g2_j(107)=961;
g2_j(108)=962;
g2_j(109)=1008;
g2_j(110)=961;
g2_j(111)=963;
g2_j(112)=1055;
g2_j(113)=773;
g2_j(114)=957;
g2_j(115)=961;
g2_v(1)=(-(T(22)/(1-params(2))));
g2_v(2)=(-((-(params(3)*T(1)))*T(22)/(1-params(2))));
g2_v(3)=g2_v(2);
g2_v(4)=(-(T(17)*T(22)/(1-params(2))));
g2_v(5)=g2_v(4);
g2_v(6)=(-((-(params(3)*T(1)))*(-(params(3)*T(1)))*T(22)/(1-params(2))));
g2_v(7)=(-(((-(params(3)*T(1)))*T(17)*T(22)+T(12)*(-(params(3)*T(16))))/(1-params(2))));
g2_v(8)=g2_v(7);
g2_v(9)=(-((T(17)*T(17)*T(22)+T(12)*T(24))/(1-params(2))));
g2_v(10)=(-(T(4)*getPowerDeriv(y(17),params(4),2)));
g2_v(11)=(-(T(13)*T(15)));
g2_v(12)=g2_v(11);
g2_v(13)=(-(T(3)*getPowerDeriv(y(2),1-params(4),2)));
g2_v(14)=(-T(25));
g2_v(15)=(-((-(params(3)*T(1)))*T(25)));
g2_v(16)=g2_v(15);
g2_v(17)=(-(T(17)*T(25)));
g2_v(18)=g2_v(17);
g2_v(19)=(-((-(params(3)*T(1)))*(-(params(3)*T(1)))*T(25)));
g2_v(20)=(-((-(params(3)*T(1)))*T(17)*T(25)+T(14)*(-(params(3)*T(16)))));
g2_v(21)=g2_v(20);
g2_v(22)=(-(T(17)*T(17)*T(25)+T(14)*T(24)));
g2_v(23)=(-T(5));
g2_v(24)=g2_v(23);
g2_v(25)=(-T(19));
g2_v(26)=g2_v(25);
g2_v(27)=(-(y(9)*T(18)));
g2_v(28)=g2_v(27);
g2_v(29)=(-(y(9)*y(18)*params(3)*(-params(1))*getPowerDeriv(y(20),params(1)-1,2)));
g2_v(30)=(-((-params(3))*T(16)));
g2_v(31)=g2_v(30);
g2_v(32)=(-(y(9)*(-params(3))*T(23)));
g2_v(33)=(-params(6));
g2_v(34)=g2_v(33);
g2_v(35)=(-(y(18)*params(4)))/(y(17)*y(17));
g2_v(36)=g2_v(35);
g2_v(37)=params(4)/y(17);
g2_v(38)=g2_v(37);
g2_v(39)=(-((-(y(18)*params(4)*y(13)))*(y(17)+y(17))))/(y(17)*y(17)*y(17)*y(17));
g2_v(40)=(-(params(4)*y(13)))/(y(17)*y(17));
g2_v(41)=g2_v(40);
g2_v(42)=(-((-((1-params(4))*params(6)*y(43)))/(y(18)*y(18))));
g2_v(43)=g2_v(42);
g2_v(44)=(-((1-params(4))*params(6)/y(18)));
g2_v(45)=g2_v(44);
g2_v(46)=(-((-((-((1-params(4))*params(6)*y(40)*y(43)))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18))));
g2_v(47)=(-((-((1-params(4))*params(6)*y(40)))/(y(18)*y(18))));
g2_v(48)=g2_v(47);
g2_v(49)=1/(y(12)*y(12));
g2_v(50)=g2_v(49);
g2_v(51)=(-(y(10)*(y(12)+y(12))))/(y(12)*y(12)*y(12)*y(12));
g2_v(52)=(-(T(8)*y(24)*y(24)*T(26)));
g2_v(53)=(-(y(24)*T(20)*T(21)));
g2_v(54)=g2_v(53);
g2_v(55)=(-(T(8)*(T(20)+y(24)*y(20)*T(26))));
g2_v(56)=g2_v(55);
g2_v(57)=(-(T(7)*getPowerDeriv(y(3),1-params(5),2)));
g2_v(58)=(-(T(21)*y(20)*T(20)));
g2_v(59)=g2_v(58);
g2_v(60)=(-(T(8)*y(20)*y(20)*T(26)));
g2_v(61)=(-((-(y(21)*params(5)))*(y(20)+y(20))))/(y(20)*y(20)*y(20)*y(20));
g2_v(62)=(-params(5))/(y(20)*y(20));
g2_v(63)=g2_v(62);
g2_v(64)=params(11)*2*(y(27)-1);
g2_v(65)=g2_v(64);
g2_v(66)=(-(y(23)*(-(2*params(11)))));
g2_v(67)=(-((-((-y(23))*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4))));
g2_v(68)=(-((-1)/(y(4)*y(4))));
g2_v(69)=g2_v(68);
g2_v(70)=(-((-((-(y(9)*params(6)))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
g2_v(71)=(-((-params(6))/(y(1)*y(1))));
g2_v(72)=g2_v(71);
g2_v(73)=y(45)*(2*params(11)*T(10)+2*params(11)*(y(44)-1)*2*y(44));
g2_v(74)=g2_v(73);
g2_v(75)=2*params(11)*(y(44)-1)*T(10);
g2_v(76)=g2_v(75);
g2_v(77)=y(28)*((-(2*params(11)))-(2*params(11)+2*params(11)));
g2_v(78)=(-(params(11)*2*(y(27)-1)))-(params(11)*2*y(27)+(y(27)-1)*2*params(11));
g2_v(79)=g2_v(78);
g2_v(80)=y(41)*y(45)*(2*params(11)*2*y(44)+2*params(11)*2*y(44)+2*2*params(11)*(y(44)-1));
g2_v(81)=y(41)*(2*params(11)*T(10)+2*params(11)*(y(44)-1)*2*y(44));
g2_v(82)=g2_v(81);
g2_v(83)=(-((-(1-params(5)))/(y(3)*y(3))/y(7)));
g2_v(84)=g2_v(83);
g2_v(85)=(-((-((1-params(5))/y(3)))/(y(7)*y(7))));
g2_v(86)=g2_v(85);
g2_v(87)=(-((-((-(y(21)*(1-params(5))))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3))/y(7)));
g2_v(88)=(-((-((-(y(21)*(1-params(5))))/(y(3)*y(3))))/(y(7)*y(7))));
g2_v(89)=g2_v(88);
g2_v(90)=(-((-((-(y(21)*(1-params(5))/y(3)+(1-params(7))*y(28)))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7))));
g2_v(91)=(-((-(1-params(7)))/(y(7)*y(7))));
g2_v(92)=g2_v(91);
g2_v(93)=(-1);
g2_v(94)=g2_v(93);
g2_v(95)=1;
g2_v(96)=g2_v(95);
g2_v(97)=(-y(26));
g2_v(98)=g2_v(97);
g2_v(99)=(-y(20));
g2_v(100)=g2_v(99);
g2_v(101)=(-y(19));
g2_v(102)=g2_v(101);
g2_v(103)=(-(params(8)*(-1)/(y(5)*y(5))));
g2_v(104)=(-1)/(y(24)*y(24));
g2_v(105)=(-(params(9)*(-1)/(y(6)*y(6))));
g2_v(106)=(-1)/(y(25)*y(25));
g2_v(107)=(-((-((-y(22))*(y(21)+y(21))))/(y(21)*y(21)*y(21)*y(21))));
g2_v(108)=(-((-1)/(y(21)*y(21))));
g2_v(109)=g2_v(108);
g2_v(110)=(-((-((-y(23))*(y(21)+y(21))))/(y(21)*y(21)*y(21)*y(21))));
g2_v(111)=(-((-1)/(y(21)*y(21))));
g2_v(112)=g2_v(111);
g2_v(113)=(-((-1)/(y(21)*y(21))));
g2_v(114)=g2_v(113);
g2_v(115)=(-((-((-y(17))*(y(21)+y(21))))/(y(21)*y(21)*y(21)*y(21))));
g2 = sparse(g2_i,g2_j,g2_v,31,2209);
end
