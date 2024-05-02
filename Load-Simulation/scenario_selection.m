%Aristotle University of Thessaloniki
%Department of Electric and Computer Engineering
%Methodologia dhmiourgias typikon ndiagrammatwn fortiou gia
%oikiakous katanalwtes
%K.Kalymnios, A.Matonaki, J.Panapakidis, G.Papagiannis
%2008-2009

%o xronos metratai se tetarta ths wras gia akriveia
p=96; %24h =96 tetarta
t=(1:1:96);

%thetontas tis times 1 kai 0 sto xeimonas orizoume thn epoxh toy
%xronou. To stoixeio xrhsimopoieitai argotera gia th xrhsimopoihsh h oxi thermanshs %kai prwinou fwtismoy
xeimonas=0;

%exoume proepileksei 5 senaria katalhpsimothtas spitiou. Thetontas sth
%metavlhth select_scenario times apo 1 ews 5 dialegoume ena apo taparakatw
%senaria:
%1 part-time douleia to prwi spiti mh kathleimeno 9:00 me 13:00
%2 prwinh douleia full-time mh kateileimeno spiti 9:00 me 18:00
%3 part-time 2/3 mh kateileimeno spiti 9:00 me 16:00
%4 no working
%5 part-time to apogevma mh kateileimeno spiti 13:00 me 18:00

%Epilogh senariou parousias sto spiti. 5 diathesima senaria
select_scenario=4;

microkimata=0;

%scenario 1
if select_scenario==1
    n=36; %wra pou adeiazei to spiti
    m=20; %wra pou menei adeio
end

%scenario 2
if select_scenario==2
    n=36; %wra pou adeiazei to spiti
    m=36; %wra pou menei adeio
end

%scenario 3
if select_scenario==3
    n=36;
    m=28;
end

%scenario 4
if select_scenario==4
    n=96;
    m=0;
end

%scenario 5
if select_scenario==5
    n=60; %13:00
    m=32; %5 wres
end

scenario=zeros(1,96);
for i=1:1:p
    if i<=n || i>= n+m
        scenario(i)=1;
    end
end

