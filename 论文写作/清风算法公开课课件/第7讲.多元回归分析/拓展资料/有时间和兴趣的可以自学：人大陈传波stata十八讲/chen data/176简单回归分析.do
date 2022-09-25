clear
cap log close
log using scoresize.log,replace
set more off
use caschool.dta
* dist_code �C ��������
* Read_scr -- ƽ���Ķ��ɼ�
* Math_scr -- ƽ����ѧ�ɼ�
* County -- ��
* District �C ѧ��
* gr_span �C �꼶
* enrl_tot �C��ѧ����
* teachers �C ����ʦ��
* computer �C ѧУ�ļ��������
* testscr �C ƽ�����Գɼ� (= (read_scr+math_scr)/2 )
* comp_stu �C ����������� ( = computer/enrl_tot)
* expn_stu �C ��������
* str �C��ʦ�� (teachers/enrl_tot)
* el_pct �C Ӣ��ѧϰ�߰ٷֱ�
* Meal_pct �C ������Ͳ���ѧ���ٷֱ�
* clw_pct �C ��������Ԯ���ƻ�ѧ���ٷֱ�
* aving �C ����ƽ������(in $1000's)
sum str str
pctile pct_tsc = testscr, nq(20) genp(pctx)
pctile pct_str = str, nq(20)
list pctx pct_str pct_tsc in 1/20
cor str testscr
tw (scatter testscr str,sort) (lfit testscr str)
reg testscr str,r
gen d=(str<20)
reg testscr d,r
