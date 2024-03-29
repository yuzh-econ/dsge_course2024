function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 35);

T = RBC_1.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(16) = T(13)*params(9)*2*y(35);
T(17) = getPowerDeriv(y(12),1-params(1),1);
T(18) = T(2)*T(17);
T(19) = getPowerDeriv(T(3),1-params(5),1);
T(20) = (1-params(1))*getPowerDeriv(y(12),(1-params(1))*(1-params(5))-1,1);
T(21) = (-params(1))*getPowerDeriv(y(12),(1-params(1))*(1-params(5)),1);
T(22) = (-(getPowerDeriv(1-y(14),params(1),1)));
T(23) = (-(getPowerDeriv(1-y(14),params(1)*(1-params(5)),1)));
T(24) = (-(getPowerDeriv(1-y(14),params(1)*(1-params(5))-1,1)));
T(25) = getPowerDeriv(y(14)*y(18),params(2),1);
T(26) = getPowerDeriv(y(1),1-params(2),1);
T(27) = (-y(17))/(y(2)*y(2));
T(28) = (-(params(9)*T(27)*2*(T(10)-1)));
T(29) = 1/y(2);
T(30) = (-(params(9)*2*(T(10)-1)*T(29)));
T(31) = (-y(34))/(y(17)*y(17));
T(32) = 2*y(34)/y(17);
T(33) = T(31)*T(32);
T(34) = 1/y(17);
T(35) = T(32)*T(34);

end
