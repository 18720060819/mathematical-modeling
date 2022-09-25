% vec2mat.m
%
% Converts the band vectors to matrices
% Assume 2 states for now.
%
% Written by : Justin Romberg
% Created : 12/9/98
%
% Modified by Hyeokho Choi
% Last modified : 12/22/98

function [ES, PS, MU, SI] = vec2mat(ESm,ESl,ESr,PSm,PSl,PSr,MUm,MUl,MUr,...
    SIm,SIl,SIr);

L = size(PSm,2);
N = 2^L;

ES = zeros(2,2,N,N);
SI = ones(2,N,N);
PS = zeros(2,N,N);
MU = zeros(2,N,N);

for ii = 1:L
  lrow = 1:(2^(ii-1));
  lcol = (2^(ii-1)+1):(2^ii);
  
  ES(:,:,lrow,lcol) = repmat(ESl(:,:,ii),[1,1,2^(ii-1),2^(ii-1)]);
  ES(:,:,lcol,lcol) = repmat(ESm(:,:,ii),[1,1,2^(ii-1),2^(ii-1)]);
  ES(:,:,lcol,lrow) = repmat(ESr(:,:,ii),[1,1,2^(ii-1),2^(ii-1)]);
  MU(:,lrow,lcol) = repmat(MUl(:,ii),[1,2^(ii-1),2^(ii-1)]);
  MU(:,lcol,lcol) = repmat(MUm(:,ii),[1,2^(ii-1),2^(ii-1)]);
  MU(:,lcol,lrow) = repmat(MUr(:,ii),[1,2^(ii-1),2^(ii-1)]);
  SI(:,lrow,lcol) = repmat(SIl(:,ii),[1,2^(ii-1),2^(ii-1)]);
  SI(:,lcol,lcol) = repmat(SIm(:,ii),[1,2^(ii-1),2^(ii-1)]);
  SI(:,lcol,lrow) = repmat(SIr(:,ii),[1,2^(ii-1),2^(ii-1)]);
  PS(:,lrow,lcol) = repmat(PSl(:,ii),[1,2^(ii-1),2^(ii-1)]);
  PS(:,lcol,lcol) = repmat(PSm(:,ii),[1,2^(ii-1),2^(ii-1)]);
  PS(:,lcol,lrow) = repmat(PSr(:,ii),[1,2^(ii-1),2^(ii-1)]);
end;







