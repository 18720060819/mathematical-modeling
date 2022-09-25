function y = up(x,M,FLAG)
% y = up(x,M); Upsample x by M
%
% Input:  x    - input signal
%         M    - upsampling factor
%         FLAG - 0/1, 0-dont append zeros, 1-append zeros so that
%                length(y)=length(x). Default FLAG=1
% Output: y - output signal
%
% Example:
%
% See also: down
%

%File Name: up.m
%Last Modification Date: 8/30/95        15:52:04
%Current Version: up.m  1.2
%File Creation Date: 92/09/25
%Author: Ramesh Gopinath  <ramesh@dsp.rice.edu>
%
%Copyright: All software, documentation, and related files in this distribution
%           are Copyright (c) 1993  Rice University
%
%Permission is granted for use and non-profit distribution providing that this
%notice be clearly maintained. The right to distribute any portion for profit
%or as part of any commercial product is specifically reserved for the author.
%
%Change History:
%

if (nargin < 3)
  FLAG=1;
end;
y_len=length(x)*M;
if (FLAG==1)
y=zeros(1,y_len);
end;
y(1:M:y_len)=x;


