clear
cap log close
log using scoresize.log,replace
set more off
use caschool.dta
* dist_code – 地区代码
* Read_scr -- 平均阅读成绩
* Math_scr -- 平均数学成绩
* County -- 县
* District – 学区
* gr_span – 年级
* enrl_tot –总学生数
* teachers – 总老师数
* computer – 学校的计算机总数
* testscr – 平均考试成绩 (= (read_scr+math_scr)/2 )
* comp_stu – 生均计算机数 ( = computer/enrl_tot)
* expn_stu – 生均经费
* str –生师比 (teachers/enrl_tot)
* el_pct – 英语学习者百分比
* Meal_pct – 享有午餐补助学生百分比
* clw_pct – 享有收入援助计划学生百分比
* aving – 地区平均收入(in $1000's)
sum str str
pctile pct_tsc = testscr, nq(20) genp(pctx)
pctile pct_str = str, nq(20)
list pctx pct_str pct_tsc in 1/20
cor str testscr
tw (scatter testscr str,sort) (lfit testscr str)
reg testscr str,r
gen d=(str<20)
reg testscr d,r
