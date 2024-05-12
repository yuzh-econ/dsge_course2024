%
%program to work out model odds from LL values
%
%
%number of models
%
n=4
%
%LL vector (all Habit Indexing None)
%

LL=[-72.29 -68.49 -91.03 -85.01]
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

