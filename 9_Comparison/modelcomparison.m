
load NKlinear_Est_All_results
mhm1=oo_.MarginalDensity.ModifiedHarmonicMean; % second stage result
%mhm1=oo_.MarginalDensity.LaplaceApproximation; % first stage result

% the second stage results are usually preferred

load NKlinear_Est_Habit_results
mhm2=oo_.MarginalDensity.ModifiedHarmonicMean;
%mhm2=oo_.MarginalDensity.LaplaceApproximation;

load NKlinear_Est_Indexing_results
mhm3=oo_.MarginalDensity.ModifiedHarmonicMean;
%mhm3=oo_.MarginalDensity.LaplaceApproximation;

load NKlinear_Est_None_results
mhm4=oo_.MarginalDensity.ModifiedHarmonicMean;
%mhm4=oo_.MarginalDensity.LaplaceApproximation;

LL=[mhm1 mhm2 mhm3 mhm4]
n=size(LL,2);

sum=1.0;
for i=2:n
      rp(i)=exp(LL(i)-LL(1));
      sum=sum+rp(i);
end
p(1)=1/sum;
sump=p(1);
for i=2:n
      p(i)=rp(i)*p(1);
      sump=sump+p(i);
end
p
sump

