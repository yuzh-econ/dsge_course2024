
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynare set-up:
%   - NK Model with costs of adjusting investment
%   - Non-linear set-up
%   - With habit and indexing
%   - Remove retail costs
%   - Add Flexi Price Bloc
%   - Zero ss net inflation
%   - Use of preprocessor commands
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;
debug;
%----------------------------------------------------------------
% Control panel
%----------------------------------------------------------------
%
%NOTE: when changing these options it is safest to run clear all in matlab before executing
%
%

@#define habit = 1
%habit=1 gives habit in consumption
%habit=0 removes habit in consumption 
   
@#define indexing = 1 
%indexing = 1 gives indexed Calvo contracts
%indexing = 0 removes indexing

@#define rule = 0

%rule=0  gives  implementable rule with persistence, inflation and output targets
%rule=1  gives  standard Taylor  rule with persistence, inflation and output gap targets

@#define flexi = 0

%flexi=0 gives NK model with sticky prices
%flexi=1 makes prices flexi- should then give the same output as RBC

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
    U           $U$         (long_name='Utility')
    UC          $UC$        (long_name='Marginal utility of consumption')
    UH          $UH$        (long_name='Marginal utility of labour')
    LAMBDA      $\lambda$   (long_name='Stochastic discount factor')
    R           $R$         (long_name='Risk free interest rate')
    RK          $R^{K}$     (long_name='Return on capital')
    C           $C$         (long_name='Consumption') 
    W           $W$         (long_name='Real wage')
    H           $H$         (long_name='Hours')
    Y           $Y$         (long_name='Output') 
    PWP         $P^{W}$     (long_name='Intermediate price')
    K           $K$         (long_name='Capital stock')
    I           $I$         (long_name='Investment')  
    tax         $Tax$       (long_name='Taxes') 
    A           $A$         (long_name='Production technology')
    G           $G$         (long_name='Government spending') 
	  KY			$\frac{\bar{K}}{\bar{YW}}$   (long_name='Capital output ratio in steady state')
	  IY          $\frac{\bar{I}}{\bar{Y}}$    (long_name='Investment output ratio in steady state')
	  CY          $\frac{\bar{C}}{\bar{Y}}$    (long_name='Consumption output ratio in steady state')
    S           $S$                          (long_name='Investment adjustment costs') 
    Sdash       $S^{l}$                      (long_name='Adjustment costs on X')
    Q           $Q$                          (long_name='Tobin Q')
    X           $X$                          (long_name='Gross growth rate of investment')
    Rn          $Rn$                         (long_name='Nominal interest rate') 
    ER          $E(R)$                       (long_name='Ex-post real interest rate')
    PIE         $\pi$                         (long_name='Inflation')  
    MC          $MC$                         (long_name='Real marginal costs')
    JJ          $JJ$                         (long_name='Price setting - Recursive auxiliary variable 1a')
    JJtilde     $\tilde{JJ}$                 (long_name='Price setting - Recursive auxiliary variable 2a')
    J           $J$                          (long_name='Price setting - Recursive auxiliary variable 1b')
    Jtilde      $\tilde{J}$                  (long_name='Price setting - Recursive auxiliary variable 2b')
    PIEtilde    $\tilde{\pi}$                (long_name='Optimal reset price')            
    Delta       $\delta$                     (long_name='Price dispersion')
    MS          $MS$                         (long_name='Mark-up shock')

    UF           $UF$         (long_name='Utility - flexible prices')
    UCF          $UCF$        (long_name='Marginal utility of consumption - flexible prices')
    UHF          $ULF$        (long_name='Marginal utility of labour - flexible prices')   
    RF           $RF$         (long_name='Risk free interest rate - flexible prices')
    GF           $GF$         (long_name='Government spending - flexible prices')
	PWPF         $PF^{W}$     (long_name='Wholesale price - flxible prices') 
    HF           $HF$         (long_name='Hours - flxible prices')  
    YF           $YF$         (long_name='Output - flxible prices')  
    KF           $KF$         (long_name='Capital stock - flxible prices') 
    IF           $IF$         (long_name='Investment - flxible prices')   
    WF           $WF$         (long_name='Real wage - flxible prices') 
    CF           $CF$         (long_name='Consumption - flxible prices') 
    KYF          $\frac{\bar{KF}}{\bar{YF}}$   (long_name='Capital output ratio in steady state - flxible prices')
    IYF          $\frac{\bar{IF}}{\bar{YF}}$   (long_name='Investment output ratio in steady state - flxible prices') 
    CYF          $\frac{\bar{CF}}{\bar{YF}}$   (long_name='Consumption output ratio in steady state - flxible prices')
    taxF         $TaxF$       (long_name='Taxes - flxible prices')
    LAMBDAF      $\lambda$    (long_name='Stochastic discount factor - flxible prices')
    RKF          $RFk$        (long_name='Gross return on capital')
    SF           $SF$         (long_name='Investment adjustment costs')
    SdashF       $SF^{l}$     (long_name='Adjustment costs on X')
    QF           $QF$         (long_name='Tobin Q') 
    XF           $XF$         (long_name='Gross growth rate of investment')
 
    OUTGAP       $OUTGAP$     (long_name='Output gap')  
	
    
    IS          $IS$            (long_name='Investment Scaler')
    PS          $PS$            (long_name='Preference Scaler')
%--------------------------------------------------------------------------------
%   Variables in deviation from the steady state (used for IRFs)
%--------------------------------------------------------------------------------

    RR              $RR$       (long_name='Real interest rate - deviation from the steady state') 
    RnRn            $RRn$      (long_name='Nominal interest rate - deviation from the steady state') 
    ERER            $E(RR)$    (long_name='Ex-post real interest rate - deviation from the steady state')
    YY              $yy$       (long_name='Output - deviation from the steady state')
    CC              $cc$       (long_name='Consumption - deviation from the steady state') 
    HH              $hh$       (long_name='Hours - deviation from the steady state') 
    WW              $ww$       (long_name='Real wage - deviation from the steady state')
    II              $ii$       (long_name='Investment - deviation from the steady state') 
    KK              $kk$       (long_name='Capital - deviation from the steady state') 
    QQ              $qq$       (long_name='Tobin Q - deviation from the steady state')  
    PIEPIE          $\pi\pi$   (long_name='Inflation - deviation from the steady state')
    OUTGAPOUTGAP    $Ogapogap$ (long_name='Output gap - deviation from the steady state')

	varrho         ${\varrho}$ (long_name='Weight on Leisure in utility')
;

%----------------------------------------------------------------
% Declaration of exogeneous variables
%----------------------------------------------------------------

varexo
    epsA        ${\epsilon^{A}}$      (long_name='Labour augmenting shock')
    epsG        ${\epsilon^{G}}$      (long_name='Government spending shock')
    epsMS       ${\epsilon^{MS}}$     (long_name='Mark-up shock')
    epsM        ${\epsilon^{M}}$      (long_name='Monetary policy shock')
    epsIS       ${\epsilon^{I}}}$     (long_name='Investment Specific shock')
    epsPS       ${\epsilon^{U}}}$     (long_name='Preference shock')
;

%----------------------------------------------------------------
% Declaration of parameters
%----------------------------------------------------------------

parameters 
    gy             ${gy}$                       (long_name='Government spending output ratio in steady state') 
    zzeta          ${\zeta}$                    (long_name='Elasticity of substitution across products')
    alp            ${\alpha}$                   (long_name='Labour share')
    betta          ${\beta}$                    (long_name='Discount factor') 
    delta          ${\delta}$                   (long_name='Capital depreciation')
    sigma_c        ${\sigma_{C}}$               (long_name='Inverse of the elasticity of substitution')
    rhoA           ${\rho_{A}}$                 (long_name='Persistence of labour augmentig shock')
    rhoG           ${\rho_{G}}$                 (long_name='Persistence of government spending shock')
	Ass	           ${\bar{A}}$                  (long_name='Labour technology in steady state')
    phiX           ${\phi_{X}}$                 (long_name='Smoothing parameter of investment adjustment costs')
    xi             ${\xi}$                      (long_name='Calvo parameter')          
    rho_r          ${\rho_{R}}$                 (long_name='Interest rate smoothing parameter') 
    theta_pie      $\theta^{\pi}$              (long_name='Taylor rule parameter for inflation')
    theta_y        $\theta^{y}$                (long_name='Taylor rule parameter for output') 
    rhoMS          ${\rho_{MS}}$                (long_name='Persistence of mark-up shock')
    chi            ${\chi}$                     (long_name='habits persistence')
    gammap         ${\gamma^{p}}$               (long_name='degree of indexation')
	Hss            ${\bar{H}}$                  (long_name='Hours in steady state') 
    
    rhoPS         ${\rho_{U}}$                 (long_name='Persistence of preference shock') 
    rhoIS         ${\rho_{I}}$                 (long_name='Persistence of investment shock') 
 
    sigma_A        ${\sigma_{A}}$               (long_name='STD of labour augmentig shock')
    sigma_G        ${\sigma_{G}}$               (long_name='STD of government spendng shock') 
    sigma_MS       ${\sigma_{MS}}$              (long_name='STD of mark-up shock') 
    sigma_M        ${\sigma_{M}}$               (long_name='STD of monetary policy shock')
    sigma_PS       ${\sigma_{U}}$               (long_name='STD of preference shock')
    sigma_IS       ${\sigma_{I}}$               (long_name='STD of investment shock')
 ;


%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

gammap=0.5;		// Indexing
chi=0.7;		// Habit parameter
Hss=0.35;		// Steady state hours
phiX=4.0;		// Smoothing parameter of investment adjustment costs
gy=0.2; 		// Government output ratio
alp=0.70;       // Labour share
zzeta= 7.0;		// Elasticity of substitution across products
betta= 0.99;   	// Discount factor
delta= 0.0250; 	// Capital depreciation
sigma_c= 2.0;   // Inverse of the elasticity of substitution

%----------------------------------------------------------------
% Monetary Policy Rule
%----------------------------------------------------------------

rho_r=0.7;     // Smoothing parameter of the interest rate
theta_pie=1.5; // Taylor rule parameter for inflation
theta_y=0.3;   // Taylor rule parameter for output

%----------------------------------------------------------------
% Choice of units of output, hours and capital (i.e,. normalization)
%----------------------------------------------------------------

Ass=1;            // Steady state technology            

%----------------------------------------------------------------
% Shock persistence
%----------------------------------------------------------------

rhoA=0.75; // Persistence of labour augmentig shock
rhoG=0.75; // Persistence of government spending shock
rhoMS=0.75;// Persistence of mark-up shock
rhoPS=0.999;// Persistence of preference shock
rhoIS=0.999;// Persistence of investment shock

%----------------------------------------------------------------
% Standard deviation of shocks
%----------------------------------------------------------------
sigma_A=1; // STD of labour augmentig shock
sigma_G=1; // STD of government spendng shock
sigma_MS=1;// STD of mark-up shock
sigma_M=1;// STD of monetary policy shock
sigma_PS=1;// STD of preference shock
sigma_IS=1;// STD of investment shock
%-----------------------------------------------------------------

@#if habit > 0
	chi=0.7;
	@#else
	chi=0;
@#endif

@#if indexing > 0
	gammap=0.5;
	@#else
	gammap=0;
@#endif

% Switch for price stickiness

@#if flexi==0
	xi=0.75;
	%xi=0.5; 
	zzeta=7;
	
	@#else // Flexi-price case 
	xi=0.0;
	zzeta=1000;
	%sigma_MS=0;//ensures NK and RBC are equivalent
@#endif

%-------------------------------------------------------------------

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;

   [name='Parameter varrho']

   varrho=STEADY_STATE(varrho);

    [name='Single period utility']

		U=((((C-chi*C(-1))^(1-varrho))*((1-H)^varrho))^(1-sigma_c)-1)/(1-sigma_c)*PS;


    [name='Marginal Utility of Consumption (with external habits)']
    
		UC=(PS)*(1-varrho)*((C-chi*C(-1))^((1-varrho)*(1-sigma_c)-1))*((1-H)^(varrho*(1-sigma_c)));

    [name='Marginal Utility of Labour (with external habits)']
    
		UH=-(PS)*varrho*((C-chi*C(-1))^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));
       

    %----------------------------------------------------------------
    % Euler equation 
    %----------------------------------------------------------------
    %Risky Bonds; Rn set in period t to yield interest over period t+1, 
    %ex post real interest rate R now risky

        %UC=betta*R(+1)*UC(+1);

    %----------------------------------------------------------------
    % Stochastic discount factor
    %----------------------------------------------------------------

    [name='Stochastic discount factor - 1']

		LAMBDA=betta*UC/UC(-1);

    %Alternative Euler Equation

    [name='Stochastic discount factor - 2']

		R(+1)*LAMBDA(+1)=1;

    %For NK: Fisher Equation

    [name='Fisher equation - real interest rate']    
       
		R=Rn(-1)/PIE;
    
    [name='Fisher equation - expected real interest rate']        
    
		ER=Rn/PIE(+1);

    [name='Labour Supply FOC']

		-UH/UC=W;

    [name='Price dispertion - eq. 10']    

		Delta=xi*(PIEtilde^zzeta)*Delta(-1)+(1-xi)*(J/JJ)^(-zzeta);

    [name='Prodution function']

    %Note: Capital stock is end-of-period
    
		Y=((A*H)^alp)*(K(-1))^(1-alp)/Delta;

    [name='Wholesale firms FOC - 1a']
    
		RK=((1-alp)*PWP*Y*Delta/K(-1)+(1-delta)*Q)/Q(-1);

    [name='Wholesale firms FOC - 1b']
       %where Tobin's Q is given by

		Q*(1-S-X*Sdash)+LAMBDA(+1)*Q(+1)*Sdash(+1)*X(+1)^2=1;

    [name='Wholesale firms FOC - 2']
 
		LAMBDA(+1)*RK(+1)=1;

    [name='Wholesale firms FOC - 3']
		
			PWP*(alp*Y*Delta)/H=W;

    [name='Resource constraint']
    
		Y=C+G+I;

    [name='Capital law of motion']
		%Costless investment adjustment return on capital
		
		%K=I+(1-delta)*K(-1);
		%replaced with
		

		K=(1-S)*I*IS+(1-delta)*K(-1);

    [name='Gross growth rate of investment']

		X=I/I(-1);

    [name='Investment adjustment cost - 1']
		
		S=phiX*(X-1)^2;

    [name='Investment adjustment cost - 2']

		Sdash=2*phiX*(X-1);

    [name='Balanced budget constraint']

		G=tax;


    [name='Inflation dynamic - 1']

		JJ-xi*betta*JJtilde(+1)=Y*UC;

    [name='Inflation dynamic - 2']

		J-xi*betta*Jtilde(+1)=(1/(1-(1/zzeta)))*Y*UC*MC*MS;

    [name='Inflation dynamic - 3']

		JJtilde=(PIEtilde^(zzeta-1))*JJ;

    [name='Inflation dynamic - 4']

		Jtilde=PIEtilde^zzeta*J;

    [name='Inflation dynamic - 5']

		1=xi*(PIEtilde^(zzeta-1))+(1-xi)*((J/JJ)^(1-zzeta));

    [name='Inflation dynamic - 6']

		PIEtilde=PIE/PIE(-1)^gammap;

	@#if rule==0

    [name='Taylor rule - implementable rule (relative to ss)']

		log(Rn/STEADY_STATE(Rn))=rho_r*log(Rn(-1)/STEADY_STATE(Rn))+(1-rho_r)*theta_pie*log(PIE/STEADY_STATE(PIE))
		+(1-rho_r)*theta_y*log(Y/STEADY_STATE(Y))+sigma_M*epsM;
    @#endif

    @#if rule>0

    [name='Taylor rule - conventional  rule (relative to Flexi-Price )']
        
	log(Rn/STEADY_STATE(Rn))=rho_r*log(Rn(-1)/STEADY_STATE(Rn))+(1-rho_r)*(theta_pie*log(PIE/STEADY_STATE(PIE))
	+theta_y*log((Y/STEADY_STATE(Y))/(YF/STEADY_STATE(YF))))+sigma_M*epsM;
    @#endif

    [name='Mark-up Monopolistic pricing']

		MC=PWP;

    [name='Labour augmenting shock process']

		log(A)-log(STEADY_STATE(A))=rhoA*(log(A(-1))-log(STEADY_STATE(A)))+sigma_A*epsA;

    [name='Government shock process']

		log(G)-log(STEADY_STATE(G))=rhoG*(log(G(-1))-log(STEADY_STATE(G)))+sigma_G*epsG;

    [name='Government shock process - flexible prices']

		log(GF)-log(STEADY_STATE(GF))=rhoG*(log(GF(-1))-log(STEADY_STATE(GF)))+sigma_G*epsG;

    [name='Markup shock']

		log(MS)-log(STEADY_STATE(MS))=rhoMS*(log(MS(-1))-log(STEADY_STATE(MS)))+sigma_MS*epsMS;
        
    [name='Preference shock']
        log(PS)-log(STEADY_STATE(PS))=rhoPS*(log(PS(-1))-log(STEADY_STATE(PS)))+sigma_PS*epsPS;

    [name='Investment shock']
        log(IS)-log(STEADY_STATE(IS))=rhoIS*(log(IS(-1))-log(STEADY_STATE(IS)))+sigma_IS*epsIS;
%----------------------------------------------------------------
% Variables in deviation form for IRFs
%----------------------------------------------------------------

YY=Y/STEADY_STATE(Y);
KK=K/STEADY_STATE(K);
II=I/STEADY_STATE(I);
CC=C/STEADY_STATE(C);
WW=W/STEADY_STATE(W);
HH=H/STEADY_STATE(H);
QQ=Q/STEADY_STATE(Q);
RR=R/STEADY_STATE(R);
ERER=ER/STEADY_STATE(ER);
RnRn=Rn/STEADY_STATE(Rn);
PIEPIE=PIE/STEADY_STATE(PIE);
OUTGAPOUTGAP=OUTGAP/STEADY_STATE(OUTGAP);

%----------------------------------------------------------------
% Ratio variables used in steady state
%----------------------------------------------------------------

KY=K/Y;
IY=I/Y;
CY=C/Y;


%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
%
% FLEXI- PRICE BLOCK (with ss mark-up so YF=Y) 
%
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------


    [name='Single period utility']

		UF=((((CF-chi*CF(-1))^(1-varrho))*((1-HF)^varrho))^(1-sigma_c)-1)/(1-sigma_c);

    [name='Marginal Utility of Consumption (with external habits)']

		UCF=(1-varrho)*((CF-chi*CF(-1))^((1-varrho)*(1-sigma_c)-1))*((1-HF)^(varrho*(1-sigma_c)));

    [name='Marginal Utility of Labour (with external habits)']

		UHF=-varrho*((CF-chi*CF(-1))^((1-varrho)*(1-sigma_c)))*((1-HF)^(varrho*(1-sigma_c)-1));

    %-------------------------------------------------------------------------
    % Euler equation
    %-------------------------------------------------------------------------
    %Riskless Bonds; R set in period t to yield interest over period t+1

        %UCF=betta*RF*UCF(+1);

    %-------------------------------------------------------------------------
    % Stochastic Discount Factor
    %-------------------------------------------------------------------------

		LAMBDAF=betta*UCF/UCF(-1);

    %Alternative Euler Equation

    [name='Stochastic Discount Factor - 2']

		RF*LAMBDAF(+1)=1;

     [name='Labour supply foc - eq 54']

		-UHF/UCF=WF;

    [name='Prodution function']
    %Note: Capital stock is end-of-period

		YF=((A*HF)^alp)*(KF(-1))^(1-alp);

    [name='Wholesale firms FOC - 1a']

		RKF=((1-alp)*PWPF*YF/KF(-1)+(1-delta)*QF)/QF(-1);
        %where Tobin's Q is given by

    [name='Wholesale firms FOC - 1b']

		QF*(1-SF-XF*SdashF)+LAMBDAF(+1)*QF(+1)*SdashF(+1)*XF(+1)^2=1;

    [name='Wholesale firms FOC - 2']

		LAMBDAF(+1)*RKF(+1)=1;

    [name='Wholesale firms FOC - 3']

		PWPF*(alp*YF)/HF=WF;

    [name='Resource constraint - eq 58']

		YF=CF+GF+IF;

    [name='Capital law of motion']

		KF=(1-SF)*IF+(1-delta)*KF(-1);
    
    %where

    [name='Gross growth rate of investment']

		XF=IF/IF(-1);

    [name='Investment adjustment cost - 1']

		SF=phiX*(XF-1)^2;

    [name='Investment adjustment cost - 2']

		SdashF=2*phiX*(XF-1);

    [name='Balance budget constraint']

		taxF=GF;

    [name='Mark-up monopolistic shock']

	PWPF=(1-1/zzeta);//without MS shock 
	
  %   PWPF=(1-1/zzeta)/MS;

    [name='Output gap']

		OUTGAP=YF/Y;

%----------------------------------------------------------------
% Variables used for the steady state
%----------------------------------------------------------------
KYF=KF/YF;
IYF=IF/YF;
CYF=CF/YF;

end;

//initval;
//Use this for initial steady state guess at the numerical solution
//end;


%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

%----------------------------------------------------------------
% Analytical steady-state computation 
%----------------------------------------------------------------


steady_state_model;
	H=Hss;
	A=Ass;
	Delta=1;
	R=1.0/betta;
	PWP=1-1/zzeta;
	KY=PWP*(1-alp)/(R-1+delta);
	IY=PWP*(1-alp)*delta/(R-1+delta);
	CY=1-IY-gy;
	//H=(1-varrho)*alp*PWP/(varrho*CY*(1-chi)+(1-varrho)*alp*PWP);
	varrho=(1-H)/(1+H*(CY*(1-chi)/(alp*PWP)-1));
	Y=A*H*KY^((1-alp)/alp)/Delta;
	K=KY*Y;
	I=IY*Y;
	G=gy*Y;
	W=alp*PWP*Y/H;
	C=CY*Y;
	%
	%Other endogenous Variabes
	%
	tax=G;
	U=1/(1-sigma_c)*((C*(1-chi))^((1-varrho)*(1-sigma_c))*(1-H)^(varrho*(1-sigma_c))-1);
	UC=(1-varrho)*(C*(1-chi))^((1-varrho)*(1-sigma_c)-1)*(1-H)^(varrho*(1-sigma_c));
	UH=-varrho*((C*(1-chi))^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));
	LAMBDA=betta;
	RK=R;
	%
	S=0;
	Sdash=0;
	Q=1;
	X=1;
	MC=PWP;
	JJ=Y*UC/(1-betta*xi);
	JJtilde=JJ;
	J=JJ;
	Jtilde=J;
	PIE=1;
	PIEtilde=1;
	MS=1;
	Rn=1/betta;
	ER=1/betta;

    IS=1;
    PS=1;
    
	YY=1;
	CC=1;
	HH=1;
	WW=1; 
	II=1; 
	KK=1;
	RR=1;

	QQ=1;
	RnRn=1;
	PIEPIE=1;
	ERER=1;
	RF=R;
	PWPF=1-1/zzeta;
	KYF=PWPF*(1-alp)/(RF-1+delta);
	IYF=PWPF*(1-alp)*delta/(RF-1+delta);
	CYF=1-IYF-gy;
	HF=(1-varrho)*alp*PWPF/(varrho*CYF*(1-chi)+(1-varrho)*alp*PWPF);
	YF=A*HF*KYF^((1-alp)/alp);
	GF=gy*YF;
	KF=KYF*YF;
	IF=IYF*YF;
	WF=alp*PWPF*YF/HF;
	CF=CYF*YF;

	taxF=GF;
	UF=1/(1-sigma_c)*((CF*(1-chi))^((1-varrho)*(1-sigma_c))*(1-HF)^(varrho*(1-sigma_c))-1);
	UCF=(1-varrho)*(CF*(1-chi))^((1-varrho)*(1-sigma_c)-1)*(1-HF)^(varrho*(1-sigma_c));
	UHF=-varrho*((CF*(1-chi))^((1-varrho)*(1-sigma_c)))*((1-HF)^(varrho*(1-sigma_c)-1));
	LAMBDAF=LAMBDA;
	RKF=RK;
	SF=S;
	SdashF=Sdash;
	QF=Q;
	XF=X;
	OUTGAP=YF/Y;
	OUTGAPOUTGAP=1;
end;

steady;


%----------------------------------------------------------------
% Specification of shocks
%----------------------------------------------------------------

shocks;
%     var epsA; stderr sigma_A;
%     var epsG; stderr sigma_G;
%     var epsMS; stderr sigma_MS;
%     var epsM; stderr sigma_M;
    var epsPS; stderr sigma_PS;
    var epsIS; stderr sigma_IS;
end;

check;

stoch_simul(order=1,irf=40, tex, graph_format=fig) YY CC II HH WW RR ERER QQ RnRn PIEPIE;

%stoch_simul(order=1,irf=40,tex, graph_format=fig) YY CC II HH WW RR ERER QQ RnRn PIEPIE OUTGAPOUTGAP;

write_latex_dynamic_model;
write_latex_static_model;
write_latex_definitions;
write_latex_parameter_table;
collect_latex_files;
