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

assert(length(T) >= 44);

T = NK.static_resid_tt(T, y, x, params);

T(31) = getPowerDeriv(T(3),1-params(6),1);
T(32) = (-(1/y(10)));
T(33) = getPowerDeriv(y(9)*y(15),params(3),1);
T(34) = 1/y(15)-1/(y(15));
T(35) = getPowerDeriv(y(15)*y(41),params(3),1);
T(36) = 1/y(16)-1/(y(16));
T(37) = ((y(24))-y(24))/((y(24))*(y(24)))/(y(24)/(y(24)));
T(38) = getPowerDeriv(T(11),(-params(2)),1);
T(39) = getPowerDeriv(T(11),1-params(2),1);
T(40) = getPowerDeriv(y(32),params(2),1);
T(41) = getPowerDeriv(y(32),params(2)-1,1);
T(42) = 1/y(34)-1/(y(34));
T(43) = 1/y(39)-1/(y(39));
T(44) = getPowerDeriv(T(21),1-params(6),1);

end
