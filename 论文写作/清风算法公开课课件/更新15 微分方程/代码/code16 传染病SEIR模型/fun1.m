function dx=fun1(t,x)   % 大家可以修改里面的参数，来看结果的变化
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    sigma = 0.2; % 潜伏者转换为感染者的速率
    gamma = 0.02;  % 康复率
    dx = zeros(4,1);  % x(1)表示S  x(2)表示E  x(3)表示I  x(4)表示R
    C = x(1)+x(2)+x(3);  % 传染病系统中的有效人群,也就是课件中的N' = S+E+I
    dx(1) = - beta*x(1)*x(3)/C;  
    dx(2) = beta*x(1)*x(3)/C - sigma*x(2);
    dx(3) = sigma*x(2) - gamma*x(3);
    dx(4) = gamma*x(3); 
end

