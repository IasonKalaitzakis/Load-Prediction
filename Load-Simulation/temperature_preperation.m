clear all;
close all;
clc;

T = readtable('chania_weather_temperature.csv','NumHeaderLines',1);
t= table2array(T(:,2));

for i= 1:size(t)
    if isnan(t(i))
        t(i) = t(i-1);
    end
end

z=1;
y=1;
for i= 1:size(t)
    temperature(z,y) = t(i);
    y=y+1;
    if y == 25
        y=1;
        z=z+1;
    end
end

time_new = 0.25:0.25:24;
temperature_final = temperature(1:31,:);


t = 1:24;
for i=1:31
    temperature_super_final(i,:) = interp1(t,temperature_final(i,:),time_new);
    
end
temperature_super_final(1,1) = temperature_super_final(1,96);
temperature_super_final(1,2) = temperature_super_final(1,96);
temperature_super_final(1,3) = temperature_super_final(1,96);

for y=1:30
    temperature_super_final(y+1,1) = temperature_super_final(y,96);
    temperature_super_final(y+1,2) = temperature_super_final(y,96);
    temperature_super_final(y+1,3) = temperature_super_final(y,96);
    
end

figure
plot(t,temperature_final)
axis([0 24 10 40])

figure
plot(time_new,temperature_super_final)
axis([0 24 10 40])
