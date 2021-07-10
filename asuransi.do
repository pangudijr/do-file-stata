/*******************************************************************************
					Do File Variabel Asuransi - IFLS
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

*Seksi Asuransi
use "$ifls5/b3b_ak1.dta", clear
keep if ak01==1
keep pid* hhid* ak02 aktype

reshape wide ak02, i(pidlink) j(aktype) string

save "$hasil/asuransi", replace

