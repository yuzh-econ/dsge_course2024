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
    T = RBC_JR_0.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(31, 47);
g1(1,8)=1;
g1(1,17)=(-(T(12)/(1-params(2))));
g1(1,18)=(-(T(12)*(-(params(3)*T(1)))/(1-params(2))));
g1(1,20)=(-(T(12)*T(17)/(1-params(2))));
g1(2,17)=(-(T(4)*T(13)));
g1(2,2)=(-(T(3)*T(15)));
g1(2,18)=1;
g1(3,9)=1;
g1(3,17)=(-T(14));
g1(3,18)=(-(T(14)*(-(params(3)*T(1)))));
g1(3,20)=(-(T(14)*T(17)));
g1(4,9)=(-T(6));
g1(4,10)=1;
g1(4,18)=(-(y(9)*T(5)));
g1(4,20)=(-(y(9)*T(19)));
g1(5,9)=(-(T(1)*(-params(3))));
g1(5,11)=1;
g1(5,20)=(-(y(9)*(-params(3))*T(16)));
g1(6,12)=1;
g1(6,39)=(-(params(6)*y(15)));
g1(6,15)=(-(params(6)*y(39)));
g1(7,9)=(-1);
g1(7,12)=1;
g1(7,13)=y(18)*params(4)/y(17);
g1(7,17)=(-(y(18)*params(4)*y(13)))/(y(17)*y(17));
g1(7,18)=params(4)*y(13)/y(17);
g1(8,11)=1;
g1(8,13)=1;
g1(8,40)=(-((1-params(4))*params(6)*y(43)/y(18)));
g1(8,18)=(-((-((1-params(4))*params(6)*y(40)*y(43)))/(y(18)*y(18))));
g1(8,43)=(-((1-params(4))*params(6)*y(40)/y(18)));
g1(9,10)=(-1)/y(12);
g1(9,12)=y(10)/(y(12)*y(12));
g1(9,19)=(-1);
g1(10,20)=(-(T(8)*y(24)*T(20)));
g1(10,21)=1;
g1(10,3)=(-(T(7)*T(21)));
g1(10,24)=(-(T(8)*y(20)*T(20)));
g1(11,19)=(-1);
g1(11,20)=(-(y(21)*params(5)))/(y(20)*y(20));
g1(11,21)=params(5)/y(20);
g1(12,17)=(-1);
g1(12,21)=1;
g1(12,23)=(-1);
g1(12,25)=(-1);
g1(13,3)=(-(1-params(7)));
g1(13,22)=1;
g1(13,23)=(-T(9));
g1(13,27)=(-(y(23)*(-(params(11)*2*(y(27)-1)))));
g1(14,4)=(-((-y(23))/(y(4)*y(4))));
g1(14,23)=(-(1/y(4)));
g1(14,27)=1;
g1(15,1)=(-((-(y(9)*params(6)))/(y(1)*y(1))));
g1(15,9)=(-(params(6)/y(1)));
g1(15,14)=1;
g1(16,41)=T(11);
g1(16,27)=y(28)*((-(params(11)*2*(y(27)-1)))-(params(11)*2*y(27)+(y(27)-1)*2*params(11)));
g1(16,44)=y(41)*y(45)*(2*params(11)*T(10)+2*params(11)*(y(44)-1)*2*y(44));
g1(16,28)=T(9)-(y(27)-1)*params(11)*2*y(27);
g1(16,45)=2*params(11)*(y(44)-1)*T(10)*y(41);
g1(17,16)=1;
g1(17,21)=(-((1-params(5))/y(3)/y(7)));
g1(17,3)=(-((-(y(21)*(1-params(5))))/(y(3)*y(3))/y(7)));
g1(17,7)=(-((-(y(21)*(1-params(5))/y(3)+(1-params(7))*y(28)))/(y(7)*y(7))));
g1(17,28)=(-((1-params(7))/y(7)));
g1(18,41)=y(42)-y(15);
g1(18,15)=(-y(41));
g1(18,42)=y(41);
g1(19,19)=(-(y(20)*y(26)));
g1(19,20)=(-(y(19)*y(26)));
g1(19,25)=1;
g1(19,26)=(-(y(20)*y(19)));
g1(20,5)=(-(params(8)*1/y(5)));
g1(20,24)=1/y(24);
g1(20,46)=(-params(10));
g1(21,6)=(-(params(9)*1/y(6)));
g1(21,25)=1/y(25);
g1(21,47)=(-params(10));
g1(22,21)=(-(1/(steady_state(14))));
g1(22,33)=1;
g1(23,22)=(-(1/(steady_state(15))));
g1(23,38)=1;
g1(24,23)=(-(1/(steady_state(16))));
g1(24,37)=1;
g1(25,17)=(-(1/(steady_state(10))));
g1(25,34)=1;
g1(26,19)=(-(1/(steady_state(12))));
g1(26,36)=1;
g1(27,20)=(-(1/(steady_state(13))));
g1(27,35)=1;
g1(28,15)=(-(1/(steady_state(8))));
g1(28,32)=1;
g1(29,21)=(-((-y(22))/(y(21)*y(21))));
g1(29,22)=(-(1/y(21)));
g1(29,29)=1;
g1(30,21)=(-((-y(23))/(y(21)*y(21))));
g1(30,23)=(-(1/y(21)));
g1(30,30)=1;
g1(31,17)=(-(1/y(21)));
g1(31,21)=(-((-y(17))/(y(21)*y(21))));
g1(31,31)=1;

end
