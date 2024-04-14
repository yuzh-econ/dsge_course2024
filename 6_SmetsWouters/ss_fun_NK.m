function F = ss_fun_NK(x)

%% Load model parameters
global M_
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
 
end
%% Load model parameters
     

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

F = Wh-(C-chi*C/(1+g))*H^pssi/(1-betta*chi*(1+g)^(-sigma_c));