function y = Iidwt(w,h,L);
% y = Iidwt(w,h,L);
%
% Discrete Orthogonal Wavelet Transform Inverse
%
% Input
%   w : dwt coefficients
%   h : lowpass filter
%   L : number of levels (2^L must divide length(w))
%
% Example
%   h = daubcqf(6);
%   x = makesig('Doppler',64);
%   w = Idwt(x,h,4);
%   y = Iidwt(w,h,4);
%   x - y

% recursive program

h0 = h;
h1 = makeh1(h0);
n = length(h0);
wlen = length(w);

if L > 1
   w = [Iidwt(w(1:wlen/2),h,L-1) w(wlen/2+1:wlen)];
end

   % get lowpass part and highpass part
   lo = w(1:wlen/2);
   hi = w(wlen/2+1:wlen);

   % upsample
   lo = up(lo,2);
   hi = up(hi,2);

   % create cyclic extensions
   lo = [zeros(1,n-1), lo];
   hi = [zeros(1,n-1), hi];
   for k = n-1:-1:1
      lo(k) = lo(k+wlen);
      hi(k) = hi(k+wlen);
   end

   % linear convolution
   lo = conv(lo,h0);
   hi = conv(hi,h1);

   % extract periodic part
   lo = lo(n:n+wlen-1);
   hi = hi(n:n+wlen-1);

   y = lo + hi;
