function dy=df3(x,y) 
       dy=zeros(2,1);  % 初始化用来储存因变量一阶导数的矩阵
       dy(1)=y(2);
       dy(2)=(2*x)/(1+x*x)*y(2);
end
