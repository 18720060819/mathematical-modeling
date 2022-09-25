sim_arma x,ar(1) n(200) time(t) spin(2000)
g y=10+0.5*x+invnormal(uniform())
tsline x y
reg y x
predict e ,res
dfuller y
dfuller x
dfuller e,regress
