clear all;
close all;
clc;


A=load('home_loads.mat');
loads=A.final_home_load;
B=load('ota.mat');
energy_cost=B.table_final;
C=load('temperatures.mat');
temperature=C.temperature_super_final;

%% ---- Load Temparature correlation
cor_matrix = zeros(31,31);
for columns= 1:31
    for rows= 1:31
        correlation_temp = corrcoef(loads(rows,:),temperature(columns,:));
        cor_matrix(rows,columns) = correlation_temp(1,2);
        cor_matrix_Perm(rows,columns) = correlation_temp(1,2);
    end
end

for i = 1:31
    [~,idx] = max(cor_matrix(i,:));
    load_temperature_dataset(i,1) = i;
    load_temperature_dataset(i,2) = idx;
    cor_matrix(:,idx) = NaN;
end

%% ---- Load Energy_cost correlation

cor_matrix = zeros(31,31);
for columns= 1:31
    for rows= 1:31
        correlation_temp = corrcoef(loads(rows,:),energy_cost(columns,:));
        cor_matrix(rows,columns) = correlation_temp(1,2);
    end
end

for i = 1:31
    [~,idx] = min(cor_matrix(i,:));
    load_cost_dataset(i,1) = i;
    load_cost_dataset(i,2) = idx;
    cor_matrix(:,idx) = NaN;
end

for i = 1:31
    full_dataset(i,1:96,1) = loads(load_temperature_dataset(i,1),:);
    full_dataset(i,1:96,2) = temperature(load_temperature_dataset(i,2),:);
    full_dataset(i,1:96,3) = energy_cost(load_cost_dataset(i,2),:);
end





% for i=1:31
%     [~,t] = max(cor_matrix(i,:))
% end
%
% for i=1:31
%     [~,t] = max(cor_matrix(:,i))
% end
