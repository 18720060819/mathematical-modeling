clear all;

%<----------------------------!运用BP网络进行图像分类--------------------------->
%读入样本10,即遥感图像的背景
I=imread('10.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
%初始化输入矢量P和输出矢量T
P=[];
T=[];
P=[R;G;B];
T=[0;0;0];
[m n]=size(P);
T=concur(T,n);

%读入样本图像0
I=imread('0.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像1
I=imread('1.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像2
I=imread('2.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像3
I=imread('3.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像4
I=imread('4.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像5
I=imread('5.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像6
I=imread('6.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像7
I=imread('7.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像8
I=imread('8.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%读入样本图像9
I=imread('9.jpg');
%将样本图像降维处理
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
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

%创建一个前向神经网络
net=newff(minmax(P),[5,3],{'logsig','purelin'},'traingdx');
%设置训练参数
net.trainParam.show=50;
net.trainParam.epochs=1000;   %最大训练步数为1000
net.trainParam.goal=0.001;
net=init(net);
%对BP网络进行训练
net=train(net,P,T);

for j=1:2
    if j==1
        var=input('是否对2000年崇明东滩遥感影像进行分类（是:输入1 ，否:输入2）');
    elseif j==2
        var=input('是否对2003年崇明东滩遥感影像进行分类（是:输入1 ，否:输入2）');
    end

%读入待分类遥感图像
if var==1
    if j==1 
    I=imread('tm2000mask.jpg');
    elseif j==2
    I=imread('tm2003mask.jpg');
    end
  %将彩色图像降维
  R=I(:,:,1);
  G=I(:,:,2);
  B=I(:,:,3);
  %将灰度值归一化处理
  R=im2double(R);
  G=im2double(G);
  B=im2double(B);
  [M,N]=size(R);
  R=reshape(R',[1 M*N]);
  G=reshape(G',[1 M*N]);
  B=reshape(B',[1 M*N]);
  p=[R;G;B];
  %对BP网络进行仿真
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
      title('2000年崇明东滩遥感图像分类图');
  elseif j==2
      title('2003年崇明东滩遥感图像分类图');
  end

  %计算各类地物面积
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
  
  var=input('是否以饼状图显示地物比例(是:输入1 ,否:输入2)');
  if var==1
  %绘制地物面积饼状图
  t=[t0,t1,t2,t3,t4,t5,t6,t7,t8,t9];
  figure;
  pie(t);
  legend('海水','农地','绿林地','房屋','养殖场','芦苇','互花米草','海三棱藨草','光滩','未利用地',-1);            %标注图例
  end
  
  var=input('是否以直方图显示地物比例(是:输入1 ,否:输入2 )');
  if var==1
  %绘制地物面积柱状图
  y=[t0,t1,t2,t3,t4,t5,t6,t7,t8,t9];  
  x=1:10;
  figure;
  bar(x,y);colormap summer;         %绘制柱状图且返回图形句柄
  end
end
end

var=input('是否对2005年遥感图像进行预测(是：输入1 否：输入2)');
if var==1
%<----------------------------!运用2000年和2003年图像预测2005年图像------------------>
%读入2000年遥感数据
I=imread('tm2000mask.jpg');
%将图像数据降维
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
%初始化输入向量
P=[];
P=[R;G;B];

%初始化输出向量
%读入2003年遥感数据
I=imread('tm2003mask.jpg');
%将图像数据降维
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%灰度值归一化
R=im2double(R);
G=im2double(G);
B=im2double(B);
[M N]=size(R);
R=reshape(R',[1 M*N]);
G=reshape(G',[1 M*N]);
B=reshape(B',[1 M*N]);
T=[];
T=[R;G;B];

%创建一个前向神经网络
net=newff(minmax(P),[5 3],{'logsig','purelin'},'traingdx');
%设置训练参数
net.trainParam.show=50;
net.trainParam.epochs=1000;
net.trainParam.goal=0.001;
%对BP网络进行训练
net=train(net,P,T);

%预测2005年遥感图像
%对BP网络进行仿真
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








