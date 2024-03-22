%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynare set-up: 
%   - Non-linear version
%   - RBC Model with adjustment costs of investment
%	- CD utility Function
%	- Calibrated to hit target hours and great ratios
%
% DSGE: Solution and Estimation Techniques
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
    U                       (long_name='Utility function')
    UC          $UC$        (long_name='Marginal utility of consumption')
    UH          $UH$        (long_name='Marginal utility of labor')
    LAMBDA      $\lambda$   (long_name='Stochastic discount factor')
    R           $R$         (long_name='Risk free interest rate')
    RK          $R^{K}$     (long_name='Return on capital')
    C           $C$         (long_name='Consumption') 
    W           $W$         (long_name='Real wage')
    H           $H$         (long_name='Hours')
    Y           $Y$         (long_name='Output') 
    K           $K$         (long_name='Capital')
    I           $I$         (long_name='Investment')  
    A           $A$         (long_name='Technology')
    G           $G$         (long_name='Government spending')
	tax			$T$         (long_name='Tax')
	X			$X$       	(long_name='Gross investment growth rate')
	Q			$Q$		    (long_name='Tobin s Q')	
	Z1			$Z1$		(long_name='Tobin s Q - auxiliary variable')
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
		
%--------------------------------------------------------------------------------
%   Variables in deviation from the steady state (used for IRFs)
%--------------------------------------------------------------------------------
%----------------------------------------------------------------
% Declaration of exogeneous variables
%----------------------------------------------------------------

varexo
    epsA        ${\epsilon^{A}}$      (long_name='Labor augmenting shock')
    epsG        ${\epsilon^{G}}$      (long_name='Government spending shock')
;

%----------------------------------------------------------------
% Declaration of parameters
%----------------------------------------------------------------

parameters

    varrho         ${\varrho}$                  (long_name='Weight on Leisure in utility') 
    chii           ${\chi}$                     (long_name='Habit Parameter')
    alp            ${\alpha}$                   (long_name='Labor share')
    betta          ${\beta}$                    (long_name='Discount factor') 
    delta          ${\delta}$                   (long_name='Capital depreciation')
    sigma_c        ${\sigma_{C}}$               (long_name='Inverse of the elasticity of substitution')
    rhoA           ${\rho_{A}}$                 (long_name='Persistence of labor augmentig shock')
    rhoG           ${\rho_{G}}$                 (long_name='Persistence of government spending shock')
    sigma          ${\sigma}$                   (long_name='Shock scaling parameter') 
	phiX		   ${\phi^X}$                   (long_name='Investment Adjustment costs')
    H_bar          $\bar{H}$                    (long_name='Steady state hours')
    A_bar          $\bar{A}$                    (long_name='Steady state technology')
    cy             $\frac{\bar{C}}{\bar{Y}}$    (long_name='Consumption output ratio in steady state')
    iy             $\frac{\bar{I}}{\bar{Y}}$    (long_name='Investment output ratio in steady state')
    gy             $\frac{\bar{G}}{\bar{Y}}$    (long_name='Government output ratio')    
;

%----------------------------------------------------------------
% 2. Calibration (quarterly model)
%----------------------------------------------------------------

gy=0.2;             // Government output ratio
alp=0.70;           // Labour share
betta=0.99;         // Discount factor
delta=0.0250;       // Capital depreciation
sigma_c=2.0;        // Inverse of the elasticity of substitution

H_bar=0.35; // Steady state hours
R_bar=1.0/betta; // Steady state risk free interest rate
iy=((1-alp)*delta)/((R_bar-1+delta)); // Investment output ratio in steady state
cy=1-iy-gy; // Consumption output ratio in steady state
varrho=alp*(1-H_bar)/(alp*(1-H_bar)+cy*H_bar); // Weight on Leisure in utility

% 
% alp=0.70;           // Labor share
% betta=0.99;         // Discount factor
% gy=0.2;             // Government output ratio
% cy=0.6;				// Consumption output ratio
% iy=0.2;				// Investment output ratio
% H_bar=0.35;			// Target ss hours worked
% varrho=alp*(1-H_bar)/(alp*(1-H_bar)+cy*H_bar); // Calibrated to hit H=H_bar in steady state
% delta=(1/betta-1)*iy/(1-alp-iy); 			   // Calibrated to hit iy and R=1/betta in steady state
% sigma_c=2.0;        // Inverse of the elasticity of substitution
phiX=0.0;			// Parameter ruling investment costs
chii=0.99;           // Habit parameter

%----------------------------------------------------------------
% Choice of units of output, hours and capital (i.e,. normalization)
%----------------------------------------------------------------
A_bar=1;            // Steady state technology            

%----------------------------------------------------------------
% Shock persistence
%----------------------------------------------------------------

rhoA=0.75; // Persistence of labor augmenting shock
rhoG=0.75; // Persistence of government spending shock

%----------------------------------------------------------------
% Shock scaling  parameter
%----------------------------------------------------------------

sigma=0.01;	//	for order 2 or 3 stochastic simulations 
sigma=1;
%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;

    [name='Single period utility']

		U=((((C-chii*C(-1))^(1-varrho))*((1-H)^varrho))^(1-sigma_c)-1)/(1-sigma_c);

    [name='Marginal Utility of Consumption']
    
		UC=(1-varrho)*((C-chii*C(-1))^((1-varrho)*(1-sigma_c)-1))*((1-H)^(varrho*(1-sigma_c)));

    [name='Marginal Utility of Labor']

		UH=-varrho*((C-chii*C(-1))^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));

    %----------------------------------------------------------------
    % Stochastic discount factor
    %----------------------------------------------------------------

    [name='Stochastic discount factor - 1']

		UC=betta*R*UC(+1);
		//OR LAMBDA(+1)*R=1;

    [name='Labor Supply FOC']

		-UH/UC=W;

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

		Z1=2*phiX*(X-1)*X^2*Q*LAMBDA;

	[name='Tobin s Q - 2']
	
		Q*(1-phiX*(X-1)^2-X*2*phiX*(X-1))+Z1(+1)=1;

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
	H=(1-varrho)*alp/(varrho*CY*(1-chii)+(1-varrho)*alp);
	Y=A*H*KY^((1-alp)/alp);
	K=KY*Y;
	I=IY*Y;
	C=CY*Y;
	G=gy*Y;
	W=alp*Y/H;
	tax=G/(W*H);
	U=1/(1-sigma_c)*(((1-chii)*C)^((1-varrho)*(1-sigma_c))*(1-H)^(varrho*(1-sigma_c))-1);
	UC=(1-varrho)*((1-chii)*C)^((1-varrho)*(1-sigma_c)-1)*(1-H)^(varrho*(1-sigma_c));
	UH=-varrho*(((1-chii)*C)^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));
	LAMBDA=betta;

%-----------------------------------------------
%Additional ss for Invest Costs
%-----------------------------------------------

	Q=1;
	X=1;
	Z1=2*phiX*(X-1)*X^2*Q/(R);
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

stoch_simul(order=1,irf=40) YY CC II HH WW RR Q;

collect_latex_files;
