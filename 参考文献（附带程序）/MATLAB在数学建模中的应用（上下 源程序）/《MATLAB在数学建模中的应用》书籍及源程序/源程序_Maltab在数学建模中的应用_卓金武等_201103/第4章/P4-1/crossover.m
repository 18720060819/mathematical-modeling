%�ӳ�������Ⱥ�������,�������ƴ洢Ϊcrossover.m
function scro=crossover(population,seln,pc);
BitLength=size(population,2);
pcc=IfCroIfMut(pc);  %���ݽ�����ʾ����Ƿ���н��������1���ǣ�0���
if pcc==1
   chb=round(rand*(BitLength-2))+1;  %��[1,BitLength-1]��Χ���������һ������λ
   scro(1,:)=[population(seln(1),1:chb) population(seln(2),chb+1:BitLength)];
   scro(2,:)=[population(seln(2),1:chb) population(seln(1),chb+1:BitLength)];
else
   scro(1,:)=population(seln(1),:);
   scro(2,:)=population(seln(2),:);
end  