clc, clear, format rat
a=[4  3  2  1  4  3  1  1  2  3 
   2  1  2  3  4  4  3  3  1  1
   1  3  3  2  1  2  2  2  4  4
   2  3  2  3  1  1  2  4  3  1];
a=a'; a=a(:)'; %�Ѿ���a����չ����һ��������
for i=1:4
   for j=1:4
      f(i,j)=length(findstr([i j],a)); %ͳ���Ӵ���ij���ĸ���
   end
end
ni=sum(f,2);  %�������f���к�
phat=f./repmat(ni,1,size(f,2))  %��״̬ת�Ƶ�Ƶ��
format %�ָ�����С������ʾ��ʽ