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

assert(length(T) >= 18);

T = RBC_JR_2.static_resid_tt(T, y, x, params);

T(12) = getPowerDeriv(T(2),1-params(2),1);
T(13) = getPowerDeriv(T(2),(-params(2)),1);
T(14) = getPowerDeriv(y(13),params(1),1);
T(15) = (-(y(11)*params(3)*T(14)));
T(16) = getPowerDeriv(y(13)*y(17),params(5),1);
T(17) = 1/y(17)-1/(y(17));
T(18) = 1/y(18)-1/(y(18));

end
