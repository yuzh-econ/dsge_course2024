function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 46);

T(1) = exp((params(9)-1)*y(21)^(1+params(16))/(1+params(16)));
T(2) = y(21)^params(16);
T(3) = y(64)^2;
T(4) = y(69)*y(71)*y(66)*T(3);
T(5) = 1/(1-1/params(5));
T(6) = y(75)^params(5);
T(7) = y(39)^(params(5)*params(15));
T(8) = T(6)/T(7);
T(9) = y(39)^(params(15)*(params(5)-1));
T(10) = T(9)*y(74);
T(11) = T(6)/T(10);
T(12) = y(8)^params(15);
T(13) = T(12)/y(40);
T(14) = y(40)^params(5);
T(15) = y(8)^(params(5)*params(15));
T(16) = (y(43)*y(49))^params(2);
T(17) = 1/(1-1/params(4));
T(18) = T(17)*y(53);
T(19) = y(74)^params(4);
T(20) = y(39)^(params(4)*params(14));
T(21) = T(19)/T(20);
T(22) = y(74)^(params(4)-1);
T(23) = y(39)^(params(14)*(params(4)-1));
T(24) = T(22)/T(23);
T(25) = y(8)^params(14);
T(26) = T(25)/y(39);
T(27) = y(39)^params(4);
T(28) = y(8)^(params(4)*params(14));
T(29) = y(38)/(steady_state(21));
T(30) = y(7)/(steady_state(21));
T(31) = y(39)/(steady_state(22));
T(32) = y(53)/(steady_state(36));
T(33) = y(53)/y(13);
T(34) = 1+params(7)/100;
T(35) = params(8)*T(34)^(1-params(9));
T(36) = y(20)-params(10)*y(1)/T(34);
T(37) = T(36)^(1-params(9))/(1-params(9));
T(38) = T(2)*T(36);
T(39) = T(34)^(-params(9));
T(40) = y(62)*params(8)*params(10)*T(39)/y(19);
T(41) = y(63)-y(20)*params(10)/T(34);
T(42) = 1-T(36)*T(40)/T(41);
T(43) = y(2)*y(36)/T(34);
T(44) = T(43)^(1-params(2));
T(45) = 1/(params(8)*T(39))-(1-params(3));
T(46) = params(17)/(1-params(17))*T(45)/2;

end
