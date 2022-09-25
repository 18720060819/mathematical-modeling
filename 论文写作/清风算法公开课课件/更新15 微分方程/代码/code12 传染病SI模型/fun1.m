function dx=fun1(t,x)   % 大家可以修改里面的参数，来看结果的变化
    global TOTAL_N   % 定义总人数为全局变量
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    dx = zeros(2,1);  % x(1)表示S  x(2)表示I
    dx(1) = - beta*x(1)*x(2)/TOTAL_N;  
    dx(2) = beta*x(1)*x(2)/TOTAL_N;
end
