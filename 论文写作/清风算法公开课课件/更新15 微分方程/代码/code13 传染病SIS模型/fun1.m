function dx=fun1(t,x)   % ��ҿ����޸�����Ĳ�������������ı仯
    global TOTAL_N   % ����������Ϊȫ�ֱ���
    beta = 0.1;  % �׸�Ⱦ�����Ѹ�Ⱦ�߽Ӵ��ұ���Ⱦ��ǿ��
    alpha = 0.06; % �ɸ�Ⱦ״̬I�ָ�Ϊ�׸���״̬S�Ļָ���
    dx = zeros(2,1);  % x(1)��ʾS  x(2)��ʾI
    dx(1) = alpha*x(2) - beta*x(1)*x(2)/TOTAL_N;  
    dx(2) = beta*x(1)*x(2)/TOTAL_N - alpha*x(2);
end
