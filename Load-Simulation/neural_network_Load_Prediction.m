clear all
close all
clc
data=load('full_dataset.mat');
loads = data.full_dataset(:,:,1);
temperature = data.full_dataset(:,:,2);
energy_cost = data.full_dataset(:,:,3);

%Apply rolling average on laods to improve results
loads = movmean(loads,6);

%Split data into training and testing
all_data = [temperature energy_cost loads];
cv = cvpartition(size(all_data,1),'HoldOut',0.20);     %Select 80% of data for training and 20% for testing
data_train = all_data(cv.training,:)';
data_test = all_data(cv.test,:)';

%Inputs and targets of the NN
inputs = data_train(1:192,:);
targets = data_train(193:end,:);

%Train the NN with 20 layers
net = feedforwardnet(20);
[net,tr] = train(net,inputs,targets);

%Test the results visually
time = 0.25:0.25:24;
for i=1:size(data_test,2)  
    output = net(data_test(1:192,i));
    output = movmean(output,6);
    
    figure
    plot(time,output')
    hold on;
    plot(time,data_test(193:end,i));
    legend('prediction','actual load');
end


