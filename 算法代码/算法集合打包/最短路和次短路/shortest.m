%function p=shortest(startp,endp,Cost)
function p=shortest(startp,endp,Cost)
CrossPointNo=length(Cost);
[a b]=Shortest_Djk(Cost,CrossPointNo,startp);
%getpath用来显示各点与起始点之间的最短路的路径
%其中，a,b为Shortest_Djk()的返回值
  p=getpath(a,b,startp,endp)
  fprintf('路径长度:%f',a(endp));
  fprintf('\n');
