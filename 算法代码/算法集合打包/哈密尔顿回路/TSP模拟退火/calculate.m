function [r,df]=calculate(R,C,N)
judge=rand(1,1);
if judge<0.5
    r=exchange2(R);
    df=cost_sum(r,C,N)-cost_sum(R,C,N);
else 
    r=exchange3(R);
    df=cost_sum(r,C,N)-cost_sum(R,C,N);
end

