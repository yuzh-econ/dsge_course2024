function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = NK_SW_noUtilization.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(42, 83);
g1(1,18)=1;
g1(1,60)=(-T(35));
g1(1,19)=(-1);
g1(2,19)=1;
g1(2,1)=(-(T(1)*T(50)*T(51)/(1-params(9))));
g1(2,20)=(-(T(1)*T(51)/(1-params(9))));
g1(2,21)=(-(T(37)*T(57)));
g1(3,2)=(-((1-params(3))/T(34)));
g1(3,22)=1;
g1(3,23)=(-(y(26)*(-y(25))));
g1(3,25)=(-((1-y(23))*y(26)));
g1(3,26)=(-((1-y(23))*y(25)));
g1(4,24)=1;
g1(4,3)=(-((-(y(25)*T(34)))/(y(3)*y(3))));
g1(4,25)=(-(T(34)/y(3)));
g1(5,23)=1;
g1(5,24)=(-(params(11)*2*(y(24)-1-params(7)/100)));
g1(6,24)=(-(2*params(11)));
g1(6,27)=1;
g1(7,19)=(-((1-params(9))/T(36)));
g1(7,1)=(-((-(y(19)*(1-params(9))*T(50)))/(T(36)*T(36))));
g1(7,20)=(-((-(y(19)*(1-params(9))))/(T(36)*T(36))));
g1(7,28)=1;
g1(8,19)=(-(T(47)/(T(42)*T(42))));
g1(8,61)=(-((-(T(38)*T(49)))/(T(42)*T(42))));
g1(8,1)=(-(T(53)/(T(42)*T(42))));
g1(8,20)=(-((T(2)*T(42)-T(38)*T(54))/(T(42)*T(42))));
g1(8,62)=(-((-(T(38)*T(55)))/(T(42)*T(42))));
g1(8,21)=(-(T(59)/T(42)));
g1(8,29)=1;
g1(9,32)=(-(y(69)*y(33)));
g1(9,33)=(-(y(32)*y(69)));
g1(9,69)=(-(y(32)*y(33)));
g1(10,67)=(-y(68));
g1(10,68)=(-(y(67)+(1-params(3))*y(70)));
g1(10,35)=1;
g1(10,70)=(-((1-params(3))*y(68)));
g1(11,23)=(-(y(26)*(-y(35))));
g1(11,24)=(-(y(26)*y(35)*(-y(27))));
g1(11,63)=(-(y(64)*y(68)*y(70)*y(65)*2*y(63)));
g1(11,26)=(-(y(35)*(1-y(23)-y(24)*y(27))));
g1(11,64)=(-T(4));
g1(11,27)=(-(y(26)*y(35)*(-y(24))));
g1(11,65)=(-(y(64)*y(68)*y(70)*T(3)));
g1(11,68)=(-(y(64)*T(3)*y(70)*y(65)));
g1(11,35)=(-(y(26)*(1-y(23)-y(24)*y(27))));
g1(11,70)=(-(y(64)*T(3)*y(68)*y(65)));
g1(12,28)=(-((-(y(66)*params(8)*T(39)))/(y(28)*y(28))));
g1(12,66)=(-(params(8)*T(39)/y(28)));
g1(12,68)=1;
g1(13,34)=1;
g1(13,7)=(-(1/y(38)));
g1(13,38)=(-((-y(7))/(y(38)*y(38))));
g1(14,36)=1;
g1(15,31)=1;
g1(16,38)=(-(y(40)*T(34)/y(9)));
g1(16,39)=1;
g1(16,9)=(-(y(38)*(-(y(40)*T(34)))/(y(9)*y(9))));
g1(16,40)=(-(y(38)*T(34)/y(9)));
g1(17,29)=(-(y(43)*T(5)*y(42)));
g1(17,68)=(-(y(73)*T(8)*params(13)*T(34)));
g1(17,38)=(-(y(73)*y(68)*params(13)*T(34)*T(75)));
g1(17,72)=(-(y(73)*y(68)*params(13)*T(34)*T(92)/T(7)));
g1(17,41)=1;
g1(17,73)=(-(T(8)*y(68)*params(13)*T(34)));
g1(17,42)=(-(y(29)*T(5)*y(43)));
g1(17,43)=(-(y(29)*T(5)*y(42)));
g1(18,68)=(-(y(74)*params(13)*T(11)));
g1(18,38)=(-(y(74)*y(68)*params(13)*T(79)));
g1(18,71)=(-(y(74)*y(68)*params(13)*(-(T(6)*T(9)))/(T(10)*T(10))));
g1(18,72)=(-(y(74)*y(68)*params(13)*T(92)/T(10)));
g1(18,42)=(-1);
g1(18,44)=1;
g1(18,74)=(-(y(68)*params(13)*T(11)));
g1(19,40)=(-((-(y(41)*y(44)))/(y(40)*y(44)*y(40)*y(44))));
g1(19,41)=(-(1/(y(40)*y(44))));
g1(19,44)=(-((-(y(40)*y(41)))/(y(40)*y(44)*y(40)*y(44))));
g1(19,45)=1;
g1(20,8)=(-(params(13)*T(64)*T(65)));
g1(20,39)=(-(params(13)*T(65)*(-T(12))/(y(39)*y(39))));
g1(20,45)=(-((1-params(13))*getPowerDeriv(y(45),1-params(5),1)));
g1(21,8)=(-(y(11)*params(13)*T(67)/(T(15)*T(15))));
g1(21,39)=(-(y(11)*params(13)*T(91)/T(15)));
g1(21,45)=(-((1-params(13))*getPowerDeriv(y(45),(-params(5)),1)));
g1(21,11)=(-(params(13)*T(14)/T(15)));
g1(21,46)=1;
g1(22,2)=(-(T(16)*T(61)));
g1(22,42)=(-(T(44)*y(48)*T(93)));
g1(22,47)=1;
g1(22,48)=(-(T(44)*y(42)*T(93)));
g1(23,40)=1;
g1(23,42)=(-((-(params(2)*y(49)*(y(47)+params(18)*(steady_state(30)))))/(y(42)*y(42))));
g1(23,47)=(-(params(2)*y(49)/y(42)));
g1(23,49)=(-(params(2)*(y(47)+params(18)*(steady_state(30)))/y(42)));
g1(24,2)=(-((-((y(47)+params(18)*(steady_state(30)))*(1-params(2))*y(49)*T(60)))/(T(43)*T(43))));
g1(24,30)=1;
g1(24,47)=(-((1-params(2))*y(49)/T(43)));
g1(24,49)=(-((1-params(2))*(y(47)+params(18)*(steady_state(30)))/T(43)));
g1(25,49)=(-1);
g1(25,50)=1;
g1(26,68)=(-(y(75)*T(21)*params(12)*T(34)));
g1(26,38)=(-(y(75)*y(68)*params(12)*T(34)*T(82)));
g1(26,71)=(-(y(75)*y(68)*params(12)*T(34)*T(88)));
g1(26,50)=(-(T(18)*y(53)));
g1(26,51)=1;
g1(26,75)=(-(T(21)*y(68)*params(12)*T(34)));
g1(26,52)=(-(y(53)*y(50)*T(17)));
g1(26,53)=(-(y(50)*T(18)));
g1(27,68)=(-(y(76)*T(24)*params(12)*T(34)));
g1(27,38)=(-(y(76)*y(68)*params(12)*T(34)*T(85)));
g1(27,71)=(-(y(76)*y(68)*params(12)*T(34)*T(90)));
g1(27,52)=(-1);
g1(27,54)=1;
g1(27,76)=(-(T(24)*y(68)*params(12)*T(34)));
g1(28,51)=(-(1/y(54)));
g1(28,54)=(-((-y(51))/(y(54)*y(54))));
g1(28,55)=1;
g1(29,8)=(-(params(12)*T(69)*T(70)));
g1(29,38)=(-(params(12)*T(70)*(-T(25))/(y(38)*y(38))));
g1(29,55)=(-((1-params(12))*getPowerDeriv(y(55),1-params(4),1)));
g1(30,8)=(-(y(15)*params(12)*T(72)/(T(28)*T(28))));
g1(30,38)=(-(y(15)*params(12)*T(86)/T(28)));
g1(30,55)=(-((1-params(12))*getPowerDeriv(y(55),(-params(4)),1)));
g1(30,15)=(-(params(12)*T(27)/T(28)));
g1(30,56)=1;
g1(31,7)=(-(params(19)*T(62)/T(30)));
g1(31,37)=T(62)/T(29);
g1(31,38)=(-((1-params(19))*params(20)*1/(steady_state(21))/T(31)));
g1(31,13)=(-((1-params(19))*params(22)*T(94)/T(33)));
g1(31,52)=(-((1-params(19))*(params(21)*1/(steady_state(35))/T(32)+params(22)*T(95)/T(33))));
g1(31,57)=(-(1/y(57)));
g1(32,20)=(-1);
g1(32,25)=(-1);
g1(32,52)=1;
g1(32,58)=(-1);
g1(33,21)=1;
g1(33,42)=(-y(46));
g1(33,46)=(-y(42));
g1(34,47)=1;
g1(34,52)=(-y(56));
g1(34,56)=(-y(52));
g1(35,30)=(-(1/y(6)));
g1(35,6)=(-((-(y(30)+(1-params(3))*y(35)))/(y(6)*y(6))));
g1(35,35)=(-((1-params(3))/y(6)));
g1(35,59)=1;
g1(36,12)=(-(params(23)*1/y(12)));
g1(36,48)=1/y(48);
g1(36,77)=(-1);
g1(37,17)=(-(params(24)*1/y(17)));
g1(37,58)=1/y(58);
g1(37,78)=(-1);
g1(38,14)=(-(params(25)*1/y(14)));
g1(38,53)=1/y(53);
g1(38,79)=(-1);
g1(39,10)=(-(params(26)*1/y(10)));
g1(39,43)=1/y(43);
g1(39,82)=(-1);
g1(40,4)=(-(params(29)*1/y(4)));
g1(40,26)=1/y(26);
g1(40,81)=(-1);
g1(41,16)=(-(params(27)*1/y(16)));
g1(41,57)=1/y(57);
g1(41,80)=(-1);
g1(42,5)=(-(params(28)*1/y(5)));
g1(42,32)=1/y(32);
g1(42,83)=(-1);

end
