%% 非线性规划的函数
% [x,fval] = fmincon(@fun,x0,A,b,Aeq,beq,lb,ub,@nonlfun,option)
% x0表示给定的初始值（用行向量或者列向量表示），必须得写
% A b表示线性不等式约束
% Aeq beq 表示线性等式约束
% lb ub 表示上下界约束
% @fun表示目标函数
% @nonlfun表示非线性约束的函数
% option 表示求解非线性规划使用的方法
clear;clc
format long g   %可以将Matlab的计算结果显示为一般的长数字格式（默认会保留四位小数，或使用科学计数法）

%% 例题1的求解
% max f(x) = x1^2 +x2^2 -x1*x2 -2x1 -5x2
% s.t. -(x1-1)^2 +x2 >= 0 ;  2x1-3x2+6 >= 0
x0 = [0 0];  %任意给定一个初始值 
A = [-2 3]; b = 6;
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1)  % 注意 fun1.m文件和nonfun1.m文件都必须在当前文件夹目录下
fval = -fval
% 一个值得讨论的地方，能不能把线性不等式约束Ax <= b也写到nonlfun1函数中？
% 先把nonlfun1中的c改为下面这样：
% c = [(x(1)-1)^2-x(2); 
%        -2*x(1)+3*x(2)-6];
%  [x,fval] = fmincon(@fun1,x0,[],[],[],[],[],[],@nonlfun1)
% 结果也是可以计算出来的，但并不推荐这样做~

%% 使用其他算法对例题1求解
% edit fmincon  % 查看fmincon的“源代码”
% Matlab2017a默认使用的算法是'interior-point' 内点法
% 使用interior point算法 （内点法）
option = optimoptions('fmincon','Algorithm','interior-point')
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1,option)  
fval = -fval
% 使用SQP算法 （序列二次规划法）
option = optimoptions('fmincon','Algorithm','sqp')
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1,option)  
fval = -fval   %得到-4.358，远远大于内点法得到的-1,猜想是初始值的影响
% 改变初始值试试
x0 = [1 1];  %任意给定一个初始值 
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1,option)  % 最小值为-1，和内点法相同（这说明内点法的适应性要好）
fval = -fval  
% 使用active set算法 （有效集法）
option = optimoptions('fmincon','Algorithm','active-set')
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1,option)
fval = -fval  
% 使用trust region reflective (信赖域反射算法)
option = optimoptions('fmincon','Algorithm','trust-region-reflective')
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1,option)  
fval = -fval  
% this algorithm does not solve problems with the constraints you have specified. 
% 这说明这个算法不适用我们这个约束条件，所以以后遇到了不能求解的情况，记得更换其他算法试试！！！

%% 选取初始值得到的结果可能会不满足限定条件，出现了一个Bug 因此选择的初始值很重要
x0 = [40.8, 10.8];
option = optimoptions('fmincon','Algorithm','interior-point')
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1,option)  
fval = -fval  
% https://cn.mathworks.com/help/optim/ug/fmincon.html

%% 生成不同的随机初始值来优化代码，有一定几率会触发上面那个Bug，因此不推荐
n = 10;  % 重复n次
Fval = +inf; X = [0,0];  %初始化最优的结果
A = [-2 3]; b = 6;
for i = 1:n
    x0 = [rand()*10 , rand()*10];  %用随机数生成一个初始值（随机数的范围自己根据题目条件设置） 
    [x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1,option); % 注意 fun1.m文件和nonfun1.m文件都必须在当前文件夹目录下
    if fval < Fval  % 如果找到了更小的值，那么就代替最优的结果
        Fval = fval;
        X = x;
    end
end
Fval = -Fval
X

%% 使用蒙特卡罗的方法来找初始值(推荐）
clc,clear;
n=10000000; %生成的随机数组数
x1=unifrnd(-100,100,n,1);  % 生成在[-100,100]之间均匀分布的随机数组成的n行1列的向量构成x1
x2=unifrnd(-100,100,n,1);  % 生成在[-100,100]之间均匀分布的随机数组成的n行1列的向量构成x2
fmin=+inf; % 初始化函数f的最小值为正无穷（后续只要找到一个比它小的我们就对其更新）
for i=1:n
    x = [x1(i), x2(i)];  %构造x向量, 这里千万别写成了：x =[x1, x2]
    if ((x(1)-1)^2-x(2)<=0)  & (-2*x1(i)+3*x2(i)-6 <= 0)     % 判断是否满足条件
        result = -x(1)^2-x(2)^2 +x(1)*x(2)+2*x(1)+5*x(2) ;  % 如果满足条件就计算函数值
        if  result  < fmin  % 如果这个函数值小于我们之前计算出来的最小值
            fmin = result;  % 那么就更新这个函数值为新的最小值
            x0 = x;  % 并且将此时的x1 x2更新为初始值
        end
    end
end
disp('蒙特卡罗选取的初始值为：'); disp(x0)
A = [-2 3]; b = 6;
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1)
fval = -fval  



%% 例题二的求解
x0 = [1 1 1];  %任意给定一个初始值 
lb = [0 0 0];  % 决策变量的下界
[x,fval] = fmincon(@fun2,x0,[],[],[],[],lb,[],@nonlfun2)  % 注意 fun2.m文件和nonfun2.m文件都必须在当前文件夹目录下
% x =
%          0.552167405729277          1.20325915507969         0.947824046150443
% fval =
%           10.6510918606939



%% 使用蒙特卡罗的方法来找初始值(推荐）
clc,clear;
n=1000000; %生成的随机数组数
x1= unifrnd(0,2,n,1);   % 生成在[0,2]之间均匀分布的随机数组成的n行1列的向量构成x1
x2 = sqrt(2-x1);  % 根据非线性等式约束用x1计算出x2
x3 = sqrt((3-x2)/2); % 根据非线性等式约束用x2计算出x3
fmin=+inf; % 初始化函数f的最小值为正无穷（后续只要找到一个比它小的我们就对其更新）
for i=1:n
    x = [x1(i), x2(i), x3(i)];  %构造x向量, 这里千万别写成了：x =[x1, x2, x3]
    if (-x(1)^2+x(2)-x(3)^2<=0) & (x(1)+x(2)^2+x(3)^2-20<=0)   % 判断是否满足条件
        result =sum(x.*x) + 8 ;  % 如果满足条件就计算函数值
        if  result  < fmin  % 如果这个函数值小于我们之前计算出来的最小值
            fmin = result;  % 那么就更新这个函数值为新的最小值
            x0 = x;  % 并且将此时的x1 x2 x3更新为初始值
        end
    end
end
disp('蒙特卡罗选取的初始值为：'); disp(x0)
lb = [0 0 0];  % 决策变量的下界
[x,fval] = fmincon(@fun2,x0,[],[],[],[],lb,[],@nonlfun2)  % 注意 fun2.m文件和nonfun2.m文件都必须在当前文件夹目录下

%% 例题三的求解(蒙特卡罗模拟那一讲的例题)
clear;clc
% 蒙特卡罗模拟得到的最大值为3445.6014
% 最大值处x1 x2 x3的取值为：
%           22.5823101903968          12.5823101903968          12.1265223966757
A = [1 -2 -2;  1 2 2];  b = [0 72];
x0 = [ 22.58   12.58  12.13];
Aeq = [1 -1 0]; beq = 10;
lb = [-inf 10 -inf];  ub = [inf 20 inf];  
[x,fval] = fmincon(@fun3,x0,A,b,Aeq,beq,lb,ub,[])  % 注意没有非线性约束，所以这里可以用[]替代，或者干脆不写
fval = -fval



% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）