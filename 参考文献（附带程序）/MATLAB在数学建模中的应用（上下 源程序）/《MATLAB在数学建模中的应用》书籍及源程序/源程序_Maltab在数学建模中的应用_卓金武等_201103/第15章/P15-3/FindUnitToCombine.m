%�Ӻ�����������ڶ�����m�ļ��У�����ΪFindUnitToCombine.m
%Ѱ����Ҫ�ϲ������ڵ�
function[unit1,unit2]=FindUnitToCombine(HiddenCorr,...
    HiddenVar,UnitsCombineThreshold,BiasCombineThreshold)
CorrTri=triu(HiddenCorr)-eye(size(HiddenCorr));
while(1)
[Val,Pos]=max(abs(CorrTri));
[MaxCorr,unit2]=max(Val);
if(MaxCorr<UnitsCombineThreshold)
unit1=0;unit2=0;
break
end
unit1=Pos(unit2);
if(HiddenVar(unit1)>BiasCombineThreshold&...
        HiddenVar(unit2)>BiasCombineThreshold)
break;
else
CorrTri(unit1,unit2)=0;
end
end

if (unit1>0) return;end
[MinVar,unit]=min(HiddenVar);
if(MinVar<BiasCombineThreshold)
unit1=unit;
unit2=0;
end
