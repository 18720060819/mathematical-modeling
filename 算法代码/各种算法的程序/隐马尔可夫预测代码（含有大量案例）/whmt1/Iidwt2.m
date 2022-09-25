function y = Iidwt2(w,h,L)
% 
% Input:
%   w : 2-D dwt coefficients
%   h : lowpass filter
%   L : number of levels (2^L must divide the size of w)
%       if omitted, max possible level is used.
% Output:
%   y : inverse dwt
% Example:
%   h = daubcqf(6);
%   w = Idwt(x,h,4); or w = Idwt(x,h);
%   y = Iidwt(w,h,4); or w = Iidwt(w,h);
%
% See also:
% 
 
% File Name: Iidwt2.m
% Last Modification Date: March 9 1999
% Current Version: 1.0
% File Creation Date: Tue Mar  9 09:17:18 1999
% Author: Hyeokho Choi  <choi@ece.rice.edu>
% 
% Copyright: All software, documentation, and related files in this distribution
%           are Copyright (c) 1999 Rice University
% 
% Permission is granted for use and non-profit distribution providing that this
% notice be clearly maintained. The right to distribute any portion for profit
% or as part of any commercial product is specifically reserved for the author.
% 
% Change History:
% 

if (nargin < 2)
  error('You should provide at least two arguments w and h');
end;
h0 = h;
h1 = makeh1(h0);
n = length(h0);
[nx,ny] = size(w);

if (nargin < 3)
  L = log2(nx);
end;

if L > 1
   w = [Iidwt2(w(1:nx/2,1:ny/2),h,L-1) w(1:nx/2,ny/2+1:ny) ;
     w(nx/2+1:nx,1:ny/2) w(nx/2+1:nx,ny/2+1:ny)];
end;

  % column transform first
  for i=1:ny
   % get lowpass part and highpass part
   lo = w(1:nx/2,i);
   hi = w(nx/2+1:nx,i);
 
   % upsample
   lo = up(lo,2);
   hi = up(hi,2);
 
   % create cyclic extensions
   lo = [zeros(1,n-1), lo];
   hi = [zeros(1,n-1), hi];
   for k = n-1:-1:1
      lo(k) = lo(k+nx);
      hi(k) = hi(k+nx);
   end
 
   % linear convolution
   lo = conv(lo,h0);
   hi = conv(hi,h1);
 
   % extract periodic part
   lo = lo(n:n+nx-1);
   hi = hi(n:n+nx-1);
 
   L0(:,i) = lo' + hi';
  end;
  
  % row transform next
  for i=1:nx
   % get lowpass part and highpass part
   lo = L0(i,1:ny/2);
   hi = L0(i,ny/2+1:ny);
 
   % upsample
   lo = up(lo,2);
   hi = up(hi,2);
 
   % create cyclic extensions
   lo = [zeros(1,n-1), lo];
   hi = [zeros(1,n-1), hi];
   for k = n-1:-1:1
      lo(k) = lo(k+ny);
      hi(k) = hi(k+ny);
   end
 
   % linear convolution
   lo = conv(lo,h0);
   hi = conv(hi,h1);
 
   % extract periodic part
   lo = lo(n:n+ny-1);
   hi = hi(n:n+ny-1);
 
   y(i,:) = lo + hi;
  end;








