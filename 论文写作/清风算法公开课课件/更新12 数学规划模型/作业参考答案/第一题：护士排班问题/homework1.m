%% 护士排班问题
clear 
% (1) 系数向量
c = ones(6,1); 
% (2) 不等式约束
A =zeros(6,6);
A(1,1) = -1; A(1,6) = -1;
for i = 1:5
    A(i+1, i) = -1;  A(i+1,i+1) = -1;
end
b = -[60 70 60 50 20 30]';
%（3）上下界
lb = zeros(6,1);

% 注意，这题应该是一个整数规划问题哦
intcon = [1:6];
[x fval] = intlinprog(c,intcon, A, b, [], [], lb)  
% fval =
%    150
% 注：本题的x可能有多个解！