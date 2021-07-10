/*******************************************************************************
					Do File Variabel Stunting - IFLS
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



*Variabel yg dibutuhkan untuk membuat agemonth dan gender
*ivwmthbk, ivwyrbk, ar08yr, ar08mth, ar07

use "$ifls5\bk_ar1.dta", clear
merge m:m hhid14 using "$ifls5\bk_time.dta"

*Variabel agemonth
gen agemonth = ((ivwyrbk-ar08yr)*12)+(ivwmthbk-ar08mth)
drop if agemonth < 0
drop if agemonth > 60

*Variabel Gender
recode ar07 (1=1 "Laki2") (3=0 "perempuan"), gen(gender)

keep pid* hhid* gender agemonth
tempfile genderagemonth
save `genderagemonth'


***************************************
*Variabel Tinggi badan
clear
use "$ifls5\bus_us.dta"
ren us04 heightanak
keep hhid* pid* heightanak
tempfile tinggianak
save `tinggianak'


**************************************
*Variabel Stunting

use `genderagemonth', clear
duplicates drop pidlink, force
merge 1:1 pidlink using `tinggianak'
keep if _m==3
drop _merge

egen zha14 = zanthro(heightanak,ha,WHO), xvar( agemonth ) gender( gender ) gencode(male=1, female=0)  ageunit(month)
gen stunting = 0
replace stunting = 1 if zha14 < -2
save "$output\hasilstunting.dta", replace
