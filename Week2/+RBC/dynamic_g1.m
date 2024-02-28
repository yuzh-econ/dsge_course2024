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
    T = RBC.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(28, 40);
g1(1,7)=1;
g1(1,13)=(-(T(2)*getPowerDeriv(y(13),1-params(1),1)*T(13)/(1-params(5))));
g1(1,15)=(-(T(13)*T(1)*(-(getPowerDeriv(1-y(15),params(1),1)))/(1-params(5))));
g1(2,8)=1;
g1(2,13)=(-(T(5)*(1-params(1))*getPowerDeriv(y(13),(1-params(1))*(1-params(5))-1,1)));
g1(2,15)=(-(T(4)*(-(getPowerDeriv(1-y(15),params(1)*(1-params(5)),1)))));
g1(3,9)=1;
g1(3,13)=(-(T(7)*(-params(1))*getPowerDeriv(y(13),(1-params(1))*(1-params(5)),1)));
g1(3,15)=(-(T(6)*(-(getPowerDeriv(1-y(15),params(1)*(1-params(5))-1,1)))));
g1(4,8)=1;
g1(4,35)=(-(params(3)*y(11)));
g1(4,11)=(-(params(3)*y(35)));
g1(5,8)=y(9)/(y(8)*y(8));
g1(5,9)=(-1)/y(8);
g1(5,14)=(-1);
g1(6,15)=(-(T(9)*y(19)*T(14)));
g1(6,16)=1;
g1(6,2)=(-(T(8)*getPowerDeriv(y(2),1-params(2),1)));
g1(6,19)=(-(T(9)*y(15)*T(14)));
g1(7,14)=(-1);
g1(7,15)=(-(y(16)*params(2)))/(y(15)*y(15));
g1(7,16)=params(2)/y(15);
g1(8,13)=(-1);
g1(8,16)=1;
g1(8,18)=(-1);
g1(8,20)=(-1);
g1(9,2)=(-(1-params(4)));
g1(9,17)=1;
g1(9,18)=(-T(10));
g1(9,22)=(-(y(18)*(-(params(9)*2*(y(22)-1)))));
g1(10,3)=(-((-y(18))/(y(3)*y(3))));
g1(10,18)=(-(1/y(3)));
g1(10,22)=1;
g1(11,1)=(-((-(y(8)*params(3)))/(y(1)*y(1))));
g1(11,8)=(-(params(3)/y(1)));
g1(11,10)=1;
g1(12,10)=(-T(12));
g1(12,22)=(-(y(10)*y(23)*(2*params(9)*T(11)+(y(22)-1)*2*params(9)*2*y(22))));
g1(12,23)=(-(y(10)*(y(22)-1)*2*params(9)*T(11)));
g1(12,24)=1;
g1(13,22)=y(23)*((-(params(9)*2*(y(22)-1)))-((y(22)-1)*2*params(9)+params(9)*2*y(22)));
g1(13,23)=T(10)-(y(22)-1)*params(9)*2*y(22);
g1(13,38)=1;
g1(14,12)=1;
g1(14,16)=(-((1-params(2))/y(2)/y(6)));
g1(14,2)=(-((-(y(16)*(1-params(2))))/(y(2)*y(2))/y(6)));
g1(14,6)=(-((-(y(16)*(1-params(2))/y(2)+(1-params(4))*y(23)))/(y(6)*y(6))));
g1(14,23)=(-((1-params(4))/y(6)));
g1(15,36)=y(37)-y(11);
g1(15,11)=(-y(36));
g1(15,37)=y(36);
g1(16,14)=(-(y(15)*y(21)));
g1(16,15)=(-(y(14)*y(21)));
g1(16,20)=1;
g1(16,21)=(-(y(15)*y(14)));
g1(17,4)=(-(params(6)*1/y(4)));
g1(17,19)=1/y(19);
g1(17,39)=(-params(8));
g1(18,5)=(-(params(7)*1/y(5)));
g1(18,20)=1/y(20);
g1(18,40)=(-params(8));
g1(19,16)=(-(1/(steady_state(10))));
g1(19,29)=1;
g1(20,17)=(-(1/(steady_state(11))));
g1(20,34)=1;
g1(21,18)=(-(1/(steady_state(12))));
g1(21,33)=1;
g1(22,13)=(-(1/(steady_state(7))));
g1(22,30)=1;
g1(23,14)=(-(1/(steady_state(8))));
g1(23,32)=1;
g1(24,15)=(-(1/(steady_state(9))));
g1(24,31)=1;
g1(25,11)=(-(1/(steady_state(5))));
g1(25,28)=1;
g1(26,16)=(-((-y(17))/(y(16)*y(16))));
g1(26,17)=(-(1/y(16)));
g1(26,25)=1;
g1(27,16)=(-((-y(18))/(y(16)*y(16))));
g1(27,18)=(-(1/y(16)));
g1(27,26)=1;
g1(28,13)=(-(1/y(16)));
g1(28,16)=(-((-y(13))/(y(16)*y(16))));
g1(28,27)=1;

end
