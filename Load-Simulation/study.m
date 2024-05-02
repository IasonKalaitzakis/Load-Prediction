scenario_selection
activities
%Ypologisths
pc=zeros(1,96);

for k=1:1:p
    pctimeuse=6; %diarkeia leitourgias
    if k<=pctimeuse
        pc(k)=250; %isxys syskevhs
    end
end
%st pithanothta diortomenh vlepe "activities.m"

% [~ , m] = max(st);
m = randomMaxProbabilities(st);

%ypologismos toy fortioy metakinhmenoy sto xrono
stload=zeros(1,p);%arxika enas adeios pinakas
%lambanoyme treis periptvseis 1. an h deiarkeia einai 1 2. an einaiperitos
%arithmos 3. an einai artios
if pctimeuse==1
    stload(m)=pc(1);
else
    if mod(pctimeuse,2)~=1
        if (m+pctimeuse/2-1)<p
            for z=(m-pctimeuse/2):1:(m+pctimeuse/2-1)
                stload(z)=pc(1);
            end
        else %edw pernoume ayto to else dioti an h pithanothta einaiarga to
            %vrady kai exei megalh diarkeia tote ksepenousame ta 96tetarta kai de douleve to programma
            for z=(m-pctimeuse/2):1:p
                stload(z)=pc(1);
            end
        end
    end
    if mod(pctimeuse,2)~=0
        if (m+pctimeuse/2-0.5)<p
            for z=m-pctimeuse/2+0.5:1:m+pctimeuse/2-0.5
                stload(z)=pc(1);
            end
        else
            for z=m-pctimeuse/2+0.5:1:p
                stload(z)=pc(1);
            end
        end
    end
end
%Epeidh an h diarkeia einai megalh mporei to fortio na topothetei8eise
%stigmh poy to spiti einai adeio kanoyme nea diorthwsh
load_study=scenario.*stload; %fortio study