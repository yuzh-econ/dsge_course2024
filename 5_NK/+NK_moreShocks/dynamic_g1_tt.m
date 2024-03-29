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

assert(length(T) >= 46);

T = NK_moreShocks.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(32) = getPowerDeriv(y(26)-params(16)*y(2),1-y(91),1);
T(33) = getPowerDeriv(T(3),1-params(6),1);
T(34) = getPowerDeriv(y(26)-params(16)*y(2),(1-y(91))*(1-params(6))-1,1);
T(35) = getPowerDeriv(y(26)-params(16)*y(2),(1-y(91))*(1-params(6)),1);
T(36) = (-(1/y(29)));
T(37) = getPowerDeriv(y(28)*y(34),params(3),1);
T(38) = getPowerDeriv(y(34)*y(60),params(3),1);
T(39) = getPowerDeriv(T(12),(-params(2)),1);
T(40) = getPowerDeriv(T(12),1-params(2),1);
T(41) = getPowerDeriv(y(51),params(2),1);
T(42) = getPowerDeriv(y(51),params(2)-1,1);
T(43) = getPowerDeriv(T(22),1-params(6),1);
T(44) = getPowerDeriv(y(65)-params(16)*y(16),1-y(91),1);
T(45) = getPowerDeriv(y(65)-params(16)*y(16),(1-y(91))*(1-params(6))-1,1);
T(46) = getPowerDeriv(y(65)-params(16)*y(16),(1-y(91))*(1-params(6)),1);

end
