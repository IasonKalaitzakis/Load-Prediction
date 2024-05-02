scenario_selection
activities
%plintirio rouxwn
wash=zeros(1,96);

m = randomMaxProbabilities(lh);


for r=1:1:p
    washt=8; %diarkeia leitourgias
    if r<=washt
        
        r = randi([1 5],1,1);
        if r == 5
            wash(r)=600; %isxys
        else
            wash(r)=0; %isxys
        end
    end
end

lwash=zeros(1,p);
if washt==1
    lwash(m)=wash(1);
else
    if mod(washt,2)~=1
        if (m+washt/2-1)<p
            for z=(m-washt/2):1:(m+washt/2-1)
                lwash(z)=wash(1);
            end
        else
            for z=(m-washt/2):1:p
                lwash(z)=wash(1);
            end
        end
    end
    if mod(washt,2)~=0
        if (m+washt/2-0.5)<p
            for z=(m-washt/2+0.5):1:(m+washt/2-0.5)
                lwash(z)=wash(1);
            end
        else
            for z=(m-washt/2+0.5):1:(m+washt/2-0.5)
                lwash(z)=wash(1);
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plintirio piatwn
dwash=zeros(1,96);
for f=1:1:p
    dwasht=3; %diarkeia leitourgias
    if f<=washt        
        r = randi([1 3],1,1);
        if r == 3
            dwash(f)=300; %isxys
        else
            dwash(f)=0; %isxys
        end
    end
end

ldwash=zeros(1,p);
if dwasht==1
    ldwash(m)=dwash(1);
else
    if mod(dwasht,2)~=1
        if (m+dwasht/2-1)<p
            for z=(m-dwasht/2):1:(m+dwasht/2-1)
                ldwash(z)=dwash(1);
            end
        else
            for z=(m-dwasht/2):1:p
                ldwash(z)=dwash(1);
            end
        end
    end
    if mod(dwasht,2)~=0
        if (m+dwasht/2-0.5)<p
            for z=(m-dwasht/2+0.5):1:(m+dwasht/2-0.5)
                ldwash(z)=dwash(1);
            end
        else
            for z=(m-dwasht/2+0.5):1:(m+dwasht/2-0.5)
                ldwash(z)=dwash(1);
            end
        end
    end
end
late_hwload=(lwash+ldwash);