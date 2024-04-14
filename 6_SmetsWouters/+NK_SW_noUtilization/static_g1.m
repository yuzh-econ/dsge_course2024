function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = NK_SW_noUtilization.static_g1_tt(T, y, x, params);
end
g1 = zeros(42, 42);
g1(1,1)=1-T(3);
g1(1,2)=(-1);
g1(2,2)=1;
g1(2,3)=(-(T(4)*(1-params(10)/T(1))*getPowerDeriv(T(5),1-params(9),1)/(1-params(9))));
g1(2,4)=(-(T(6)*T(4)*(params(9)-1)*getPowerDeriv(y(4),1+params(16),1)/(1+params(16))));
g1(3,5)=1-(1-params(3))/T(1);
g1(3,6)=(-(y(9)*(-y(8))));
g1(3,8)=(-((1-y(6))*y(9)));
g1(3,9)=(-((1-y(6))*y(8)));
g1(4,7)=1;
g1(5,6)=1;
g1(5,7)=(-(params(11)*2*(y(7)-1-params(7)/100)));
g1(6,7)=(-(2*params(11)));
g1(6,10)=1;
g1(7,2)=(-((1-params(9))/T(5)));
g1(7,3)=(-((-(y(2)*(1-params(9))*(1-params(10)/T(1))))/(T(5)*T(5))));
g1(7,11)=1;
g1(8,3)=(-(T(7)*(1-params(10)/T(1))/(1-T(2)*params(8)*params(10))));
g1(8,4)=(-(T(5)*getPowerDeriv(y(4),params(16),1)/(1-T(2)*params(8)*params(10))));
g1(8,12)=1;
g1(9,15)=(-(y(17)*y(16)));
g1(9,16)=(-(y(15)*y(17)));
g1(9,17)=(-(y(15)*y(16)));
g1(10,13)=(-y(16));
g1(10,16)=(-(y(13)+(1-params(3))*y(18)));
g1(10,18)=1-(1-params(3))*y(16);
g1(11,6)=(-(y(9)*(-y(18))));
g1(11,7)=(-(y(9)*y(18)*(-y(10))+y(9)*y(10)*y(16)*y(18)*2*y(7)));
g1(11,9)=(-(y(18)*(1-y(6)-y(7)*y(10))+T(9)));
g1(11,10)=(-(y(9)*y(18)*(-y(7))+y(9)*y(16)*y(18)*T(8)));
g1(11,16)=(-(y(9)*T(8)*y(10)*y(18)));
g1(11,18)=(-(y(9)*(1-y(6)-y(7)*y(10))+y(9)*T(8)*y(10)*y(16)));
g1(12,16)=1;
g1(13,17)=1;
g1(13,20)=(-(1/y(21)));
g1(13,21)=(-((-y(20))/(y(21)*y(21))));
g1(14,19)=1;
g1(15,14)=1;
g1(16,21)=(-T(1));
g1(16,22)=1;
g1(17,12)=(-(y(26)*T(10)*y(25)));
g1(17,16)=(-(y(24)*T(13)*T(1)*params(13)));
g1(17,21)=(-(y(24)*y(16)*T(1)*params(13)*T(33)));
g1(17,22)=(-(y(24)*y(16)*T(1)*params(13)*T(36)/T(12)));
g1(17,24)=1-T(13)*y(16)*T(1)*params(13);
g1(17,25)=(-(y(12)*T(10)*y(26)));
g1(17,26)=(-(y(12)*T(10)*y(25)));
g1(18,16)=(-(y(27)*params(13)*T(15)));
g1(18,21)=(-(y(27)*y(16)*params(13)*(-(T(11)*(T(14)+y(21)*getPowerDeriv(y(21),params(15)*(params(5)-1),1))))/(y(21)*T(14)*y(21)*T(14))));
g1(18,22)=(-(y(27)*y(16)*params(13)*T(36)/(y(21)*T(14))));
g1(18,25)=(-1);
g1(18,27)=1-y(16)*params(13)*T(15);
g1(19,23)=(-((-(y(24)*y(27)))/(y(23)*y(27)*y(23)*y(27))));
g1(19,24)=(-(1/(y(23)*y(27))));
g1(19,27)=(-((-(y(23)*y(24)))/(y(23)*y(27)*y(23)*y(27))));
g1(19,28)=1;
g1(20,21)=(-(params(13)*getPowerDeriv(y(21),params(15),1)/y(22)*T(34)));
g1(20,22)=(-(params(13)*T(34)*(-T(16))/(y(22)*y(22))));
g1(20,28)=(-((1-params(13))*getPowerDeriv(y(28),1-params(5),1)));
g1(21,21)=(-(y(29)*params(13)*T(33)));
g1(21,22)=(-(y(29)*params(13)*T(36)/T(12)));
g1(21,28)=(-((1-params(13))*getPowerDeriv(y(28),(-params(5)),1)));
g1(21,29)=1-T(13)*params(13);
g1(22,5)=(-(T(18)*1/T(1)*getPowerDeriv(T(19),1-params(2),1)));
g1(22,25)=(-(T(20)*y(31)*T(37)));
g1(22,30)=1+params(18);
g1(22,31)=(-(T(20)*y(25)*T(37)));
g1(23,23)=1;
g1(23,25)=(-((-(params(2)*y(32)*(y(30)+params(18)*(y(30)))))/(y(25)*y(25))));
g1(23,30)=(-(params(2)*y(32)*(1+params(18))/y(25)));
g1(23,32)=(-(params(2)*(y(30)+params(18)*(y(30)))/y(25)));
g1(24,5)=(-((-((y(30)+params(18)*(y(30)))*(1-params(2))*y(32)*1/T(1)))/(T(19)*T(19))));
g1(24,13)=1;
g1(24,30)=(-((1-params(2))*y(32)*(1+params(18))/T(19)));
g1(24,32)=(-((1-params(2))*(y(30)+params(18)*(y(30)))/T(19)));
g1(25,32)=(-1);
g1(25,33)=1;
g1(26,16)=(-(y(34)*T(25)*T(1)*params(12)));
g1(26,21)=(-(y(34)*y(16)*T(1)*params(12)*T(35)));
g1(26,33)=(-(T(22)*y(36)));
g1(26,34)=1-T(25)*y(16)*T(1)*params(12);
g1(26,35)=(-(y(36)*y(33)*T(21)));
g1(26,36)=(-(y(33)*T(22)));
g1(27,16)=(-(y(37)*T(1)*params(12)*T(28)));
g1(27,21)=(-(y(37)*y(16)*T(1)*params(12)*(T(27)*getPowerDeriv(y(21),params(4)-1,1)-T(26)*getPowerDeriv(y(21),params(14)*(params(4)-1),1))/(T(27)*T(27))));
g1(27,35)=(-1);
g1(27,37)=1-y(16)*T(1)*params(12)*T(28);
g1(28,34)=(-(1/y(37)));
g1(28,37)=(-((-y(34))/(y(37)*y(37))));
g1(28,38)=1;
g1(29,21)=(-(params(12)*(y(21)*getPowerDeriv(y(21),params(14),1)-T(29))/(y(21)*y(21))*getPowerDeriv(T(29)/y(21),1-params(4),1)));
g1(29,38)=(-((1-params(12))*getPowerDeriv(y(38),1-params(4),1)));
g1(30,21)=(-(y(39)*params(12)*T(35)));
g1(30,38)=(-((1-params(12))*getPowerDeriv(y(38),(-params(4)),1)));
g1(30,39)=1-T(25)*params(12);
g1(31,20)=T(32)-params(19)*T(32);
g1(31,21)=(-((1-params(19))*params(20)*((y(21))-y(21))/((y(21))*(y(21)))/(y(21)/(y(21)))));
g1(31,35)=(-((1-params(19))*params(21)*((y(35))-y(35))/((y(35))*(y(35)))/(y(35)/(y(35)))));
g1(31,40)=(-(1/y(40)));
g1(32,3)=(-1);
g1(32,8)=(-1);
g1(32,35)=1;
g1(32,41)=(-1);
g1(33,4)=1;
g1(33,25)=(-y(29));
g1(33,29)=(-y(25));
g1(34,30)=1;
g1(34,35)=(-y(39));
g1(34,39)=(-y(35));
g1(35,13)=(-(1/y(18)));
g1(35,18)=(-(((1-params(3))*y(18)-(y(13)+(1-params(3))*y(18)))/(y(18)*y(18))));
g1(35,42)=1;
g1(36,31)=T(39)-params(23)*T(39);
g1(37,41)=T(42)-params(24)*T(42);
g1(38,36)=T(40)-params(25)*T(40);
g1(39,26)=T(38)-params(26)*T(38);
g1(40,9)=T(30)-params(29)*T(30);
g1(41,40)=T(41)-params(27)*T(41);
g1(42,15)=T(31)-params(28)*T(31);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
