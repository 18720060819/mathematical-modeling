#delimit ;
clear;
*************************************************************;
* ch7.do            MWW 3/30/02;
*  Replciation file for Chapter ;
*;
*************************************************************;
log using ch7.log,replace;
set more 1;
***********************************;
*;
*  MCAS Data and Resutls ****;
* selected variable definitions:
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
***********************************
*** Modify the next line so that the path is correct for your data;
use mcas.dta;

**************************************************************;
* Table 7.1 ;
**************************************************************;
* rename variables -- same as CA dataset;
gen str = tchratio;
gen testscr=totsc4;
gen el_pct = pctel;
gen avginc = percap;
gen meal_pct = lnch_pct;
summarize testscr str el_pct meal_pct avginc;
summarize el_pct, detail;
***********************************************************;
**** Table 7.2 ;
***********************************************************;
**************************************************************;
***** Transformed Variables ********;
*************************************************************;
gen avginc2 = avginc*avginc;
gen avginc3 = avginc2*avginc;
gen loginc = ln(avginc);
gen hiel = (el_pct > 0);
gen strxhiel = str*hiel;
gen sttr2 = str*str;
gen sttr3 = sttr2*str;
****;
** Col(1);
reg testscr str, r;
dis "Adjusted Rsquared = " _result(8);
** Col(2);
reg testscr str el_pct meal_pct loginc, r;
dis "Adjusted Rsquared = " _result(8);
** Col(3);
reg testscr str el_pct meal_pct avginc avginc2 avginc3, r;
dis "Adjusted Rsquared = " _result(8);
test avginc2 avginc3;
** Col(4);
reg testscr str sttr2 sttr3 el_pct meal_pct avginc avginc2 avginc3, r;
dis "Adjusted Rsquared = " _result(8);
test str sttr2 sttr3;
test sttr2 sttr3;
test avginc2 avginc3;
** Col(5);
reg testscr str hiel strxhiel meal_pct avginc avginc2 avginc3, r;
dis "Adjusted Rsquared = " _result(8);
test str strxhiel;
test avginc2 avginc3;
test hiel strxhiel; 
** Col(6);
reg testscr str meal_pct avginc avginc2 avginc3, r;
dis "Adjusted Rsquared = " _result(8);
test avginc2 avginc3;
*;
clear;
*;
***************************************************************
**** CA data ;
***************************************************************;
*** Modify the next line so that the path is correct for your data;
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
summarize testscr str el_pct meal_pct avginc;


**************************************************************;
***** Transformed Variables ********;
*************************************************************;
gen loginc = ln(avginc);
gen strxelpc = str*el_pct;
gen sttr2 = str*str;
gen sttr3 = sttr2*str;

* --- Table 6.2 Results .... repeated here ;
** col(2);
reg testscr str el_pct meal_pct loginc, r;
** col(7);
reg testscr str sttr2 sttr3 el_pct meal_pct loginc, r;
vce;
scalar x1=20;
scalar x2=18;
scalar d1 = x2-x1;
scalar d2 = (x2*x2)-(x1*x1);
scalar d3 =  (x2*x2*x2)-(x1*x1*x1);
scalar dif = d1*_b[str]+d2*_b[sttr2]+d3*_b[sttr3];
dis "Change from 20 to 18 = " dif;
matrix b = get(_b);
matrix vb = get(VCE);
matrix d = (d1,d2,d3,0,0,0,0);
matrix ve = d*vb*d';
display "Variance of Difference   ";
matrix list ve;
matrix list vb;
matrix list d;
matrix temp = d*vb;
matrix list temp;


test d1*str+d2*sttr2+d3*sttr3 = 0;
scalar x1=22;
scalar x2=20;
scalar d1 = x2-x1;
scalar d2 = (x2*x2)-(x1*x1);
scalar d3 =  (x2*x2*x2)-(x1*x1*x1);
scalar dif = d1*_b[str]+d2*_b[sttr2]+d3*_b[sttr3];
dis "Change from 22 to 20 = " dif;
matrix b = get(_b);
matrix vb = get(VCE);
matrix d = (d1,d2,d3,0,0,0,0);
matrix ve = d*vb*d';
display "Variance of Difference   ";
matrix list ve;
test d1*str+d2*sttr2+d3*sttr3 = 0;
log close
       