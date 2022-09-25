clc
clear 
P=[-1 -1 2 2 4;0 5 0 5 7];
T=[-1 -1 1 1 -1];
P1=[3;4];
net=newff(minmax(P),[5,1],{'tansig','purelin'},'trainrp');
net.trainParam.epochs=500;
net.trainParam.goal=0.000001;
net.trainParam.lr=0.05;
net.trainParam.show=20;
[net,tr]=train(net,P,T);
sim(net,P1)