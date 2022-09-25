I = imread('cameraman.tif'); %cameraman.tif��Matlab�Դ���ͼ���ļ�
I = im2double(I); %����ת����double����
T = dctmtx(8); %TΪ8��8��DCT�任����
dct = @(block_struct) T * block_struct.data * T'; %������DCT�任��������������block_struct��Matlab���õĽṹ����
B = blockproc(I,[8 8],dct); %����DCT�任
mask = [1 1 1 1 0 0 0 0
1 1 1 0 0 0 0 0
1 1 0 0 0 0 0 0
1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0]; %������Ĥ����
B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data); %��ȡ��Ƶϵ��
invdct = @(block_struct) T' * block_struct.data * T; %������DCT�任��������
I2 = blockproc(B2,[8 8],invdct); %����DCT�任
subplot(1,2,1), imshow(I) %��ʾԭͼ��
subplot(1,2,2), imshow(I2) %��ʾ�任���ͼ��
