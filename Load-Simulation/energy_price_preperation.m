clear all;
close all;
clc;

T = readtable('SIP.csv','NumHeaderLines',1);


t= table2array(T(:,2:end));
t_t = t/1000;

meanT = mean(t_t,2)
meany = mean(meanT)
table_new = t_t +0.08;

mean(mean(table_new,2))

time = 1:24;
figure
plot(time,table_new)

time_new = 0.25:0.25:24;
for i=1:31
    table_final(i,:) = interp1(time,table_new(i,:),time_new);
end

table_final(1,1) = table_final(1,4);
table_final(1,2) = table_final(1,4);
table_final(1,3) = table_final(1,4);

for y=1:30
    table_final(y+1,1) = table_final(y,4);
    table_final(y+1,2) = table_final(y,4);
    table_final(y+1,3) = table_final(y,4);
    
end

figure
plot(time_new,table_final)