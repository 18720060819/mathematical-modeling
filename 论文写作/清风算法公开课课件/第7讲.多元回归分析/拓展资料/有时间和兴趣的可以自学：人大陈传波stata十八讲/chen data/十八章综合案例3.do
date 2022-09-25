**********环境设定****************************************
use star_sw.dta, clear
************差分估计值************************************
sum tscorek sck rak if stark==1
reg tscorek sck rak if stark==1, r
*----- 一年级-----
sum tscore1 sc1 ra1 if star1==1
reg tscore1 sc1 ra1 if star1==1, r
*----- 二年级-----
sum tscore2 sc2 ra2 if star2==1
reg tscore2 sc2 ra2 if star2==1, r
*----- 三年级-----
sum tscore3 sc3 ra3 if star3==1
reg tscore3 sc3 ra3 if star3==1, r
************对幼儿园带有额外自变量的差分估计量*******************
preserve
keep if stark==1
reg tscorek sck rak, r
est store m1
reg tscorek sck rak totexpk, r
est store m2
areg tscorek sck rak totexpk, r absorb(schidkn)
esti store m3
*增加性别boy、免费午餐freelunk， 黑人black, 种族other, 学校等额外控制变量
areg tscorek sck rak totexpk boy freelunk black other, r absorb(schidkn)
esti store m4
esti table m*, stats(r2_a N) b (%5.2f) se (%5.3f)
table sck,c(m totexpk m boy m freelunk m black m other)

