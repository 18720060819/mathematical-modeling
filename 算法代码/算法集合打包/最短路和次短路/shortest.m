%function p=shortest(startp,endp,Cost)
function p=shortest(startp,endp,Cost)
CrossPointNo=length(Cost);
[a b]=Shortest_Djk(Cost,CrossPointNo,startp);
%getpath������ʾ��������ʼ��֮������·��·��
%���У�a,bΪShortest_Djk()�ķ���ֵ
  p=getpath(a,b,startp,endp)
  fprintf('·������:%f',a(endp));
  fprintf('\n');
