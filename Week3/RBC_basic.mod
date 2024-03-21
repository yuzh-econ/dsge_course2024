%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynare set-up: 
%   - Non-linear version
%   - RBC Model without costs of investment
%   - Zero growth in steady state
%
%
% DSGE: Solution and Estimation Techniques
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% Control panel
%----------------------------------------------------------------

%   In this code we show how to define a pre-processor variable 
%   (order of solution with an associated scaling parameter of shocks)
%   that can be used  in the same code.
%   This scaling is essential in the non-linear version for order 2 or higher
%   because it might cause the process to be explosive

    @#define solution_order = 1

%   if order =1, scaling parameter of shocks is set at 1 (to denote 1%)
%   [Best - but not essential - to use for IRFs] 
%   else order = 2
%   - then scaling parameter must be 0.01 (to denote 1%)
%
%   Note 1: to compare linear and the first-order approximation of the non-linear solution
%   be careful to use the same scaling parameter in both .mod files.
%
%   Note 2: This parameter rules:
%               - the scaling coefficient of the shocks (within the shocks equations)
%               - the choice of the order of approximation in the stoch_simul statement

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
    U
    UC          $UC$        (long_name='Marginal utility of consumption')
    UH          $UL$        (long_name='Marginal utility of labour')
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
    KY          $\frac{\bar{K}}{\bar{Y}}$    (long_name='Capital output ratio in steady state')
    IY          $\frac{\bar{I}}{\bar{Y}}$    (long_name='Investment output ratio in steady state')
    CY          $\frac{\bar{C}}{\bar{Y}}$    (long_name='Consumption output ratio in steady state')

%--------------------------------------------------------------------------------
%   Variables in deviation from the steady state (used for IRFs)
%--------------------------------------------------------------------------------

    y           $y$         (long_name='Output - deviation from the steady state')
    c           $c$         (long_name='Consumption - deviation from the steady state')
    h           $h$         (long_name='Hours - deviation from the steady state')
    w           $w$         (long_name='Real wage - deviation from the steady state')
    i           $i$         (long_name='Investment - deviation from the steady state')
    k           $k$         (long_name='Capital - deviation from the steady state')
    r           $r$         (long_name='Risk free interest rate - deviation from the steady state')
    a           $a$         (long_name='Technology - deviation from the steady state')
    g           $g$         (long_name='Government spending - deviation from the steady state')
;

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
    varrho         ${\varrho}$                  (long_name='Weight on Leisure in utility') 
    alp            ${\alpha}$                   (long_name='Labour share')
    betta          ${\beta}$                    (long_name='Discount factor') 
    delta          ${\delta}$                   (long_name='Capital depreciation')
    sigma_c        ${\sigma_{C}}$               (long_name='Inverse of the elasticity of substitution')
    cy             $\frac{\bar{C}}{\bar{Y}}$    (long_name='Consumption output ratio in steady state')
    iy             $\frac{\bar{I}}{\bar{Y}}$    (long_name='Investment output ratio in steady state')
    gy             $\frac{\bar{G}}{\bar{Y}}$    (long_name='Government output ratio')    
    H_bar          $\bar{H}$                    (long_name='Steady state hours')
    R_bar          $\bar{R}$                    (long_name='Steady state risk free interest rate')
    A_bar          $\bar{A}$                    (long_name='Steady state technology')
    rhoA           ${\rho_{A}}$                 (long_name='Persistence of labor augmentig shock')
    rhoG           ${\rho_{G}}$                 (long_name='Persistence of government spending shock')
    sigma          ${\sigma}$                   (long_name='Shock scaling parameter') 
;

%----------------------------------------------------------------
% 2. Calibration
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
%                                                 (calibrated to hit H=H_bar in steady state)
%   Note we can switch varrho and H_bar with 
%   varrho=0.689169;
%   H_bar=alp*(1-varrho)/(cy*varrho+alp*(1-varrho));
%   Then H_bar is computed as 0.35

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

@#if solution_order == 1
    sigma=1.0;
    @#else
        sigma=0.01;
@#endif

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;

    [name='Single period utility']

        U=(((C^(1-varrho))*((1-H)^varrho))^(1-sigma_c)-1)/(1-sigma_c);

    [name='Marginal Utility of Consumption']
    
        UC=(1-varrho)*(C^((1-varrho)*(1-sigma_c)-1))*((1-H)^(varrho*(1-sigma_c)));

    [name='Marginal Utility of Labour']

        UH=-varrho*(C^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));

    %----------------------------------------------------------------
    % Stochastic discount factor
    %----------------------------------------------------------------

    [name='Stochastic discount factor - 1']

        LAMBDA=betta*UC(+1)/UC;

    % Risk-free real interest rate  R set in period t to yield interest
    % over period [t,t+1]

    [name='Stochastic discount factor - 2']

        UC=betta*R*UC(+1);//LAMBDA(+1)*R=1;

    [name='Stochastic discount factor - 3']

        LAMBDA*RK=1;

    [name='Labor Supply FOC']

         -UH/UC=W;

    [name='Prodution function']

    %Note: Capital stock is end-of-period

        Y=((A*H)^alp)*(K(-1))^(1-alp);

    [name='Wholesale firms FOCs']

        alp*Y/H=W;

    [name='Returns on capital']
        
        RK=(1-alp)*Y(+1)/K+1-delta;

    [name='Output equilibrium']

        Y=C+G+I;

    [name='Capital law of motion']

        K=I+(1-delta)*K(-1);

    [name='Labour augmenting shock process']

        log(A)-log(STEADY_STATE(A))=rhoA*(log(A(-1))-log(STEADY_STATE(A)))+sigma*epsA;

    [name='Government shock process']

        log(G)-log(STEADY_STATE(G))=rhoG*(log(G(-1))-log(STEADY_STATE(G)))+sigma*epsG;

%----------------------------------------------------------------
% Variables in log-deviation form for IRFs
%----------------------------------------------------------------

y=log(Y/STEADY_STATE(Y));
k=log(K/STEADY_STATE(K));
i=log(I/STEADY_STATE(I));
c=log(C/STEADY_STATE(C));
w=log(W/STEADY_STATE(W));
h=log(H/STEADY_STATE(H));
r=log(R/STEADY_STATE(R));
a=log(A/STEADY_STATE(A));
g=log(G/STEADY_STATE(G));

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
    LAMBDA=betta;
    RK=R;
    KY=(1-alp)/(R-1+delta);
    IY=(1-alp)*delta/(R-1+delta);
    CY=1-IY-gy;
    H=(1-varrho)*alp/(varrho*CY+(1-varrho)*alp);
    Y=A*H*KY^((1-alp)/alp);
    K=KY*Y;
    I=IY*Y;
    G=gy*Y;
    W=alp*Y/H;
    C=CY*Y;

    U=1/(1-sigma_c)*(C^((1-varrho)*(1-sigma_c))*(1-H)^(varrho*(1-sigma_c))-1);
    UC=(1-varrho)*C^((1-varrho)*(1-sigma_c)-1)*(1-H)^(varrho*(1-sigma_c));
    UH=-varrho*(C^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));


    y=0;
    c=0;
    h=0;
    w=0;
    i=0;
    k=0;
    r=0;
    a=0;
    g=0;
end;

%----------------------------------------------------------------
% Specification of shocks
%----------------------------------------------------------------


shocks;
    var epsA; stderr 1;
    var epsG; stderr 1;
end;

// Steady state
steady;

// Blanchard-Kahn conditions
check;


write_latex_dynamic_model;
write_latex_static_model;
write_latex_definitions;
write_latex_parameter_table;

stoch_simul(order=1,irf=40, tex) Y y C c I i H h W w R r K k A a G g ;

//@#if solution_order == 1
//    stoch_simul(order=1,irf=40, tex) Y y C c I i H h W w R r K k A a G g ;
//    @#else
//        stoch_simul(order=2,pruning, irf=40, tex) Y y C c I i H h W w R r K k A a G g ;
//@#endif


collect_latex_files;
