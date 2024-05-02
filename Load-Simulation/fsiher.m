clear all; close all; clc;

clear all
close all
clc
data=load('full_dataset.mat');
loads = data.full_dataset(:,:,1);
temperature = data.full_dataset(:,:,2);
energy_cost = data.full_dataset(:,:,3);

t = 0:0.25:23.75;
%Apply rolling average on laods to improve results
loads = movmean(loads,6);
all_data = [temperature energy_cost loads];

X = all_data;

normX(:,1:96) = X(:,1:96) - min(min(X(:,1:96)));
normX(:,1:96) = normX ./ max(normX(:)) ;
normX(:,97:192) = X(:,97:192) - min(min(X(:,97:192)));
normX(:,97:192) = normX(:,97:192) ./ max(normX(:,97:192)) ;

normX(:,193:288) = X(:,193:288) - min(min(X(:,193:288)));
test = max(normX(:,193:288));
test(find(test == 0)) = 0.0001;
normX(:,193:288) = normX(:,193:288) ./ test ;

[idx,C] = kmeans(normX,10,'Display','iter');

% for i = 1:192
%     



