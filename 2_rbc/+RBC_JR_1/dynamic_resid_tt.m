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

assert(length(T) >= 11);

T(1) = y(20)^params(1);
T(2) = y(17)-params(3)*T(1)*y(18);
T(3) = y(17)^params(4);
T(4) = y(2)^(1-params(4));
T(5) = params(3)*(-params(1))*y(20)^(params(1)-1);
T(6) = y(18)*T(5);
T(7) = (y(20)*y(24))^params(5);
T(8) = y(3)^(1-params(5));
T(9) = 1-params(11)*(y(27)-1)^2;
T(10) = y(44)^2;
T(11) = 2*params(11)*(y(44)-1)*T(10)*y(45);

end
