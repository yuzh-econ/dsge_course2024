function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 47);

T = NK_moreShocks.static_resid_tt(T, y, x, params);

T(32) = getPowerDeriv(T(3),1-params(6),1);
T(33) = (-(1/y(10)));
T(34) = getPowerDeriv(y(9)*y(15),params(3),1);
T(35) = 1/y(15)-1/(y(15));
T(36) = getPowerDeriv(y(15)*y(41),params(3),1);
T(37) = 1/y(16)-1/(y(16));
T(38) = ((y(24))-y(24))/((y(24))*(y(24)))/(y(24)/(y(24)));
T(39) = getPowerDeriv(T(12),(-params(2)),1);
T(40) = getPowerDeriv(T(12),1-params(2),1);
T(41) = getPowerDeriv(y(32),params(2),1);
T(42) = getPowerDeriv(y(32),params(2)-1,1);
T(43) = 1/y(34)-1/(y(34));
T(44) = 1/y(39)-1/(y(39));
T(45) = getPowerDeriv(T(22),1-params(6),1);
T(46) = 1/y(58)-1/(y(58));
T(47) = 1/y(59)-1/(y(59));

end
