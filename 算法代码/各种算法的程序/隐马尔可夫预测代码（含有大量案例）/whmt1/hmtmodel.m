function [ES, PS, MU, SI] = hmtmodel(N)
% function [ES, PS, MU, SI] = hmtmodel(N)
%
% Creates a HMT model for real-world images with 2 mixuture densities.
% The model is identically distributed in each scale.
%
% Usuage : [ES, PS, MU, SI] = hmtmodel(N)
% n : size of image. The generated model is for nxn square image
%
% ES : Structure that holds the transistion matrices, dimension 2x2xNxN
% PS : The mixture probabilities for the wavelet coefficients, dimension
%      2XNxN
% MU : The means of the mixture components, (all 0), dimension 2xNxN
% SI : the variances of the mixture components, dimension 2xNxN
%
% Written by : Justin Romberg
% Modified by Hyeokho Choi
%
% Last Revised : 12/22/98

lev = log2(N);
es = zeros(2,2,lev);
ps = zeros(2,lev);
si = zeros(2,lev);
mu = zeros(2,lev);

% parameter constraints for real-world images
alpha_big = 2.5;
C1_big = 13;
alpha_sm = 2.5;
C1_sm = 7;
beta = 1;

% variances decay exponentially
JJ = 1:lev;
si(1,:) = 2^(C1_sm)*2.^(-alpha_sm*JJ);
si(2,:) = 2^(C1_big)*2.^(-alpha_big*JJ);

% Transition matrices have p00->1 and p11->.5
p00(1:3) = 1;
p00(4:lev) = .8 + .2*(1-2.^-(beta*(0:lev-4)));
p11(1:3) = 1;
p11(4:lev) = .9 - .4*(1-2.^-(beta*(0:lev-4)));
p10 = 1 - p00;
for ii = 1:lev
  es(2,2,ii) = p11(ii);
  es(2,1,ii) = p10(ii);
  es(1,1,ii) = 1 - p10(ii);
  es(1,2,ii) = 1 - p11(ii);
end

% mixture probabilities are determined by the transistion matrices and a
% distribution on the initial state of the coarsest wavelet coefficient
ps(:,1) = [.5 .5]';
for ii = 2:lev
  ps(:,ii) = es(:,:,ii)*ps(:,ii-1);
end

[ES, PS, MU, SI] = vec2mat(es,es,es,si,si,si,mu,mu,mu,si,si,si);







