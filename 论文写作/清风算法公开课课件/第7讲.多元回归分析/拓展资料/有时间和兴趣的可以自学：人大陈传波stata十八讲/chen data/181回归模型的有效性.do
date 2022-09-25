********************马萨诸塞州的数据定义**************************************;

use mcas.dta,clear
* code           District Code (numerical)
* municipa       Municipality (name)
* district       District Name
* totsc4         4th grade score (math+english+science) 
* totsc8         8th grade score (math+english+science) 
* regday         Spending per pupil, regular
* specneed       Spending per pupil, special needs
* bilingua       Spending per pupil, bilingual
* occupday       Spending per pupil, occupational
* tot_day        Spending per pupil, Total
* tchratio       Students per Teacher
* s_p_c          Students per Computer
* spec_ed	 % Special Education Students
* lnch_pct       % Eligible for free/reduced price lunch
* avgsalry       Average Teacher Salary
* percap         Per Capita Income
* pctel          Percent English Learners

************生成新变量名，使之与加州数据一致************************************************;
* rename variables -- same as CA dataset;
gen str = tchratio
gen testscr=totsc4
gen el_pct = pctel
gen avginc = percap
gen meal_pct = lnch_pct
gen avginc2 = avginc*avginc
gen avginc3 = avginc2*avginc
gen loginc = ln(avginc)
gen hiel = (el_pct > 0)
gen strxhiel = str*hiel
gen sttr2 = str*str
gen sttr3 = sttr2*str

***************描述性统计分析********************************************

summarize testscr str el_pct meal_pct avginc
summarize el_pct, detail
***********************************************************;

*******************回归分析******************************************;

reg testscr str, r
esti store m1

reg testscr str el_pct meal_pct loginc, r
esti store m2

reg testscr str el_pct meal_pct avginc avginc2 avginc3, r
esti store m3
test avginc2 avginc3

reg testscr str sttr2 sttr3 el_pct meal_pct avginc avginc2 avginc3, r
esti store m4
test str sttr2 sttr3
test sttr2 sttr3
test avginc2 avginc3

reg testscr str hiel strxhiel meal_pct avginc avginc2 avginc3, r
esti store m5
test str strxhiel
test avginc2 avginc3
test hiel strxhiel

reg testscr str meal_pct avginc avginc2 avginc3, r
esti store m6
test avginc2 avginc3
esti table m*, stats(r2_a N) b (%5.2f) se (%5.3f)

***************************************************************
