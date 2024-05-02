scenario_selection
activities
%Fortio TV

m = randomMaxProbabilities(tv1);


tvp=zeros(1,96);
for z=1:1:p
    tvtime=4; %diarkeia leitourgias
    if z<=tvtime
        tvp(z)=150; %isxys
    end
end

load_tv=zeros(1,96);
if tvtime==1
    load_tv(m)=tvp(1);
else
    if mod(tvtime,2)~=1
        if (m+tvtime/2-1)<p
            for z=(m-tvtime/2):1:(m+tvtime/2-1)
                load_tv(z)=tvp(1);
            end
        else
            for z=(m-tvtime/2):1:p
                load_tv(z)=tvp(1);
            end
        end
    end
    if mod(tvtime,2)~=0
        if (m+tvtime/2-0.5)<p
            for z=(m-tvtime/2+0.5):1:(m+tvtime/2-0.5)
                load_tv(z)=tvp(1);
            end
        else
            for z=(m-tvtime/2+0.5):1:p
                load_tv(z)=tvp(1);
            end
        end
    end
end
