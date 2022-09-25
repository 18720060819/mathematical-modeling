%产生n个N(a,b)正态分布随机数
%其中a为均值，b为方差
%function x=normal(a,b,n)
function x=normal(a,b,n)
m=48;%
for i=1:n
    r=rand(1,m);
    x(i)=a+sqrt(b)*(sum(r)-m/2)/sqrt(m/12);
end
