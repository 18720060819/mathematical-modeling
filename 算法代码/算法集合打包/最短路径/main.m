%%ʹ�ñ�����������Ҫ�����ڽӾ���Cost(i,j),
%%Ȼ�����ShortestPath_Djk()������·������PrintPath()
%%��·����ӡ������


%����ShortestPath_Djk()��PrintPath() ���������·����ʾ��·��
%aΪ��CrossPointNo��ά���������CrossPointNo=6
%��Ϊ6ά���������У�a(i)��ʾ��i�����ʼ��S֮��ľ��롣
%bΪ�㷨���������У�һ���ڵ�����ʼ��ľ��뱻�Ǹ��ڵ���µģ�
%���b(i)=j,��ʾ��i����������j�ڵ��޸�.
[a b]=ShortestPath_Djk(Cost,CrossPointNo,s);
%����PrintPath����ʾ��������ʼ��֮������·��·��
%���У�a,bΪShortestPath_Djk()�ķ���ֵ
   PrintPath(a,b,s,e);
  fprintf('·������:%f',a(e));
  fprintf('\n');
