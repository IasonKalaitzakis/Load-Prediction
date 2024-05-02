scenario_selection
lighting=zeros(1,96);
for j=1:1:p
    nit=72; %xronikh stigmh poy apaiteitao fvtismos
    if j>=nit
        lighting(j)=300; %isxys
    end
end
%logo diaforas wras to xeimwna yparxei anagh gia fwtismo to prwi.
if xeimonas==1
    wakeup=24; %Dhlwnetai h wra pou ksypna to proto atomo toyspitiou
    sunup=38; %Dhlwnwtai h wra pou o fotismos den einai pleonaparaithtos
    
    for i=wakeup:1:sunup %apo th wra pou ksypna to prwto atomomexri thn wra pou de xreiazetai fvtismos ston pinaka toy fvtismouprostei8etai to prwino fortio toy fotismoy
        lighting(i)=300;
        
    end
end