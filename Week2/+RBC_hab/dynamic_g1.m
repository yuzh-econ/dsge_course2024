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
    T = RBC_hab.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(28, 41);
g1(1,8)=1;
g1(1,2)=(-(T(2)*(-params(2))*T(13)*T(14)/(1-params(6))));
g1(1,14)=(-(T(14)*T(2)*T(13)/(1-params(6))));
g1(1,16)=(-(T(14)*T(1)*(-(getPowerDeriv(1-y(16),params(1),1)))/(1-params(6))));
g1(2,9)=1;
g1(2,2)=(-(T(5)*(1-params(1))*(-params(2))*T(15)));
g1(2,14)=(-(T(5)*(1-params(1))*T(15)));
g1(2,16)=(-(T(4)*(-(getPowerDeriv(1-y(16),params(1)*(1-params(6)),1)))));
g1(3,10)=1;
g1(3,2)=(-(T(7)*(-params(1))*(-params(2))*T(16)));
g1(3,14)=(-(T(7)*(-params(1))*T(16)));
g1(3,16)=(-(T(6)*(-(getPowerDeriv(1-y(16),params(1)*(1-params(6))-1,1)))));
g1(4,9)=1;
g1(4,36)=(-(params(4)*y(12)));
g1(4,12)=(-(params(4)*y(36)));
g1(5,9)=y(10)/(y(9)*y(9));
g1(5,10)=(-1)/y(9);
g1(5,15)=(-1);
g1(6,16)=(-(T(9)*y(20)*T(17)));
g1(6,17)=1;
g1(6,3)=(-(T(8)*getPowerDeriv(y(3),1-params(3),1)));
g1(6,20)=(-(T(9)*y(16)*T(17)));
g1(7,15)=(-1);
g1(7,16)=(-(y(17)*params(3)))/(y(16)*y(16));
g1(7,17)=params(3)/y(16);
g1(8,14)=(-1);
g1(8,17)=1;
g1(8,19)=(-1);
g1(8,21)=(-1);
g1(9,3)=(-(1-params(5)));
g1(9,18)=1;
g1(9,19)=(-T(10));
g1(9,23)=(-(y(19)*(-(params(10)*2*(y(23)-1)))));
g1(10,4)=(-((-y(19))/(y(4)*y(4))));
g1(10,19)=(-(1/y(4)));
g1(10,23)=1;
g1(11,1)=(-((-(y(9)*params(4)))/(y(1)*y(1))));
g1(11,9)=(-(params(4)/y(1)));
g1(11,11)=1;
g1(12,11)=(-T(12));
g1(12,23)=(-(y(11)*y(24)*(2*params(10)*T(11)+(y(23)-1)*2*params(10)*2*y(23))));
g1(12,24)=(-(y(11)*(y(23)-1)*2*params(10)*T(11)));
g1(12,25)=1;
g1(13,23)=y(24)*((-(params(10)*2*(y(23)-1)))-((y(23)-1)*2*params(10)+params(10)*2*y(23)));
g1(13,24)=T(10)-(y(23)-1)*params(10)*2*y(23);
g1(13,39)=1;
g1(14,13)=1;
g1(14,17)=(-((1-params(3))/y(3)/y(7)));
g1(14,3)=(-((-(y(17)*(1-params(3))))/(y(3)*y(3))/y(7)));
g1(14,7)=(-((-(y(17)*(1-params(3))/y(3)+(1-params(5))*y(24)))/(y(7)*y(7))));
g1(14,24)=(-((1-params(5))/y(7)));
g1(15,37)=y(38)-y(12);
g1(15,12)=(-y(37));
g1(15,38)=y(37);
g1(16,15)=(-(y(16)*y(22)));
g1(16,16)=(-(y(15)*y(22)));
g1(16,21)=1;
g1(16,22)=(-(y(16)*y(15)));
g1(17,5)=(-(params(7)*1/y(5)));
g1(17,20)=1/y(20);
g1(17,40)=(-params(9));
g1(18,6)=(-(params(8)*1/y(6)));
g1(18,21)=1/y(21);
g1(18,41)=(-params(9));
g1(19,17)=(-(1/(steady_state(10))));
g1(19,30)=1;
g1(20,18)=(-(1/(steady_state(11))));
g1(20,35)=1;
g1(21,19)=(-(1/(steady_state(12))));
g1(21,34)=1;
g1(22,14)=(-(1/(steady_state(7))));
g1(22,31)=1;
g1(23,15)=(-(1/(steady_state(8))));
g1(23,33)=1;
g1(24,16)=(-(1/(steady_state(9))));
g1(24,32)=1;
g1(25,12)=(-(1/(steady_state(5))));
g1(25,29)=1;
g1(26,17)=(-((-y(18))/(y(17)*y(17))));
g1(26,18)=(-(1/y(17)));
g1(26,26)=1;
g1(27,17)=(-((-y(19))/(y(17)*y(17))));
g1(27,19)=(-(1/y(17)));
g1(27,27)=1;
g1(28,14)=(-(1/y(17)));
g1(28,17)=(-((-y(14))/(y(17)*y(17))));
g1(28,28)=1;

end
