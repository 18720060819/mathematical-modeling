fid = fopen('lena256','r');
lena = fread(fid,[256,256],'uint8');
lena = lena'/255.0;

sigma = 0.05; %noise standard deviation
hh = daubcqf(8); %wavelet filter

x = lena + sigma*randn(size(lena));
disp(['PSNR of noisy image is ' num2str(psnr(lena,x)) 'dB']);
y=hdenoise(x,hh);
disp(['PSNR of denoised image is ' num2str(psnr(lena,y)) 'dB']);
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

