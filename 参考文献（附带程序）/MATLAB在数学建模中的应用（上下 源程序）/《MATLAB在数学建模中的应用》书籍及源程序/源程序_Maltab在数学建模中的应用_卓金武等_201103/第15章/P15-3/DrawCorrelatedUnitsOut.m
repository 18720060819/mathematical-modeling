%�Ӻ�����������ڶ�����m�ļ��У�����ΪDrawCorrelatedUnitsOut.m
%������������ڵ���������������
function DrawCorrelatedUnitsOut(UnitOut1,UnitOut2)
[xxx,PtNum]=size(UnitOut1);
figure
echo off
axis([0 PtNum 0 1])
axis on
grid
hold on
plot(1:PtNum,UnitOut1,'b-')
plot(1:PtNum,UnitOut2,'k-')