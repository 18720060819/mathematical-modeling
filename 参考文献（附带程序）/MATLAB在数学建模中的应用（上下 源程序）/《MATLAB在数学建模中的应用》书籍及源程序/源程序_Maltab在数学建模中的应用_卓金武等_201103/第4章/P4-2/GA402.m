%�����򣺱���������Ŵ��㷨����������
%���ϴν���������õ���������Ⱥ��Ϊ�´�����ĳ�ʼ��Ⱥ
clc;
close all;
clear all;
%�����Ĵ���
T=100;
optionsOrigin=gaoptimset('Generations',T/2);
[x,fval,reason,output,finnal_pop]=ga(@ch14_2f,2,optionsOrigin);
%���еڶ��ν�������
options1=gaoptimset('Generations',T/2,'InitialPopulation',finnal_pop,...
    'PlotFcns',@gaplotbestf);
[x,fval,reason,output,finnal_pop]=ga(@ch14_2f,2,options1);
Bestx=x
BestFval=fval


