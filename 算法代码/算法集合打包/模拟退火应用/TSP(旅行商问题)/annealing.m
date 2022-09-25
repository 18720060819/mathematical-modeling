%function R=annealing(N,L,s,t,dt,C,R)
%NΪ�����ģ�����ڵ������L��ȡ�ϴ�ֵ����500��1000��
%sȡ1��2�ȣ�tΪ��ʼ�¶ȣ��ο���ΧΪ0.5--2��
%dtΪ˥�����ӣ�һ�㲻С��0.9;
%CΪ��Ȩ����Ӧ��һ��ǿ��ͨͼ�ı�Ȩ����
%RΪ��ʼ·�������·��Ҳ�����R��
%L��s��t��dtӦͨ�����������ȷ�����Ի���Ż��Ľ��
%�ο�������ֵ�����㷨--ģ���˻��㷨����ѧ������
function R=annealing(N,L,s,t,dt,C,R)
s0=0;
while 1
    a=0;
    for k=1:L
        [r,df]=calculate(R,C,N);
        if accept(t,df)
            R=r;a=1;
            disp(cost_sum(R,C,N));
        end
    end
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
