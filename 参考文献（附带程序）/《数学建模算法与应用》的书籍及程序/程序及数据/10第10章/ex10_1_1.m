clc,clear
a=[1,0;1,1;3,2;4,3;2,5];
[m,n]=size(a);
d=zeros(m);
d=mandist(a'); %mandist�������������֮�����������ֵ����
d=tril(d); %��ȡ������Ԫ��
nd=nonzeros(d);   %ȥ��d�е���Ԫ�أ�����Ԫ�ذ�������
nd=union(nd,nd)   %ȥ���ظ��ķ���Ԫ��
for i=1:m-1
    nd_min=min(nd);
    [row,col]=find(d==nd_min);tm=union(row,col);  %row��col��Ϊһ��
    tm=reshape(tm,1,length(tm));  %������tm���������  
    fprintf('��%d�κϳɣ�ƽ̨�߶�Ϊ%dʱ�ķ�����Ϊ��%s\n',...
        i,nd_min,int2str(tm));
    nd(find(nd==nd_min))=[]; %ɾ���Ѿ������Ԫ��
    if length(nd)==0
        break
    end
end
