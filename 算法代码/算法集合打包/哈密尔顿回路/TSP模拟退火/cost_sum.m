function y=cost_sum(x,C,N)
y=0;
for i=1:(N-1)
    y=y+C(x(i),x(i+1));
end
y=y+C(x(N),x(1));

