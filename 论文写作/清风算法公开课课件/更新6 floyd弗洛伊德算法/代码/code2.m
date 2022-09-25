% 思考题的参考答案
%% 首先将图转换为权重邻接矩阵D
n = 9;  %一共九个节点
D = zeros(n);  % 全部元素初始化为0, 等会你们就知道为什么这样设置啦
% 因为是无向图，所以权重邻接矩阵是一个对称矩阵
D(1,2) = 4; D(1,8) = 8; 
D(2,8) = 3; D(2,3) = 8;
D(8,9) = 1; D(8,7) = 6; 
D(9,7) = 6; D(9,3) = 2;
D(7,6) = 2; D(3,4) = 7; 
D(3,6) = 4; D(6,4) = 14;
D(4,5) = 9; D(6,5) = 10;
D = D+D';   % 这个操作可以得到对称矩阵的另一半
for i = 1:n
    for j = 1:n
        if (i ~= j) && (D(i,j) == 0)  
            D(i,j) = Inf;   % 将非主对角线上的0元素全部变为Inf
        end
    end
end

%% 调用Floyd_algorithm函数求解
[dist,path] = Floyd_algorithm(D)


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）