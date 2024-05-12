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
    T = NKlinear_Est_Habit.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(35, 60);
g1(1,32)=1;
g1(1,9)=(-(((1-params(7))*(1-T(5))-1)*(-(params(14)/(1-params(14))))));
g1(1,33)=(-(((1-params(7))*(1-T(5))-1)*1/(1-params(14))));
g1(1,34)=(-(params(21)/(1-params(21))*(params(7)-1)*T(5)));
g1(2,32)=(-1);
g1(2,54)=1;
g1(2,35)=1;
g1(3,32)=1;
g1(3,9)=(-(params(14)/(1-params(14))));
g1(3,33)=1/(1-params(14));
g1(3,34)=params(21)/(1-params(21));
g1(3,36)=1;
g1(4,32)=1;
g1(4,36)=1;
g1(4,37)=1;
g1(5,25)=(-params(2));
g1(5,34)=(-params(2));
g1(5,38)=1;
g1(5,10)=(-(1-params(2)));
g1(6,34)=1;
g1(6,37)=1;
g1(6,38)=(-1);
g1(7,33)=(-(1-T(2)-params(1)));
g1(7,38)=1;
g1(7,40)=(-T(2));
g1(7,41)=(-params(1));
g1(8,10)=(-(1-params(6)));
g1(8,39)=1;
g1(8,40)=(-params(6));
g1(9,38)=(-((params(6)+params(22)-1)/params(22)));
g1(9,10)=(params(6)+params(22)-1)/params(22);
g1(9,42)=1;
g1(9,43)=(-((1-params(6))/params(22)));
g1(10,35)=1;
g1(10,56)=(-1);
g1(10,43)=1;
g1(11,11)=(-1);
g1(11,40)=1+1/params(22);
g1(11,55)=(-(1/params(22)));
g1(11,43)=(-(1/(2*params(12))));
g1(12,34)=(-1);
g1(12,37)=(-1);
g1(12,41)=1;
g1(12,44)=(-1);
g1(13,12)=(-params(9));
g1(13,41)=1;
g1(13,58)=(-1);
g1(14,14)=1;
g1(14,17)=(-(params(19)/(1-params(19))*(params(7)-1)*T(5)));
g1(14,4)=(-(((1-params(7))*(1-T(5))-1)*(-(params(14)/(1-params(14))))));
g1(14,24)=(-(((1-params(7))*(1-T(5))-1)*1/(1-params(14))));
g1(15,14)=(-1);
g1(15,49)=1;
g1(15,50)=1;
g1(16,14)=1;
g1(16,15)=1;
g1(16,17)=params(19)/(1-params(19));
g1(16,4)=(-(params(14)/(1-params(14))));
g1(16,24)=1/(1-params(14));
g1(17,14)=1;
g1(17,15)=1;
g1(17,18)=1;
g1(18,19)=(-1);
g1(18,20)=1;
g1(19,17)=(-params(2));
g1(19,19)=1;
g1(19,2)=(-(1-params(2)));
g1(19,25)=(-params(2));
g1(20,17)=(-1);
g1(20,18)=(-1);
g1(20,19)=1;
g1(20,30)=1;
g1(21,20)=1;
g1(21,22)=(-T(1));
g1(21,24)=(-(1-T(1)-params(1)));
g1(21,26)=(-params(1));
g1(22,2)=(-(1-params(6)));
g1(22,21)=1;
g1(22,22)=(-params(6));
g1(23,19)=(-((params(6)+params(20)-1)/params(20)));
g1(23,2)=(params(6)+params(20)-1)/params(20);
g1(23,27)=1;
g1(23,28)=(-((1-params(6))/params(20)));
g1(23,30)=(-((params(6)+params(20)-1)/params(20)));
g1(24,50)=1;
g1(24,52)=(-1);
g1(24,28)=1;
g1(25,3)=(-1);
g1(25,22)=1+1/params(20);
g1(25,51)=(-(1/params(20)));
g1(25,28)=(-(1/(2*params(12))));
g1(26,17)=(-1);
g1(26,18)=(-1);
g1(26,23)=(-1);
g1(26,26)=1;
g1(27,7)=(-(params(15)/(1+params(5)*params(15))));
g1(27,29)=1;
g1(27,53)=(-(params(5)/(1+params(5)*params(15))));
g1(27,30)=(-((1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))));
g1(27,45)=(-((1-params(5)*params(13))*(1-params(13))/((1+params(5)*params(15))*params(13))));
g1(28,20)=(-((1-params(16))*params(18)));
g1(28,29)=(-((1-params(16))*params(17)));
g1(28,8)=(-params(16));
g1(28,31)=1;
g1(28,59)=(-1);
g1(29,16)=1;
g1(29,29)=1;
g1(29,8)=(-1);
g1(30,5)=(-params(8));
g1(30,25)=1;
g1(30,57)=(-1);
g1(31,6)=(-params(9));
g1(31,26)=1;
g1(31,58)=(-1);
g1(32,13)=(-params(10));
g1(32,45)=1;
g1(32,60)=(-1);
g1(33,1)=1;
g1(33,20)=(-1);
g1(33,46)=1;
g1(34,29)=(-1);
g1(34,47)=1;
g1(35,31)=(-1);
g1(35,48)=1;

end
