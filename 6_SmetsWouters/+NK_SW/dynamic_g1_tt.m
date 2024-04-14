function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 98);

T = NK_SW.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(47) = (-(y(62)*params(8)*params(10)*T(39)))/(y(19)*y(19));
T(48) = (-(T(36)*T(47)/T(41)));
T(49) = (-(T(38)*T(48)));
T(50) = T(36)*params(8)*params(10)*T(39)/y(19);
T(51) = (-(T(50)/T(41)));
T(52) = (-(params(10)/T(34)));
T(53) = getPowerDeriv(T(36),1-params(9),1);
T(54) = (-(T(40)*T(52)/T(41)));
T(55) = T(42)*T(2)*T(52)-T(38)*T(54);
T(56) = (-((T(40)*T(41)-T(36)*T(40)*T(52))/(T(41)*T(41))));
T(57) = (-((-(T(36)*T(40)))/(T(41)*T(41))));
T(58) = (params(9)-1)*getPowerDeriv(y(21),1+params(16),1)/(1+params(16));
T(59) = T(1)*T(58);
T(60) = getPowerDeriv(y(21),params(16),1);
T(61) = T(36)*T(60);
T(62) = y(36)/T(34);
T(63) = getPowerDeriv(T(43),1-params(2),1);
T(64) = y(2)/T(34);
T(65) = 1/(steady_state(21));
T(66) = getPowerDeriv(y(8),params(15),1);
T(67) = T(66)/y(40);
T(68) = getPowerDeriv(T(13),1-params(5),1);
T(69) = getPowerDeriv(y(8),params(5)*params(15),1);
T(70) = (-(T(14)*T(69)));
T(71) = getPowerDeriv(y(8),params(14),1);
T(72) = T(71)/y(39);
T(73) = getPowerDeriv(T(26),1-params(4),1);
T(74) = getPowerDeriv(y(8),params(4)*params(14),1);
T(75) = (-(T(27)*T(74)));
T(76) = getPowerDeriv(y(39),params(5)*params(15),1);
T(77) = (-(T(6)*T(76)));
T(78) = T(77)/(T(7)*T(7));
T(79) = getPowerDeriv(y(39),params(15)*(params(5)-1),1);
T(80) = y(74)*T(79);
T(81) = (-(T(6)*T(80)));
T(82) = T(81)/(T(10)*T(10));
T(83) = getPowerDeriv(y(39),params(4)*params(14),1);
T(84) = (-(T(19)*T(83)));
T(85) = T(84)/(T(20)*T(20));
T(86) = getPowerDeriv(y(39),params(14)*(params(4)-1),1);
T(87) = (-(T(22)*T(86)));
T(88) = T(87)/(T(23)*T(23));
T(89) = getPowerDeriv(y(39),params(4),1);
T(90) = getPowerDeriv(y(74),params(4),1);
T(91) = T(90)/T(20);
T(92) = getPowerDeriv(y(74),params(4)-1,1);
T(93) = T(92)/T(23);
T(94) = getPowerDeriv(y(40),params(5),1);
T(95) = getPowerDeriv(y(75),params(5),1);
T(96) = getPowerDeriv(y(43)*y(49),params(2),1);
T(97) = (-y(53))/(y(13)*y(13));
T(98) = 1/y(13);

end
