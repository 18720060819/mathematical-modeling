function [posit_x] = Mid2Max(x,best)
    M = max(abs(x-best));
    posit_x = 1 - abs(x-best) / M;
end


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 更多优质数模资料可在我的微店获取：https://weidian.com/?userid=1372657210
% % 关注我的微信公众号：《数学建模学习交流》，发送软件、数据等关键词，可获得相应的资料
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）