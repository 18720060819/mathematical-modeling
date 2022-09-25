function [y]=gauss(w,mu,s)
y=1./sqrt(2.0*pi*s).*exp(-(w-mu).^2./(2.0*s))+1e-15;

