clear;clc
load 'physical fitness test.mat'  %文件名如果有空格隔开，那么需要加引号
% https://ww2.mathworks.cn/help/matlab/ref/corrcoef.html
%% 统计描述
MIN = min(Test);  % 每一列的最小值
MAX = max(Test);   % 每一列的最大值
MEAN = mean(Test);  % 每一列的均值
MEDIAN = median(Test);  %每一列的中位数
SKEWNESS = skewness(Test); %每一列的偏度
KURTOSIS = kurtosis(Test);  %每一列的峰度
STD = std(Test);  % 每一列的标准差
RESULT = [MIN;MAX;MEAN;MEDIAN;SKEWNESS;KURTOSIS;STD]  %将这些统计量放到一个矩阵中中表示


%% 计算各列之间的相关系数
% 在计算皮尔逊相关系数之前,一定要做出散点图来看两组变量之间是否有线性关系
% 这里使用Spss比较方便: 图形 - 旧对话框 - 散点图/点图 - 矩阵散点图

R = corrcoef(Test)   % correlation coefficient


%% 假设检验部分
x = -4:0.1:4;
y = tpdf(x,28);  %求t分布的概率密度值 28是自由度  
figure(1)
plot(x,y,'-')
grid on  % 在画出的图上加上网格线
hold on  % 保留原来的图，以便继续在上面操作
% matlab可以求出临界值，函数如下
tinv(0.975,28)    %    2.0484
% 这个函数是累积密度函数cdf的反函数
plot([-2.048,-2.048],[0,tpdf(-2.048,28)],'r-')
plot([2.048,2.048],[0,tpdf(2.048,28)],'r-')


%% 计算p值
x = -4:0.1:4;
y = tpdf(x,28);
figure(2)
plot(x,y,'-')
grid on 
hold on
% 画线段的方法
plot([-3.055,-3.055],[0,tpdf(-3.055,28)],'r-')
plot([3.055,3.055],[0,tpdf(3.055,28)],'r-')
disp('该检验值对应的p值为：')
disp((1-tcdf(3.055,28))*2)  %双侧检验的p值要乘以2

%% 计算各列之间的相关系数以及p值
[R,P] = corrcoef(Test)
% 在EXCEL表格中给数据右上角标上显著性符号吧
P < 0.01  % 标记3颗星的位置
(P < 0.05) .* (P > 0.01)  % 标记2颗星的位置
(P < 0.1) .* (P > 0.05) % % 标记1颗星的位置
% 也可以使用Spss操作哦 看我演示

%% 正态分布检验
% 正态分布的偏度和峰度
x = normrnd(2,3,100,1);   % 生成100*1的随机向量，每个元素是均值为2，标准差为3的正态分布
skewness(x)  %偏度
kurtosis(x)  %峰度
qqplot(x)
    
% 检验第一列数据是否为正态分布
[h,p] = jbtest(Test(:,1),0.05)
[h,p] = jbtest(Test(:,1),0.01)

% 用循环检验所有列的数据
n_c = size(Test,2);  % number of column 数据的列数
H = zeros(1,6);  % 初始化节省时间和消耗
P = zeros(1,6);
for i = 1:n_c
    [h,p] = jbtest(Test(:,i),0.05);
    H(i)=h;
    P(i)=p;
end
disp(H)
disp(P)

% Q-Q图
qqplot(Test(:,1))

%% 斯皮尔曼相关系数
X = [3 8 4 7 2]'  % 一定要是列向量哦，一撇'表示求转置
Y = [5 10 9 10 6]'
% 第一种计算方法
1-6*(1+0.25+0.25+1)/5/24

% 第二种计算方法
coeff = corr(X , Y , 'type' , 'Spearman')
% 等价于：
RX = [2 5 3 4 1]
RY = [1 4.5 3 4.5 2]
R = corrcoef(RX,RY)

% 计算矩阵各列的斯皮尔曼相关系数
R = corr(Test, 'type' , 'Spearman')

% 大样本下的假设检验
% 计算检验值
disp(sqrt(590)*0.0301)
% 计算p值
disp((1-normcdf(0.7311))*2) % normcdf用来计算标准正态分布的累积概率密度函数

% 直接给出相关系数和p值
[R,P]=corr(Test, 'type' , 'Spearman')

% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）