%�Ӻ�����������ڶ�����m�ļ��У�����ΪBPNet.m
%���������ṹ
function Out=BPNet(In,W1,B1,W2,B2,W3,B3)
[xxx,InNum]=size(In);
Hidden1Out=logsig(W1*In+repmat(B1,1,InNum));
Hidden2Out=logsig(W2*Hidden1Out+repmat(B2,1,InNum));
Out=logsig(W3*Hidden2Out+repmat(B3,1,InNum));