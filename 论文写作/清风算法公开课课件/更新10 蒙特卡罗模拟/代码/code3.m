%%  蒙特卡罗模拟排队问题

%% （1）预备知识
% normrnd(MU,SIGMA):生成一个服从正态分布(MU参数代表均值,SIGMA参数代表标准差,方差开根号是标准差)的随机数
normrnd(10,2)  % 均值为10 标准差为2（方差为4）的正态分布随机数
% exprnd(M)表示生成一个均值为M的指数分布随机数(其对应的参数为1/M)
exprnd(5)  % 均值为5的指数分布随机数（对应的参数为0.2）
% mean函数是用来求解均值的函数（第一期视频第五讲）
mean([1,2,3])
% tic函数和toc函数可以用来返回代码运行的时间，例如我们要计算一段代码的运行时间，就可以在这段代码前加上tic，在这段代码后加上toc (我的微信公众号"数学建模学习交流"中有一篇推送《为什么要对代码初始化》中使用过这对函数)
tic
a = 2^100
toc

%% （2）模型中出现的变量的说明
% x(i)表示第i-1个客户和第i个客户到达的间隔时间，服从参数为0.1的指数分布
% y(i)表示第i个客户的服务持续时间，服从均值为10方差为4(标准差为2)的正态分布 (若小于1则按1计算)
% c(i)表示第i个客户的到达时间，那么c(i) = c(i-1) + x(i)，初始值c0=0
% b(i)表示第i个客户开始服务的时间
% e(i)表示第i个客户结束服务的时间，初始值e0=0
% 第i个客户结束服务的时间 = 第i个客户开始服务的时间 + 第i个客户的服务持续时间
% 即：e(i) = b(i) + y(i）
% 第i个客户开始服务的时间取决于该客户的到达时间和上一个客户结束服务的时间
% 即：b(i) = max(c(i),e(i-1))，初始值b1=c1;
% 第i个客户等待的时间 = 第i个客户开始服务的时间 - 第i个客户到达银行的时间
% 即：wait(i) = b(i) - c(i)
% w表示所有客户等待时间的总和
% 假设一天内银行最终服务了n个顾客，那么客户的平均等待时间t = w/n

%% （3）问题1的代码
clear
tic  %计算tic和toc中间部分的代码的运行时间
i = 1;  % i表示第i个客户，最开始取i=1
w = 0;  % w用来表示所有客户等待的总时间，初始化为0
e0 = 0;  c0 = 0;   % 初始化e0和c0为0
x(1) = exprnd(10);  % 第0个客户(假想的)和第1个客户到达的时间间隔
c(1) = c0 + x(1);  % 第1个客户到达的时间
b(1) = c(1); % 第1个客户的开始服务的时间
while b(i) <= 480  % 开始设置循环，只要第i个顾客开始服务的时间(时刻)小于480，就可以对其服务（银行每天工作8小时，折换为分钟就是480分钟）
    y(i) = normrnd(10,2); % 第i个客户的服务持续时间，服从均值为10方差为4(标准差为2)的正态分布
    if y(i) < 1  % 根据题目的意思：若服务持续时间不足一分钟，则按照一分钟计算
        y(i) = 1;
    end
    e(i) = b(i) + y(i); % 第i个客户结束服务的时间 = 第i个客户开始服务的时间 + 第i个客户的服务持续时间
    wait(i) = b(i) - c(i); % 第i个客户等待的时间 = 第i个客户开始服务的时间 - 第i个客户到达银行的时间
    w = w + wait(i); % 更新所有客户等待的总时间
    i = i + 1; % 增加一名新的客户
    x(i) = exprnd(10); % 这位新客户和上一个客户到达的时间间隔
    c(i) = c(i-1) + x(i); % 这位新客户到达银行的时间 = 上一个客户到达银行的时间 + 这位新客户和上一个客户到达的时间间隔
    b(i) = max(c(i),e(i-1)); % 这个新客户开始服务的时间取决于其到达时间和上一个客户结束服务的时间
end
n = i-1; % n表示银行一天8小时一共服务的客户人数
t = w/n; % 客户的平均等待时间
disp(['银行一天8小时一共服务的客户人数为: ',num2str(n)])
disp(['客户的平均等待时间为: ',num2str(t)])
toc  %计算tic和toc中间部分的代码的运行时间

%% （4）问题2的代码
clear
tic  %计算tic和toc中间部分的代码的运行时间
day = 100;  % 假设模拟100天
n = zeros(day,1); % 初始化用来保存每日接待客户数结果的矩阵
t = zeros(day,1); % 初始化用来保存每日客户平均等待时长的矩阵
for k = 1:day
    i = 1;  % i表示第i个客户，最开始取i=1
    w = 0;  % w用来表示所有客户等待的总时间，初始化为0
    e0 = 0;  c0 = 0;   % 初始化e0和c0为0
    x(1) = exprnd(10);  % 第0个客户(假想的)和第1个客户到达的时间间隔
    c(1) = c0 + x(1);  % 第1个客户到达的时间
    b(1) = c(1); % 第1个客户的开始服务的时间
    while b(i) <= 480  % 开始设置循环，只要第i个顾客开始服务的时间(时刻)小于480，就可以对其服务（银行每天工作8小时，折换为分钟就是480分钟）
        y(i) = normrnd(10,2); % 第i个客户的服务持续时间，服从均值为10方差为4(标准差为2)的正态分布
        if y(i) < 1  % 根据题目的意思：若服务持续时间不足一分钟，则按照一分钟计算
            y(i) = 1;
        end
        e(i) = b(i) + y(i); % 第i个客户结束服务的时间 = 第i个客户开始服务的时间 + 第i个客户的服务持续时间
        wait(i) = b(i) - c(i); % 第i个客户等待的时间 = 第i个客户开始服务的时间 - 第i个客户到达银行的时间
        w = w + wait(i); % 更新所有客户等待的总时间
        i = i + 1; % 增加一名新的客户
        x(i) = exprnd(10); % 这位新客户和上一个客户到达的时间间隔
        c(i) = c(i-1) + x(i); % 这位新客户到达银行的时间 = 上一个客户到达银行的时间 + 这位新客户和上一个客户到达的时间间隔
        b(i) = max(c(i),e(i-1)); % 这个新客户开始服务的时间取决于其到达时间和上一个客户结束服务的时间
    end
    n(k) = i-1; % n(k)表示银行第k天服务的客户人数
    t(k) = w/n(k); % t(k)表示该银行第k天客户的平均等待时间
end
disp([num2str(day),'个工作日中，银行每日平均服务的客户人数为: ',num2str(mean(n))])
disp([num2str(day),'个工作日中，银行每日客户的平均等待时间为: ',num2str(mean(t))])
toc  %计算tic和toc中间部分的代码的运行时间




% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）