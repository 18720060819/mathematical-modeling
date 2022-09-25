function [yhat , se ] = arimapred(y,phi,theta,d,mu,sa2,l)
% ARIMAPRED(Y,PHI,THETA,D,MU,SA2,L) Forecast ARIMA process
% INPUTS:
% y = observed data; n by 1
% phi = vector of AR coefficients; p by 1
% theta = vector of MA coefficients; q by 1
% d = order of differencing; 1 by 1 integer
% mu = mean of d times differenced y process; 1 by 1
% sa2 = variance of "shocks"; 1 by 1 and positive
% l = forecast lead time; 1 by 1 positive integer
% OUTPUTS:
% yhat = point forecasts; l by 1
% se = prediction standard deviations; 1 by 1
[n m ] = size(y);
z = y;
if d > 0
   for k = 1:d
      z = z(2:(n-k+1)) - z(1:(n-k));
   end
end
acvf = armaacvf(phi,theta,n-d+l);
V = toeplitz(acvf);
V11 = V(1:(n-d),1:(n-d));
V21 = V((n-d+1):(n-d+l),1:(n-d));
V22 = V((n-d+1):(n-d+l),(n-d+1):(n-d+l));
mu1 = mu*ones(n-d,1);
mu2 = mu*ones(l,1);
[ zhat Vp ] = blip(z,mu1,mu2,V11,V22,V21);
if d==0
   yhat = zhat;
   se = sqrt(diag(Vp));
else
   A = tril(ones(l,l));
   B = A^d;
   Vpy = B*Vp*B';
   se = sqrt(diag(Vpy));
   dy = [ y(n-d+1) ];
   if d > 1
      yend = y((n-d+1):n);
      for k = 2:d
         yend = diff(yend);
         dy = [ dy ; yend(1) ];
      end
   end
   yhat = zhat;
   for k=1:d
      yhat = cumsum([ dy(d-k+1) ; yhat ]);
   end
   yhat = yhat((d+1):(l+d));
end

   