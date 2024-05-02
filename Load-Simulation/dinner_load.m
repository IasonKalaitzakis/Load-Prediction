scenario_selection
activities

m = randomMaxProbabilities(dn);


if microkimata==1 %omoia me prwino
    micro2=zeros(1,96);
    for x=1:1:p
        microt2=5; %diarkeia leitourgias
        if x<=microt2
            micro2(x)=800; %isxys
        end
    end
    
    load_dinner=zeros(1,p);
    if microt2==1
        load_dinner(m)=micro2(1);
    else
        if mod(microt2,2)~=1
            if (m+microt2/2-1)<p
                for z=(m-microt2/2):1:(m+microt2/2-1)
                    load_dinner(z)=micro2(1);
                end
            else
                for z=(m-microt2/2):1:p
                    load_dinner(z)=micro2(1);
                end
            end
        end
        if mod(microt2,2)~=0
            if (m+microt2/2-0.5)<p
                for z=(m-microt2/2+0.5):1:(m+microt2/2-0.5)
                    load_dinner(z)=micro2(1);
                end
            else
                for z=(m-microt2/2+0.5):1:p
                    load_dinner(z)=micro2(1);
                end
            end
        end
    end
else
    %Fournos/estia mono an "microkimata~=1"
    ovendn=zeros(1,96);
    for w=1:1:p
        ovent2=2; %diarkeia leitourgias
        if w<=ovent2
            ovendn(w)=1500; %isxys
        end
    end
    load_dinner=zeros(1,p);
    if ovent2==1
        load_dinner(m)=ovendn(1);
    else
        if mod(ovent2,2)~=1
            if(m+(ovent2-1)/2)<p
                for z=(m-(ovent2)/2):1:(m+(ovent2)/2-1)
                    load_dinner(z)=ovendn(1);
                end
            else
                for z=(m-(ovent2)/2):1:p
                    load_dinner(z)=ovendn(1);
                end
            end
        end
    end
    if mod(ovent2,2)~=0
        if (m+ovent2/2-0.5)<p
            for z=(m-ovent2/2+0.5):1:(m+ovent2/2-0.5)
                load_dinner(z)=ovendn(1);
            end
        else
            for z=(m-ovent2/2+0.5):1:p
                load_dinner(z)=ovendn(1);
            end
        end
    end
end