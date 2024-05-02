clear
% close all

y=1;
    rng shuffle

for iterator=1:31
    
    scenario_selection
    activities
    load_base
    breakfast_load
    dinner_load
    lighting_load
    load_supper
    load_vacuum
    loadlate_hw
    personal_care
    study
    thermossysoreftes
    tv_load
    load_ac
    total_home_load=base_load+(load_breakfast+load_dinner+lighting+supper_load+vacuum_load+late_hwload+load_bath+load_study+lthermosys+load_tv+ac_load).*scenario;

    final_home_load(iterator,:)=total_home_load;
end



%profile figures
figure(1)
plot(t/4,final_home_load)
xlabel('time(15mn)')
ylabel('power(watts)')
title('home load profile')
axis([0 24 0 5000])





% figure(2)
% plot(t/4,base_load)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('fortio vashs')
% figure(3)
% plot(t/4,load_breakfast)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('fortio prwinou')
% figure(4)
% plot(t/4,load_dinner)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('fortio vradinou')
% figure(5)
% plot(t/4,lighting)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('fwtismos')
% figure(6)
% plot(t/4,supper_load)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('fortio meshmerianou')
% figure(7)
% plot(t/4,vacuum_load)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('prwines douleies')
% figure(8)
% plot(t/4,late_hwload)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('apogevmatines douleies')
% figure(9)
% plot(t/4,load_bath)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('proswpikh ygeihnh')
% figure(10)
% plot(t/4,load_study)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('PC')
% figure(11)
% plot(t/4,lthermosys)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('thermansh')
% figure(12)
% plot(t/4,load_tv)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('TV load profile')
% figure(13)
% plot(t/4,ac_load)
% xlabel('time(15mn)')
% ylabel('power(watts)')
% title('A/C')