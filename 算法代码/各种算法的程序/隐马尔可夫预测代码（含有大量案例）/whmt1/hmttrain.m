function [ES,PS,MU,SI] = hmttrain(w,M,epsilon)
% function [ES,PS,MU,SI] = hmttrain(w,M,epsilon)
%
% Author: H. Choi
% Last modified 12/14/1998
%
% train HMT model for wavelet transform data w
%
% M : no. of mixture densities
% w : data (wavelet transform, PxP)
% epsilon : convergence test threshold (1e-5 is reasonable) 
%
% ES : MxMxPxP matrix
% PS : MxPxP matrix
% MU : MxPxP matrix
% SI : MxPxP matrix

P = size(w,1);
level = log2(P); %no. of levels of tree

ES=zeros(M,M,P,P);
PS=zeros(M,P,P);
MU=zeros(M,P,P);
SI=ones(M,P,P);

%initialization of model
for k=1:level
 J = 2^(k-1); J2 = J*J;

 % HH subband
 si=J+1; ei=2*J;
 sj=J+1; ej=2*J;
 mutemp = 0.0;
 sitemp = sum(sum((w(si:ei,sj:ej)-mutemp).^2))/J2;
 sitemp = sitemp*(sitemp > 1e-6) + 1e-6*(sitemp <=1e-6);
 SI(:,si:ei,sj:ej)=repmat(sitemp*linspace(0.5, 2.0,M)',[1 2^(k-1) 2^(k-1)]); 
 ES(:,:,si:ei,sj:ej)=repmat(ones(M,M)/M,[1 1 2^(k-1) 2^(k-1)]);
 PS(:,si:ei,sj:ej)=repmat(ones(M,1)/M, [1 2^(k-1) 2^(k-1)]);

 % LH subband
 si=1; ei=J;
 sj=J+1; ej=2*J;
 mutemp = 0.0;
 sitemp = sum(sum((w(si:ei,sj:ej)-mutemp).^2))/J2;
 sitemp = sitemp*(sitemp > 1e-6) + 1e-6*(sitemp <=1e-6);
 SI(:,si:ei,sj:ej)=repmat(sitemp*linspace(0.5,2.0,M)',[1 2^(k-1) 2^(k-1)]);
 ES(:,:,si:ei,sj:ej)=repmat(ones(M,M)/M,[1 1 2^(k-1) 2^(k-1)]);
 PS(:,si:ei,sj:ej)=repmat(ones(M,1)/M, [1 2^(k-1) 2^(k-1)]);

 % HL subband
 si=J+1; ei=2*J;
 sj=1; ej=J;
 mutemp = 0.0;
 sitemp = sum(sum((w(si:ei,sj:ej)-mutemp).^2))/J2;
 sitemp = sitemp*(sitemp > 1e-6) + 1e-6*(sitemp <=1e-6);
 SI(:,si:ei,sj:ej)=repmat(sitemp*linspace(0.5,2.0,M)',[1 2^(k-1) 2^(k-1)]);
 ES(:,:,si:ei,sj:ej)=repmat(ones(M,M)/M,[1 1 2^(k-1) 2^(k-1)]);
 PS(:,si:ei,sj:ej)=repmat(ones(M,1)/M, [1 2^(k-1) 2^(k-1)]);

end;

conerr = 1.0;
%training of HMM model with tying
while(conerr > epsilon)
 ESP=ES; PSP=PS; MUP=MU; SIP=SI;
 [ES, PS, MU, SI] = emhht(w,ESP,PSP,MUP,SIP,1);
 testcon;
end;
disp('HH subband completed...');

conerr = 1.0;
while(conerr > epsilon)
 ESP=ES; PSP=PS; MUP=MU; SIP=SI;
 [ES, PS, MU, SI] = emlht(w,ESP,PSP,MUP,SIP,1);
 testcon;
end;
disp('LH subband completed...');

conerr = 1.0;
while(conerr > epsilon)
 ESP=ES; PSP=PS; MUP=MU; SIP=SI;
 [ES, PS, MU, SI] = emhlt(w,ESP,PSP,MUP,SIP,1);
 testcon;
end;
disp('HL subband completed...');





