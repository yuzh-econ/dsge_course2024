function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
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

assert(length(T) >= 11);

T(1) = y(13)^params(1);
T(2) = y(10)-params(3)*T(1)*y(11);
T(3) = y(10)^params(4);
T(4) = y(11)^(1-params(4));
T(5) = params(3)*(-params(1))*y(13)^(params(1)-1);
T(6) = y(11)*T(5);
T(7) = (y(13)*y(17))^params(5);
T(8) = y(15)^(1-params(5));
T(9) = 1-params(11)*(y(20)-1)^2;
T(10) = y(20)^2;
T(11) = y(21)*(y(20)-1)*2*params(11)*T(10);

end
