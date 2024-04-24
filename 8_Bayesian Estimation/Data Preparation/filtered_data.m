close all
clear all
clc

%%
load raw_data %Contains data from 1947Q1 (inflation starts in 1947Q2 because is in log diff, fed funds also start in 1947Q2)
% first necessary to transforme the excel data into a .mat file,
% otherwise this code is not running how it is.

%time vector
t=1947.25:0.25:2013.05;

%Filtering output

[y_obs_hp_t,y_obs_hp]=hpfilter(y(2:end),1600); %HP Filter

dy=diff(y); %first difference

y_obs_lin=detrend(y(2:end),'linear'); %linear trend

% hpfilter, diff, detrend are in-built functions



figure(1)
plot(t,dy)
hold on
plot(t,y_obs_hp,'r')
hold on
plot(t,y_obs_lin,'g')
axis tight
legend('FD','HP','LT')
title('Output')

figure(2)
plot(t,pinfobs,'r')
hold on
plot(t,robs,'b')
axis tight
legend('Inflation','Fed Funds Rate')

%first difference of consuption and investment

dc=diff(c);
di=diff(i);


save us_data dy dc di pinfobs robs

