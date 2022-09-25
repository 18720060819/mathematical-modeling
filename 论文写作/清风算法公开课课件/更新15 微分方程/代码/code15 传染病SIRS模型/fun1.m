function dx=fun1(t,x)   % 大家可以修改里面的参数，来看结果的变化
    global TOTAL_N   % 定义总人数为全局变量
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    gamma = 0.03;  % 康复率
    alpha = 0.01; % 康复者R再次转变为易感者S的转移率
    dx = zeros(3,1);  % x(1)表示S  x(2)表示I x(3)表示R
    dx(1) = - beta*x(1)*x(2)/TOTAL_N + alpha*x(3) ;  
    dx(2) = beta*x(1)*x(2)/TOTAL_N - gamma*x(2);
    dx(3) = gamma*x(2) - alpha*x(3) ;  
end
