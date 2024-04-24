%second moment computations in the data

clear all
close all
clc

load us_data;

fprintf('STD FD Data 1985:2-2008:2\n')
fprintf(' STD Y\n')
std(dy(148:end))
fprintf(' STD Infl\n')
std(pinfobs(148:end))
fprintf(' STD R\n')
std(robs(148:end))
fprintf('----------------------------------\n')

fprintf('Cross correlations FD Data 1984:2-2008:2\n')
fprintf('Cross correlation of Infl with Y is\n')
c_hp1=corr(pinfobs(148:end),dy(148:end))
fprintf('Cross correlation of R wrt Y is\n')
c_hp1=corr(robs(148:end),dy(148:end))
fprintf('----------------------------------\n')

%Compute autocorrelations
fprintf('Relative STD HP Case\n')
fprintf(' AUTOCORR(1) Y \n')
a=acfcomp(dy(148:end));
a(2)
fprintf(' AUTOCORR(1) Infl\n')
b=acfcomp(pinfobs(148:end));
b(2)
fprintf(' AUTOCORR(1) R\n')
c=acfcomp(robs(148:end));
c(2)

