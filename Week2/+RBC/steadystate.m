function [ys_, params, info] = steadystate(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(13)=params(11);
    ys_(5)=1.0/params(3);
    ys_(19)=(1-params(2))/(ys_(5)-1+params(4));
    ys_(20)=(1-params(2))*params(4)/(ys_(5)-1+params(4));
    ys_(21)=1-ys_(20)-params(14);
    ys_(9)=params(2)*(1-params(1))/(params(2)*(1-params(1))+ys_(21)*params(1));
    ys_(10)=ys_(13)*ys_(9)*ys_(19)^((1-params(2))/params(2));
    ys_(11)=ys_(19)*ys_(10);
    ys_(12)=ys_(20)*ys_(10);
    ys_(7)=ys_(21)*ys_(10);
    ys_(14)=params(14)*ys_(10);
    ys_(8)=params(2)*ys_(10)/ys_(9);
    ys_(15)=ys_(14)/(ys_(9)*ys_(8));
    ys_(1)=1/(1-params(5))*(ys_(7)^((1-params(1))*(1-params(5)))*(1-ys_(9))^(params(1)*(1-params(5)))-1);
    ys_(2)=(1-ys_(9))^(params(1)*(1-params(5)))*(1-params(1))*ys_(7)^((1-params(1))*(1-params(5))-1);
    ys_(3)=ys_(7)^((1-params(1))*(1-params(5)))*(-params(1))*(1-ys_(9))^(params(1)*(1-params(5))-1);
    ys_(4)=params(3);
    ys_(17)=1;
    ys_(16)=1;
    ys_(18)=ys_(17)*2*params(9)*(ys_(16)-1)*ys_(16)^2/ys_(5);
    ys_(6)=ys_(5);
    ys_(23)=1;
    ys_(24)=1;
    ys_(25)=1;
    ys_(26)=1;
    ys_(27)=1;
    ys_(28)=1;
    ys_(22)=1;
    % Auxiliary equations
end