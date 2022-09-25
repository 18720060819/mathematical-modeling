%function [e,c,f]=GCPanneal2(L,s,t,dt,lamda,d,b,n)
%
%ͼ��ɫ����(Graph Colouring Problem)���˻��㷨
%GCP����ɿ�Ϊ�����㼯����Ϊ���ٸ���������������
%
%���������������㷨��
%GCPanneal1�����ڶ���С��20������
%GCPanneal2�����ڸ��ֶ���
%��GCPanneal1�У�w(i)��ʾ������ɫi��Ȩֵ
%
%
%nΪ�����ģ�����ڵ������bΪ��������
%lamda��һ������1�ķ���������
%dΪͼG������������С��ɫ�Ͻ�Ϊd+1
%e(u)��ʾu���ŵ���ɫ��%
%c(i)��ʾ������ɫi�Ķ������%
%
%L��ȡ�ϴ�ֵ����500��1000��
%sȡ1��2�ȣ�tΪ��ʼ�¶ȣ��ο���ΧΪ0.5--2��
%dtΪ˥�����ӣ�һ�㲻С��0.9;
%L��s��t��dtӦͨ�����������ȷ�����Ի���Ż��Ľ��
%�ο�������ֵ�����㷨--ģ���˻��㷨����ѧ������

function [e,c]=GCPanneal2(L,s,t,dt,lamda,d,b,n)

e=zeros(1,n);
e=e+1;
c=zeros(1,d+1);
c(1)=n;
f=0;
%�趨��ʼ��

s0=0;
while 1
    a=0;
    for k=1:L
        
        u=1+fix(unifrnd(0,n));
        i=e(u);
        while 1
            j=1+fix(unifrnd(0,d+1));
            if j~=1&(c(i)>1|c(j)>0)
                break;
            end
        end
        df=0;
        for v=1:n
            if e(v)==j
                df=df+b(v,u);
            end
            if e(v)==i
                df=df-b(v,u);
            end
        end
        df=lamda*df;
        if c(i)==1
            df=df-1;
        end
        if c(j)==0
            df=df+1;
        end
        if df==0
            df=1;
        end
        
        
        if df<0|(df/t<88&exp(-df/t)>rand(1,1))
            e(u)=j;c(i)=c(i)-1;c(j)=c(j)+1;f=f+df;
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

