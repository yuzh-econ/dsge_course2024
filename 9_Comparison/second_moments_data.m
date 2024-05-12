%second moment computations in the data

clear all
close all
clc

load us_data;

fprintf('STD FD Data 1985:2-2008:2\n')
fprintf(' STD Y (Data)\n')
std(dy(148:end))
fprintf(' STD Infl (Data)\n')
std(pinfobs(148:end))
fprintf(' STD R (Data)\n')
std(robs(148:end))
fprintf('----------------------------------\n')

fprintf('Cross correlations FD Data 1984:2-2008:2\n')
fprintf('Cross correlation of Infl with Y is (Data)\n')
c_hp1=corr(pinfobs(148:end),dy(148:end))
fprintf('Cross correlation of R wrt Y is (Data)\n')
c_hp1=corr(robs(148:end),dy(148:end))
fprintf('----------------------------------\n')

%Compute autocorrelations
fprintf('Relative STD HP Case (Data)\n')
fprintf(' AUTOCORR(1) Y \n')
a=acfcomp(dy(148:end));
a(2)
fprintf(' AUTOCORR(1) Infl (Data)\n')
b=acfcomp(pinfobs(148:end));
b(2)
fprintf(' AUTOCORR(1) R (Data)\n')
c=acfcomp(robs(148:end));
c(2)

fprintf('================================\n')

clear all;

load NKlinear_Est_All/Output/NKlinear_Est_All_results_conventional100k
fprintf('STD FD model (ALL) \n')
fprintf(' STD Y\n')
std(oo_.UpdatedVariables.dy(6:end))
fprintf(' STD Infl\n')
std(oo_.UpdatedVariables.pinfobs(6:end))
fprintf(' STD R\n')
std(oo_.UpdatedVariables.robs(6:end))
fprintf('----------------------------------\n')

fprintf('Cross correlations model (ALL)\n')
fprintf('Cross correlation of Infl with Y is\n')
c_hp1=corr(oo_.UpdatedVariables.pinfobs(6:end),oo_.UpdatedVariables.dy(6:end))
fprintf('Cross correlation of R wrt Y is\n')
c_hp1=corr(oo_.UpdatedVariables.robs(6:end),oo_.UpdatedVariables.dy(6:end))
fprintf('----------------------------------\n')

%Compute autocorrelations
fprintf('Relative STD HP Case\n')
fprintf(' AUTOCORR(1) Y \n')
a=acfcomp(oo_.UpdatedVariables.dy(6:end));
a(2)
fprintf(' AUTOCORR(1) Infl\n')
b=acfcomp(oo_.UpdatedVariables.pinfobs(6:end));
b(2)
fprintf(' AUTOCORR(1) R\n')
c=acfcomp(oo_.UpdatedVariables.robs(6:end));
c(2)