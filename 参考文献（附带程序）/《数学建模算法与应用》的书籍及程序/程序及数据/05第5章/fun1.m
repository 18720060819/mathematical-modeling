function f=fun1(canshu,xdata);
f= exp(-canshu(1)*xdata(:,1)).*sin(canshu(2)*xdata(:,2))+xdata(:,3).^2;  %����canshu(1)=k1��canshu(2)=k2��ע�⺯�����Ա�������ʽ
