%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynare set-up: 
%   - Non-linear version
%   - RBC Model with adjustment costs of investment
%	- CD utility Function
%	- Calibrated to hit target hours and great ratios
%   - External Steady State solves for ss hours
%
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
    UC          $U_C$        (long_name='Marginal utility of consumption')
    UH          $U_H$        (long_name='Marginal utility of labor')
    LAMBDA      $\Lambda$   (long_name='Stochastic discount factor')
    R           $R$         (long_name='Risk free interest rate')
    RK          $R^{K}$     (long_name='Gross return on capital')
	rk			$r^{K}$		(long_name='Return on capital')
    C           $C$         (long_name='Consumption') 
    W           $W$         (long_name='Real wage')
    H           $H$         (long_name='Hours')
    Y           $Y$         (long_name='Output') 
    K           $K$         (long_name='Capital')
    I           $I$         (long_name='Investment')  
    A           $A$         (long_name='Technology')
    G           $G$         (long_name='Government spending')
	tax			$T$         (long_name='Tax')
	q			$q$			(long_name='Tobin s marginal Q ')
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
% 2. Calibration
%----------------------------------------------------------------

alp=0.70;           // Labor share
betta=0.99;         // Discount factor
gy=0.2;             // Government output ratio
cy=0.6;				// Consumption output ratio
iy=0.2;				// Investment output ratio
H_bar=0.35;			// Target ss hours worked
varrho=alp*(1-H_bar)/(alp*(1-H_bar)+cy*H_bar); // Calibrated to hit H=H_bar in steady state
delta=(1/betta-1)*iy/(1-alp-iy); 			   // Calibrated to hit iy and R=1/betta in steady state
sigma_c=2.0;        // Inverse of the elasticity of substitution
phiX=2.0;			// Parameter ruling investment costs

%----------------------------------------------------------------
% Choice of units of output, hours and capital (i.e,. normalization)
%----------------------------------------------------------------
A_bar=1;            // Steady state technology            

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

		U=(((C^(1-varrho))*((1-H)^varrho))^(1-sigma_c)-1)/(1-sigma_c);
		%U=(1-varrho)*log(C)+varrho*log(1-H);

    [name='Marginal Utility of Consumption']
    
		UC=(1-varrho)*(C^((1-varrho)*(1-sigma_c)-1))*((1-H)^(varrho*(1-sigma_c)));
		%UC=(1-varrho)/C;

    [name='Marginal Utility of Labor']

		UH=-varrho*(C^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));
		%UH=-varrho/(1-H);

    % Stochastic discount factor
    [name='Stochastic discount factor - 1']

		LAMBDA*R=1;
		//UC=betta*R*UC(+1);  	%%%%%%%%%%%%%

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
		
		K=I*(1-phiX*(I/I(-1)-1)^2)+(1-delta)*K(-1);

    [name='Stochastic discount factor - 2']

		LAMBDA=betta*UC(+1)/UC;

	%	Tobin's Q
	[name='Investment']
	
		1=q*(1-phiX*(I/I(-1)-1)^2-2*phiX*(I/I(-1)-1)*(I/I(-1)))+LAMBDA*q(+1)*2*phiX*(I(+1)/I-1)*(I(+1)/I)^2;

	[name='Returns on capital']

		rk=(1-alp)*Y/K(-1);

	[name='Gross returns on capital']

		RK=(rk(+1)+(1-delta)*q(+1))/q;

	[name='Capital FOC']

		LAMBDA*RK=1;

	[name='Balance budget constraint']

		G=tax;

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
/*
%----------------------------------------------------------------
% Analytical steady-state computation - now an external steady state 
%----------------------------------------------------------------
*/
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

stoch_simul(order=2,irf=40) YY CC II HH WW RR q;

collect_latex_files;
