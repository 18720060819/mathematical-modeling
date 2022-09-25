use caschool.dta, clear
gen avginc2 = avginc*avginc
gen avginc3 = avginc2*avginc
gen loginc = ln(avginc)
gen logtest = ln(testscr)
gen loginc2 = loginc*loginc
gen loginc3 = loginc2*loginc
gen histr = (str>=20)
gen hiel = (el_pct >= 10)
gen hisxhie = histr*hiel
gen strxhiel = str*hiel
gen strxelpc = str*el_pct
gen sttr2 = str*str
gen sttr3 = sttr2*str
gen str2hiel = sttr2*hiel
gen str3hiel = sttr3*hiel
reg testscr str el_pct meal_pct, r
esti store model1
reg testscr str el_pct meal_pct loginc, r
esti store model2
reg testscr str hiel strxhiel, r
esti store model3
test str strxhiel
reg testscr str hiel strxhiel meal_pct loginc, r
esti store model4
test str strxhiel
reg testscr str sttr2 sttr3 hiel meal_pct loginc, r
esti store model5
test str sttr2 sttr3
test sttr2 sttr3
reg testscr str sttr2 sttr3 hiel strxhiel str2hiel str3hiel meal_pct loginc, r
esti store model6
test str sttr2 sttr3 strxhiel str2hiel str3hiel
test sttr2 sttr3
test strxhiel str2hiel str3hiel
reg testscr str sttr2 sttr3 el_pct meal_pct loginc, r
esti store model7
test str sttr2 sttr3
test sttr2 sttr3
esti table model*, stats(r2_a N) b (%5.2f) se (%5.3f)
