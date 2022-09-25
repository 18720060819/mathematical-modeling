clear
capt prog drop bb
prog bb
drop _all
set obs 100
sim_arma x,ar(0.8)
sim_arma y,ar(0.8)
reg y x
test x=0
scalar p1=r(p)
prais y x,corc
test x=0
scalar p2=r(p)
end
quietly simulate p1=p1 p2=p2,reps(1000):bb
gen h1=p1<0.05
g h2=p2<0.05
tab h1
tab h2
*hist h,xline(0.05)
