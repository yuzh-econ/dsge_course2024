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

assert(length(T) >= 31);

T(1) = (y(7)-y(7)*params(16))^(1-y(72));
T(2) = (1-y(9))^y(72);
T(3) = T(1)*T(2);
T(4) = (T(3)^(1-params(6))-1)/(1-params(6));
T(5) = (y(7)-y(7)*params(16))^((1-y(72))*(1-params(6))-1);
T(6) = (1-y(72))*y(59)*T(5);
T(7) = (1-y(9))^(y(72)*(1-params(6)));
T(8) = (y(7)-y(7)*params(16))^((1-y(72))*(1-params(6)));
T(9) = y(72)*(-y(59))*T(8);
T(10) = (1-y(9))^(y(72)*(1-params(6))-1);
T(11) = y(32)^params(2);
T(12) = y(30)/y(28);
T(13) = (y(9)*y(15))^params(3);
T(14) = y(12)^(1-params(3));
T(15) = y(23)^2;
T(16) = 1/(1-1/params(2));
T(17) = y(10)*T(16);
T(18) = y(32)^(params(2)-1);
T(19) = y(26)^params(17);
T(20) = (y(46)-params(16)*y(46))^(1-y(72));
T(21) = (1-y(41))^y(72);
T(22) = T(20)*T(21);
T(23) = (y(46)-params(16)*y(46))^((1-y(72))*(1-params(6))-1);
T(24) = (1-y(72))*T(23);
T(25) = (1-y(41))^(y(72)*(1-params(6)));
T(26) = (y(46)-params(16)*y(46))^((1-y(72))*(1-params(6)));
T(27) = (-y(72))*T(26);
T(28) = (1-y(41))^(y(72)*(1-params(6))-1);
T(29) = (y(15)*y(41))^params(3);
T(30) = y(43)^(1-params(3));
T(31) = y(56)^2;

end
