clc,clear
yt=load('ranliao.txt'); %ʵ��ȼ���������������������ķ�ʽ����ڴ��ı��ļ���
n=length(yt); alpha=0.4; 
dyt=diff(yt); %��yt��һ����ǰ���
dyt=[0;dyt]; %����ʹ�õ���һ������֣��ӡ�0����λ
dyhat(2)=dyt(2); %ָ��ƽ��ֵ�ĳ�ʼֵ
for i=2:n
    dyhat(i+1)=alpha*dyt(i)+(1-alpha)*dyhat(i);
end
for i=1:n
    yhat(i+1)=dyhat(i+1)+yt(i);  
end
yhat
xlswrite('ranliao.xls',[yt,dyt]) 
xlswrite('ranliao.xls',[dyhat',yhat'],'Sheet1','C1')
