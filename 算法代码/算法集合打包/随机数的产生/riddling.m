%产生一个N(0,1)正态分布随机数
%采用筛选法，精度较高
%其他方法可参阅《现代应用数学手册--概率统计与随机过程卷》清华大学出版社马振华主编
%function y=riddling()
function y=riddling()
sign=0;
while 1
    x=rand(1,2);
    v1=2*x(1)-1;v2=2*x(2)-1;
    s=v1^2+v2^2;
    if s<=1
        a=sqrt(-2*log(s)/s);
        y=v1*a;
        sign=1;
    end
    if sign==1
        break;
    end
end
