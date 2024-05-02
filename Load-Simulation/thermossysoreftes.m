scenario_selection
activities
%Fortio thermanshs. An kai h hlektrikh thermansh den einai pleondhmofilhs
%prepei na lhfthei ypopsh. Me to deikth "xeimonas" vlepe
%"scenario_selection.m" orizoume th xrhsh h oxi analoga ton kairo.An den
%xrhsimopoiountai ka8oloy bazoyme thn timh 0 sthn isxy. De vazoumeto
%xeimonas=o dioti xrhsimopoieitai kai sta fvta kai sto aerothermo
if xeimonas==1
    thermos1=zeros(1,96);
    thermos2=zeros(1,96);
    %Epeidh oi thermosysoreftes leitourgoun me nyxterino revma orizoumethn ora
    %diakophs kai enarkshs leitourgias tous
    thermopower=2400;%isxys thermosyssoreftwn
    tsys2=92; %vra enarkshs leitourgias
    tsys1=20; %wra diakophs leitourgias
    for f=1:1:p
        if f<=tsys1
            thermos1(f)=thermopower;
        end
    end
    for xx=(tsys2):1:p
        thermos2(xx)=thermopower;
    end
else
    thermos1=zeros(1,96);
    thermos2=zeros(1,96);
end
lthermosys=thermos1+thermos2;