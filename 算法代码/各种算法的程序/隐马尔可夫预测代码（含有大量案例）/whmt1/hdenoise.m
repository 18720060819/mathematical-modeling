function [y]=hdenoise(x,h,option,ES,PS,MU,SI,type)
% function [y]=hdenoise(x,h,option,ES,PS,MU,SI,type)
%
% Author: H. Choi
% Last modified 3/29/1999
%
% input:
%   x : noisy image
%       normalization of pixel values to [0,1] recommended
%       to avoid numerical overflow in HMT training.
%
%   h : wavelet filter
%   option : length 3 vector (optional)
%    option(1) : epsilon : convergence test threshold for training
%                          (default = 1e-4)
%    option(2) : M : number of mixture densities (default = 2)
%    option(3) : level 
%                (default = 5 if x is larger than 256x256)
%                (maximum possible value otherwise) 
%    option(4) : Whether to save trained HMT model
%                0 -> do not save model
%                1 -> save ES,PS,MU,SI as hmtmodel.mat
%
%     ES, PS, MU, SI : HMT model parameters (optional)
%                      if omitted, HMT training is performed to obtain
%                      parameters. If these are provided, option argument
%                      is required (set it to [] for default.
%                      Other incomplete specification of option
%                      resorts to default values.)
%                    
%    type : type of HMT model specified by ES,PS,MU,SI
%           0 -> the model is for noiselss image
%           1 -> the model is for noisy image (default)
%  
% output: y (denoised image)
%
% Examples:
% (1) y=hdenoise(x,h);
%     denoise image x using wavelet filter h with full HMT
%     training with 2 state mixture and default level and epsilon.
%
% (2) y=hdenoise(x,h,option);
%     same as (1) except using epsilon, M, level specified by option.
%
% (3) y=hdenoise(x,h,option,ES,PS,MU,SI);
%     denoise image x using HMT model specified by ES,PS,MU,SI
%     the first two arguments of option are ignored. HMT model
%     is for noisy image.
%
% (4) y=hdenoise(x,h,[],ES,PS,MU,SI);
%     denoise image x using HMT model specified by ES,PS,MU,SI
%     using default value for level. The model is for noisy image
%
% (5) y=hdenoise(x,h,[],ES,PS,MU,SI,0);
%     denoise image x using HMT model specified by ES,PS,MU,SI
%     using default value for level. The model is for noiseless
%     image.
 
if (nargin <2)
 error('You should provide at least two arguements: x and h');
end;
if (nargin >3 & nargin < 7)
 error('Insufficient number of input arguments');
end;
if (nargin < 8)
  type = 1;
end;

w = Idwt2(x,h); %compute wavelet transform
P = size(x,1);
level = log2(P);
if (level>8)
  tmp = 4;
else
  tmp = 1;
end;

if (nargin < 4) % HMT not specified
 if (nargin < 3) %option not specified. use default values
   option = [1e-4 2 tmp 0];
 end;
 % if option is incompletely specified, used default values
 [nx ny]=size(option);
 if (nx*ny ~= 4)
   option = [1e-4 2 tmp 0];
 end;
 % train HMT model to obtain ES,PS,MU,SI
 disp('Please wait: this step takes 15+ minutes for 512x512 images');
 [ES,PS,MU,SI]=hmttrain(w,option(2),option(1));
 if (option(4) == 1)
  save hmtmodel ES PS MU SI;
 end;
end;

%incomplete option resorts to default setting
[nx ny]=size(option);
if (nx*ny ~= 4)
   option = [1e-4 2 tmp 0];
end;

%denoise image
if (type)
 [yw]=hmtdeno(w,option(3),ES,PS,MU,SI);
else
 [yw]=hmtdeno0(w,option(3),ES,PS,MU,SI);
end;
y = Iidwt2(yw,h);
%if (nargin < 4) % HMT not specified
 %if (nargin < 3) %option not specified. use default values
  % option = [1e-4 2 tmp 0];
% end;
 % if option is incompletely specified, used default values
 %[nx ny]=size(option);
 %if (nx*ny ~= 4)
  % option = [1e-4 2 tmp 0];
 %end;
 % train HMT model to obtain ES,PS,MU,SI
 %disp('Please wait: this step takes 15+ minutes for 512x512 images');
 %[ES,PS,MU,SI]=hmttrain(w,option(2),option(1));
 %if (option(4) == 1)
  %save hmtmodel ES PS MU SI;
 %end;
%end;

%incomplete option resorts to default setting
%[nx ny]=size(option);
%if (nx*ny ~= 4)
 %  option = [1e-4 2 tmp 0];
%end;

%denoise image
%if (type)
 %[yw]=hmtdeno(w,option(3),ES,PS,MU,SI);
%else
 %[yw]=hmtdeno0(w,option(3),ES,PS,MU,SI);
%end;
%y = Iidwt2(yw,h);











