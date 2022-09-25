use nyse, clear
tsset t
g y=49.75 in 1
quietly forvalues i=2/691 {
replace y=0.2+y[_n-1]+invnorm(uniform()) in `i'
}
tsline y D.y || tsline price D.price
reg y L.y
reg D.y L.y
reg D.y L.y t
dfuller y, lags(0) regress
dfuller price, lags(0) regress
dfuller y, lags(0) trend regress
dfuller price, lags(0) trend regress
