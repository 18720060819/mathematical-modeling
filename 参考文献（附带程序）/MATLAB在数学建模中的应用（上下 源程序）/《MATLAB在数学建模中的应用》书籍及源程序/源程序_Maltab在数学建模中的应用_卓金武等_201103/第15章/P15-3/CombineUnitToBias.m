%�Ӻ�����������ڶ�����m�ļ��У�����ΪCombineUnitToBias.m
%�����ڵ�ϲ���ƫ��
function[W1Ex,W2Ex]=CombineUnitToBias(unit,UnitMean,W1Ex,W2Ex)
[xxx,BiasCol]=size(W2Ex);
W2Ex(:,BiasCol)=W2Ex(:,BiasCol)+UnitMean*W2Ex(:,unit);
W1Ex(unit,:)=[];
W2Ex(:,unit)=[];