%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynare set-up: 
%   - linear version
%   - One-Sector RBC Model without costs of investment 
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
%   In this code for the linear version of the model, a pre-processor
%   variable for only the scaling parameter of shocks

    @#define solution_order  = 1
%                                 - in this linear model solution_order must be 1
%
%   If solution_order =1,
%   scaling parameter of shocks is 1 denoting a 1 standard deviation shock.
%   [Best - but not essential - to use for IRFs] 
%   else solution_order = 2
%    - then scaling parameter is 0.01 to denote a 1% standard deviation.
%       
%   Note 1: to compare linear and the first-order approximation of the non-linear solution
%   be careful to use the same scaling parameter in both .mod files.
%
%   Note 2: This parameter rules:
%               - the scaling coefficient of the shocks (withing the shocks equations)


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
    uc      $U^{C}$     (long_name='Marginal utility of consumption')
    ul      $U^{L}$     (long_name='Marginal utility of labour') 
    r       $R$         (long_name='Risk free interest rate') 
    h       $H$         (long_name='Hours')
    w       $W$         (long_name='Real wage')
    y       $Y$         (long_name='Output')
    k       $K$         (long_name='Capital') 
    i       $I$         (long_name='Investment') 
    c       $C$         (long_name='Consumption')
    a       $A$         (long_name='Technology') 
    g       $G$         (long_name='Government spending') 
; 

%----------------------------------------------------------------
% Declaration of exogeneous variables
%----------------------------------------------------------------

varexo
    epsA          ${\epsilon^{A}}$      (long_name='Labor Augmenting shock')
    epsG          ${\epsilon^{G}}$      (long_name='Government Spending shock')
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

gy=0.2;         // Government output ratio
varrho=0.689169;// Weight on Leisure in utility
                // Calibrated to hit H=H_bar=0.35 in steady state
alp=0.70;       // Labour share
betta=0.99;     // Discount factor
delta=0.0250;   // Capital depreciation    
sigma_c=2.0;    // Inverse of the elasticity of substitution

%----------------------------------------------------------------
% Choice of Units
%----------------------------------------------------------------
A_bar=1;        // Steady state technology

%----------------------------------------------------------------
% Shock persistence
%----------------------------------------------------------------

rhoA=0.75;      // Persistence of labor augmentig shock
rhoG=0.75;      // Persistence of government spending shock

%----------------------------------------------------------------
% Shock scaling  parameter
%----------------------------------------------------------------

@#if solution_order == 1
    sigma=1.0;
    @#else
        sigma=0.01;
@#endif


%----------------------------------------------------------------
% Steady state relaionships from non-linear set-up
%----------------------------------------------------------------

    R_bar=1.0/betta;                                // Steady state risk free interest rate
    iy=((1-alp)*delta)/((R_bar-1+delta));           // Investment output ratio in steady state
    cy=1-iy-gy;                                     // Consumption output ratio in steady state
    H_bar=alp*(1-varrho)/(cy*varrho+alp*(1-varrho));// Steady state hours

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model(linear);

[name='Marginal Utility of Consumption']

    uc=((1-varrho)*(1-sigma_c)-1)*c+ varrho*(sigma_c-1)*(H_bar/(1-H_bar))*h;
    
    % Deliberate mistake in linearization - replace above with:
    //uc=((1-varrho)*(1-sigma_c)-1)*c+ (sigma_c-1)*(H_bar/(1-H_bar))*h; 

[name='Euler Equations']
    uc(+1)=uc-r; 

[name='Labor Supply FOC']
   
    ul=uc+c+(H_bar/(1-H_bar))*h;

    % Deliberate Mistake in Linearization - replace above with:
    % ul=uc+c+(1/(1-H_bar))*h;

[name='Real Wage']

    w=ul-uc;

[name='Prodution function']

    y=alp*(a+h)+(1-alp)*k(-1);

[name='Wholesale firms FOC']

    y(+1)-k=(R_bar)/(R_bar-1+delta)*r;

[name='Real Wage - firm FOC']
 
    w=y-h;

[name='Resource Constraint']

    y=cy*c+iy*i+gy*g;

[name='Capital law of motion']
    
    k=delta*i +(1-delta)*k(-1);

[name='Labour augmenting shock process']

    a=rhoA*a(-1)+sigma*epsA;

[name='Government shock process']

    g=rhoG*g(-1)+sigma*epsG;
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

%----------------------------------------------------------------
% Specification of shocks
%----------------------------------------------------------------

shocks;
    var epsA; stderr 1;
    var epsG; stderr 1;
end;

steady;

check;


stoch_simul(order=1,irf=40, tex) y c i h w r ;

write_latex_dynamic_model;
write_latex_static_model;
write_latex_definitions;
write_latex_parameter_table;
collect_latex_files;