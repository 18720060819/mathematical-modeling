%�Ӻ�����������ڶ�����m�ļ��У�����ΪDrawBiasedUnitOut.m
%���Ʊ�׼���С�ĵ������ڵ����
function DrawBiasedUnitOut(UnitOut)
[xxx,PtNum]=size(UnitOut);
figure('Position',[300 300 400 300])
echo off
axis([0 PtNum 0 1])
axis on
grid
hold on
plot(1:PtNum,UnitOut,'k-')