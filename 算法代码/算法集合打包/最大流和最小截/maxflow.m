%function [f,s]=maxflow(startp,endp,c)
%cΪ��������
%�������������д��һ��˵��
%�������з����ԣ����绡(i,j)������Ϊ10����(j,i)Ϊ0
%�����������жԳ���
function [f,s]=maxflow(startp,endp,c)
n=length(c);
f=zeros(size(c));
l=zeros(1,n);d=zeros(1,n);examine=zeros(1,n);
l(startp)=0.5;d(startp)=inf;
while 1
    ifexam=0;ifl=0;
    for i=1:n
        if l(i)~=0
            ifl=ifl+1;
            if examine(i)==1
                ifexam=ifexam+1;
            end
        end
    end
    if ifl==ifexam
        break;
    end
    for i=1:n
        if l(i)~=0&examine(i)==0
            break;
        end
    end
    for j=1:n
        if c(i,j)~=0
            if f(i,j)<c(i,j)&l(j)==0
                l(j)=i;
                d(j)=min(d(i),c(i,j)-f(i,j));
            end
        end
        if c(j,i)~=0
            if f(j,i)>0&l(j)==0
                
                l(j)=-i;
                d(j)=min(d(i),f(i,j));
            end
        end
    end
    examine(i)=1;
    if l(endp)~=0
        j=endp;
        while 1
            if l(j)~=0.5
                if l(j)>0
                    i=l(j);
                    f(i,j)=f(i,j)+d(endp);
                    j=i;
                end
                if l(j)<0
                    i=-l(j);
                    f(j,i)=f(j,i)-d(endp);
                    j=i;
                end
            else
                l=zeros(1,n);break;
            end
        end
        l(startp)=0.5;d(startp)=inf;examine=zeros(1,n);
    end
end
s=[];ns=0;
for i=1:n
    if l(i)~=0
        ns=ns+1;
        s(ns)=i;
    end
end
fprintf('fΪ��������\n');
fprintf('ͼ����С�ػ��ֵõ���һ���Ӽ�sΪ��\n');
disp(s);

    