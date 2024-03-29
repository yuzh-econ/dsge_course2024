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

assert(length(T) >= 31);

T(1) = (y(26)-params(16)*y(2))^(1-y(91));
T(2) = (1-y(28))^y(91);
T(3) = T(1)*T(2);
T(4) = (T(3)^(1-params(6))-1)/(1-params(6));
T(5) = (y(26)-params(16)*y(2))^((1-y(91))*(1-params(6))-1);
T(6) = (1-y(91))*y(78)*T(5);
T(7) = (1-y(28))^(y(91)*(1-params(6)));
T(8) = (y(26)-params(16)*y(2))^((1-y(91))*(1-params(6)));
T(9) = y(91)*(-y(78))*T(8);
T(10) = (1-y(28))^(y(91)*(1-params(6))-1);
T(11) = y(51)^params(2);
T(12) = y(49)/y(47);
T(13) = (y(28)*y(34))^params(3);
T(14) = y(3)^(1-params(3));
T(15) = y(97)^2;
T(16) = 1/(1-1/params(2));
T(17) = y(29)*T(16);
T(18) = y(51)^(params(2)-1);
T(19) = y(9)^params(17);
T(20) = (y(65)-params(16)*y(16))^(1-y(91));
T(21) = (1-y(60))^y(91);
T(22) = T(20)*T(21);
T(23) = (y(65)-params(16)*y(16))^((1-y(91))*(1-params(6))-1);
T(24) = (1-y(91))*T(23);
T(25) = (1-y(60))^(y(91)*(1-params(6)));
T(26) = (y(65)-params(16)*y(16))^((1-y(91))*(1-params(6)));
T(27) = (-y(91))*T(26);
T(28) = (1-y(60))^(y(91)*(1-params(6))-1);
T(29) = (y(34)*y(60))^params(3);
T(30) = y(14)^(1-params(3));
T(31) = y(105)^2;

end
