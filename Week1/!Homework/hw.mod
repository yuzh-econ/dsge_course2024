//Simple Example 2; 1st order 3-variable VAR process
// ---- add dynare addpath('/Applications/Dynare/5.0/matlab')


// ===============
//     PREAMBLE
// ===============

var 
    x $x$ 
    y $y$
    z $z$
    ; 

varexo 
    ex $e_x$ (long_name='innovation of x')
    ey $e_y$ (long_name='innovation of y')
    ez $e_z$ (long_name='innovation of z')
    ;

parameters 
    rhoxx $\rho_{xx}$ 
    rhoxy $\rho_{xy}$
    rhoxz $\rho_{xz}$
    rhoyx $\rho_{yx}$ 
    rhoyy $\rho_{yy}$
    rhoyz $\rho_{yz}$
    rhozx $\rho_{zx}$
    rhozy $\rho_{zy}$
    rhozz $\rho_{zz}$
    ;

    
// ---------------
//   Set Params 
// ---------------

rhoxx = 0.5;//stable
rhoxy = -0.05;
rhoxz = 0.2;
rhoyx = 0.2; 
rhoyy = -0.3;
rhoyz = 0.2;
rhozx = 0.1;
rhozy = 0.1;
rhozz = 0.1;

% rhoxx = 1.5;//unstable
// check eigen values 
// STABLE: eig([0.5 -0.05 0.2; 0.2 -0.3 0.2; 0.1 0.1 0.1])
// UNSTABLE: eig([1.5 -0.05 0.2; 0.2 -0.3 0.2; 0.1 0.1 0.1])


// ===============
//      MODEL
// ===============

model;

[name='Equation for x']
x = rhoxx*x(-1) + rhoxy*y(-1) + rhoxz*z(-1) + ex;

[name='Equation for y']
y = rhoyy*y(-1) + rhoyx*x(-1) + rhoyz*z(-1) + ey;

[name='Equation for z']
z = rhozx*x(-1) + rhozy*y(-1) + rhozz*z(-1) + ez;
end;


// ---------------
//     Shocks 
// ---------------

shocks;
var ex; stderr 1;
var ey; stderr 1;
var ez; stderr 1;
end;


// ===============
//  STEADY STATE
// ===============

steady;  // Numerical solver for steady state

% steady_state_model; // Or I can specify steady-state values
//(same effect as the initval block)
% x=0;
% y=0;
% z=0;
% end;

check; 


// ===============
//   INITIAL VAL
// ===============

% initval;
% x=0;
% y=0;
% z=0;
% end;


// ===============
//    SIMULATON
// ===============

stoch_simul(order=1,irf=40) x y z;


// ===============
//      MISC.
// ===============
write_latex_parameter_table;
write_latex_dynamic_model;
collect_latex_files;