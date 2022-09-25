function dx=fun3(t,x)   % 大家可以修改里面的参数，来看结果的变化
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    gamma1 = 0.01;  % 完全康复率
    gamma2 = 0.01;  % 暂时康复率
    alpha = 0.01; % 暂时康复者R2再次转变为易感者S的转移率
    d = 0.005; % 因病的死亡率
    C = x(1)+x(2)+x(4);  % 传染病系统中的有效人群,也就是课件中的N' = S+I+R2
    dx = zeros(5,1);  % x(1)表示S  x(2)表示I x(3)表示R1 x(4)表示R2 x(5)表示ID
    dx(1) = - beta*x(1)*x(2)/C + alpha*x(4) ;  
    dx(2) = beta*x(1)*x(2)/C - gamma1*x(2)-gamma2*x(2)-d*x(2);
    dx(3) = gamma1*x(2) ;  
    dx(4) = gamma2*x(2) - alpha*x(4) ;  
    dx(5) = d*x(2);
end
