%�ӳ�������Ⱥ����������������ƴ洢Ϊmutation.m
function snnew=mutation(snew,pmutation);
BitLength=size(snew,2);
snnew=snew;
pmm=IfCroIfMut(pmutation);  %���ݱ�����ʾ����Ƿ���б��������1���ǣ�0���
if pmm==1
   chb=round(rand*(BitLength-1))+1;  %��[1,BitLength]��Χ���������һ������λ
   snnew(chb)=abs(snew(chb)-1);
end   