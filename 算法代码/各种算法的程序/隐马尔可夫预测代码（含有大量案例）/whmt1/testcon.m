% compute convergence error

muerr = sum(sum(sum((MUP-MU).^2)));
sierr = sum(sum(sum((SIP-SI).^2)));
eserr = sum(sum(sum(sum((ESP-ES).^2))));

conerr = max(sierr,eserr)/J2;
disp(conerr);
