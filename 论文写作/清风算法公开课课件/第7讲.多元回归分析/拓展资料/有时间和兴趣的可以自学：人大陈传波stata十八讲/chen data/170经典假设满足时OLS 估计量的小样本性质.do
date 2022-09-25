clear
set memory 40m
mat m=(3,4,5,0)
mat sd=(9,9.6,0.01,0\9.6,16,12,0\0.01,12,25,0\0,0,0,1)
drawnorm x1 x2 x3 x4,n(10) means(m) cov(sd)
gen u=invnorm(uniform())
gen y=12+5*x1+10*x2+3*x3+x4+u
reg y x1 x2 x3 x4
capt prog drop _all
prog bb
drop _all
drawnorm x1 x2 x3 x4,n(10) means(m) cov(sd)
gen u=invnorm(uniform())
gen y=12+5*x1+10*x2+3*x3+x4+u
quietly reg y x1 x2 x3 x4
end
simulate _b,reps(200): bb
sum _b_x2
pnorm _b_x2
swilk _b_x2
hist _b_x2
