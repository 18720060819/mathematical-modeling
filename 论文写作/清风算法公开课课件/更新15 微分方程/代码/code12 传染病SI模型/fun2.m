function dx=fun2(t,x)   % 大家可以修改里面的参数，来看结果的变化
    global TOTAL_N   % 定义总人数为全局变量
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    if t > 60
        beta = beta/10; % 第60期后禁止大规模聚会，使得传染强度beta缩小为原来的10倍
    end
%     beta = 0.1 - 0.001*t
%     if beta < 0
%         beta = 0;
%     end
    dx = zeros(2,1);  % x(1)表示S  x(2)表示I
    dx(1) = - beta*x(1)*x(2)/TOTAL_N;  
    dx(2) = beta*x(1)*x(2)/TOTAL_N;
end
