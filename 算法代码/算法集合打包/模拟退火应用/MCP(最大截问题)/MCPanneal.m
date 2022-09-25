%function [e,f]=MCPanneal(L,s,t,dt,w,N)
%��������(Max Cut Problem)���˻��㷨
%�����㷨��ȱ�ݣ���fֵ�ڽϳ�ʱ���ڲ��ٸı�ʱ������cl+cֹͣ����
%NΪ�����ģ�����ڵ������wΪȨ����
%L��ȡ�ϴ�ֵ����500��1000��
%sȡ1��2�ȣ�tΪ��ʼ�¶ȣ��ο���ΧΪ0.5--2��
%dtΪ˥�����ӣ�һ�㲻С��0.9;
%eΪ��0��1ΪԪ�ص����飬����ʾ�����Ӽ�
%fΪ����Ȩ�غ�
%L��s��t��dtӦͨ�����������ȷ�����Ի���Ż��Ľ��
%�ο�������ֵ�����㷨--ģ���˻��㷨����ѧ������

function [e,f]=MCPanneal(L,s,t,dt,w,N)
f=0;
e=zeros(1,N);

s0=0;
while 1
    a=0;
    for k=1:L
        [u,df]=MCPgen(e,N,w);
        if MCPacc(df,t)
              e(u)=1-e(u);
              f=f+df;
              a=1;
        end
    end
    disp(e);disp(f);
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