**********�����趨****************************************
use star_sw.dta, clear
************��ֹ���ֵ************************************
sum tscorek sck rak if stark==1
reg tscorek sck rak if stark==1, r
*----- һ�꼶-----
sum tscore1 sc1 ra1 if star1==1
reg tscore1 sc1 ra1 if star1==1, r
*----- ���꼶-----
sum tscore2 sc2 ra2 if star2==1
reg tscore2 sc2 ra2 if star2==1, r
*----- ���꼶-----
sum tscore3 sc3 ra3 if star3==1
reg tscore3 sc3 ra3 if star3==1, r
************���׶�԰���ж����Ա����Ĳ�ֹ�����*******************
preserve
keep if stark==1
reg tscorek sck rak, r
est store m1
reg tscorek sck rak totexpk, r
est store m2
areg tscorek sck rak totexpk, r absorb(schidkn)
esti store m3
*�����Ա�boy��������freelunk�� ����black, ����other, ѧУ�ȶ�����Ʊ���
areg tscorek sck rak totexpk boy freelunk black other, r absorb(schidkn)
esti store m4
esti table m*, stats(r2_a N) b (%5.2f) se (%5.3f)
table sck,c(m totexpk m boy m freelunk m black m other)

