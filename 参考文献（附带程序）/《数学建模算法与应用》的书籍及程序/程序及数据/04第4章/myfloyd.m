function [dist,mypath]=myfloyd(a,sb,db);
% ���룺a���ڽӾ���Ԫ��(aij)�Ƕ���i��j֮���ֱ����룬�����������
% sb�����ı�ţ�db���յ�ı��
% �����dist�����·�ľ��룻% mypath�����·��·��
n=size(a,1); path=zeros(n);
for k=1:n
    for i=1:n
        for j=1:n
            if a(i,j)>a(i,k)+a(k,j)
                a(i,j)=a(i,k)+a(k,j);
                path(i,j)=k;
            end
        end
    end
end
dist=a(sb,db);
parent=path(sb,:); %�����sb���յ�db�����·�ϸ������ǰ������
parent(parent==0)=sb; %path�еķ���Ϊ0����ʾ�ö����ǰ�������
mypath=db; t=db;
while t~=sb
        p=parent(t); mypath=[p,mypath];
        t=p;
end
