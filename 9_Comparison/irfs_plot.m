clear; close all;

load NKlinear_Est_All_results;
oo1=oo_;
load NKlinear_Est_Habit_results;
oo2=oo_;
load NKlinear_Est_Indexing_results;
oo3=oo_;
load NKlinear_Est_None_results;
oo4=oo_;

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
plot(lag,oo2.irfs.pinfobs_epsA(:,[1: 10]),'--r','linewidth',2); 
plot(lag,oo3.irfs.pinfobs_epsA(:,[1: 10]), '-.g','linewidth',2);
plot(lag,oo4.irfs.pinfobs_epsA(:,[1: 10]), '-.y','linewidth',2);
hold off
title('Inflation Rate')
%ylabel('Output')

subplot(2,2,2)
plot(lag,oo1.irfs.dy_epsA(:,[1: 10])','b','linewidth',2);
hold on
plot(lag,oo2.irfs.dy_epsA(:,[1: 10]),'--r','linewidth',2); 
plot(lag,oo3.irfs.dy_epsA(:,[1: 10]), '-.g','linewidth',2);
plot(lag,oo4.irfs.dy_epsA(:,[1: 10]), '-.y','linewidth',2);
hold off
title('Output')

subplot(2,2,3)
plot(lag,oo1.irfs.robs_epsA(:,[1: 10])','b','linewidth',2);
hold on
plot(lag,oo2.irfs.robs_epsA(:,[1: 10]),'--r','linewidth',2); 
plot(lag,oo3.irfs.robs_epsA(:,[1: 10]), '-.g','linewidth',2);
plot(lag,oo4.irfs.robs_epsA(:,[1: 10]), '-.y','linewidth',2);
hold off
title('Nominal Interest Rate')


legend('Model All','Model Habit','Model Indexing','Model None', 'Location','Best','Orientation','vertical');
