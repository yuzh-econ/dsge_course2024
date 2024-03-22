//
//Simple Example 1; Two AR1 processes -stochastic simulations
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

parameters rhox rhoy; 
%persistance parameters of the AR(1) shocks
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
%

model;
x = rhox*x(-1)+ex;
y = rhoy*y(-1)+ey;
end;

shocks;
var ex; stderr 1;
var ey; stderr 1;
end;

steady; 
check; 

initval;
x=0;
y=0;
end;

stoch_simul(order=1,irf=40) x y ;
