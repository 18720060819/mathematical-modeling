clc, clear, T=dctmtx(8); %8��8��DCT�任����
colormap('gray'); %������ɫӳ�����
for m = 1:8
for n = 1:8
subplot(8,8,(m-1)*8+n);
Y=zeros(8); Y(m,n)=1; %8��8�����У�ֻ�е�m�е�n��Ϊ1������Ԫ�ض�Ϊ0
X = T'*Y*T; %����DCT�任
imagesc(X); %��ʾͼ��
axis square %��ͼ�����Ƿ���
axis off %����ʾ���ߺͱ��
end
end
