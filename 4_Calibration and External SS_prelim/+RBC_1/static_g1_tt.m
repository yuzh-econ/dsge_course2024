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

assert(length(T) >= 13);

T = RBC_1.static_resid_tt(T, y, x, params);

T(10) = getPowerDeriv(T(3),1-params(5),1);
T(11) = getPowerDeriv(y(10)*y(14),params(2),1);
T(12) = 1/y(14)-1/(y(14));
T(13) = 1/y(15)-1/(y(15));

end