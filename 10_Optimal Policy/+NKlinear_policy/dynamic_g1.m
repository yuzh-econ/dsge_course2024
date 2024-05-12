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
    T = NKlinear_policy.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(32, 55);
g1(1,31)=1;
g1(1,34)=(-(params(6)*(params(5)-1)*params(20)/(1-params(20))));
g1(1,11)=(-(((1-params(6))*(1-params(5))-1)*(-(params(13)/(1-params(13))))));
g1(1,40)=(-(((1-params(6))*(1-params(5))-1)*1/(1-params(13))));
g1(2,31)=(-1);
g1(2,50)=1;
g1(2,33)=1;
g1(3,31)=1;
g1(3,32)=1;
g1(3,34)=params(20)/(1-params(20));
g1(3,11)=(-(params(13)/(1-params(13))));
g1(3,40)=1/(1-params(13));
g1(4,31)=1;
g1(4,32)=1;
g1(4,39)=1;
g1(5,23)=(-params(2));
g1(5,34)=(-params(2));
g1(5,35)=1;
g1(5,8)=(-(1-params(2)));
g1(6,34)=1;
g1(6,35)=(-1);
g1(6,39)=1;
g1(7,35)=1;
g1(7,37)=(-params(26));
g1(7,38)=(-params(25));
g1(7,40)=(-params(27));
g1(8,8)=(-(1-params(4)));
g1(8,36)=1;
g1(8,37)=(-params(4));
g1(9,35)=(-((params(4)+params(21)-1)/params(21)));
g1(9,8)=(params(4)+params(21)-1)/params(21);
g1(9,41)=(-((1-params(4))/params(21)));
g1(9,42)=1;
g1(10,33)=1;
g1(10,41)=1;
g1(10,52)=(-1);
g1(11,9)=(-1);
g1(11,37)=1+1/params(21);
g1(11,51)=(-(1/params(21)));
g1(11,41)=(-(1/(2*params(11))));
g1(12,34)=(-1);
g1(12,38)=1;
g1(12,39)=(-1);
g1(12,43)=(-1);
g1(13,10)=(-params(8));
g1(13,38)=1;
g1(13,54)=(-1);
g1(14,13)=1;
g1(14,18)=(-(params(6)*(params(5)-1)*params(18)/(1-params(18))));
g1(14,5)=(-(((1-params(6))*(1-params(5))-1)*(-(params(13)/(1-params(13))))));
g1(14,25)=(-(((1-params(6))*(1-params(5))-1)*1/(1-params(13))));
g1(15,13)=(-1);
g1(15,45)=1;
g1(15,46)=1;
g1(16,13)=1;
g1(16,14)=1;
g1(16,18)=params(18)/(1-params(18));
g1(16,5)=(-(params(13)/(1-params(13))));
g1(16,25)=1/(1-params(13));
g1(17,13)=1;
g1(17,14)=1;
g1(17,17)=1;
g1(18,18)=(-params(2));
g1(18,19)=1;
g1(18,1)=(-(1-params(2)));
g1(18,23)=(-params(2));
g1(19,17)=(-1);
g1(19,18)=(-1);
g1(19,19)=1;
g1(19,29)=1;
g1(20,19)=1;
g1(20,21)=(-params(24));
g1(20,24)=(-params(25));
g1(20,25)=(-params(23));
g1(21,1)=(-(1-params(4)));
g1(21,20)=1;
g1(21,21)=(-params(4));
g1(22,19)=(-((params(4)+params(19)-1)/params(19)));
g1(22,1)=(params(4)+params(19)-1)/params(19);
g1(22,26)=(-((1-params(4))/params(19)));
g1(22,27)=1;
g1(22,29)=(-((params(4)+params(19)-1)/params(19)));
g1(23,46)=1;
g1(23,26)=1;
g1(23,48)=(-1);
g1(24,2)=(-1);
g1(24,21)=1+1/params(19);
g1(24,47)=(-(1/params(19)));
g1(24,26)=(-(1/(2*params(11))));
g1(25,17)=(-1);
g1(25,18)=(-1);
g1(25,22)=(-1);
g1(25,24)=1;
g1(26,6)=(-(params(14)/(1+params(3)*params(14))));
g1(26,28)=1;
g1(26,49)=(-(params(3)/(1+params(3)*params(14))));
g1(26,29)=(-((1-params(3)*params(12))*(1-params(12))/((1+params(3)*params(14))*params(12))));
g1(26,44)=(-((1-params(3)*params(12))*(1-params(12))/((1+params(3)*params(14))*params(12))));
g1(27,19)=(-params(30));
g1(27,28)=(-params(29));
g1(27,7)=(-(exp(params(28))/(1+exp(params(28)))));
g1(27,30)=1;
g1(27,35)=params(30);
g1(28,15)=1;
g1(28,28)=1;
g1(28,7)=(-1);
g1(29,16)=1;
g1(29,49)=1;
g1(29,30)=(-1);
g1(30,3)=(-params(7));
g1(30,23)=1;
g1(30,53)=(-1);
g1(31,4)=(-params(8));
g1(31,24)=1;
g1(31,54)=(-1);
g1(32,12)=(-params(9));
g1(32,44)=1;
g1(32,55)=(-1);

end
