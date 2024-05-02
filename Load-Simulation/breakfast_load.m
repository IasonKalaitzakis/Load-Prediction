scenario_selection
activities

m = randomMaxProbabilities(br);

if microkimata==1 %an einai 1 xrhsimopoieitai o foyrnos mikrokimatwnan oxi o kanonikos fournos
    % foyrnos mikrokimatwn
    micro=zeros(1,96);
    for x=1:1:p
        microt=1; %diarkeia leitourgias
        if x<=microt
            micro(x)=200; %onomastikh isxus
        end
    end
    
    lmicro1=zeros(1,p);
    if microt==1
        lmicro1(m)=micro(1);
    else
        if mod(microt,2)~=1
            if (m+microt/2-1)<p
                for z=(m-microt/2):1:(m+microt/2-1)
                    lmicro1(z)=micro(1);
                end
            else
                for z=(m-microt/2):1:p
                    lmicro1(z)=micro(1);
                end
            end
        end
        if mod(microt,2)~=0
            if (m+microt/2-0.5)<p
                for z=(m-microt/2+0.5):1:(m+microt/2-0.5)
                    lmicro1(z)=micro(1);
                end
            else
                for z=(m-microt/2+0.5):1:p
                    lmicro1(z)=micro(1);
                end
            end
        end
    end
else %microkimata diaforo toy 1
    %hlektrikos fournos
    ovenmorn=zeros(1,96);
    for w=1:1:p
        ovent=2; %diarkeia leitoyrgias
        if w<=ovent
            ovenmorn(w)=1500; %isxus
        end
    end
    
    
    lmicro1=zeros(1,p);
    if ovent==1
        lmicro1(m)=ovenmorn(1);
    else
        if mod(ovent,2)~=1
            if(m+ovent/2-1)<p
                for z=(m-ovent/2):1:(m+ovent/2-1)
                    lmicro1(z)=ovenmorn(1);
                end
            else
                for z=(m-ovent/2):1:p
                    lmicro1(z)=ovenmorn(1);
                end
            end
        end
    end
    if mod(ovent,2)~=0
        if (m+ovent/2-0.5)<p
            for z=(m-ovent/2+0.5):1:(m+ovent/2-0.5)
                lmicro1(z)=ovenmorn(1);
            end
        else
            for z=(m-ovent/2+0.5):1:p
                lmicro1(z)=ovenmorn(1);
            end
        end
    end
end


load_breakfast=scenario.*lmicro1;