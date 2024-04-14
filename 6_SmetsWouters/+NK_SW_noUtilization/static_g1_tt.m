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

assert(length(T) >= 42);

T = NK_SW_noUtilization.static_resid_tt(T, y, x, params);

T(30) = 1/y(9)-1/(y(9));
T(31) = 1/y(15)-1/(y(15));
T(32) = ((y(20))-y(20))/((y(20))*(y(20)))/(y(20)/(y(20)));
T(33) = (-(T(11)*getPowerDeriv(y(21),params(5)*params(15),1)))/(T(12)*T(12));
T(34) = getPowerDeriv(T(17),1-params(5),1);
T(35) = (T(24)*getPowerDeriv(y(21),params(4),1)-T(23)*getPowerDeriv(y(21),params(4)*params(14),1))/(T(24)*T(24));
T(36) = getPowerDeriv(y(22),params(5),1);
T(37) = getPowerDeriv(y(25)*y(31),params(2),1);
T(38) = 1/y(26)-1/(y(26));
T(39) = 1/y(31)-1/(y(31));
T(40) = 1/y(36)-1/(y(36));
T(41) = 1/y(40)-1/(y(40));
T(42) = 1/y(41)-1/(y(41));

end
