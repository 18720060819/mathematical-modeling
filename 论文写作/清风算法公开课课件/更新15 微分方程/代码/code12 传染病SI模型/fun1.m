function dx=fun1(t,x)   % ��ҿ����޸�����Ĳ�������������ı仯
    global TOTAL_N   % ����������Ϊȫ�ֱ���
    beta = 0.1;  % �׸�Ⱦ�����Ѹ�Ⱦ�߽Ӵ��ұ���Ⱦ��ǿ��
    dx = zeros(2,1);  % x(1)��ʾS  x(2)��ʾI
    dx(1) = - beta*x(1)*x(2)/TOTAL_N;  
    dx(2) = beta*x(1)*x(2)/TOTAL_N;
end
