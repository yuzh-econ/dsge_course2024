function [ys,params,check] = SW_steadystate(ys,exo,M_,options_)

 
%% DO NOT CHANGE THIS PART.
%%
%% Here we load the values of the deep parameters in a loop.
%%
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;


%% THIS BLOCK IS MODEL SPECIFIC.
%%
%% Here the user has to define the steady state.
%%

H0      = 0.5;
x0      = log(H0);
options = optimset('TolFun',1e-9,'TolX',1e-9,'MaxIter', 5000, 'MaxFunEvals', 5000, 'Display','off');
x       = fsolve(@ss_fun_NK,x0,options);

H       = exp(x(1));

g       = g_bar/100;

A       = 1;
MCS     = 1;
MRSS    = 1;
IS      = 1;
MPS     = 1;
RPS     = 1;

PIE     = PIE_bar/100+1;
u       = 1;

S       = 0; % (215)
Sdash   = 0; % (216)
PIEw    = (1+g)*PIE; % (217)
Q       = 1; % (218)
LAMBDA  = betta*(1+g)^(-sigma_c); % (219)
rK      = 1/LAMBDA-(1-delta); % (220)
au      = 0; % (221)
adash   = 1/(betta*(1+g)^(-sigma_c))-(1-delta); % (222) & (223)
PO      = ((1-xip*PIE^((gammap-1)*(1-zzetap)))/(1-xip))^(1/(1-zzetap)); % (224)
Deltap  = (1-xip)/(1-xip*PIE^(zzetap*(1-gammap)))*PO^(-zzetap); % (225)
MC      = (1-1/zzetap)*1/MCS*(1-xip*(1+g)*LAMBDA*PIE^(zzetap*(1-gammap)))/(1-xip*(1+g)*LAMBDA*PIE^((zzetap-1)*(1-gammap)))*PO; % (226)
PWP     = MC; % (227)
WO      = ((1-xiw*PIE^(gammaw*(1-zzetaw))*PIEw^(zzetaw-1))/(1-xiw))^(1/(1-zzetaw)); % (228)
Deltaw  = (1-xiw)/(1-xiw*PIEw^(zzetaw)/PIE^(gammaw*zzetaw))*WO^(-zzetaw); % (229)
Hd      = H/Deltaw; % (230)
KYW     = (1-alp)*(1+g)*(1+F)/(u*rK)*PWP; % (231)
YW      = A*Hd/(1+F)^(1/alp)*(KYW/(1+g))^((1-alp)/alp); % (232)
K       = YW*KYW; % (233)
Y       = YW/Deltap; % (234)
I       = K/IS*(g+delta)/(1+g); % (235)
G       = gy*Y; % (236)
C       = Y-G-I; % (237)
JJw     = Hd/(1-xiw*LAMBDA*PIEw^zzetaw*PIE^(gammaw*(1-zzetaw)-1)); % (238)
W       = alp*PWP*(YW+F*YW)/Hd; % (239)
Jw      = WO*W*JJw; % (240)
Wh      = (1-xiw*(1+g)*LAMBDA*PIEw^zzetaw/PIE^(gammaw*zzetaw))*(1-1/zzetaw)*Jw/(Hd*MRSS); % (241)

U       = (C*(1-chi/(1+g)))^(1-sigma_c)/(1-sigma_c)*exp((sigma_c-1)*H^(1+pssi)/(1+pssi)); % (244)
V       = U/(1-betta*(1+g)^(1-sigma_c)); % (245)
X       = 1+g; % (246)
if habit ==1
 lambda  = (1-sigma_c)*U/(C-chi*C/(1+g));
else 
lambda  = (1-sigma_c)*U/(C-chi*C/(1+g))-betta*chi*(1+g)^(-sigma_c)*(1-sigma_c)*U/(C-chi*C/(1+g)); % (228)
end;
R       = 1/LAMBDA; % (249)
Rn      = R*PIE; % (249)
Jp      = Y*MC*MCS/((1-1/zzetap)*(1-xip*(1+g)*LAMBDA*PIE^(zzetap*(1-gammap)))); % (250);
JJp     = Jp/PO; % (251)
RK      = rK+(1-delta); % (252)
CEquiv  = (1.01^(1-sigma_c)-1)*U/(1-betta*(1+g)^(1-sigma_c)); % (253)

dyobs   = log((1+g));
dcobs   = log((1+g));
labobs  = 0;
robs    = (Rn-1);
shadow_robs  = (Rn-1);
pinfobs = (log(PIE));
dinvobs = log((1+g));
dwobs   = log((1+g));

%% END OF THE MODEL SPECIFIC BLOCK.

%% DO NOT CHANGE THIS PART.
%%
%% Here we define the steady state vZNues of the endogenous variables of
%% the model.
%%
 params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end                                                       % End of the loop.
