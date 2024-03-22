%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynare set-up: 
%   - Non-linear version
%   - RBC Model with adjustment costs of investment
%	- JR preferences utility Function
%	- Calibrated to hit target hours and great ratios
%
% DSGE: Solution and Estimation Techniques 
% 
%
% This is a free software: you can redistribute it and/or modify it under
% the terms of the GNU General Public License as published by the Free
% Software Foundation, either version 3 of the License, or (at your option)
% any later version.  See <http://www.gnu.org/licenses/> for more information.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;


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
    U                                   (long_name='Utility function')
    UC          $UC$                    (long_name='Marginal utility of consumption')
    UH          $UL$                    (long_name='Marginal utility of labor')
	UXi         ${\Lambda^{\Xi}}$       (long_name='Marginal Utility of $\Xi$') 
	lam         ${\lambda}$             (long_name='lagarange multiplier') 
	mu          ${\mu}$                 (long_name='JR preferences auxiliary variable 2') 
    LAMBDA      $\lambda$               (long_name='Stochastic discount factor')
	R           $R$                     (long_name='Risk free interest rate')
    RK          $R^{K}$                 (long_name='Return on capital')
    C           $C$                     (long_name='Consumption') 
    Xi          ${\Xi}$                 (long_name='JR preferences auxiliary variable 1') 
	W           $W$                     (long_name='Real wage')
    H           $H$                     (long_name='Hours')
    Y           $Y$                     (long_name='Output') 
    K           $K$                     (long_name='Capital')
    I           $I$                     (long_name='Investment')  
    A           $A$                     (long_name='Technology')
    G           $G$                     (long_name='Government spending')
	tax			$T$                     (long_name='Tax')
	X			$X$                     (long_name='Gross investment growth rate')
	Q			$Q$                     (long_name='Tobin s Q')	
	KY          $\frac{\bar{K}}{\bar{Y}}$    (long_name='Capital output ratio in steady state')
    IY          $\frac{\bar{I}}{\bar{Y}}$    (long_name='Investment output ratio in steady state')
    CY          $\frac{\bar{C}}{\bar{Y}}$    (long_name='Consumption output ratio in steady state')


%--------------------------------------------------------------------------------
%   Variables in deviation from the steady state (used for IRFs)
%--------------------------------------------------------------------------------

	RR			$RR$         (long_name='Risk free interest rate - deviation from the steady state')
	YY 			$YY$       	 (long_name='Output - deviation from the steady state') 
	CC         	$CC$         (long_name='Consumption - deviation from the steady state') 
	HH			$HH$         (long_name='Hours - deviation from the steady state') 
	WW		    $WW$         (long_name='Real wage - deviation from the steady state')
	II 			$II$         (long_name='Investment - deviation from the steady state')
	KK			$KK$         (long_name='Capital - deviation from the steady state')
;
	


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF EXOGENOUS VARIABLES%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varexo epsA epsG;

		
%--------------------------------------------------------------------------------
%   Variables in deviation from the steady state (used for IRFs)
%--------------------------------------------------------------------------------
%----------------------------------------------------------------
% Declaration of exogeneous variables
%----------------------------------------------------------------

varexo
    epsA        ${\epsilon^{A}}$      (long_name='Labor saugmenting shock')
    epsG        ${\epsilon^{G}}$      (long_name='Government spending shock')
;

%----------------------------------------------------------------
% Declaration of parameters
%----------------------------------------------------------------

parameters

    theta          ${\theta}$                   (long_name='Inverse of the Frish Elasticity of Labor Supply') 
	sigma_es       ${\sigma_{es}}$              (long_name='Intertemporal elasticity of substitution')
    kappa          ${\kappa}$                   (long_name='Weight on Leisure in Utility') 
    gamma          ${\gamma}$                   (long_name='Wealth effect parameter') 
    alp            ${\alpha}$                   (long_name='Labor share')
    betta          ${\beta}$                    (long_name='Discount factor') 
    delta          ${\delta}$                   (long_name='Capital depreciation')
    rhoA           ${\rho_{A}}$                 (long_name='Persistence of labor augmentig shock')
    rhoG           ${\rho_{G}}$                 (long_name='Persistence of government spending shock')
    sigma          ${\sigma}$                   (long_name='Shock scaling parameter') 
    phiX           ${\phi^X}$                   (long_name='Investment adjustment costs')
    H_bar          $\bar{H}$                    (long_name='Steady state hours')
    A_bar          $\bar{A}$                    (long_name='Steady state technology')
    cy             $\frac{\bar{C}}{\bar{Y}}$    (long_name='Consumption output ratio in steady state')
    iy             $\frac{\bar{I}}{\bar{Y}}$    (long_name='Investment output ratio in steady state')
    gy             $\frac{\bar{G}}{\bar{Y}}$    (long_name='Government output ratio')    
;
	


%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

%----------------------------------------------
% Utility function 
%----------------------------------------------
%gamma=0.0001;	// closes down short-term wealth effects 
gamma=0.1;
%gamma=1.0;
%theta=2.60;	// value that minimizes the Frisch inverse 
				// elasticity below for gamma almost zero 
theta=1.4; 		// From JR  

%-----------------------------------------------

alp=0.70;           // Labor share
betta=0.99;         // Discount factor
gy=0.2;             // Government output ratio
cy=0.6;				// Consumption output ratio
iy=0.2;				// Investment output ratio
H_bar=0.35;			// Target ss hours worked

kappa=alp*(1-betta*(1-gamma))/(theta*cy*(1-betta*(1-gamma))+gamma*alp)/H_bar^theta;

delta=(1/betta-1)*iy/(1-alp-iy);	// Discount factor:
									// Calibrated to hit iy and R=1/betta in steady state
sigma_es=2.0;						// Inverse elasticity of substitution 
phiX=2.0;phiX=2.0;					// Parameter ruling investment costs

%----------------------------------------------------------------
% Choice of units of output, hours and capital (i.e,. normalization)
%----------------------------------------------------------------
A_bar=1;

%----------------------------------------------------------------
% Shock persistence
%----------------------------------------------------------------

rhoA=0.75; // Persistence of labor augmentig shock
rhoG=0.75; // Persistence of government spending shock

%----------------------------------------------------------------
% Shock scaling  parameter
%----------------------------------------------------------------

sigma=0.01;	//	for order 2 or 3 stochastic simulations 

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;


    [name='Single period utility']

		U=((C-kappa*(H^theta)*Xi)^(1-sigma_es)-1)/(1-sigma_es);

	[name='Consumption - auxiliary variable']

		Xi=C^gamma*Xi(-1)^(1-gamma);

    [name='Marginal Utility of Consumption']
    
		UC=(C-kappa*H^theta*Xi)^(-sigma_es);

    [name='Marginal Utility of Labor']

		UH=-theta*kappa*H^(theta-1)*Xi*UC;

    [name='Marginal Utility of auxiliary variable']
		
		UXi=-kappa*H^theta*UC;

    %----------------------------------------------------------------
    % Stochastic discount factor
    %----------------------------------------------------------------

    [name='Stochastic discount factor - 1']

		lam=betta*R*lam(+1);

    [name='Stochastic discount factor - 1']
		
		lam=UC-gamma*mu*Xi/C;

    [name='Utility function parameter']
		
		mu=-UXi+betta*(1-gamma)*mu(+1)*Xi(+1)/Xi;

    [name='Labor Supply FOC']

		-UH/lam=W;


    [name='Prodution function']

    %Note: Capital stock is end-of-period

		Y=((A*H)^alp)*(K(-1))^(1-alp);


    [name='Wholesale firms FOCs']

		alp*Y/H=W;


	[name='Output equilibrium']

		Y=C+G+I;


    [name='Capital law of motion with investment costs']
		
		K=I*(1-phiX*(X-1)^2)+(1-delta)*K(-1);

    [name='Gross investment growth rate']

		X=I/I(-1);


%---------------------------------------------------------------------------
%	Tobin's Q
%---------------------------------------------------------------------------
		
    [name='Stochastic discount factor - 2']

		LAMBDA=betta*UC/UC(-1);

	[name='Tobin s Q - 1']

		Q*(1-phiX*(X-1)^2-X*2*phiX*(X-1))+2*phiX*(X(+1)-1)*X(+1)^2*Q(+1)*LAMBDA(+1)=1;

	[name='Returns on capital with adjustment costs - 1']

		RK=((1-alp)*Y/K(-1)+(1-delta)*Q)/Q(-1);


	[name='Returns on capital with adjustment costs - 2']

		LAMBDA(+1)*RK(+1)=LAMBDA(+1)*R;

	[name='Balance budget constraint']

		G=H*W*tax;



    [name='Technology shock process']

		log(A)-log(STEADY_STATE(A))=rhoA*(log(A(-1))-log(STEADY_STATE(A)))+sigma*epsA;


    [name='Government spending shock process']
		
		log(G)-log(STEADY_STATE(G))=rhoG*(log(G(-1))-log(STEADY_STATE(G)))+sigma*epsG;

%----------------------------------------------------------------
% Variables in log-deviation form for IRFs
%----------------------------------------------------------------

	YY=Y/STEADY_STATE(Y);
	KK=K/STEADY_STATE(K);
	II=I/STEADY_STATE(I);
	CC=C/STEADY_STATE(C);
	WW=W/STEADY_STATE(W);
	HH=H/STEADY_STATE(H);
	RR=R/STEADY_STATE(R);

%----------------------------------------------------------------
% Ratio variables used in steady state
%----------------------------------------------------------------

	KY=K/Y;
	IY=I/Y;
	CY=C/Y;
end;


%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

%----------------------------------------------------------------
% Analytical steady-state computation
%----------------------------------------------------------------

steady_state_model;

	A=A_bar;
	R=1.0/betta;
	KY=(1-alp)/(R-1+delta);
	IY=(1-alp)*delta/(R-1+delta);
	CY=1-IY-gy;
	H=H_bar;
	Y=A*H*KY^((1-alp)/alp);
	K=KY*Y;
	I=IY*Y;
	C=CY*Y;
	G=gy*Y;
	W=alp*Y/H;//not satisfied!

	Xi=C;
	U=((C-kappa*(H^theta)*Xi)^(1-sigma_es)-1)/(1-sigma_es);
	UC=(C-kappa*H^theta*Xi)^(-sigma_es);
	UH=-theta*kappa*H^(theta-1)*Xi*UC;
	UXi=-kappa*H^theta*UC;
	%UXi=0;
	%gamma=1 case

	mu=-UXi/(1-betta*(1-gamma));
	lam=UC-gamma*mu;
	%W=-UH/lam;
	tax=G/(W*H);
	LAMBDA=betta;

%-----------------------------------------------
%Additional ss for Invest Costs
%-----------------------------------------------

	Q=1;	
	X=1;
	RK=R;

	YY=1;
	CC=1;
	HH=1;
	WW=1; 
	II=1; 
	KK=1;
	RR=1;
end;

%----------------------------------------------------------------
% Specification of shocks
%----------------------------------------------------------------

shocks;
	var epsA; stderr 1;
	var epsG; stderr 1;
end;

steady;

check;

write_latex_dynamic_model;
write_latex_static_model;
write_latex_definitions;
write_latex_parameter_table;

stoch_simul(order=2,irf=40) YY CC II HH WW RR Q;

collect_latex_files;
