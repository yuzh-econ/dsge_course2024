%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynare set-up:
%   - One-Sector NK Model with capital and costs of investment
%     and with non-distortionary taxes
%   - Linear version
%   - ONLY VALId for zero-steady state inflation
%
%   NB: set the gross-inflation rate to 1.00 in the non-linear model
%       to ensure consistency with this file  
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% Control panel
%----------------------------------------------------------------
%
%NOTE: when changing these options it is safest to run clear all in matlab before executing
%
%
@#define habit = 0

%habit=1 gives habit in consumption
%habit=0 removes habit in consumption 

@#define indexing = 1 

%indexing = 1 gives indexed Calvo contracts
%indexing = 0 removes indexing

@#define rule = 0

%rule=0  gives  implementable rule with persistence, inflation and output targets
%rule=1  gives  standard Taylor  rule with persistence, inflation and output gap targets

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------
%   This section defines each variable and parameters using Latex 
%   syntax so to trigger Dynare producing a .tex file with all
%   the equilibrium conditions in the .mod file

%----------------------------------------------------------------
% Declaration of endogeneous variables
%----------------------------------------------------------------

var
    UC          $UC$        (long_name='Marginal utility of consumption')
    UH          $UH$        (long_name='Marginal utility of labour')
    R           $R$         (long_name='Risk free interest rate')
    ER          $E(R)$      (long_name='Ex-post real interest rate')
    W           $W$         (long_name='Real wage')
    H           $H$         (long_name='Hours')
    Y           $Y$         (long_name='Output') 
    K           $K$         (long_name='Capital stock')
    I           $I$         (long_name='Investment')  
    tax         $Tax$       (long_name='Taxes') 
    A           $A$         (long_name='Production technology')
    G           $G$         (long_name='Government spending') 
    C           $C$         (long_name='Consumption') 
    Q           $Q$         (long_name='Tobin Q')
    X           $X$         (long_name='Gross growth rate of investment')
    PIE         $Pi$        (long_name='Inflation')  
    MC          $MC$        (long_name='Real marginal costs')
    Rn          $Rn$        (long_name='Nominal interest rate') 
  
    UCF          $UCF$        (long_name='Marginal utility of consumption - flexible prices')
    UHF          $ULF$        (long_name='Marginal utility of labour - flexible prices') 
    RF           $RF$         (long_name='Risk free interest rate - flexible prices')

    HF           $HF$         (long_name='Hours - flxible prices')  
    YF           $YF$         (long_name='Output - flxible prices')  
    KF           $KF$         (long_name='Capital stock - flxible prices') 
    IF           $IF$         (long_name='Investment - flxible prices')   
    GF           $GF$         (long_name='Government spending - flexible prices')
    WF           $WF$         (long_name='Real wage - flxible prices') 
    CF           $CF$         (long_name='Consumption - flxible prices') 
    QF           $QF$         (long_name='Tobin Q') 
    XF           $XF$         (long_name='Gross growth rate of investment')
    taxF         $TaxF$       (long_name='Taxes - flxible prices')
    MS           $MS$         (long_name='Mark-up shock')
 ;


%----------------------------------------------------------------
% Declaration of exogeneous variables
%----------------------------------------------------------------

varexo
    epsA        ${\epsilon^{A}}$      (long_name='Labour augmenting shock')
    epsG        ${\epsilon^{G}}$      (long_name='Government spending shock')
    epsMS       ${\epsilon^{MS}}$     (long_name='Mark-up shock')
    epsM        ${\epsilon^{M}}$      (long_name='Monetary policy shock')
;

%----------------------------------------------------------------
% Declaration of parameters
%----------------------------------------------------------------

parameters

    zzeta          ${\zeta}$                    (long_name='Elasticity of substitution across products')
    alp            ${\alpha}$                   (long_name='Labour share')
    betta          ${\beta}$                    (long_name='Discount factor') 
    delta          ${\delta}$                   (long_name='Capital depreciation')
    sigma_c        ${\sigma_{C}}$               (long_name='Inverse of the elasticity of substitution')
    varrho         ${\varrho}$                  (long_name='Weight on Leisure in utility') 
    rhoA           ${\rho_{A}}$                 (long_name='Persistence of labour augmentig shock')
    rhoG           ${\rho_{G}}$                 (long_name='Persistence of government spending shock')
    rhoMS          ${\rho_{MS}}$                (long_name='Persistence of mark-up shock')
    Ass            ${\bar{A}}$                  (long_name='Labour technology in steady state')
    phiX           ${\phi_{X}}$                 (long_name='Smoothing parameter of investment adjustment costs')
    xi             ${\xi}$                      (long_name='Calvo parameter')          
    chi            ${\chi}$                     (long_name='habits persistence')
    gammap         ${\gamma^{p}}$               (long_name='degree of indexation')
    rho_r          ${\rho_{R}}$                 (long_name='Interest rate smoothing parameter') 
    theta_pie      $\theta^{\pi}$               (long_name='Taylor rule parameter for inflation')
    theta_y        $\theta^{y}$                 (long_name='Taylor rule parameter for output') 
    hss            ${\bar{H}}$                  (long_name='Hours in steady state') 
    Rss            ${\bar{R}}$                  (long_name='Risk free interest rate in steady state - flexible prices')
    hfss           ${\bar{H}}$                  (long_name='Hours in steady state - flexible prices') 
    Rfss           ${\bar{RF}}$                 (long_name='Risk free interest rate in steady state - flexible prices')
    PWPss          ${{\bar{P}}^{W}}$            (long_name='Intermediate price in steady state')
    cy             ${cy}$                       (long_name='Consumption output ratio in steady state')
    iy             ${iy}$                       (long_name='Investment output ratio in steady state') 
    gy             ${gy}$                       (long_name='Government spending output ratio in steady state - flexible prices') 
    iyf            ${iyf}$                      (long_name='Investment output ratio in steady state') 
    cyf            ${cyf}$                      (long_name='Consumption output ratio in steady state - flexible prices')
;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------


gammap=0.5;         // Indexing
% gammap=0;
% gammap=1;
chi=0.7;            // Habit parameter
% chi = 0;
% chi = 1;
hss       = 0.35;   // Steady state hours
phiX=2.0;           // Smoothing parameter of investment adjustment costs
gy=0.2;             // Government output ratio
alp=0.70;           // Labour share
zzeta     = 7.0;
betta     = 0.99;   // Discount factor
delta     = 0.0250; // Capital depreciation
sigma_c   = 2.0;    // Inverse of the elasticity of substitution

xi      = 0.75;     // Calvo parameter
rho_r   = 0.7;      // interest rate smoothing
theta_pie = 1.5;    // Taylor rule parameter for inflation
theta_y   = 0.3;    // Taylor rule parameter for GDP
%----------------------------------------------------------------
% Choice of units of output, hours and capital (i.e,. normalization)
%----------------------------------------------------------------
Ass       = 1;            // Steady state technology            

%----------------------------------------------------------------
% Shock persistence
%----------------------------------------------------------------

rhoA=0.75; // Persistence of labour augmentig shock
rhoG=0.75; // Persistence of government spending shock
rhoMS=0.75;// Persistence of mark-up shock

@#if habit > 0
     chi=0.7;
@#else
    chi=0;
@#endif

@#if indexing > 0
    gammap=0.99;
@#else
    gammap=0;
@#endif

%----------------------------------------------------------------
%	Steady state relationships
%----------------------------------------------------------------

hfss      = hss;
Rss       = 1.0/betta;
Rfss      = Rss;
PWPss=1-1/zzeta;
iy=PWPss*((1-alp)*delta)/((Rss-1+delta));
cy=1-iy-gy;
iyf=PWPss*delta*(1-alp)/(Rfss-1+delta);
cyf=1-iyf-gy;
varrho=(1-hss)/(1+hss*(cy*(1-chi)/(PWPss*alp)-1));
%-------------------------------------------------------------------

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model(linear);
%----------------------------------------------------------------
% Flexible price economy
%----------------------------------------------------------------


    [name='Marginal Utility of Consumption (with external habits) 1 - flexible prices']
    
        UCF=((1-varrho)*(1-sigma_c)-1)*(CF/(1-chi)-chi/(1-chi)*CF(-1))+ varrho*(sigma_c-1)*(hfss/(1-hfss))*HF;

    [name='Marginal Utility of Consumption (with external habits) 2 - flexible prices']

        UCF(+1)=UCF-RF;

    [name='Euler equation - flexible prices']
    
        UHF=-UCF-(CF/(1-chi)-chi/(1-chi)*CF(-1))-(hfss/(1-hfss))*HF;

    [name='Labour supply foc - flexible prices']
    
         WF=-UHF-UCF;

    [name='Prodution function- flexible prices']

        YF=alp*(A+HF)+(1-alp)*(KF(-1));

    [name='Wholesale firms FOC for labour- flexible prices']
    
       WF=YF-HF;//without MS shock 
    %    WF=YF-MS-HF;

    [name='Resource constraint- flexible prices']

        YF=cyf*CF+iyf*IF+gy*GF;

    [name='Resource constraint- flexible prices']

        KF=delta*(IF) +(1-delta)*KF(-1);

    [name='Tobin s Q 1- flexible prices']

        XF=(Rfss-1+delta)/(Rfss)*(YF-KF(-1))+(1-delta)/(Rfss)*QF;

    [name='Tobin s Q 2- flexible prices']

        RF=XF(+1)-QF;

    [name='Investment- flexible prices']

        (1+1/(Rfss))*IF= 1/(Rfss)*IF(+1)+IF(-1)+1/(2*phiX*(1)^2)*QF; 

    [name='Balance budget constraint 1 - flexible prices']

        GF=HF+WF+taxF;
        
    [name='Balance budget constraint 2 - flexible prices']
        
        GF=rhoG*GF(-1)+epsG;

        
%----------------------------------------------------------------
% Sticky price economy
%----------------------------------------------------------------


    [name='Marginal Utility of Consumption (with external habits)']

        UC=((1-varrho)*(1-sigma_c)-1)*(C/(1-chi)-chi/(1-chi)*C(-1))+ varrho*(sigma_c-1)*(hss/(1-hss))*H;


    [name='Marginal Utility of Consumption (with external habits) 2']

        UC(+1)=UC-R(+1); 


    [name='Euler equation']
    
        UH=-UC-(C/(1-chi)-chi/(1-chi)*C(-1))-(hss/(1-hss))*H;


    [name='Labour supply foc']
            
        W=-UH-UC;


    [name='Prodution function']

        Y=alp*(A+H)+(1-alp)*K(-1);


    [name='Wholesale firms FOC for labou']
    
        MC=W+H-Y;


    [name='Resource constraint']

        Y=cy*C+iy*I+gy*G;

    [name='Capital law of motion']

        K=delta*I +(1-delta)*K(-1);

    [name='Tobin s Q 1']

        X=(Rss-1+delta)/(Rss)*(MC+Y-K(-1))+(1-delta)/(Rss)*Q;

    [name='Tobin s Q 2']

        R(+1)=X(+1)-Q;

    [name='Investments']

        (1+1/(Rss))*I= 1/(Rss)*I(+1)+I(-1)+1/(2*phiX*(1)^2)*Q; 

%
%

    [name='Balanced budget constraint']

        G=H+W+tax;

    [name='Phillips Curve']

        PIE=betta/(1+betta*gammap)*PIE(+1)+gammap/(1+betta*gammap)*PIE(-1)+(1-betta*xi)*(1-xi)/((1+betta*gammap)*xi)*(MC+MS);

    
@#if rule==0

    [name='Taylor rule - implementable rule (relative to ss)']

	Rn=rho_r*Rn(-1)+(1-rho_r)*theta_pie*(PIE)+(1-rho_r)*theta_y*Y+epsM;
	
    @#endif

    @#if rule>0

    [name='Taylor rule - conventional  rule (relative to Flexi-Price )']
    
    Rn=rho_r*Rn(-1)+(1-rho_r)*theta_pie*(PIE)+(1-rho_r)*theta_y*(Y-YF)+epsM;
   
	   @#endif

    [name='Real Interest Rate']

        R=Rn(-1)-PIE;

    [name='Real Ex-Post Interest Rate']

        ER=Rn-PIE(+1);

    [name='Technology shock process']
    
        A=rhoA*A(-1)+epsA;
    
    [name='Government spending shock process']

        G=rhoG*G(-1)+epsG;
    
        [name='Markup shock process']

        MS=rhoMS*MS(-1)+epsMS;
        
end;

%----------------------------------------------------------------
% Specification of shocks
%----------------------------------------------------------------

shocks;
    var epsA; stderr 1;
    var epsG; stderr 1;
    var epsMS; stderr 1;
    var epsM; stderr 1;
end;

stoch_simul(order=1,irf=40, graph_format=fig) Y C I H W R ER Q Rn PIE;
write_latex_dynamic_model;
collect_latex_files;