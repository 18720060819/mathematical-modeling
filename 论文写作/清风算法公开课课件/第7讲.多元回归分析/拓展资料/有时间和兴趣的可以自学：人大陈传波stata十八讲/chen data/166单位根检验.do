clear
sim_arma y, ar(1) n(691) spin(2000) time(t)
tsline y D.y
pac y
ac y
reg y l.y
ttest y==1
reg d.y l.y
dfuller y,lags(0)
dfuller y,lags(0) regress
dfgls y
dfgls y,maxlag(3)
pperron y
pperron y,reg
