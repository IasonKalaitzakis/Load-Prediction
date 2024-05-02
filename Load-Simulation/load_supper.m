scenario_selection
activities
%Fortio meshmerianou

m = randomMaxProbabilities(sp);



if sp==zeros(1,96) % yparxei periptwsh ths wres poy exei megalh
    %pithanothta to meshmeriano h katalhpsimothta toy
    %spitiou na einai 0. etsi se merika senaria o
    %dior8wmenos pinakas toy meshmerianoy einaimhdenikos.
    %s ayth thn periptvsh thevroyme oti oi enoikoitrwne
    %kapoy ektos spitioy kai ara to fortio einaimhdeniko.
    %An de to kaname ayto o algorithmos 8a epsaxne tomax
    %enos mhdenikou pinaka kai the eixame sfalma
    
    lovensup=zeros(1,96);
    lventi=zeros(1,96);
    
else
    %hlektrikos fournos
    ovensup=zeros(1,96);
    for w=1:1:p
        oventsup=6; %diarkeia leitourgias
        if w<=oventsup
            ovensup(w)=1500; %isxys
        end
    end
    
    lovensup=zeros(1,p);
    if oventsup==1
        lovensup(m)=ovensup(1);
    else
        if mod(oventsup,2)~=1
            if (m+oventsup/2-1)<p
                for z=(m-oventsup/2):1:(m+oventsup/2-1)
                    lovensup(z)=ovensup(1);
                end
            else
                for z=(m-oventsup/2):1:p
                    lovensup(z)=ovensup(1);
                end
            end
        end
        if mod(oventsup,2)~=0
            if (m+oventsup/2-0.5)<p
                for z=(m-oventsup/2+0.5):1:(m+oventsup/2-0.5)
                    lovensup(z)=ovensup(1);
                end
            else
                for z=(m-oventsup/2+0.5):1:p
                    lovensup(z)=ovensup(1);
                    
                end
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %eksaeristhras
    venti=zeros(1,96);
    for s=1:1:p
        ventit=6; %diarkeia leitourgias
        if s<=ventit
            venti(s)=100; %isxys
        end
    end
    lventi=zeros(1,p);
    if ventit==1
        lventi(m)=venti(1);
    else
        if mod(ventit,2)~=1
            if (m+ventit/2-1)<p
                for z=(m-ventit/2):1:(m+ventit/2-1)
                    lventi(z)=venti(1);
                end
            else
                for z=(m-ventit/2):1:p
                    lventi(z)=venti(1);
                end
            end
        end
        if mod(ventit,2)~=0
            if(m+ventit/2-0.5)<p
                for z=(m-ventit/2+0.5):1:(m+ventit/2-0.5)
                    lventi(z)=venti(1);
                end
            else
                for z=(m-ventit/2+0.5):1:p
                    
                end
            end
        end
    end
end
supper_load=(lovensup+lventi);
