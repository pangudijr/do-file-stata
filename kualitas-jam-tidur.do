/*******************************************************************************
					Do File Variabel Years of Schooling - IFLS
*******************************************************************************/
set more off
capture log close

/*******************************************************************************
					Manajemen Input Output File
*******************************************************************************/

cd "D:\Kelas IFLS Premium Farmasi Unpad"
global ifls5 "D:\Data\IFLS\IFLS5(2014)\DATA_IFLS5HH"
global ifls4 "D:\Data\IFLS\IFLS4(2007)\DATA_IFLS4HH"
global ifls3 "D:\Data\IFLS\IFLS3(2000)\DATA_IFLS3HH"
global ifls2 "D:\Data\IFLS\IFLS2(1997)\DATA_IFLS2HH"
global ifls1 "D:\Data\IFLS\IFLS1(1993)\DATA_IFLS1HH"
global output "D:\Kelas IFLS Premium Farmasi Unpad\Hasil Olahan Dataset"

dir "$ifls5\*" /*Melihat isi direktori folder input ifls5*/

use "$ifls5/b3b_tdr.dta", clear
keep pid* hhid* tdrtype tdr01
reshape wide tdr01, i(pidlink) j(tdrtype)
recode tdr011 (1 9 = 1 "Tidak") (2 3 4 5 9 = 0 "Ya"), gen(gangguan_tidur14)
recode tdr012 (1 2 9 = 0 "Buruk") (3 4 5 = 1 "Baik"), gen(kualitas_tidur14)

tempfile satu
save `satu', replace


merge 1:1 hhid14 pid14 using "$ifls5/b3a_pna1.dta"

replace pna04hr = 24 if pna04hr ==0
replace pna05hr = 24 if pna05hr ==0
//Two conditionals, 
	//condition 1: if time sleep < time woke up, then + 24
	gen condition1 = 1 if pna05hr < pna04hr
	gen jamtidur_14 = (pna05hr - pna04hr)*-1 if condition1==1
	
	//condition 2: if time sleep > time woke up, then - 24
	gen condition2 = 1 if pna05hr > pna04hr
	replace jamtidur_14 = ((pna05hr - pna04hr) - 24)*-1 if condition2==1
	
keep hhid* pid* jamtidur_14 gangguan_tidur14 kualitas_tidur14
save "$output\gangguan-kualitas-jam-tidur.dta", replace
