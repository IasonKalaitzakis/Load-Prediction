scenario_selection
activities
%klimatismos. Fortio poy anoigei kai kleinei xwris idiaiterastathero
%programma. Edw dhlwnoume thn wra poy anoigoume to a/c kai poso tokratame
%anameno. Pithano na to anoiksoule/kleisoume polles fores

% power=0;%isxys A/C
power=1440;%isxys A/C

r = randi([0 2],1,1);       %33% change 0W, 33% change 720W, 33% change 1440W
power=720*r;

ac_load=zeros(1,96);
ac_loadon1=28;%dhlwnoume thn wra pou ksekinaei h leitourgia toy A/C
dur1=32;%dhlwnoyme posh wra paramenei anoixto
if (ac_loadon1+dur1)<p
    for i=ac_loadon1:1:(ac_loadon1+dur1)
        ac_load(i)=power;
    end
else
    for i=ac_loadon1:1:p
        ac_load(i)=power;
    end
end
