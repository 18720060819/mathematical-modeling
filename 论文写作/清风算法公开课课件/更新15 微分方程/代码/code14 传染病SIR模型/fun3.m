function dx=fun3(t,x)   % 大家可以修改里面的参数，来看结果的变化
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    gamma = 0.01;  % 康复率
    if t > 100
        gamma = gamma * 10;  % 第100期后研发了疫苗，使得康复率增加为原来的10倍
    end
    dx = zeros(3,1);  % x(1)表示S  x(2)表示I  x(3)表示R
    C = x(1)+x(2);  % 传染病系统中的有效人群,也就是课件中的N' = S+I
    dx(1) = - beta*x(1)*x(2)/C;  
    dx(2) = beta*x(1)*x(2)/C - gamma*x(2);
    dx(3) = gamma*x(2); 
end
