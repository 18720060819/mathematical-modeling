function dy=df3(x,y) 
       dy=zeros(2,1);  % ��ʼ���������������һ�׵����ľ���
       dy(1)=y(2);
       dy(2)=(2*x)/(1+x*x)*y(2);
end
