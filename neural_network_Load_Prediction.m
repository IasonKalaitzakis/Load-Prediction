clear all
close all
clc
data=load('full_dataset.mat');
loads_non_normal = data.full_dataset(:,:,1);
temperature_non_normal = data.full_dataset(:,:,2);
energy_cost_non_normal = data.full_dataset(:,:,3);
t = 0:0.25:23.75;
t_old = 0:0.5:24;

load('savedcost.mat')
load('savedtemp.mat')
saved_temp_temp = interp1(t_old,saved_temp_temp,t,'linear');
saved_temp = saved_temp_temp;

%Apply rolling average on laods to improve results
loads_non_normal = 0.7*movmean(loads_non_normal,6);

load_max = max(max(loads_non_normal(:,1:96)));
load_min = min(min(loads_non_normal(:,1:96)));
temp_max = max(max(temperature_non_normal(:,1:96)));
temp_min = min(min(temperature_non_normal(:,1:96)));
cost_max = max(max(energy_cost_non_normal(:,1:96)));
cost_min = min(min(energy_cost_non_normal(:,1:96)));

%Normalize data between 0 and 1
loads = loads_non_normal(:,1:96) - load_min;
loads = loads ./ load_max ;
temperature = temperature_non_normal(:,1:96) - temp_min;
temperature = temperature ./ temp_max ;
energy_cost = energy_cost_non_normal(:,1:96) - cost_min;
energy_cost = energy_cost ./ cost_max ;

%Split data into training and testing
all_data = [temperature energy_cost loads];
cv = cvpartition(size(all_data,1),'HoldOut',0.20);     %Select 80% of data for training and 20% for testing
data_train = all_data(cv.training,:)';
data_test = all_data(cv.test,:)';


% Cluster centroids (train the cluster)
X = data_train';
[idx,C] = kmeans(X,10,'Display','iter');


%Inputs and targets of the NN
for i = 1:size(data_train,2)
     inputs(1:288,i) = [data_train(1:192,i)', C(idx(i),193:288)];
end
targets = data_train(193:end,:);

%Train the NN
net = feedforwardnet(10);
[net,tr] = train(net,inputs,targets);


%Cluster validation of testing data
closest = zeros(1,10);
for y = 1:size(data_test,2)
    for i = 1:192
        [~,closestIndex] = min(abs(C(:,i)-data_test(i,y)));
        closest(closestIndex) = closest(closestIndex) + 1;
    end

    [~,cluster(y)] = max(closest);
    closest = zeros(1,10);
end


%Test the results visually
for i=1:size(data_test,2)
    output = net([data_test(1:192,i)', C(cluster(i),193:288)]');
    output = movmean(output,6);

    plot_predicted_data = output' .* load_max;
    plot_predicted_data = plot_predicted_data + load_min;

    plot_real_data = data_test(193:end,i) .* load_max;
    plot_real_data = plot_real_data + load_min;

    figure
    plot(t,plot_predicted_data,'r','LineWidth', 1.5)
    hold on;
    plot(t,plot_real_data,'b','LineWidth', 1.5);
    legend('Predicted Load','Actual Load');
    ylabel('Loads (W)')
    xlabel({'Time (hours)';'(b)'})
    set(gca,'fontname','times','FontSize', 15)
axis([0 24 0 1600])
set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'off', 'YMinorTick', 'on', 'YGrid', 'off', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], 'YTick', 0:200:1600,'LineWidth', 1)
xticks(0:4:24)
xticklabels({'00:00','04:00','08:00','12:00','16:00','20:00','24:00'})
end


% 
% figure
% hold on
% for i = 1:31
%     plot(t,loads(i,:))
% end
% ylabel('P_L_O_A_D (W)')
% xlabel('t (hours)')
% title('Simulated Loads')
% 
% figure
% hold all
% title('Loads envelope')
% minload = movmean(min(loads_non_normal),5);
% maxload = movmean(max(loads_non_normal),5);
% patch([t fliplr(t)],[minload fliplr(maxload)], 'black', 'FaceColor', 'black', 'FaceAlpha', 0.2, 'EdgeColor','black', 'EdgeAlpha', 0.1);


figure
hold all
% title('Temperature envelope')
mintemp = movmean(min(temperature_non_normal),5);
maxtemp = movmean(max(temperature_non_normal),5);
patch([t fliplr(t)], [mintemp fliplr(maxtemp)], 'black', 'FaceColor', 'red', 'FaceAlpha', 0.2, 'EdgeColor','black', 'EdgeAlpha', 0);
plot(t,mean(temperature_non_normal),'r','LineWidth', 1.5);
% 
% saved_temp = data_test(1:96,6) .* temp_max;
% saved_temp = saved_temp + temp_min;
% saved_temp = movmean(saved_temp,3);

saved_temp = saved_temp - 0.6;


plot(t,saved_temp,'b','LineWidth', 1.5);
legend('Temperature range','Temperature mean','Case study temperature','Location','northwest')
axis([0 24 17 35])
set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'off', 'YMinorTick', 'on', 'YGrid', 'off', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], 'YTick', 18:2:36,'LineWidth', 1)
xticks(0:4:24)
xticklabels({'00:00','04:00','08:00','12:00','16:00','20:00','24:00'})
xlabel({'Time (hours)';'(a)'})
ylabel('Temperature (°C)')
set(gca,'fontname','times','FontSize', 15)



figure
hold all
energy_cost_non_normal  =energy_cost_non_normal*1.005;

% title('Energy Cost envelope')
mincost = movmean(min(energy_cost_non_normal),5);
maxcost = movmean(max(energy_cost_non_normal),5);
patch([t fliplr(t)], [mincost fliplr(maxcost)], 'black', 'FaceColor', 'yellow', 'FaceAlpha', 0.3, 'EdgeColor','yellow', 'EdgeAlpha', 0.1);
plot(t,mean(energy_cost_non_normal),'r','LineWidth', 1.5);

% saved_cost = data_test(97:192,6) .* cost_max;
% saved_cost = saved_cost + cost_min;
% saved_cost = movmean(saved_cost,3);

saved_cost = saved_cost*0.6;
saved_cost = saved_cost+0.045;
saved_cost = movmean(saved_cost,5);
set(gca,'fontname','times','FontSize', 15)


plot(t,saved_cost,'b','LineWidth', 1.5);
% plot(t,vq+0.05,'b','LineWidth', 1.5);
legend('Energy price range','Energy price mean','Case study energy price','Location','northwest')
axis([0 24 0.1 0.22])
set(gca, 'Box', 'off', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'off', 'YMinorTick', 'on', 'YGrid', 'off', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], 'YTick', 0.1:0.02:0.22,'LineWidth', 1)
xticks(0:4:24)
xticklabels({'00:00','04:00','08:00','12:00','16:00','20:00','24:00'})
xlabel({'Time (hours)';'(b)'})
ylabel('Energy Price (€ / kWh)')
set(gca,'fontname','times','FontSize', 15)
% 
% 
% saved_cost_temp = saved_cost(1:1.96:96);
% saved_temp_temp = saved_temp(1:1.96:96);
% 
% 
% 
% xlabel({'t (seconds)';'(c)'},'FontName', 'Times New Roman')

% 








