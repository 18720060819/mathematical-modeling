function dx=fun1(t,x)   % ��ҿ����޸�����Ĳ�������������ı仯
    global TOTAL_N   % ����������Ϊȫ�ֱ���
    beta = 0.1;  % �׸�Ⱦ�����Ѹ�Ⱦ�߽Ӵ��ұ���Ⱦ��ǿ��
    gamma = 0.03;  % ������
    alpha = 0.01; % ������R�ٴ�ת��Ϊ�׸���S��ת����
    dx = zeros(3,1);  % x(1)��ʾS  x(2)��ʾI x(3)��ʾR
    dx(1) = - beta*x(1)*x(2)/TOTAL_N + alpha*x(3) ;  
    dx(2) = beta*x(1)*x(2)/TOTAL_N - gamma*x(2);
    dx(3) = gamma*x(2) - alpha*x(3) ;  
end
