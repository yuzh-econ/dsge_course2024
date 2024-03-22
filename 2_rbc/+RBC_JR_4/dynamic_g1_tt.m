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

assert(length(T) >= 21);

T = RBC_JR_4.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(12) = getPowerDeriv(T(2),1-params(2),1);
T(13) = getPowerDeriv(y(17),params(4),1);
T(14) = getPowerDeriv(T(2),(-params(2)),1);
T(15) = getPowerDeriv(y(2),1-params(4),1);
T(16) = getPowerDeriv(y(20),params(1),1);
T(17) = (-(y(18)*params(3)*T(16)));
T(18) = params(3)*(-params(1))*getPowerDeriv(y(20),params(1)-1,1);
T(19) = y(18)*T(18);
T(20) = getPowerDeriv(y(20)*y(24),params(5),1);
T(21) = getPowerDeriv(y(3),1-params(5),1);

end
