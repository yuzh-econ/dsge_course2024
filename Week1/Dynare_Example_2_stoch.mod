//
//Simple Example 2; 1st order VAR process
//
//
//DSGE: Solution and Estimation Techniques 
//
//////////////////////////////////////////////////////////////////////////////////////////////////
//This is a free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free
// Software Foundation, either version 3 of the License, or (at your option)
// any later version.  See <http://www.gnu.org/licenses/> for more information.
//////////////////////////////////////////////////////////////////////////////////////////////////

var x y; 

varexo ex $e_x$ ey $e_y$;

parameters rhoxx $\rho_{xx}$ rhoxy $\rho_{xy}$ rhoyx $\rho_{yx}$ rhoyy $\rho_{yy}$;
rhoxx = 0.5;//stable
//rhoxx = 1.5;//unstable
rhoxy =0.2; 
rhoyy = -0.3;
rhoyx=0.2;

model;
[name='Equation for x']
x = rhoxx*x(-1)+rhoxy*y(-1)+ex;
[name='Equation for y']
y = rhoyy*y(-1)+rhoyx*x(-1)+ ey;
end;

shocks;
var ex; stderr 1;
var ey; stderr 1;
end;

steady; 
check; 

initval;
//steady_state_model;
// either initial or steady_state_model do the same job
x=0;
y=0;
end;

stoch_simul(order=1,irf=40) x y;
write_latex_dynamic_model;