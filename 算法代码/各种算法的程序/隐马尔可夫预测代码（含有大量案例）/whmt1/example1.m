%load lena512;
 pepper=imread('peppers.png');
 pepper=double(pepper)/256;
 
sigma = 0.1; %noise standard deviation
hh = daubcqf(4); %wavelet filter

x = pepper + sigma*randn(size(pepper));
disp(['PSNR of noisy image is ' num2str(psnr(pepper,x)) 'dB']);
y=hdenoise(x,hh);
disp(['PSNR of denoised image is ' num2str(psnr(pepper,y)) 'dB']);
figure(1);
image(x*255+1);
colormap(gray(256));
axis square;
title('Noisy image');
figure(2);
image(y*255+1);
colormap(gray(256));
axis square;
title('Denoised image');

