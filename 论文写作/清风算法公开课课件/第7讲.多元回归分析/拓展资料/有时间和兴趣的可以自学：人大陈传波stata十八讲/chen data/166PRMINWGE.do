use "D:\Program Files\Stata11.1\PRMINWGE.dta", clear
tsset t, yearly
newey lprepop lmincov lprgnp lusgnp t, lag(2)
reg lprepop lmincov lprgnp lusgnp t
bgodfrey
bgodfrey , lags(1 2 3)
dwstat
drawnorm x, mean(5) sds(9) clear
sim_arma u, ar(-0.2 -0.8)
g y=20*x+u
reg y x
dwstat
durbina, lag(1 2 3) robust
bgodfrey, lag(1/5)
predict e, res
reg e L(1/2).e
reg e L(1/5).e
newey y x, lag(2)
prais y x, ssesearch
