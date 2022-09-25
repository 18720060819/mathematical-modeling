clear
# delimit ;
cap log close;

*************************************************************;
* Caschool.do
* Prepare Final Data for Text book
* California School District Data
*************************************************************;
log using ch6.log,replace;
set more 1;

***********************************;
use caschool.dta;

*;
*;
* Decription of Data;
* dist_code -- district Code;
* Read_scr  -- avg Reading Score;
* Math_scr  -- avg Math Score;
* County   --  county;
* District -- District;
* gr_span -- grade span of district;
* enrl_tot -- total enrollment;
* teachers -- number of teachers;
* computer -- number of computers;
* testscr -- avg test score (= (read_scr+math_scr)/2 );
* comp_stu -- computers per student ( = computer/enrl_tot);
* expn_stu -- expentitures per student;
* str -- student teacher ration (teachers/enrl_tot);
* el_pct -- percent of English Learners;
* Meal_pct -- Percent qualifying for reduced-price lunch;
* calw_pct -- Percent qualifying for CalWorks;
* avginc -- district average income (in $1000's);

**************************************************************;
***** Transformed Variables ********;
*************************************************************;
gen avginc2 = avginc*avginc;
gen avginc3 = avginc2*avginc;
gen loginc = ln(avginc);
gen logtest = ln(testscr);
gen loginc2 = loginc*loginc;
gen loginc3 = loginc2*loginc;
gen histr = (str>=20);
gen hiel = (el_pct >= 10);
gen hisxhie = histr*hiel;
gen strxhiel = str*hiel;
gen strxelpc = str*el_pct;
gen sttr2 = str*str;
gen sttr3 = sttr2*str;
gen str2hiel = sttr2*hiel;
gen str3hiel = sttr3*hiel;

reg logtest str el_pct, r;

**************************************************************;
***** EQ 6.2 ********;
*************************************************************;
reg testscr avginc avginc2, r;
dis "Adjusted Rsquared = " _result(8);

**************************************************************;
***** EQ 6.11 ********;
*************************************************************;
reg testscr avginc avginc2 avginc3, r;
dis "Adjusted Rsquared = " _result(8);
test avginc2 avginc3;

**************************************************************;
***** EQ 6.18 ********;
*************************************************************;
reg testscr loginc, r;
dis "Adjusted Rsquared = " _result(8);

**************************************************************;
***** EQ 6.23 ********;
*************************************************************;
reg logtest loginc, r;
dis "Adjusted Rsquared = " _result(8);

**************************************************************;
***** EQ 6.24 ********;
*************************************************************;
reg logtest avginc, r;
dis "Adjusted Rsquared = " _result(8);

**************************************************************;
***** EQ 6.26 ********;
*************************************************************;
reg testscr loginc loginc2 loginc3, r;
dis "Adjusted Rsquared = " _result(8);

**************************************************************;
***** EQ 6.30 ********;
*************************************************************;
reg testscr hiel histr hisxhie, r;
dis "Adjusted Rsquared = " _result(8);

**************************************************************;
***** EQ 6.34 ********;
*************************************************************;
reg testscr str hiel strxhiel, r;
dis "Adjusted Rsquared = " _result(8);

**************************************************************;
***** EQ 6.37 ********;
*************************************************************;
reg testscr str el_pct strxelpc, r;
dis "Adjusted Rsquared = " _result(8);

**************************************************************;
***** Table 6.2 ********;
*************************************************************;
** col(1);
reg testscr str el_pct meal_pct, r;
dis "Adjusted Rsquared = " _result(8);
** col(2);
reg testscr str el_pct meal_pct loginc, r;
dis "Adjusted Rsquared = " _result(8);
** col(3);
reg testscr str hiel strxhiel, r;
dis "Adjusted Rsquared = " _result(8);
test str strxhiel;
** col(4);
reg testscr str hiel strxhiel meal_pct loginc, r;
dis "Adjusted Rsquared = " _result(8);
test str strxhiel;
** col(5);
reg testscr str sttr2 sttr3 hiel meal_pct loginc, r;
dis "Adjusted Rsquared = " _result(8);
test str sttr2 sttr3;
test sttr2 sttr3;
** col(6);
reg testscr str sttr2 sttr3 hiel strxhiel str2hiel str3hiel meal_pct loginc, r;
dis "Adjusted Rsquared = " _result(8);
test str sttr2 sttr3 strxhiel str2hiel str3hiel;
test sttr2 sttr3;
test strxhiel str2hiel str3hiel;
** col(7);
reg testscr str sttr2 sttr3 el_pct meal_pct loginc, r;
dis "Adjusted Rsquared = " _result(8);
test str sttr2 sttr3;
test sttr2 sttr3;

log close;
*clear;
*exit;
