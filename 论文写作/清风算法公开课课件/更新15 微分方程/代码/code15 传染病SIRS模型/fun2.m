function dx=fun2(t,x)   % 大家可以修改里面的参数，来看结果的变化
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    gamma = 0.03;  % 康复率
    alpha = 0.01; % 康复者R再次转变为易感者S的转移率
    d = 0.005; % 因病的死亡率
    C = x(1)+x(2)+x(3);  % 传染病系统中的有效人群,也就是课件中的N' = S+I+R
    dx = zeros(4,1);  % x(1)表示S  x(2)表示I x(3)表示R x(4)表示ID
    dx(1) = - beta*x(1)*x(2)/C + alpha*x(3) ;  
    dx(2) = beta*x(1)*x(2)/C - gamma*x(2)-d*x(2);
    dx(3) = gamma*x(2) - alpha*x(3) ;  
    dx(4) = d*x(2);
end
