use caschool.dta,clear
gen str_20 = (str<20)
gen ts_lostr = testscr if str_20==1
gen ts_histr = testscr if str_20==0
xtile elq=el_pct,nq(4)
table str_20 elq,c(mean testscr) format(%5.2f)
ttest ts_lostr=ts_histr, unp une
by elq,sort: ttest ts_lostr=ts_histr, unp une
anov testscr str_20
reg testscr str, r
esti store model1
reg testscr str el_pct, r
esti store model2
replace expn_stu = expn_stu/1000
reg testscr str expn_stu el_pct, r
esti store model3
test str expn_stu
cor testscr str expn_stu el_pct meal_pct calw_pct
reg testscr str, r
esti store model1
reg testscr str el_pct, r
esti store model2
reg testscr str el_pct meal_pct, r
esti store model3
reg testscr str el_pct calw_pct, r
esti store model4
reg testscr str el_pct meal_pct calw_pct, r
esti store model5
esti table model*, stats(r2_a N) b (%5.2f) se (%5.3f)
