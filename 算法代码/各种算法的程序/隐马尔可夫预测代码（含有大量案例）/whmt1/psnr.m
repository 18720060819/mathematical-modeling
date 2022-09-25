function [y] = psnr(x,y)

[nx,ny]=size(x);
y = -10.0*log10(norm(x-y,'fro')^2/(nx*ny));

