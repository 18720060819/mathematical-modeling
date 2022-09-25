%% 生产决策问题
format long g   %可以将Matlab的计算结果显示为一般的长数字格式（默认会保留四位小数，或使用科学计数法）
% (1) 系数向量
c = zeros(9,1); % 初始化目标函数的系数向量全为0
c(1) = 1.25 -0.25 -300/6000*5;  % x1前面的系数是c1
c(2) = 1.25 -0.25 -321/10000*7;
c(3) = -250 / 4000 * 6;
c(4)  = -783/7000*4;
c(5) = -200/4000 * 7;
c(6) = -300/6000*10;
c(7) = -321 / 10000 * 9;
c(8) = 2-0.35-250/4000*8;
c(9) = 2.8-0.5-321/10000*12-783/7000*11;
c = -c;  % 我们求的是最大值，所以这里需要改变符号
% (2) 不等式约束
A = zeros(5,9);
A(1,1) = 5;  A(1,6) = 10;
A(2,2) = 7;  A(2,7) = 9; A(2,9) = 12;
A(3,3) = 6;  A(3,8) = 8;
A(4,4) = 4;  A(4,9) = 11;
A(5,5) = 7;  
b = [6000 10000 4000 7000 4000]';
% (3) 等式约束
Aeq = [1 1 -1 -1 -1 0 0 0 0;
            0 0 0 0 0 1 1 -1 0];
beq = [0 0]';
%（4）上下界
lb = zeros(9,1);

% 进行求解
[x fval] = linprog(c, A, b, Aeq, beq, lb)
fval = -fval
% fval =
%           1146.56650246305
%  注意，本题应该是一个整数规划的例子，我们在后面的整数规划部分再来重新求解。
intcon = 1:9;
[x,fval]=intlinprog(c,intcon,A,b,Aeq,beq,lb)
fval = -fval



% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）