
set seed 1234
drawnorm x, n(691) sds(3) clear
set seed 1234
sim_arma y, sigma(3)
tsline y
hist y ,bin(50) norm
sum y, d
ttest y==0
sdtest y==1
pnorm y, grid
wntestb y
wntestq y
corrgram y
ac y
pac y
