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

assert(length(T) >= 29);

T(1) = 1+params(7)/100;
T(2) = T(1)^(-params(9));
T(3) = params(8)*T(1)^(1-params(9));
T(4) = exp((params(9)-1)*y(4)^(1+params(16))/(1+params(16)));
T(5) = y(3)-y(3)*params(10)/T(1);
T(6) = T(5)^(1-params(9))/(1-params(9));
T(7) = y(4)^params(16);
T(8) = y(7)^2;
T(9) = y(10)*y(16)*y(18)*T(8);
T(10) = 1/(1-1/params(5));
T(11) = y(22)^params(5);
T(12) = y(21)^(params(5)*params(15));
T(13) = T(11)/T(12);
T(14) = y(21)^(params(15)*(params(5)-1));
T(15) = T(11)/(y(21)*T(14));
T(16) = y(21)^params(15);
T(17) = T(16)/y(22);
T(18) = (y(25)*y(31))^params(2);
T(19) = y(5)/T(1);
T(20) = T(19)^(1-params(2));
T(21) = 1/(1-1/params(4));
T(22) = T(21)*y(35);
T(23) = y(21)^params(4);
T(24) = y(21)^(params(4)*params(14));
T(25) = T(23)/T(24);
T(26) = y(21)^(params(4)-1);
T(27) = y(21)^(params(14)*(params(4)-1));
T(28) = T(26)/T(27);
T(29) = y(21)^params(14);

end
