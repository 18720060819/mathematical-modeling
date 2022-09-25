%编写 J矩阵的主程序
J=zeros(720,6);
N=6;y=1;
for m=1:N
   a(m)=m
end
p=0;p=p+1;
for m=1:N
   J(p,m)=a(m)
end
x=0
y=y+1
exchange
while x~=0
   p=p+1
   for m=1:N
      J(p,m)=a(m)
   end 
   x=0
   y=y+1
   exchange
end%得到了一个720*6的全排列矩阵
