function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 30);

T(1) = (y(24)-params(16)*y(2))^(1-y(87));
T(2) = (1-y(26))^y(87);
T(3) = T(1)*T(2);
T(4) = (y(24)-params(16)*y(2))^((1-y(87))*(1-params(6))-1);
T(5) = (1-y(87))*T(4);
T(6) = (1-y(26))^(y(87)*(1-params(6)));
T(7) = (y(24)-params(16)*y(2))^((1-y(87))*(1-params(6)));
T(8) = (-y(87))*T(7);
T(9) = (1-y(26))^(y(87)*(1-params(6))-1);
T(10) = y(49)^params(2);
T(11) = y(47)/y(45);
T(12) = (y(26)*y(32))^params(3);
T(13) = y(3)^(1-params(3));
T(14) = y(93)^2;
T(15) = 1/(1-1/params(2));
T(16) = y(27)*T(15);
T(17) = y(49)^(params(2)-1);
T(18) = y(9)^params(17);
T(19) = (y(63)-params(16)*y(16))^(1-y(87));
T(20) = (1-y(58))^y(87);
T(21) = T(19)*T(20);
T(22) = (y(63)-params(16)*y(16))^((1-y(87))*(1-params(6))-1);
T(23) = (1-y(87))*T(22);
T(24) = (1-y(58))^(y(87)*(1-params(6)));
T(25) = (y(63)-params(16)*y(16))^((1-y(87))*(1-params(6)));
T(26) = (-y(87))*T(25);
T(27) = (1-y(58))^(y(87)*(1-params(6))-1);
T(28) = (y(32)*y(58))^params(3);
T(29) = y(14)^(1-params(3));
T(30) = y(101)^2;

end
