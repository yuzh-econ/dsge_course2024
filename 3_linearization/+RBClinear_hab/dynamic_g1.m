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
    T = RBClinear_hab.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(11, 19);
g1(1,5)=1;
g1(1,8)=(-(params(1)*(params(5)-1)*params(9)/(1-params(9))));
g1(1,2)=(-(((1-params(1))*(1-params(5))-1)*(-params(15))/(1-params(15))));
g1(1,13)=(-(((1-params(1))*(1-params(5))-1)*1/(1-params(15))));
g1(2,5)=(-1);
g1(2,16)=1;
g1(2,7)=1;
g1(3,5)=(-1);
g1(3,6)=1;
g1(3,8)=(-(params(9)/(1-params(9))));
g1(3,13)=(-1);
g1(4,5)=1;
g1(4,6)=(-1);
g1(4,9)=1;
g1(5,8)=(-params(2));
g1(5,10)=1;
g1(5,1)=(-(1-params(2)));
g1(5,14)=(-params(2));
g1(6,7)=(-(params(10)/(params(10)-1+params(4))));
g1(6,17)=1;
g1(6,11)=(-1);
g1(7,8)=1;
g1(7,9)=1;
g1(7,10)=(-1);
g1(8,10)=1;
g1(8,12)=(-params(7));
g1(8,13)=(-params(6));
g1(8,15)=(-params(8));
g1(9,1)=(-(1-params(4)));
g1(9,11)=1;
g1(9,12)=(-params(4));
g1(10,3)=(-params(12));
g1(10,14)=1;
g1(10,18)=(-params(14));
g1(11,4)=(-params(13));
g1(11,15)=1;
g1(11,19)=(-params(14));

end
