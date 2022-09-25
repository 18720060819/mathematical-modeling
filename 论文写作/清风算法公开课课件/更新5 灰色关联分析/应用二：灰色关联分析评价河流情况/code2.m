%% 灰色关联分析用于综合评价模型例题的讲解
clear;clc
load data_water_quality.mat
% 不会导入数据的同学可以看看第二讲topsis模型，我们也可以自己在工作区新建变量，并把Excel的数据粘贴过来
% 注意Matlab的当前文件夹一定要切换到有数据文件的这个文件夹内

%%  判断是否需要正向化
[n,m] = size(X);
disp(['共有' num2str(n) '个评价对象, ' num2str(m) '个评价指标']) 
Judge = input(['这' num2str(m) '个指标是否需要经过正向化处理，需要请输入1 ，不需要输入0：  ']);   %1

if Judge == 1
    Position = input('请输入需要正向化处理的指标所在的列，例如第2、3、6三列需要处理，那么你需要输入[2,3,6]： '); %[2,3,4]
    disp('请输入需要处理的这些列的指  标类型（1：极小型， 2：中间型， 3：区间型） ')
    Type = input('例如：第2列是极小型，第3列是区间型，第6列是中间型，就输入[1,3,2]：  '); %[2,1,3]
    % 注意，Position和Type是两个同维度的行向量
    for i = 1 : size(Position,2)  %这里需要对这些列分别处理，因此我们需要知道一共要处理的次数，即循环的次数
        X(:,Position(i)) = Positivization(X(:,Position(i)),Type(i),Position(i));
    % Positivization是我们自己定义的函数，其作用是进行正向化，其一共接收三个参数
    % 第一个参数是要正向化处理的那一列向量 X(:,Position(i))   回顾上一讲的知识，X(:,n)表示取第n列的全部元素
    % 第二个参数是对应的这一列的指标类型（1：极小型， 2：中间型， 3：区间型）
    % 第三个参数是告诉函数我们正在处理的是原始矩阵中的哪一列
    % 该函数有一个返回值，它返回正向化之后的指标，我们可以将其直接赋值给我们原始要处理的那一列向量
    end
    disp('正向化后的矩阵 X =  ')
    disp(X)
end

%% 对正向化后的矩阵进行预处理
Mean = mean(X);  % 求出每一列的均值以供后续的数据预处理
Z = X ./ repmat(Mean,size(X,1),1);  
disp('预处理后的矩阵为：'); disp(Z)

%% 构造母序列和子序列
Y = max(Z,[],2);  % 母序列为虚拟的，用每一行的最大值构成的列向量表示母序列
X = Z; % 子序列就是预处理后的数据矩阵

%% 计算得分
absX0_Xi = abs(X - repmat(Y,1,size(X,2)))  % 计算|X0-Xi|矩阵
a = min(min(absX0_Xi))    % 计算两级最小差a
b = max(max(absX0_Xi))  % 计算两级最大差b
rho = 0.5; % 分辨系数取0.5
gamma = (a+rho*b) ./ (absX0_Xi  + rho*b)  % 计算子序列中各个指标与母序列的关联系数
weight = mean(gamma) / sum(mean(gamma));  % 利用子序列中各个指标的灰色关联度计算权重
score = sum(X .* repmat(weight,size(X,1),1),2);   % 未归一化的得分
stand_S = score / sum(score);   % 归一化后的得分
[sorted_S,index] = sort(stand_S ,'descend') % 进行排序





% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 更多优质数模资料可在我的微店获取：https://weidian.com/?userid=1372657210
% % 关注我的微信公众号：《数学建模学习交流》，发送软件、数据等关键词，可获得相应的资料
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）