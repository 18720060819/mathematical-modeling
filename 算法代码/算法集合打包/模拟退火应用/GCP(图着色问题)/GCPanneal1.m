%function [e,c]=GCPanneal1(L,s,t,dt,lamda,d,b,n)
%
%ͼ��ɫ����(Graph Colouring Problem)���˻��㷨
%GCP����ɿ�Ϊ�����㼯����Ϊ���ٸ���������������
%
%���������������㷨��
%GCPanneal1�����ڶ���С��20������
%GCPanneal2�����ڸ��ֶ���
%��GCPanneal1�У�w(i)��ʾ������ɫi��Ȩֵ
%
%nΪ�����ģ�����ڵ������bΪ��������
%lamda��һ������1�ķ���������
%dΪͼG������������С��ɫ�Ͻ�Ϊd+1
%e(u)��ʾu���ŵ���ɫ��
%c(i)��ʾ������ɫi�Ķ������
%
%L��ȡ�ϴ�ֵ����500��1000��
%sȡ1��2�ȣ�tΪ��ʼ�¶ȣ��ο���ΧΪ0.5--2��
%dtΪ˥�����ӣ�һ�㲻С��0.9;
%L��s��t��dtӦͨ�����������ȷ�����Ի���Ż��Ľ��
%�ο�������ֵ�����㷨--ģ���˻��㷨����ѧ������

function [e,c]=GCPanneal1(L,s,t,dt,lamda,d,b,n)
w(1)=2^d;
for j=2:(d+1)
    w(j)=2*w(j-1)-w(1)-1;
end
%��Ȩ

e=zeros(1,n);
e=e+1;
c=zeros(1,d+1);
c(1)=n;
%�趨��ʼ��

s0=0;
while 1
    a=0;
    for k=1:L
        [u,i,j,df]=GCPgen1(e,d,b,n,w,lamda);
        if GCPacc1(df,t)
              e(u)=j;c(i)=c(i)-1;c(j)=c(j)+1;
              a=1;
        end
    end
    fprintf('ͼ�и��㱻�ŵ���ɫ��\n');
    disp(e);
    fprintf('���Ը���ɫ�Ķ������\n');
    disp(c);
    t=t*dt
    if a==0
        s0=s0+1;
    else 
        s0=0;
    end
    if s0==s
        break;
    end
end




