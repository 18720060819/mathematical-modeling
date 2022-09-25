% % ������ȫ�ֱ�����д��
function dx=newfun2(t,x,GAMMA)   % ��GAMMA���ɲ����������
    beta = 0.1;  % �׸�Ⱦ�����Ѹ�Ⱦ�߽Ӵ��ұ���Ⱦ��ǿ��
    dx = zeros(3,1);  % x(1)��ʾS  x(2)��ʾI  x(3)��ʾR
    C = x(1)+x(2);  % ��Ⱦ��ϵͳ�е���Ч��Ⱥ,Ҳ���ǿμ��е�N' = S+I
    dx(1) = - beta*x(1)*x(2)/C;  
    dx(2) = beta*x(1)*x(2)/C - GAMMA*x(2);
    dx(3) = GAMMA*x(2);
end