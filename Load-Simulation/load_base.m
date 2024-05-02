%Fortia Vashs
%fortia pou leitourgoun 24h
%edw katatasoume to psygeio kai ena synoliko fortio vashs pouapoteleitai
%apo to a8roisma ths katanalwshs syskeyvn enw einai kleistes
%dhmiourgei ena pinaka apo 1 ews 96 me to fortio vashs to opoioorizoume emeis
base=zeros(1,96);
for i=1:1:p
    base(i)=50;
end
%psigeio
freezer=zeros(1,96);
for l=1:1:p
    freezer(l)=150; %isxys orizetai apo emas analoga me th syskeyh
end
base_load=base+freezer;