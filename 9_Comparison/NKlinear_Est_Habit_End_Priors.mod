//Dynare set-up:   NK Model with capital and costs of investment and with non-distortionary taxes
//Linear version
//Model with only Habit and no Indexing
//
//Estimation with  Brook-Gelman convergence diagnostics and more replications
//////////////////////////////////////////////////////////////////////////////////////////////////
 
//------------------------------------------------------------------------
//       Variables and Parameters
//------------------------------------------------------------------------
var UC UL R H W YW Y K I tax C A G X Q PIE MC Rn
UCF CF HF RF ULF WF YF KF IF GF XF QF taxF MS;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF OBSERVABLE VARIABLES%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var dy pinfobs robs;  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF EXOGENOUS VARIABLES%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varexo epsA epsG epsM epsMS;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF PARAMETERS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters gy alp c zzeta betta delta sigma_c rhoA rhoG rhoMS Ass phiX xi
chi gammap rho_r theta_pie theta_y hss Rss hfss Rfss PIEss;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ADD OBSERVATION TRENDS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters trend conspie consr;

//------------------------------------------------------------------------
//       Parameter Values
//------------------------------------------------------------------------
gy        = 0.2;
alp       = 0.70;
zzeta     = 7.0;
c         = 1/zzeta;
betta     = 0.99;
delta     = 0.0250;
sigma_c   = 2.0;
phiX      = 1.24;
xi        = 0.75;
chi       = 0;
gammap    = 0;
rho_r   = 0.7;
theta_pie = 1.5;
theta_y   = 0.3;
Ass       = 1; // Choice of Units
rhoA      = 0.7;
rhoG      = 0.7;
rhoMS      = 0.7;
trend     = 0.4;
PIEss=1.005; //2% inflation per year
consr     = (1.0*PIEss/betta-1)*100; // ss nominal interest rate
//to give prior about 1.5 
conspie   = PIEss-1; // quarterly ss net inflation rate

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%STEADY STATE RELATIONSHIPS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hss       = 0.4;
hfss      = hss;
Rss       = 1.0/betta;
Rfss      = Rss;

//------------------------------------------------------------------------
//       DSGE Model Equations
//------------------------------------------------------------------------
model(linear);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%STEADY STATE RELATIONSHIPS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#iy=((1-alp)*delta)/((Rss-1+delta));
#cy=1-iy-gy;
#iyf=delta*(1-alp)/(Rfss-1+delta);
#cyf=1-iyf-gy;
#varrho=(1-hss)/(1+hss*(cy*(1-chi)/alp-1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//---------------FLEXIBLE PRICE ECONOMY--------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Marginal utility of consumption%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UCF=((1-varrho)*(1-sigma_c)-1)*(CF/(1-chi)-chi/(1-chi)*CF(-1))+ varrho*(sigma_c-1)*(hfss/(1-hfss))*HF;

%%%%%%%%%%%%%%%%%%
%%Euler equation%%
%%%%%%%%%%%%%%%%%%
UCF(+1)=UCF-RF;

%%%%%%%%%%%%%%%%%%%%%
%%Labour supply foc%%
%%%%%%%%%%%%%%%%%%%%%
ULF=-UCF-(CF/(1-chi)-chi/(1-chi)*CF(-1))-(hfss/(1-hfss))*HF;
WF=-ULF-UCF;

%%%%%%%%%%%%%%%%%%%%%%%
%%Production Function%%
%%%%%%%%%%%%%%%%%%%%%%%
YF=alp*(A+HF)+(1-alp)*(KF(-1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Wholesale firms FOC for labour%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WF=YF-HF;

%%%%%%%%%%%%%%%%%%%%%%%
%%Resource constraint%%
%%%%%%%%%%%%%%%%%%%%%%%
YF=cyf*CF+iyf*IF+gy*GF;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%Capital law of motion%% 
%%%%%%%%%%%%%%%%%%%%%%%%%
KF=delta*(IF) +(1-delta)*KF(-1);

%%%%%%%%%%%%%
%%Tobin's Q%%
%%%%%%%%%%%%%
XF=(Rfss-1+delta)/(Rfss)*(YF-KF(-1))+(1-delta)/(Rfss)*QF;
RF=XF(+1)-QF;

%%%%%%%%%%%%%%
%%Investment%%
%%%%%%%%%%%%%%
(1+1/(Rfss))*IF= 1/(Rfss)*IF(+1)+IF(-1)+1/(2*phiX*(1)^2)*QF; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Balance budget constraint%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GF=HF+WF+taxF;
GF=rhoG*GF(-1)+epsG;

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
//---------------STICKY PRICE ECONOMY----------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Marginal utility of consumption%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UC=((1-varrho)*(1-sigma_c)-1)*(C/(1-chi)-chi/(1-chi)*C(-1))+ varrho*(sigma_c-1)*(hss/(1-hss))*H;

%%%%%%%%%%%%%%%%%%
%%Euler equation%%
%%%%%%%%%%%%%%%%%%
UC(+1)=UC-R(+1); 

%%%%%%%%%%%%%%%%%%%%%
%%Labour supply foc%%
%%%%%%%%%%%%%%%%%%%%%
UL=-UC-(C/(1-chi)-chi/(1-chi)*C(-1))-(hss/(1-hss))*H;
W=-UL-UC;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Wholesale and retail sector relation%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y=YW;

%%%%%%%%%%%%%%%%%%%%%%%
%%Production Function%%
%%%%%%%%%%%%%%%%%%%%%%%
YW=alp*(A+H)+(1-alp)*K(-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Wholesale firms FOC for labour%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MC=W+H-YW;

%%%%%%%%%%%%%%%%%%%%%%%
%%Resource constraint%%
%%%%%%%%%%%%%%%%%%%%%%%
Y=cy*C+iy*I+gy*G;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%Capital law of motion%% 
%%%%%%%%%%%%%%%%%%%%%%%%%
K=delta*I +(1-delta)*K(-1);

%%%%%%%%%%%%%
%%Tobin's Q%%
%%%%%%%%%%%%%
X=(Rss-1+delta)/(Rss)*(MC+YW-K(-1))+(1-delta)/(Rss)*Q;
R(+1)=X(+1)-Q;

%%%%%%%%%%%%%%
%%Investment%%
%%%%%%%%%%%%%%
(1+1/(Rss))*I= 1/(Rss)*I(+1)+I(-1)+1/(2*phiX*(1)^2)*Q; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Balance budget constraint%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G=H+W+tax;

%%%%%%%%%%%%%%%%%%
%%Phillips Curve%%
%%%%%%%%%%%%%%%%%%
PIE=betta/(1+betta*gammap)*PIE(+1)+gammap/(1+betta*gammap)*PIE(-1)+(1-betta*xi)*(1-xi)/((1+betta*gammap)*xi)*(MC+MS);

%%%%%%%%%%%%%%%
%%Taylor rule%%
%%%%%%%%%%%%%%%
%
%Conventional
Rn=rho_r*Rn(-1)+(1-rho_r)*theta_pie*(PIE)+(1-rho_r)*theta_y*(Y-YF)+epsM;
%Implementable
//Rn=rho_r*Rn(-1)+(1-rho_r)*theta_pie*(PIE)+(1-rho_r)*theta_y*Y+epsM;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Real Ex-Post Interest Rate%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=Rn(-1)-PIE;

%%%%%%%%%%%%%%%%%%%
%%Shock processes%%
%%%%%%%%%%%%%%%%%%%
A=rhoA*A(-1)+epsA;
G=rhoG*G(-1)+epsG;
MS=rhoMS*MS(-1)+epsMS;

%%%%%%%%%%%%%%%%%%%%%%%%
%%Measurment equations%%
%%%%%%%%%%%%%%%%%%%%%%%%
dy=Y-Y(-1)+trend;
pinfobs = PIE+conspie;
robs = Rn+consr;
end;

//------------------------------------------------------------------------
//       Shock Variance
//------------------------------------------------------------------------
shocks;
var epsA; stderr 1;
var epsG; stderr 1;
var epsM; stderr 1;
var epsMS; stderr 1;
end;


//------------------------------------------------------------------------
//       Bayesian Estimation and Simulation
//------------------------------------------------------------------------
estimated_params;
// PARAM NAME, INITVAL, LB, UB, PRIOR_SHAPE, PRIOR_P1, PRIOR_P2, PRIOR_P3, PRIOR_P4, JSCALE
// PRIOR_SHAPE: BETA_PDF, GAMMA_PDF, NORMAL_PDF, INV_GAMMA_PDF
// Priors used as in SW07
//
stderr epsA,     INV_GAMMA_PDF,0.10, 2.00; //technology
stderr epsG,     INV_GAMMA_PDF,0.10, 2.00; //government spending - rescaled stderr/gy
stderr epsM,     INV_GAMMA_PDF,0.10, 2.00; //interest rate rule
stderr epsMS,    INV_GAMMA_PDF,0.10, 2.00; //mark-up
rhoA,            BETA_PDF,     0.50, 0.20; //AR1 technology
rhoG,            BETA_PDF,     0.50, 0.20; //AR1 government spending
rhoMS,           BETA_PDF,     0.50, 0.20; //AR1 mark-up
hss,             BETA_PDF,     0.40, 0.10; //hours worked
phiX,            NORMAL_PDF,   2.00, 1.50; //investment adj cost
%sigma_c,         NORMAL_PDF,   1.50, 0.375;//consumption utility
sigma_c,         GAMMA_PDF,    2.00, 0.50;//consumption utility (as in Herst and Schorfheide, but not SW) 
chi,             BETA_PDF,     0.70, 0.10; //habit
xi,              BETA_PDF,     0.50, 0.10; //calvo prices
//gammap,          BETA_PDF,     0.50, 0.15; //indexation prices
alp,             BETA_PDF,     0.70, 0.05; //labour share
theta_pie,       NORMAL_PDF,   2.00, 0.25; //feedback inflation
rho_r,           BETA_PDF,     0.75, 0.10; //lagged interest rate
theta_y,         NORMAL_PDF,   0.125,0.05; //feedback output gap 
conspie,         GAMMA_PDF,    0.625,0.10; //quarterly ss inflation rate;
trend,           NORMAL_PDF,   0.40, 0.10; //common quarterly trend growth rate
consr,           NORMAL_PDF,    1.5,0.1;      //common quarterly nominal interest rate
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF OBSERVABLE VARIABLES%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
varobs dy pinfobs robs;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%sample periods 84:1-08:2
%%4 quarters for initialisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
options_.plot_priors=0;

%conffile='C:\Users\ecs1pl\Documents\config.txt';
%options_.parallel = struct('Local', 1, 'ComputerName','', 'CPUnbr', [1:4], 'UserName','','Password','', 
%'RemoteDrive', '', 'RemoteDirectory','', 'MatlabOctavePath', 'matlab', 'DynarePath', 
%'C:\Users\ecs1pl\Documents\4.6.0\matlab','NumberOfThreadsPerJob',1, 'NodeWeight','1','SingleCompThread','false','OperatingSystem','windows');
%
estimation(datafile=us_data,mode_compute=4,first_obs=143,presample=4,
           prefilter=0,mh_replic=10000,mh_nblocks=2,mh_jscale=0.40,mh_drop=0.2,endogenous_prior, mode_file=NKlinear_Est_Habit_saved_mode,mode_check);
% 
%
%estimation(datafile=us_data,mode_compute=4,first_obs=143,presample=4,
%           prefilter=0,mh_replic=10000,mh_nblocks=2,mh_jscale=0.40,mh_drop=0.2);
%
%estimation MCMC when modes already exist
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%generate IRfunctions and Moments of obs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get_posterior_parameters('mean',M_,estim_params_,oo_,'lik_') // get post. mean for steady state and simulation.
%
%or use mode:
%get_posterior_parameters('mode'); // get post. mean for steady state (and simulation without optsim)
%get_posterior_parameters('mode',M_,estim_params_,oo_,'lik_')// get post. mean for steady state and simulation
%% INPUTS
%%   o type              [char]     = 'mode' or 'mean'.
%%   o M_:               [structure] Dynare structure describing the model.
%%   o estim_params_:    [structure] Dynare structure describing the estimated parameters.
%%   o field_1           [char]     optional field like 'mle_'.

stoch_simul(irf=20,ar=10) dy pinfobs robs Y C I PIE Rn ;
%
%produce historical decomposition
%
shock_decomposition (parameter_set=posterior_mean) dy pinfobs robs;