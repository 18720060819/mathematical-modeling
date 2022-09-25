use nyse, clear
tsset t
corr price l2.price
tsline price d.price
corrgram price,lag(10)
pac price
ac price
dfuller price
dfuller price,lags(0) regress
dfgls price
pperron price
xcorr price return,lags(9)
xcorr price return,lags(9) table
sim_arma y,ar(1) n(691) spin(2000) time(t)
replace y=y+50
tsline price d.price || line y d.y
corrgram y
corrgram price
dfuller y,lags(0) regress
dfuller price,lags(0) regress
reg y l.y
