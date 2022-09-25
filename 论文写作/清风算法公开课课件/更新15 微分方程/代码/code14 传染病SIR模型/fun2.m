function dx=fun2(t,x)   % 大家可以修改里面的参数，来看结果的变化
    global GAMMA % 定义康复率为全局变量
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    dx = zeros(3,1);  % x(1)表示S  x(2)表示I  x(3)表示R
    C = x(1)+x(2);  % 传染病系统中的有效人群,也就是课件中的N' = S+I
    dx(1) = - beta*x(1)*x(2)/C;  
    dx(2) = beta*x(1)*x(2)/C - GAMMA*x(2);
    dx(3) = GAMMA*x(2);
end


