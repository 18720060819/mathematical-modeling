use "D:\Program Files\Stata11.1\phillips.dta", clear
tsset year,yearly
set seed 1234
sim_arma u,ar(0.8)
drawnorm x,mean(5) sds(9)
g y=20*x+u
reg y x
dwstat
durbina
bgodfrey,lag(1/3)
predict e,res
g e1=e[_n-1]
line e e1,sort
reg e x l(1/3).e
dwstat
bgodfrey,lag(1/3)
prais y x
prais y x,corc
prais y x,twostep

prais y x,ssesearch
prais y x,robust
reg inf unem
predict uh,res
reg uh l.uh
dwstat
durbina
prais inf unem,ssesearch
