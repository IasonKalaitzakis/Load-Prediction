%Prwines douleies spitiou
%hlektrikh skoupa
vacuu=zeros(1,96);
for v=1:1:p
    vacuut=2; %diarkeia leitourgias
    if v<=vacuut
        
        r = randi([1 6],1,1);
        if r == 6
            vacuu(v)=1000; %isxys
        else
            vacuu(v)=0; %isxys
        end
    end
end

% [~ , m] = max(mh);
m = randomMaxProbabilities(mh);


vacuum_load=zeros(1,p);
if vacuut==1
    vacuum_load(m)=vacuu(1);
else
    if mod(vacuut,2)~=1
        if (m+vacuut/2-1)<p
            for z=(m-vacuut/2):1:(m+vacuut/2-1)
                vacuum_load(z)=vacuu(1);
            end
        else
            for z=(m-vacuut/2):1:p
                vacuum_load(z)=vacuu(1);
            end
        end
    end
    if mod(vacuut,2)~=0
        if (m+vacuut/2-0.5)<p
            for z=(m-vacuut/2+0.5):1:(m+vacuut/2-0.5)
                vacuum_load(z)=vacuu(1);
            end
        else
            for z=(m-vacuut/2+0.5):1:p
                vacuum_load(z)=vacuu(1);
            end
        end
    end
end