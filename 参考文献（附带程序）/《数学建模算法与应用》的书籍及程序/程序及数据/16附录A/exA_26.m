a=[2 -2 0; -2 4 0; 0 0 5];
b=eig(a);
if all(b>0)
    fprintf('����������\n');
else
    fprintf('�����ͷ�����\n');
end
[c,d]=eig(a)   %cΪ�����任�ı任����
