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

assert(length(T) >= 16);

T = RBC_hab.static_resid_tt(T, y, x, params);

T(13) = getPowerDeriv(T(3),1-params(6),1);
T(14) = getPowerDeriv(y(9)*y(13),params(3),1);
T(15) = 1/y(13)-1/(y(13));
T(16) = 1/y(14)-1/(y(14));

end
