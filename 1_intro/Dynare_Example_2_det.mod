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

var x  y; 

varexo ex ey;

parameters rhoxx rhoxy rhoyx rhoyy;
rhoxx = 0.5;//stable
rhoxx = 1.5;//unstable
rhoxy =0.2; 
rhoyy = -0.3;
rhoyx=0.2;

model;
x = rhoxx*x(-1)+rhoxy*y(-1)+ex;
y = rhoyy*y(-1)+rhoyx*x(-1)+ ey;
end;

shocks;
var ex; stderr 1;
var ey; stderr 1;
end;

steady; 
check; 

initval;
x=1;
y=1;
end;

%simul(periods=10);
perfect_foresight_setup(periods=10);
perfect_foresight_solver;
rplot x y;
%%%%%%%%%%%%%%%%%%%%%%%
%or irf starts at t=5;
%%%%%%%%%%%%%%%%%%%%%%%
%/*
initval;
x=0;
y=0;
end;
shocks;
var ex; periods 5; values 1;
var ey; periods 5; values 1;
end;
%*/
%simul(periods=10);
perfect_foresight_setup(periods=10);
perfect_foresight_solver;
rplot x y;