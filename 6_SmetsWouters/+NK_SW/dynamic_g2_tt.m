function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 109);

T = NK_SW.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(99) = getPowerDeriv(T(36),1-params(9),2);
T(100) = T(52)*T(99);
T(101) = T(42)*T(42)*T(42)*T(42);
T(102) = T(42)*T(54)+T(42)*T(54);
T(103) = T(42)*T(56)+T(42)*T(56);
T(104) = T(42)*T(57)+T(42)*T(57);
T(105) = getPowerDeriv(y(75),params(5),2);
T(106) = getPowerDeriv(T(13),1-params(5),2);
T(107) = getPowerDeriv(T(43),1-params(2),2);
T(108) = getPowerDeriv(y(43)*y(49),params(2),2);
T(109) = getPowerDeriv(T(26),1-params(4),2);

end
