% սǰ
function dx=pre_war(t,x)
    dx=zeros(2,1); 
    dx(1)=x(1)*(0.7-0.1*x(2));
    dx(2)=x(2)*(-0.8+0.02*x(1));
end