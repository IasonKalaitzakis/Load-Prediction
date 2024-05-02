scenario_selection
activities
%Fortio Proswpikhs ygeihnhs
%sthn kathgoria katatassoume thermosyfvno, sesouar, mikrhthermantikh syskevh(aerothermo,soba alogonou)
%aerothermo

m = randomMaxProbabilities(pec);


if xeimonas==1 %pali xrhsimopoioume to deikth "xeimwnas" vlepe"scenario_selection.m"
    
    aero=zeros(1,96);
    for f=1:1:p
        taero=5; %diarkeia leitourgias
        if f<=taero
            aero(f)=0; %isxys
        end
    end
    laero=zeros(1,p);
    if taero==1
        laero(m)=aero(1);
    else
        if mod(taero,2)~=1
            if (m+taero/2-1)<p
                for z=(m-taero/2):1:(m+taero/2-1)
                    laero(z)=aero(1);
                end
            else
                for z=(m-taero/2):1:p
                    laero(z)=aero(1);
                end
            end
        end
        if mod(taero,2)~=0
            if (m+taero/2-0.5)<p
                for z=(m-taero/2+0.5):1:(m+taero/2-0.5)
                    laero(z)=aero(1);
                end
            else
                for z=(m-taero/2+0.5):1:p
                    laero(z)=aero(1);
                end
            end
        end
    end
else
    laero=zeros(1,96);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%stegnwthras maliwn
hairl=zeros(1,96);
for f=1:1:p
    hdt=1; %diarkeia leitourgias
    if f<=hdt
        hairl(f)=250; %isxys
    end
end
hload=zeros(1,p);
if hdt==1
    hload(m)=hairl(1);
else
    if mod(hdt,2)~=1
        if (m+hdt/2-1)<p
            for z=(m-hdt/2):1:(m+hdt/2-1)
                hload(z)=hairl(1);
            end
        else
            for z=(m-hdt)/2:1:p
                hload(z)=hairl(1);
            end
        end
    end
    if mod(hdt,2)~=0
        if (m+hdt/2-0.5)<p
            for z=m-hdt/2+0.5:1:m+hdt/2-0.5
                hload(z)=hairl(1);
            end
        else
            for z=m-hdt/2+0.5:1:p
                hload(z)=hairl(1);
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%thermosyfono
thermo=zeros(1,96);
for d=1:1:p
    thet=2; %diarkeia leitourgias
    if d<=thet
        thermo(d)=1000; %isxys
    end
end
lthermo=zeros(1,p);
if thet==1
    lthermo(m)=thermo(1);
else
    if mod(thet,2)~=1
        if(m+thet/2-1)<p
            for z=(m-thet/2):1:(m+thet/2-1)
                lthermo(z)=thermo(1);
            end
        else
            for z=(m-thet/2):1:p
                lthermo(z)=thermo(1);
            end
        end
    end
    if mod(thet,2)~=0
        if (m+(thet/2)-0.5)
            for z=(m-thet/2+0.5):1:(m+thet/2-0.5)
                lthermo(z)=thermo(1);
            end
        else
            for z=(m-thet/2+0.5):1:p
                lthermo(z)=thermo(1);
            end
        end
    end
end
load_bath=(lthermo+hload+laero);