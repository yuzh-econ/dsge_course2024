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

T(1) = 1+params(7)/100;
T(2) = T(1)^(-params(9));
T(3) = 1/(params(8)*T(2))-(1-params(3));
T(4) = params(8)*T(1)^(1-params(9));
T(5) = exp((params(9)-1)*y(4)^(1+params(16))/(1+params(16)));
T(6) = y(3)-y(3)*params(10)/T(1);
T(7) = T(6)^(1-params(9))/(1-params(9));
T(8) = y(4)^params(16);
T(9) = y(7)^2;
T(10) = y(10)*y(16)*y(18)*T(9);
T(11) = T(3)*params(17)/(1-params(17))/2;
T(12) = 1/(1-1/params(5));
T(13) = y(23)^params(5);
T(14) = y(22)^(params(5)*params(15));
T(15) = T(13)/T(14);
T(16) = y(22)^(params(15)*(params(5)-1));
T(17) = T(13)/(y(22)*T(16));
T(18) = y(22)^params(15);
T(19) = T(18)/y(23);
T(20) = (y(26)*y(32))^params(2);
T(21) = y(5)*y(19)/T(1);
T(22) = T(21)^(1-params(2));
T(23) = 1/(1-1/params(4));
T(24) = T(23)*y(36);
T(25) = y(22)^params(4);
T(26) = y(22)^(params(4)*params(14));
T(27) = T(25)/T(26);
T(28) = y(22)^(params(4)-1);
T(29) = y(22)^(params(14)*(params(4)-1));
T(30) = T(28)/T(29);
T(31) = y(22)^params(14);

end
