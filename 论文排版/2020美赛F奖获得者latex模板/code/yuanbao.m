%part 1
function [ard] = around(n)
%return the index of cells around
ard = [n+100, n+99, n-1, n-101, n-100, n-99,n+1, n+101];
for i = 1:8
    if ard(i) > 10000
        ard(i) = ard(i) - 10000;
    elseif ard(i) < 1
        ard(i) = ard(i) + 10000;
    end
end
%part 2
function[delta] = cal(a, d, p)
%determine how much surrounding cells affect
for i = 1:8
    if isnan(a(i));
       a(i) = 0;
    end
end
    delta = a*p*d;
end
%part3
% initialize
a = 0.7/4;
b = 0.3/4;
p = [a; b; a; b; a; b; a; b];
%time
T = 1200;
%cultural difference
d = 0.2;
env = zeros(100, 100);
for i = 1:10000
    env(i) = NaN;
end
for i = 1:33
    env(3*i-1, 60)=1;
end
for i = 1:20
    env(3*i-1, 40)=1;
end
newenv = env;
% put individuals in two certain areas randomly
rng('shuffle');
rh = randperm(5000, 1000);
env(rh) = 1;
re = randperm(5000, 1000);
re = re+5000;
env(re) = -1;
for t = 1:T 
    newmap = newenv;
for i = 1:10000 
        if isnan(env(i))
            continue;
        end
        ard = env(around(i));
% change the value
        x = env(i)+cal(ard, d, p);
        new = atan(x/(1+d))*4/pi;
        newmap(i) = new;
end
env = newmap;
newmap = newenv;
% change the place
for i = 1:10000
    if isnan(env(i))
        continue;
    end
    ard = around(i);
    w = rand(1);
    if isnan(newmap(ard(1))) || isnan(newmap(ard(2))) || isnan(newmap(ard(3))) || isnan(newmap(ard(4))) || isnan(newmap(ard(5))) || isnan(newmap(ard(6)))|| isnan(newmap(ard(7)))||isnan(newmap(ard(8)))|| isnan(newmap(i))
    if w<=0.2
        if isnan(newmap(ard(1)))
            newmap(ard(1)) = env(i);
        elseif isnan(newmap(i))
            newmap(i) = env(i);
        end
    elseif w<=0.4
        if isnan(newmap(ard(3)))
            newmap(ard(3)) = env(i);
        elseif isnan(newmap(i))
            newmap(i) = env(i);
        end
    elseif w<= 0.6
        if isnan(newmap(ard(5)))
            newmap(ard(5)) = env(i);
        elseif isnan(newmap(i))
            newmap(i) = env(i);
        end
    elseif w<=0.8
        if isnan(newmap(ard(7)))
            newmap(ard(7)) = env(i);
        elseif isnan(newmap(i))
            newmap(i) = env(i);
        end
    elseif w<=0.85
        if isnan(newmap(ard(2)))
            newmap(ard(2)) = env(i);
        elseif isnan(newmap(i))
            newmap(i) = env(i);
        end
    elseif w<=0.9
        if isnan(newmap(ard(4)))
            newmap(ard(4)) = env(i);
        elseif isnan(newmap(i))
            newmap(i) = env(i);
        end
    elseif w<=0.95
        if isnan(newmap(ard(6)))
            newmap(ard(6)) = env(i);
        elseif isnan(newmap(i))
            newmap(i) = env(i);
        end
    else
        if isnan(newmap(ard(8)))
            newmap(ard(8)) = env(i);
        elseif isnan(newmap(i))
            newmap(i) = env(i);
        end
    end
    else
        flag = 1;
        while flag == 1
            rnd = randperm(10000, 1);
            if isnan(newmap(rnd))
                newmap(rnd) = env(i);
                flag = 0;
            end
        end
    end
end
env = newmap;
newmap = newenv;
end
writetable(array2table(env), 'simucell.xlsx');
