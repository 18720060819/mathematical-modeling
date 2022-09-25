function f=fun(x)
    f=2*x(1)+3*x(1)^2+3*x(2)+x(2)^2+x(3);
    f=-f;  % 最大值加负号改为最小值
end
