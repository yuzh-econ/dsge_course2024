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
    T = RBC_basic.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(26, 33);
g1(1,4)=1;
g1(1,10)=(-(T(2)*getPowerDeriv(y(10),1-params(1),1)*T(10)/(1-params(5))));
g1(1,12)=(-(T(10)*T(1)*(-(getPowerDeriv(1-y(12),params(1),1)))/(1-params(5))));
g1(2,5)=1;
g1(2,10)=(-(T(5)*(1-params(1))*getPowerDeriv(y(10),(1-params(1))*(1-params(5))-1,1)));
g1(2,12)=(-(T(4)*(-(getPowerDeriv(1-y(12),params(1)*(1-params(5)),1)))));
g1(3,6)=1;
g1(3,10)=(-(T(7)*(-params(1))*getPowerDeriv(y(10),(1-params(1))*(1-params(5)),1)));
g1(3,12)=(-(T(6)*(-(getPowerDeriv(1-y(12),params(1)*(1-params(5))-1,1)))));
g1(4,5)=(-((-(params(3)*y(30)))/(y(5)*y(5))));
g1(4,30)=(-(params(3)/y(5)));
g1(4,7)=1;
g1(5,5)=1;
g1(5,30)=(-(params(3)*y(8)));
g1(5,8)=(-(params(3)*y(30)));
g1(6,7)=y(9);
g1(6,9)=y(7);
g1(7,5)=y(6)/(y(5)*y(5));
g1(7,6)=(-1)/y(5);
g1(7,11)=(-1);
g1(8,12)=(-(T(9)*y(16)*T(11)));
g1(8,13)=1;
g1(8,1)=(-(T(8)*getPowerDeriv(y(1),1-params(2),1)));
g1(8,16)=(-(T(9)*y(12)*T(11)));
g1(9,11)=(-1);
g1(9,12)=(-(y(13)*params(2)))/(y(12)*y(12));
g1(9,13)=params(2)/y(12);
g1(10,9)=1;
g1(10,31)=(-((1-params(2))/y(14)));
g1(10,14)=(-((-((1-params(2))*y(31)))/(y(14)*y(14))));
g1(11,10)=(-1);
g1(11,13)=1;
g1(11,15)=(-1);
g1(11,17)=(-1);
g1(12,1)=(-(1-params(4)));
g1(12,14)=1;
g1(12,15)=(-1);
g1(13,2)=(-(params(12)*1/y(2)));
g1(13,16)=1/y(16);
g1(13,32)=(-params(14));
g1(14,3)=(-(params(13)*1/y(3)));
g1(14,17)=1/y(17);
g1(14,33)=(-params(14));
g1(15,13)=(-(1/(steady_state(10))/(y(13)/(steady_state(10)))));
g1(15,21)=1;
g1(16,14)=(-(1/(steady_state(11))/(y(14)/(steady_state(11)))));
g1(16,26)=1;
g1(17,15)=(-(1/(steady_state(12))/(y(15)/(steady_state(12)))));
g1(17,25)=1;
g1(18,10)=(-(1/(steady_state(7))/(y(10)/(steady_state(7)))));
g1(18,22)=1;
g1(19,11)=(-(1/(steady_state(8))/(y(11)/(steady_state(8)))));
g1(19,24)=1;
g1(20,12)=(-(1/(steady_state(9))/(y(12)/(steady_state(9)))));
g1(20,23)=1;
g1(21,8)=(-(1/(steady_state(5))/(y(8)/(steady_state(5)))));
g1(21,27)=1;
g1(22,16)=(-(1/(steady_state(13))/(y(16)/(steady_state(13)))));
g1(22,28)=1;
g1(23,17)=(-(1/(steady_state(14))/(y(17)/(steady_state(14)))));
g1(23,29)=1;
g1(24,13)=(-((-y(14))/(y(13)*y(13))));
g1(24,14)=(-(1/y(13)));
g1(24,18)=1;
g1(25,13)=(-((-y(15))/(y(13)*y(13))));
g1(25,15)=(-(1/y(13)));
g1(25,19)=1;
g1(26,10)=(-(1/y(13)));
g1(26,13)=(-((-y(10))/(y(13)*y(13))));
g1(26,20)=1;

end
