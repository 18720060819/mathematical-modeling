rand('state',sum(clock));  %��ʼ�������������
p0=0;
tic    %��ʱ��ʼ
for i=1:10^6
   x=randint(1,5,[1,99]); %����һ�����е�����[1,99]�ϵ��������
   [f,g]=mengte(x);
   if all(g<=0)
       if p0<f
           x0=x; p0=f; %��¼�µ�ǰ�ϺõĽ�
       end
   end
end
x0,p0
toc    %��ʱ����
