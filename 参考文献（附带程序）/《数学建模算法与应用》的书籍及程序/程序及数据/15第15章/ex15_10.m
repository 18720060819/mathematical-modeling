clc,clear
format rat  %���ݸ�ʽ���������
fid=fopen('msdata.txt','r');
a=[];
while (~feof(fid))
    a=[a fgetl(fid)];  %�������ַ������ӳ�һ�����ַ���������
end
for i=0:1
    for j=0:1
        s=[int2str(i),int2str(j)]; %�������ַ�����ij��
        f(i+1,j+1)=length(findstr(s,a));  %�����Ӵ���ij���ĸ���
    end
end
fs=sum(f,2);  %��f������к�
f=f./repmat(fs,1,size(f,2))  %��״̬ת��Ƶ��
