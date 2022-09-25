function [P1N]=postlh(w,ES,PS,MU,SI,P1)
% function [P1N]=postlh(w,ES,PS,MU,SI,P1)
% compute posterior state probabilities given data w and HMT model
% for LH subband
%
% Author: H. Choi
% Last update : 12/14/1998
%
% input :
%  w : data
%  ES,PS,MU,SI : HMT model parameters
%  P1 : posterior state prob matrix
%
% output:
%  P1N : posterior state probabilities with updated LH subband entries
%        other subbands remain unchanged.

M=size(ES,1);
P=size(w,1);
level=log2(P);
BE=zeros(M,P,P);
BEP=zeros(M,P,P);
BER=zeros(M,P,P);
 
AL=zeros(M,P,P);
P2=zeros(M,M,P,P);

%UP step
wtmp = repmat(w,[1 1 M]);
wtmp = shiftdim(wtmp,2);
si=1; ei=2^(level-1); sj=2^(level-1)+1; ej=P;
gtmp = gauss(wtmp,MU,SI);
scale = repmat(mean(gtmp,1),[M 1 1]);
BE(:,si:ei,sj:ej) = gtmp(:,si:ei,sj:ej)./scale(:,si:ei,sj:ej);

%clear MUtmp SItmp;

for k=level:-1:2
 J=2^(k-1);J2=J*J; si = 1; ei = J; sj = J+1; ej = 2*J;

 EStmp = reshape(ES(:,:,si:ei,sj:ej),M,M*J2);

 if M==2
  %%%%%% For M=2 the following may be faster
  BEtmp = zeros(M,M*J2);
  BEtmp(:,1:M:(M*J2))=reshape(BE(:,si:ei,sj:ej),M,J2);
  BEtmp(:,2:M:(M*J2))=BEtmp(:,1:M:(M*J2));
 else
  % For general M (not equal to 2) use the following
  BEtmp = zeros(M,M*4^(k-1)*K);
  for m=1:M
   BEtmp(:,m:M:(M*4^(k-1)*K))=reshape(BE(:,si:ei,sj:ej,:),M,4^(k-1)*K);
  end;
 end;

 BEtmp = reshape(EStmp.*BEtmp,[M M J J]);
 BEP(:,si:ei,sj:ej) = squeeze(sum(BEtmp,1));
 
 sni = 1; eni = J/2; snj = J/2+1; enj = J;

%construct betachild matrix here
 BCtmp = BEP(:,si:2:ei,sj:2:ej);
 BCtmp = BCtmp.*BEP(:,si+1:2:ei,sj:2:ej);
 BCtmp = BCtmp.*BEP(:,si:2:ei,sj+1:2:ej);
 BCtmp = BCtmp.*BEP(:,si+1:2:ei,sj+1:2:ej); 
 scaletmp = repmat(mean(BCtmp,1),[M 1 1]);
 scale(:,sni:eni,snj:enj) = scale(:,sni:eni,snj:enj).*scaletmp;
 BE(:,sni:eni,snj:enj)=gtmp(:,sni:eni,snj:enj)./scale(:,sni:eni,snj:enj).*BCtmp;

%construct BE(:,pai(i),paj(j),dindex) matrix
 Btmp=zeros(M,J,J);
 Btmp(:,1:2:J,1:2:J)=BE(:,sni:eni,snj:enj);
 Btmp(:,2:2:J,1:2:J)=BE(:,sni:eni,snj:enj);
 Btmp(:,1:2:J,2:2:J)=BE(:,sni:eni,snj:enj);
 Btmp(:,2:2:J,2:2:J)=BE(:,sni:eni,snj:enj);
 BER(:,si:ei,sj:ej)=Btmp./BEP(:,si:ei,sj:ej);
end;

clear EStmp BEtmp BCtmp Btmp;

%DOWN step
 %initialize
 AL(:,1,2) = PS(:,1,2);

 for k=2:level
  J = 2^(k-1); J2=J*J;
  si=1; ei=J; sj=J+1; ej=2*J;
  sni = 1; eni = J/2; snj = J/2+1; enj = J;
  Atmp=zeros(M,J,J);
  Atmp(:,1:2:J,1:2:J)=AL(:,sni:eni,snj:enj);
  Atmp(:,2:2:J,1:2:J)=AL(:,sni:eni,snj:enj);
  Atmp(:,1:2:J,2:2:J)=AL(:,sni:eni,snj:enj);
  Atmp(:,2:2:J,2:2:J)=AL(:,sni:eni,snj:enj);

  Atmp = repmat(reshape(Atmp.*BER(:,si:ei,sj:ej),1,M*J2),[M 1]);
  EStmp = reshape(ES(:,:,si:ei,sj:ej),M,M*J2);
  ALtmp = reshape(EStmp.*Atmp,[M M J J]);
  AL(:,si:ei,sj:ej) = squeeze(sum(ALtmp,2));
 end;

 clear Atmp EStmp ALtmp;

%compute probabilities
for k=2:level
 J=2^(k-1); J2=J*J;
 si=1; ei=J; sj=J+1; ej=2*J;
 sni = 1; eni = J/2; snj = J/2+1; enj = J;

 temp = repmat(sum(AL(:,si:ei,sj:ej).*BE(:,si:ei,sj:ej), 1),[M 1]);
 P1(:,si:ei,sj:ej) = AL(:,si:ei,sj:ej).*BE(:,si:ei,sj:ej)./temp;
end;
P1(:,1,2)=AL(:,1,2).*BE(:,1,2)./repmat(sum(AL(:,1,2).*BE(:,1,2),1),[M 1 1]);

clear temp BEtmp EStmp Atmp BERtmp;

P1N=P1;
