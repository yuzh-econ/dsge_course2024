
@#define form_of_habit=1
%form_of_habit=1 gives external habit (as in Model 3)
%form_of_habit=0 gives internal habit
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF ENDOGENOUS VARIABLES%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var  V U C H K S X I IS Sdash lambda Wh rK adash RPS LAMBDA R Q au Rn PIE PIEw 
W Jw Hd MRSS JJw WO Deltaw YW A PWP MC Jp Y MCS JJp PO Deltap MPS G RK; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF EXOGENOUS VARIABLES%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varexo epsA epsG epsMCS epsMPS epsIS epsMRSS epsRPS;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF PARAMETERS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters gy alp delta zzetap zzetaw PIE_bar g_bar  betta      // calibrated/fixed parameters
           sigma_c chi phiX xip xiw gammap gammaw pssi gamma2 F // estimated parameters: structural parameters
           rho_r theta_pie theta_y theta_dy                     // estimated parameters: Taylor rule
           rhoA rhoG rhoMCS rhoMRSS rhoMPS rhoRPS rhoIS         // estimated parameters: shock processes
           sigma_s habit;                                             // misc parameters
@#if  form_of_habit==1
%
%external habit
%
habit=1;
@#else  
%internal habit
%
habit=0;

@#endif
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%CALIBRATED/FIXED OF PARAMETERS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  gy           = 0.18;
  alp          = 0.67;
  delta        = 0.0250;
  zzetap       = 7.0;
  zzetaw       = 3.0;
  PIE_bar       =100*0.00472907;  %estimated directly from data
  g_bar         =100*0.002750617; %estimated directly from data
  betta        = 0.99; % imposed and not estimated
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ESTIMATED STRUCTURAL PARAMETERS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  sigma_c      = 1.5;
  chi          = 0.7;
  phiX         = 2.0;
  xip          = 0.7;
%  xip          =0;% flexi prices
  xiw          = 0.7;
%  xiw          =0.;% flexi wages
  gammap       = 0.5;
  gammaw       = 0.5;
  pssi         = 2;
  gamma2       = .5;
  F            = 0.25;
  
%   nou          = 1.;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ESTIMATED POLICY PARAMETERS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  rho_r        = 0.7;
  theta_pie    = 1.5;
  theta_y      = 0.3;
  theta_dy     = 0.3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ESTIMATED SHOCK PROCESS PARAMETERS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  rhoA         = 0.7;
  rhoG         = 0.7;
  rhoMCS       = 0.7;
  rhoMRSS      = 0.7;
  rhoMPS       = 0.7;
  rhoRPS       = 0.7;
  rhoIS        = 0.7;

%%%%%%%%%%%%%%%%%%%
%%MISC PARAMETERS%%
%%%%%%%%%%%%%%%%%%%

  sigma_s      = 0.001;
  
% ----------------------------
% *** DSGE-Model-equations ***
% ----------------------------
model;
// [name = ' Calibration of beta']
  # g                               = g_bar/100;
  
[ name = ' Intertemporal welfare']
  V                                 = U+betta*(1+g)^(1-sigma_c)*V(+1);

[ name = ' Period utility']
  U                                 = ((C-chi*C(-1)/(1+g))^(1-sigma_c))/(1-sigma_c)*exp((sigma_c-1)*H^(1+pssi)/(1+pssi));

[ name = ' Law of motion for capital']
  K                                 = (1-delta)*K(-1)/(1+g)+(1-S)*I*IS;

[ name = ' Investment']
  X                                 = I*(1+g)/I(-1);

[ name = ' Capital adjustment cost']
  S                                 = phiX*(X-1-g)^2;

[ name = ' Capital adjustment cost']
  Sdash                             = 2*phiX*(X-1-g);
@#if  form_of_habit==1
%
%external habit
%

[ name = ' Consumption foc with external habit']
  lambda                            = (1-sigma_c)*U/(C-chi*C(-1)/(1+g));

@#else  
%internal habit
[ name = ' Consumption foc with internal habit']
  lambda                            = (1-sigma_c)*U/(C-chi*C(-1)/(1+g))-betta*chi*(1+g)^(-sigma_c)*(1-sigma_c)*U(+1)/(C(+1)-chi*C/(1+g));

@#endif
[ name = ' Household foc for hours']
  Wh                                = (C-chi*C(-1)/(1+g))*H^pssi/(1-betta*chi*(1+g)^(-sigma_c)*U(+1)/U*(C-chi*C(-1)/(1+g))/(C(+1)-chi*C/(1+g)));
% 
% [ name = ' Household foc for capital']
%   rK                                = adash;

[ name = ' Euler equation']
  1                                 = RPS*R(+1)*LAMBDA;

[ name = ' Household foc for capital']
%   Q                                 = LAMBDA(+1)*(rK(+1)*u(+1)-au(+1)+(1-delta)*Q(+1));
  Q                                 = LAMBDA(+1)*(rK(+1)-au(+1)+(1-delta)*Q(+1));

  
[ name = ' Household foc for investment']
  1                                 = Q*(1-S-Sdash*X)*IS
                                    + LAMBDA(+1)*Q(+1)*Sdash(+1)*X(+1)^2*IS(+1);

[ name = ' Stochastic discount factor']
  LAMBDA(+1)                            = betta*(1+g)^(-sigma_c)*lambda(+1)/lambda;

[ name = ' Ex-post real return']
  R                                 = Rn(-1)/PIE;

  # gamma1                          = 1/(betta*(1+g)^(-sigma_c))-(1-delta);
  
[ name = ' Capital utilisation adjustment function']
%   au                                = gamma1*(u-1)+gamma2/(1-gamma2)*gamma1/2*(u-1)^2;
au = 0;

[ name = ' Capital utilisation adjustment function derivative']
%   adash                             = gamma1+gamma2/(1-gamma2)*gamma1*(u-1);
adash = gamma1;

[ name = ' Wage inflation']
  PIEw                              = (1+g)*W/W(-1)*PIE;

[ name = ' Wage setting condition']
  Jw                                = (1/(1-1/zzetaw))*Wh*Hd*MRSS
                                    + xiw*(1+g)*LAMBDA(+1)*(PIEw(+1)^zzetaw/PIE^(gammaw*zzetaw))*Jw(+1);

[ name = ' Wage setting condition']
  JJw                               = Hd + xiw*LAMBDA(+1)*(PIEw(+1)^zzetaw/(PIE^(gammaw*(zzetaw-1))*PIE(+1)))*JJw(+1);

[ name = ' Wage setting condition']
  WO                                = Jw/(W*JJw);

[ name = ' Law of motion for wage level']
  1                                 = xiw*(PIE(-1)^gammaw/PIEw)^(1-zzetaw)+(1-xiw)*WO^(1-zzetaw);

[ name = ' Law of motion for wage dispersion']
  Deltaw                            = xiw*(PIEw^zzetaw/PIE(-1)^(zzetaw*gammaw))*Deltaw(-1)+(1-xiw)*WO^(-zzetaw);

[ name = ' Production function']
%   YW                                = (A*Hd)^alp*(u*K(-1)/(1+g))^(1-alp) - F*STEADY_STATE(YW);
  YW                                = (A*Hd)^alp*(1*K(-1)/(1+g))^(1-alp) - F*STEADY_STATE(YW);

[ name = ' Firm for for labour']
  W                                 = alp*PWP*(YW+F*STEADY_STATE(YW))/Hd;

[ name = ' Firm foc: return on capital']
%   rK                                = (1-alp)*PWP*(YW+F*STEADY_STATE(YW))/(u*K(-1)/(1+g));
rK                                = (1-alp)*PWP*(YW+F*STEADY_STATE(YW))/(1*K(-1)/(1+g));

[ name = ' Marginal cost']
  MC                                = PWP;

[ name = ' Price setting condition']
  Jp                                = (1/(1-1/zzetap))*Y*MC*MCS
                                      +xip*(1+g)*LAMBDA(+1)*(PIE(+1)^zzetap/PIE^(gammap*zzetap))*Jp(+1);

[ name = ' Price setting condition']
  JJp                               = Y+xip*(1+g)*LAMBDA(+1)*(PIE(+1)^(zzetap-1)/PIE^(gammap*(zzetap-1)))*JJp(+1);

[ name = ' Price setting condition']
  PO                                = Jp/JJp;

[ name = ' Law of motion for price level']
  1                                 = xip*(PIE(-1)^(gammap)/PIE)^(1-zzetap)+(1-xip)*(PO)^(1-zzetap);

[ name = ' Law of motion for price dispersion']
  Deltap                            = xip*(PIE^zzetap/PIE(-1)^(zzetap*gammap))*Deltap(-1)+(1-xip)*PO^(-zzetap);

[ name = ' Taylor rule']
  log(Rn/STEADY_STATE(Rn))          = rho_r*log(Rn(-1)/STEADY_STATE(Rn))
                                    +(1-rho_r)*(theta_pie*log(PIE/STEADY_STATE(PIE))+theta_y*log(Y/STEADY_STATE(Y))+theta_dy*log(Y/Y(-1)))
                                    +log(MPS);

[ name = ' Resource constraint']
  Y                                 = C+G+I+au*K(-1)/(1+g);

[ name = ' Market clearing for labor']
  H                                 = Deltaw*Hd;

[ name = ' Market clearing for goods']
  YW                                = Deltap*Y;

[ name = ' Gross real return on capital']
%   RK                                = (rK*u-au+(1-delta)*Q)/Q(-1);
  RK                                = (rK*1-au+(1-delta)*Q)/Q(-1);

[ name = ' Law of motion for productivity']
  log(A)-log(STEADY_STATE(A))       = rhoA*(log(A(-1))-log(STEADY_STATE(A)))+epsA;

[ name = ' Law of motion for government expenditure']
  log(G)-log(STEADY_STATE(G))       = rhoG*(log(G(-1))-log(STEADY_STATE(G)))+epsG;

[ name = ' Law of motion for price markup shock']
  log(MCS)-log(STEADY_STATE(MCS))   = rhoMCS*(log(MCS(-1))-log(STEADY_STATE(MCS)))+epsMCS;

[ name = ' Law of motion for wage markup shock']
  log(MRSS)-log(STEADY_STATE(MRSS)) = rhoMRSS*(log(MRSS(-1))-log(STEADY_STATE(MRSS)))+epsMRSS;

[ name = ' Law of motion for capital quality shock']
  log(IS)-log(STEADY_STATE(IS))     = rhoIS*(log(IS(-1))-log(STEADY_STATE(IS)))+epsIS;

[ name = ' Law of motion for monetary policy shock']
  log(MPS)-log(STEADY_STATE(MPS))   = rhoMPS*(log(MPS(-1))-log(STEADY_STATE(MPS)))+epsMPS;

[ name = ' Law of motion for risk premium shock']
  log(RPS)-log(STEADY_STATE(RPS))   = rhoRPS*(log(RPS(-1))-log(STEADY_STATE(RPS)))+epsRPS;


end;

shocks;
  var epsA;    stderr sigma_s;
  var epsG;    stderr sigma_s;
  var epsMCS;  stderr sigma_s ;
  var epsMPS;  stderr sigma_s ;
  var epsMRSS; stderr sigma_s ;
  var epsRPS;  stderr sigma_s ;
  var epsIS;   stderr sigma_s;
end;

% stoch_simul(order=1,irf=40)  Y C I H Hd W R Q Rn MC PIE PIEw u V Deltap  Deltaw;
stoch_simul(order=2,pruning, irf=40)  Y C I H Hd W R Q Rn MC PIE PIEw V Deltap  Deltaw ;


check;
steady;

