function w = Idwt(x,h,L);
% 
% Input:
%   x : data (square matrix)
%   h : lowpass filter
%   L : number of levels (2^L must divide the size of x)
%       if omitted, max possible level is used.
% Output:
%   w : 2-D wavelet transform of x
% Example:
%   h = daubcqf(6);
%   w = Idwt2(x,h,4); or w = Idwt2(x,h);
%
% See also:
% 
 
% File Name: Idwt2.m
% Last Modification Date: March 9, 1999
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
[nx,ny]=size(x);

if (nargin < 3)
  L = log2(nx);
end;

if (nx-ny) == 0
  if rem(nx,2^L) == 0
    
     H0 = zeros(nx,ny/2); L0 = H0;
     LL = zeros(nx/2,ny/2); HL = LL; LH = LL; HH = LL;
     
     %row transformation
     for i = 1:nx
       xx = x(i,:);
       
       % create cyclic extension
       xx = [xx, zeros(1,n-1)];
       for k = 1:n-1
          xx(nx+k) = xx(k);
       end
  
       % linear convolution
       lo = conv(xx,h0(n:-1:1));
       hi = conv(xx,h1(n:-1:1));
 
       % extract periodic part and downsample
       L0(i,:) = lo(n:2:nx+n-1);
       H0(i,:) = hi(n:2:ny+n-1);
     end; % of i
     
     % column transformation
     for i = 1:ny/2
       xx = L0(:,i)';
       
       % create cyclic extension
       xx = [xx, zeros(1,n-1)];
       for k = 1:n-1
          xx(nx+k) = xx(k);
       end
  
       % linear convolution
       lo = conv(xx,h0(n:-1:1));
       hi = conv(xx,h1(n:-1:1));
 
       % extract periodic part and downsample
       LL(:,i) = lo(n:2:nx+n-1)';
       LH(:,i) = hi(n:2:ny+n-1)';
     end;
     
     for i = 1:ny/2
       xx = H0(:,i)';
       
       % create cyclic extension
       xx = [xx, zeros(1,n-1)];
       for k = 1:n-1
          xx(nx+k) = xx(k);
       end
  
       % linear convolution
       lo = conv(xx,h0(n:-1:1))';
       hi = conv(xx,h1(n:-1:1))';
 
       % extract periodic part and downsample
       HL(:,i) = lo(n:2:nx+n-1);
       HH(:,i) = hi(n:2:ny+n-1);
     end;
     
     
     if L == 1
        w = [LL HL; LH HH];
     else 
        w = [Idwt2(LL,h,L-1) HL; LH HH];
     end  
  else
    disp('The size of x must be divisible by 2^L * 2^L');
  end;
else
  disp('The original image should be square');
end  
