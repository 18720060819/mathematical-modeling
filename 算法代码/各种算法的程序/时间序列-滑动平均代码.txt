function [movaver3,movaver5]= moveaver(Y)
%Y:原时间序列
%movaver3,movaver5: 三点/五点滑动平均值
n=length(Y);
%计算三点滑动平均值
movaver3(1)=0;
movaver3(n)=0;
for i=2:(n-1)
    movaver3(i)=(Y(i-1)+Y(i)+Y(i+1))/3;
end
%计算五点滑动平均值
movaver5(1)=0;
movaver5(2)=0;
movaver5(n-1)=0;
movaver5(n)=0;
for i=3:(n-2)
    movaver5(i)=(Y(i-2)+Y(i-1)+Y(i)+Y(i+1)+Y(i+2))/5;
end
end