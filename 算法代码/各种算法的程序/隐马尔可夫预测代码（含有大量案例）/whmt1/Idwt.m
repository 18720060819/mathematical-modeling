function w = Idwt(x,h,L);
% w = Idwt(x,h,L);
%
% Discrete Orthogonal Wavelet Transform
%
% Input
%   x : data
%   h : lowpass filter
%   L : number of levels (2^L must divide length(x))
%
% Example
%   h = daubcqf(6);
%   x = makesig('Doppler',64);
%   w = Idwt(x,h,4);
%

% recursive program

h0 = h;
h1 = makeh1(h0);
n = length(h0);
xlen = length(x);

if rem(xlen,2^L) == 0

   % create cyclic extension
   x = [x, zeros(1,n-1)];
   for k = 1:n-1
      x(xlen+k) = x(k);
   end

   % linear convolution
   lo = conv(x,h0(n:-1:1));
   hi = conv(x,h1(n:-1:1));

   % extract periodic part and downsample
   lo = lo(n:2:xlen+n-1);
   hi = hi(n:2:xlen+n-1);

   if L == 1
      w = [lo, hi];
   else 
      w = [Idwt(lo,h,L-1), hi];
   end
else

   disp('The length of x must be divisible by 2^L')

end

