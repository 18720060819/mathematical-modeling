%��д J�����������
J=zeros(720,6);
N=6;y=1;
for m=1:N
   a(m)=m
end
p=0;p=p+1;
for m=1:N
   J(p,m)=a(m)
end
x=0
y=y+1
exchange
while x~=0
   p=p+1
   for m=1:N
      J(p,m)=a(m)
   end 
   x=0
   y=y+1
   exchange
end%�õ���һ��720*6��ȫ���о���
