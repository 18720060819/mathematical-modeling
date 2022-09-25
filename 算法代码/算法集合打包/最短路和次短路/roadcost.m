function y=roadcost(road,c)
y=0;
n=length(road);
for i=1:(n-1)
    y=y+c(road(i),road(i+1));
end

