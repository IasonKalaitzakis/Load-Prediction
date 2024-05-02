clear all
close all
clc
data=load('full_dataset.mat');
loads_non_normal = data.full_dataset(:,:,1);
loads_non_normal = movmean(loads_non_normal,6);

temperature_non_normal = data.full_dataset(:,:,2);
energy_cost_non_normal = data.full_dataset(:,:,3);
 t = 0:0.25:23.75;

figure
hold on
for i = 1:31
    plot(t,loads_non_normal(i,:))
end
ylabel('P_L_O_A_D (W)')
xlabel('t (hours)')
title('Simulated Loads')

figure
hold all
title('Loads envelope')
patch([t fliplr(t)], [min(loads_non_normal) fliplr(max(loads_non_normal))], 'g')

figure
hold all
title('Temperature envelope')
patch([t fliplr(t)], [min(temperature_non_normal) fliplr(max(temperature_non_normal))], 'b')

figure
hold all
title('Energy Cost envelope')
patch([t fliplr(t)], [min(energy_cost_non_normal) fliplr(max(energy_cost_non_normal))], 'r')
