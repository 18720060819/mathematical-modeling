function [mydistance,mypath]=mydijkstra(a,sb,db);
% ���룺a���ڽӾ���a��i��j)��ָi��j֮��ľ��룬�����������
% sb�����ı��, db���յ�ı��
% �����mydistance�����·�ľ���, mypath�����·��·��
n=size(a,1); visited(1:n) = 0;
distance(1:n) = inf; distance(sb) = 0; %��㵽���������ĳ�ʼ��
visited(sb)=1; u=sb;  %uΪ���µ�P��Ŷ���
parent(1:n) = 0; %ǰ������ĳ�ʼ��
for i = 1: n-1
     id=find(visited==0); %����δ��ŵĶ���
     for v = id           
         if  a(u, v) + distance(u) < distance(v)
             distance(v) = distance(u) + a(u, v);  %�޸ı��ֵ 
             parent(v) = u;                                    
         end            
     end
     temp=distance;
     temp(visited==1)=inf;  %�ѱ�ŵ�ľ��뻻������
     [t, u] = min(temp);  %�ұ��ֵ��С�Ķ��� 
     visited(u) = 1;       %����Ѿ���ŵĶ���
 end
mypath = [];
if parent(db) ~= 0   %�������·!
    t = db; mypath = [db];
    while t ~= sb
        p = parent(t);
        mypath = [p mypath];
        t = p;      
    end
end
mydistance = distance(db);
