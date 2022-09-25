function [posit_x] = Inter2Max(x,a,b)
    r_x = size(x,1);  % row of x 
    M = max([a-min(x),max(x)-b]);
    posit_x = zeros(r_x,1);   %zeros�����÷�: zeros(3)  zeros(3,1)  ones(3)
    % ��ʼ��posit_xȫΪ0  ��ʼ����Ŀ���ǽ�ʡ����ʱ��
    for i = 1: r_x
        if x(i) < a
           posit_x(i) = 1-(a-x(i))/M;
        elseif x(i) > b
           posit_x(i) = 1-(x(i)-b)/M;
        else
           posit_x(i) = 1;
        end
    end
end


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ������
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ
% % ����������ģ���Ͽ����ҵ�΢���ȡ��https://weidian.com/?userid=1372657210
% % ��ע�ҵ�΢�Ź��ںţ�����ѧ��ģѧϰ��������������������ݵȹؼ��ʣ��ɻ����Ӧ������
% % ����޸Ĵ��������صķ�����https://www.bilibili.com/video/av59423231���ؿ���