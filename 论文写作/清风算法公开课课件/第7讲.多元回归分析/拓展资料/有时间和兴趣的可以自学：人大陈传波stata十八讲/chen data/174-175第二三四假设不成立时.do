drop _all
drawnorm x1 x2 x3 x4,n(1000) means(m) cov(sd)
gen u=3*invnorm(uniform())
gen y=5*x1+10*x2+3*x3+x4+u
sort y
keep in 1/50
reg y x1 x2 x3 x4
drop _all
drawnorm x2,n(1000)
gen u=9*invnorm(uniform())
gen y=-5+10*x2+u
drop if y<0
reg y x2
truncreg y x2,ll(0)
capt prog drop _all
prog bb
drop _all
drawnorm x1 x2 x3 x4,n(100) means(m) cov(sd)
gen u=3*invnorm(uniform())
gen y=12+5*x1+10*x2+3*x3+x4+u
quietly reg y x2 x3 x4
end
simulate _b,reps(200) :bb
sum
capt prog drop _all
prog bb
drop _all
drawnorm x1 x2 x3 x4,n(100) means(m) cov(sd)
gen u=invnorm(uniform())
gen y=12+5*x1+10*x2+3*x3+x4+u
quietly reg y x1 x2 x3
end
simulate _b,reps(200) :bb
sum
drop _all
drawnorm x1 x2 x3 x4,n(100) means(m) cov(sd)
gen u=3*invnorm(uniform())
gen y=12+5*x1+10*x2+3*x3+x4+u
gen x5=3*x2+x1
reg y x1 x2 x3 x4 x5
