clear all;

%<----------------------------!����BP�������ͼ�����--------------------------->
%��������10,��ң��ͼ��ı���
I=imread('10.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
%��ʼ������ʸ��P�����ʸ��T
P=[];
T=[];
P=[R;G;B];
T=[0;0;0];
[m n]=size(P);
T=concur(T,n);

%��������ͼ��0
I=imread('0.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.1;0.3;0.5];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��1
I=imread('1.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.2;0.4;0.6];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��2
I=imread('2.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.3;0.2;0.7];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��3
I=imread('3.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.4;0.4;0.7];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��4
I=imread('4.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.5;0.5;0.4];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��5
I=imread('5.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.6;0.9;0.2];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��6
I=imread('6.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.7;0.2;0.8];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��7
I=imread('7.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.8;0.3;0.5];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��8
I=imread('8.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[0.9;0.2;0.1];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%��������ͼ��9
I=imread('9.jpg');
%������ͼ��ά����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
P1=[R;G;B];
T1=[1;0.5;0.6];
P=[P,P1];
[m n]=size(P1);
T1=concur(T1,n);
T=[T,T1];

%����һ��ǰ��������
net=newff(minmax(P),[5,3],{'logsig','purelin'},'traingdx');
%����ѵ������
net.trainParam.show=50;
net.trainParam.epochs=1000;   %���ѵ������Ϊ1000
net.trainParam.goal=0.001;
net=init(net);
%��BP�������ѵ��
net=train(net,P,T);

for j=1:2
    if j==1
        var=input('�Ƿ��2000�������̲ң��Ӱ����з��ࣨ��:����1 ����:����2��');
    elseif j==2
        var=input('�Ƿ��2003�������̲ң��Ӱ����з��ࣨ��:����1 ����:����2��');
    end

%���������ң��ͼ��
if var==1
    if j==1 
    I=imread('tm2000mask.jpg');
    elseif j==2
    I=imread('tm2003mask.jpg');
    end
  %����ɫͼ��ά
  R=I(:,:,1);
  G=I(:,:,2);
  B=I(:,:,3);
  %���Ҷ�ֵ��һ������
  R=im2double(R);
  G=im2double(G);
  B=im2double(B);
  [M,N]=size(R);
  R=reshape(R',[1 M*N]);
  G=reshape(G',[1 M*N]);
  B=reshape(B',[1 M*N]);
  p=[R;G;B];
  %��BP������з���
  Y=sim(net,p);
  R=Y(1,:);
  X=R;              
  classR=[];    
  for i=0:(M-1)
      classR=[classR;R((i*N+1):(i*N+N))];
  end
  G=Y(2,:);
  classG=[];
  for i=0:(M-1)
      classG=[classG;G((i*N+1):(i*N+N))];
  end
  B=Y(3,:);
  classB=[];
  for i=0:(M-1)
      classB=[classB;B((i*N+1):(i*N+N))];
  end

  R=abs(classR)*255;
  R=uint8(R);
  G=abs(classG)*255;
  G=uint8(G);
  B=abs(classB)*255;
  B=uint8(B);
  classify=cat(3,R,G,B);
  figure,imshow(classify);
  if j==1
      title('2000�������̲ң��ͼ�����ͼ');
  elseif j==2
      title('2003�������̲ң��ͼ�����ͼ');
  end

  %�������������
  X=abs(X)*255;
  [M,N]=size(X);
  t10=0;t0=0;t1=0;t2=0;t3=0;t4=0;t5=0;t6=0;t7=0;t8=0;t9=0;

  for i=1:N
      if X(1,i)==0
          t10=t10+1;
      elseif X(1,i)<26
          t0=t0+1;
      elseif X(1,i)<52
          t1=t1+1;
      elseif X(1,i)<=76
          t2=t2+1;
      elseif X(1,i)<=102
          t3=t3+1;
      elseif X(1,i)<=127
          t4=t4+1;
      elseif X(1,i)<=153
          t5=t5+1;
      elseif X(1,i)<=178
          t6=t6+1;
      elseif X(1,i)<204
          t7=t7+1;
      elseif X(1,i)<=229
          t8=t8+1;
      else t9=t9+1;
      end
  end
  
  var=input('�Ƿ��Ա�״ͼ��ʾ�������(��:����1 ,��:����2)');
  if var==1
  %���Ƶ��������״ͼ
  t=[t0,t1,t2,t3,t4,t5,t6,t7,t8,t9];
  figure;
  pie(t);
  legend('��ˮ','ũ��','���ֵ�','����','��ֳ��','«έ','�����ײ�','������ˑ��','��̲','δ���õ�',-1);            %��עͼ��
  end
  
  var=input('�Ƿ���ֱ��ͼ��ʾ�������(��:����1 ,��:����2 )');
  if var==1
  %���Ƶ��������״ͼ
  y=[t0,t1,t2,t3,t4,t5,t6,t7,t8,t9];  
  x=1:10;
  figure;
  bar(x,y);colormap summer;         %������״ͼ�ҷ���ͼ�ξ��
  end
end
end

var=input('�Ƿ��2005��ң��ͼ�����Ԥ��(�ǣ�����1 ������2)');
if var==1
%<----------------------------!����2000���2003��ͼ��Ԥ��2005��ͼ��------------------>
%����2000��ң������
I=imread('tm2000mask.jpg');
%��ͼ�����ݽ�ά
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
%��ʼ����������
P=[];
P=[R;G;B];

%��ʼ���������
%����2003��ң������
I=imread('tm2003mask.jpg');
%��ͼ�����ݽ�ά
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%�Ҷ�ֵ��һ��
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
T=[];
T=[R;G;B];

%����һ��ǰ��������
net=newff(minmax(P),[5 3],{'logsig','purelin'},'traingdx');
%����ѵ������
net.trainParam.show=50;
net.trainParam.epochs=1000;
net.trainParam.goal=0.001;
%��BP�������ѵ��
net=train(net,P,T);

%Ԥ��2005��ң��ͼ��
%��BP������з���
Y=sim(net,T);
  R=Y(1,:);              
  R2005=[];    
  for i=0:(M-1)
      R2005=[R2005;R((i*N+1):(i*N+N))];
  end
  G=Y(2,:);
  G2005=[];
  for i=0:(M-1)
      G2005=[G2005;G((i*N+1):(i*N+N))];
  end
  B=Y(3,:);
  B2005=[];
  for i=0:(M-1)
      B2005=[B2005;B((i*N+1):(i*N+N))];
  end
  
  R=abs(R2005)*255;
  R=uint8(R);
  G=abs(G2005)*255;
  G=uint8(G);
  B=abs(B2005)*255;
  B=uint8(B);
  T2005=cat(3,R,G,B);
  figure;imshow(T2005);
end








