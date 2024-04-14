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

assert(length(T) >= 45);

T = NK_SW.static_resid_tt(T, y, x, params);

T(32) = getPowerDeriv(T(21),1-params(2),1);
T(33) = 1/y(9)-1/(y(9));
T(34) = 1/y(15)-1/(y(15));
T(35) = ((y(21))-y(21))/((y(21))*(y(21)))/(y(21)/(y(21)));
T(36) = (-(T(13)*getPowerDeriv(y(22),params(5)*params(15),1)))/(T(14)*T(14));
T(37) = getPowerDeriv(T(19),1-params(5),1);
T(38) = (T(26)*getPowerDeriv(y(22),params(4),1)-T(25)*getPowerDeriv(y(22),params(4)*params(14),1))/(T(26)*T(26));
T(39) = getPowerDeriv(y(23),params(5),1);
T(40) = getPowerDeriv(y(26)*y(32),params(2),1);
T(41) = 1/y(27)-1/(y(27));
T(42) = 1/y(32)-1/(y(32));
T(43) = 1/y(37)-1/(y(37));
T(44) = 1/y(41)-1/(y(41));
T(45) = 1/y(42)-1/(y(42));

end
