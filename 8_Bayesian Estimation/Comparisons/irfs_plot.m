clear; close all;

load NKlinear_Est_results;
oo1=oo_;
lag = (1:1:10);

%% A
F1=figure(1);
set(F1, 'numbertitle','off')
set(F1, 'name', 'Impulse response functions (Technology shock)')
  h1 = area(1:10);
  set(h1,'FaceColor',[.9 .9 .9]);
subplot(2,2,1)
plot(lag,oo1.irfs.pinfobs_epsA(:,[1: 10])','b','linewidth',2);
hold on
title('Inflation Rate')
%ylabel('Output')

subplot(2,2,2)
plot(lag,oo1.irfs.dy_epsA(:,[1: 10])','b','linewidth',2);
hold on
title('Output')

subplot(2,2,3)
plot(lag,oo1.irfs.robs_epsA(:,[1: 10])','b','linewidth',2);
hold on
hold off
title('Nominal Interest Rate')


legend('NK Model', 'Location','Best','Orientation','vertical');
