%����һ��N(0,1)��̬�ֲ������
%����ɸѡ�������Ƚϸ�
%���������ɲ��ġ��ִ�Ӧ����ѧ�ֲ�--����ͳ����������̾��廪��ѧ��������������
%function y=riddling()
function y=riddling()
sign=0;
while 1
    x=rand(1,2);
    v1=2*x(1)-1;v2=2*x(2)-1;
    s=v1^2+v2^2;
    if s<=1
        a=sqrt(-2*log(s)/s);
        y=v1*a;
        sign=1;
    end
    if sign==1
        break;
    end
end
