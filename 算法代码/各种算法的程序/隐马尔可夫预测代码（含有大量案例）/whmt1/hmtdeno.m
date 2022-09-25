function [yw] = hmtdeno(w,L,ES,PS,MU,SI)
% function [yw] = hmtdeno(w,L,ES,PS,MU,SI)
%
% Author: H. Choi
% Last modified: 12/14/1998
% 
% input :
%  w : noisy wavelet coeffs
%      (normalize image pixel values to be in [0,1])
%  L : Number of levels. Only L coarse scales are processed for denoising
%      (suggested value for 512x512 image : 4 or 5)
%  ES,PS,MU,SI : HMT parameters
%
% output : processed wavelet coefficients in yw

P = size(w,1);
level = log2(P);
M=size(ES,1);
yw = zeros(size(w));

J=2^L;

%noise variance estimation estimation
%MAD (mean absolute deviation) method

tmp = w(P/2+1:P,P/2+1:P);
sn = median(abs(tmp(:)))/.67;
sn2 = sn*sn;
%sn=sigma;
%sn2=sigma * sigma;

%we can use STD (classical numerical std estimate)
%sn = std(tmp(:));
%sn2 = sn*sn;

%computing posterior state probabilities
P1 = zeros(M,P,P);
[P1]=posthh(w,ES,PS,MU,SI,P1);
[P1]=postlh(w,ES,PS,MU,SI,P1);
[P1]=posthl(w,ES,PS,MU,SI,P1);

si2 = SI-sn2;
si2 = si2.*(si2>0)+0.0*(si2<=0);
ywtmp = shiftdim(repmat(w,[1 1 M]),2);
yw = squeeze(sum(si2./(si2+sn2).*ywtmp.*P1,1));
yw(1:J,1:J)=w(1:J,1:J);







