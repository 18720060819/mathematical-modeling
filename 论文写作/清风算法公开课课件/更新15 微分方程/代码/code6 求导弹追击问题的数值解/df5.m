function dy=df5(t,y)
    v = 200; 
    dy=zeros(2,1);
    dy(1)=3*v*(20+sqrt(2)/2*v*t-y(1))/sqrt((20+sqrt(2)/2*v*t-y(1))^2+(sqrt(2)/2*v*t-y(2))^2);
    dy(2)=3*v*(sqrt(2)/2*v*t-y(2))/sqrt((20+sqrt(2)/2*v*t-y(1))^2+(sqrt(2)/2*v*t-y(2))^2);
end