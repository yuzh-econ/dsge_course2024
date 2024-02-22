//
//Simple Example 1; Two  first-order var AR1 -deterministic simulations
//
//
// DSGE: Solution and Estimation Techniques 
//
//////////////////////////////////////////////////////////////////////////////////////////////////
//This is a free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free
// Software Foundation, either version 3 of the License, or (at your option)
// any later version.  See <http://www.gnu.org/licenses/> for more information.
//////////////////////////////////////////////////////////////////////////////////////////////////

var x  y; 

varexo ex ey;

parameters rhox rhoy;
%
%stable case
%
rhox = 0.5;
rhoy = -0.3;
%
%unstable case
%
%rhox = 1.5;
%rhoy = 1.3;

model;
x = rhox*x(-1)+ex;
y = rhoy*y(-1)+ey;
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
perfect_foresight_setup(periods=10);
perfect_foresight_solver;
%simul(periods=10);
rplot x y;