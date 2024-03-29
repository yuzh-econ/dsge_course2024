function [ys_, params, info] = steadystate(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(9)=params(18);
    ys_(15)=params(9);
    ys_(33)=1;
    ys_(5)=1.0/params(4);
    ys_(11)=1-1/params(2);
    ys_(17)=ys_(11)*(1-params(3))/(ys_(5)-1+params(5));
    ys_(18)=ys_(11)*(1-params(3))*params(5)/(ys_(5)-1+params(5));
    ys_(19)=1-ys_(18)-params(1);
    ys_(72)=(1-ys_(9))/(1+ys_(9)*(ys_(19)*(1-params(16))/(ys_(11)*params(3))-1));
    ys_(10)=ys_(9)*ys_(15)*ys_(17)^((1-params(3))/params(3))/ys_(33);
    ys_(12)=ys_(17)*ys_(10);
    ys_(13)=ys_(18)*ys_(10);
    ys_(16)=params(1)*ys_(10);
    ys_(8)=ys_(11)*params(3)*ys_(10)/ys_(9);
    ys_(7)=ys_(19)*ys_(10);
    ys_(14)=ys_(16);
    ys_(1)=1/(1-params(6))*(((1-params(16))*ys_(7))^((1-params(6))*(1-ys_(72)))*(1-ys_(9))^(ys_(72)*(1-params(6)))-1);
    ys_(2)=(1-ys_(9))^(ys_(72)*(1-params(6)))*(1-ys_(72))*((1-params(16))*ys_(7))^((1-params(6))*(1-ys_(72))-1);
    ys_(3)=((1-params(16))*ys_(7))^((1-params(6))*(1-ys_(72)))*(-ys_(72))*(1-ys_(9))^(ys_(72)*(1-params(6))-1);
    ys_(4)=params(4);
    ys_(6)=ys_(5);
    ys_(20)=0;
    ys_(21)=0;
    ys_(22)=1;
    ys_(23)=1;
    ys_(27)=ys_(11);
    ys_(28)=ys_(10)*ys_(2)/(1-params(4)*params(11));
    ys_(29)=ys_(28);
    ys_(30)=ys_(28);
    ys_(31)=ys_(30);
    ys_(26)=1;
    ys_(32)=1;
    ys_(34)=1;
    ys_(24)=1/params(4);
    ys_(25)=1/params(4);
    ys_(58)=1;
    ys_(59)=1;
    ys_(63)=1;
    ys_(64)=1;
    ys_(65)=1;
    ys_(66)=1;
    ys_(67)=1;
    ys_(68)=1;
    ys_(60)=1;
    ys_(69)=1;
    ys_(61)=1;
    ys_(70)=1;
    ys_(62)=1;
    ys_(38)=ys_(5);
    ys_(40)=1-1/params(2);
    ys_(47)=(1-params(3))*ys_(40)/(params(5)+ys_(38)-1);
    ys_(48)=params(5)*(1-params(3))*ys_(40)/(params(5)+ys_(38)-1);
    ys_(49)=1-ys_(48)-params(1);
    ys_(41)=ys_(40)*params(3)*(1-ys_(72))/(ys_(40)*params(3)*(1-ys_(72))+(1-params(16))*ys_(72)*ys_(49));
    ys_(42)=ys_(15)*ys_(41)*ys_(47)^((1-params(3))/params(3));
    ys_(39)=params(1)*ys_(42);
    ys_(43)=ys_(47)*ys_(42);
    ys_(44)=ys_(48)*ys_(42);
    ys_(45)=ys_(42)*params(3)*ys_(40)/ys_(41);
    ys_(46)=ys_(49)*ys_(42);
    ys_(50)=ys_(39);
    ys_(35)=1/(1-params(6))*(((1-params(16))*ys_(46))^((1-params(6))*(1-ys_(72)))*(1-ys_(41))^(ys_(72)*(1-params(6)))-1);
    ys_(36)=(1-ys_(41))^(ys_(72)*(1-params(6)))*(1-ys_(72))*((1-params(16))*ys_(46))^((1-params(6))*(1-ys_(72))-1);
    ys_(37)=(-ys_(72))*((1-params(16))*ys_(46))^((1-params(6))*(1-ys_(72)))*(1-ys_(41))^(ys_(72)*(1-params(6))-1);
    ys_(51)=ys_(4);
    ys_(52)=ys_(6);
    ys_(53)=ys_(20);
    ys_(54)=ys_(21);
    ys_(55)=ys_(22);
    ys_(56)=ys_(23);
    ys_(57)=ys_(42)/ys_(10);
    ys_(71)=1;
    % Auxiliary equations
end
