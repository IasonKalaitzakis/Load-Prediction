function [m] = randomMaxProbabilities(statistic)
%Select the 20 highest probabilities (timeslots) and randomly select one of the 20 timeslots uniformely

k=20;
[~,I] = maxk(statistic,k);

r = randi([1 k],1,1);

m=I(r);

end

