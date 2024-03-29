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
    T = RBC_1.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(27, 37);
g1(1,5)=1;
g1(1,12)=(-(T(18)*T(19)/(1-params(5))));
g1(1,14)=(-(T(19)*T(1)*T(22)/(1-params(5))));
g1(2,6)=1;
g1(2,12)=(-(T(5)*T(20)));
g1(2,14)=(-(T(4)*T(23)));
g1(3,7)=1;
g1(3,12)=(-(T(7)*T(21)));
g1(3,14)=(-(T(6)*T(24)));
g1(4,8)=y(9);
g1(4,9)=y(8);
g1(5,6)=y(7)/(y(6)*y(6));
g1(5,7)=(-1)/y(6);
g1(5,13)=(-1);
g1(6,14)=(-(T(9)*y(18)*T(25)));
g1(6,15)=1;
g1(6,1)=(-(T(8)*T(26)));
g1(6,18)=(-(T(9)*y(14)*T(25)));
g1(7,13)=(-1);
g1(7,14)=(-(y(15)*params(2)))/(y(14)*y(14));
g1(7,15)=params(2)/y(14);
g1(8,12)=(-1);
g1(8,15)=1;
g1(8,17)=(-1);
g1(8,19)=(-1);
g1(9,1)=(-(1-params(4)));
g1(9,16)=1;
g1(9,2)=(-(y(17)*T(28)));
g1(9,17)=(-(T(11)+y(17)*T(30)));
g1(10,6)=(-((-(params(3)*y(32)))/(y(6)*y(6))));
g1(10,32)=(-(params(3)/y(6)));
g1(10,8)=1;
g1(11,8)=(-(T(15)*T(16)));
g1(11,2)=(-(y(21)*(T(28)-(T(12)*T(27)+T(10)*2*params(9)*T(27)))));
g1(11,17)=(-(y(21)*(T(30)-(T(12)*T(29)+T(10)*2*params(9)*T(29)))+T(15)*params(9)*2*y(8)*y(35)*T(31)+T(14)*T(33)));
g1(11,34)=(-(T(15)*params(9)*2*y(8)*y(35)*T(34)+T(14)*T(35)));
g1(11,21)=(-(T(11)-T(10)*T(12)));
g1(11,35)=(-(T(15)*T(13)*params(9)*2*y(8)));
g1(12,11)=1;
g1(12,15)=(-((1-params(2))/y(1)));
g1(12,1)=(-((-(y(15)*(1-params(2))))/(y(1)*y(1))));
g1(13,10)=1;
g1(13,33)=(-(1/y(21)));
g1(13,21)=(-((-(y(33)+(1-params(4))*y(35)))/(y(21)*y(21))));
g1(13,35)=(-((1-params(4))/y(21)));
g1(14,8)=y(10);
g1(14,10)=y(8);
g1(15,19)=1;
g1(15,20)=(-1);
g1(16,3)=(-(params(6)*1/y(3)));
g1(16,18)=1/y(18);
g1(16,36)=(-params(8));
g1(17,4)=(-(params(7)*1/y(4)));
g1(17,19)=1/y(19);
g1(17,37)=(-params(8));
g1(18,15)=(-(1/(steady_state(11))));
g1(18,26)=1;
g1(19,16)=(-(1/(steady_state(12))));
g1(19,31)=1;
g1(20,17)=(-(1/(steady_state(13))));
g1(20,30)=1;
g1(21,12)=(-(1/(steady_state(8))));
g1(21,27)=1;
g1(22,13)=(-(1/(steady_state(9))));
g1(22,29)=1;
g1(23,14)=(-(1/(steady_state(10))));
g1(23,28)=1;
g1(24,9)=(-(1/(steady_state(5))));
g1(24,25)=1;
g1(25,15)=(-((-y(16))/(y(15)*y(15))));
g1(25,16)=(-(1/y(15)));
g1(25,22)=1;
g1(26,15)=(-((-y(17))/(y(15)*y(15))));
g1(26,17)=(-(1/y(15)));
g1(26,23)=1;
g1(27,12)=(-(1/y(15)));
g1(27,15)=(-((-y(12))/(y(15)*y(15))));
g1(27,24)=1;

end
