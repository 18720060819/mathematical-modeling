%�Ӻ�����������ڶ�����m�ļ��У�����ΪCombineTwoUnits.m
%�������ڵ�ϲ�
function[W1Ex,W2Ex]=CombineTwoUnits(unit1,unit2,a,b,W1Ex,W2Ex)
[xxx,BiasCol]=size(W2Ex);
W2Ex(:,unit1)=W2Ex(:,unit1)+a*W2Ex(:,unit2);
W2Ex(:,BiasCol)=W2Ex(:,BiasCol)+b*W2Ex(:,unit2);
W1Ex(unit2,:)=[];
W2Ex(:,unit2)=[];