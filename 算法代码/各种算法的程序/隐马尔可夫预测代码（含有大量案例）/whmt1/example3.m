srcpic=imread('barbara','png');
%srcpic=(double(srcpic1)+1)/256;

%whmtimg=srcpic;

subplot(2,2,1);
%imagesc(srcpic(41:168, 181:308), range);
imshow(srcpic,[]);
title('original image');


%noiseimg1=makenoise('barbara','png',sigma * sigma);
%noiseimg1 = srcpic + sigma * randn(size(srcpic));

%noiseimg=(double(noiseimg1)+1)/256;



%fid = fopen('lena512','r');
%lena = fread(fid,[512,512],'uint8');
lena=srcpic;
lena = lena'/255.0;
[ES,PS,MU,SI] = hmtmodel(size(lena,1));


sig = std(srcpic(:));
sigma = sig / 3;
%sigma = 0.1; %noise standard deviation
hh = daubcqf(8); %wavelet filter

x=makenoise('barbara','png',sigma * sigma);
x=(double(x)+1)/256;
%x = lena + sigma*randn(size(lena));

%disp(['PSNR of noisy image is ' num2str(psnr(lena,x)) 'dB']);
y=hdenoise(x,hh,[],ES,PS,MU,SI,0);
%disp(['PSNR of denoised image is ' num2str(psnr(lena,y)) 'dB']);
psnrvalue=psnr((double(lena)+1),y);
subplot(2,2,2);
image(x*255+1);
colormap(gray(256));
axis square;
title('Noisy image');
subplot(2,2,3);
image(y*255+1);
colormap(gray(256));
axis square;
title('Denoised image');
