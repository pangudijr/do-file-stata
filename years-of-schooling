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

*************Variabel Years of Schooling****************

use "$ifls5\bk_ar1.dta", clear
keep pid* hhid* ar16 ar17

gen yos=0 if ar16==1

*SD
replace yos = 0 if ar16 == 2 & ar17 == 0
replace yos = 1 if ar16 == 2 & ar17 == 1
replace yos = 2 if ar16 == 2 & ar17 == 2
replace yos = 3 if ar16 == 2 & ar17 == 3
replace yos = 4 if ar16 == 2 & ar17 == 4
replace yos = 5 if ar16 == 2 & ar17 == 5
replace yos = 6 if ar16 == 2 & ar17 == 6
replace yos = 6 if ar16 == 2 & ar17 == 7

*Madrasah
replace yos = 0 if ar16 == 72 & ar17 == 0
replace yos = 1 if ar16 == 72 & ar17 == 1
replace yos = 2 if ar16 == 72 & ar17 == 2
replace yos = 3 if ar16 == 72 & ar17 == 3
replace yos = 4 if ar16 == 72 & ar17 == 4
replace yos = 5 if ar16 == 72 & ar17 == 5
replace yos = 6 if ar16 == 72 & ar17 == 6
replace yos = 6 if ar16 == 72 & ar17 == 7

*Paket A
replace yos = 6 if ar16 == 11 & ar17 == 7
replace yos = 6 if ar16 == 11 & ar17 > 7
replace yos = 6 if ar16 == 11 & ar17 < 7

*SMP
replace yos = 6 if ar16 == 3 & ar17 == 0
replace yos = 7 if ar16 == 3 & ar17 == 1
replace yos = 8 if ar16 == 3 & ar17 == 2
replace yos = 9 if ar16 == 3 & ar17 == 3
replace yos = 9 if ar16 == 3 & ar17 == 7

*SMP Kejuruan
replace yos = 6 if ar16 == 4 & ar17 == 0
replace yos = 7 if ar16 == 4 & ar17 == 1
replace yos = 8 if ar16 == 4 & ar17 == 2
replace yos = 9 if ar16 == 4 & ar17 == 3
replace yos = 9 if ar16 == 4 & ar17 == 7

*Paket B
replace yos = 9 if ar16 == 12 & ar17 == 7
replace yos = 9 if ar16 == 12 & ar17 > 7
replace yos = 9 if ar16 == 12 & ar17 < 7

*MTs
replace yos = 6 if ar16 == 73 & ar17 == 0
replace yos = 7 if ar16 == 73 & ar17 == 1
replace yos = 8 if ar16 == 73 & ar17 == 2
replace yos = 9 if ar16 == 73 & ar17 == 3
replace yos = 9 if ar16 == 73 & ar17 == 7

*SMA
replace yos = 9 if ar16 == 5 & ar17 == 0
replace yos = 10 if ar16 == 5 & ar17 == 1
replace yos = 11 if ar16 == 5 & ar17 == 2
replace yos = 12 if ar16 == 5 & ar17 == 3
replace yos = 12 if ar16 == 5 & ar17 == 7

*SMK
replace yos = 9 if ar16 == 6 & ar17 == 0
replace yos = 10 if ar16 == 6 & ar17 == 1
replace yos = 11 if ar16 == 6 & ar17 == 2
replace yos = 12 if ar16 == 6 & ar17 == 3
replace yos = 12 if ar16 == 6 & ar17 == 7

*MA
replace yos = 9 if ar16 == 74 & ar17 == 0
replace yos = 10 if ar16 == 74 & ar17 == 1
replace yos = 11 if ar16 == 74 & ar17 == 2
replace yos = 12 if ar16 == 74 & ar17 == 3
replace yos = 12 if ar16 == 74 & ar17 == 7

*Paket C
replace yos = 12 if ar16 == 15 & ar17 == 7
replace yos = 12 if ar16 == 15 & ar17 > 7
replace yos = 12 if ar16 == 15 & ar17 < 7

*Vokasi
replace yos = 12 if ar16 == 60 & ar17 == 0
replace yos = 13 if ar16 == 60 & ar17 == 1
replace yos = 14 if ar16 == 60 & ar17 == 2
replace yos = 15 if ar16 == 60 & ar17 == 3
replace yos = 14 if ar16 == 60 & ar17 == 7

*S1
replace yos = 12 if ar16 == 61 & ar17 == 0
replace yos = 13 if ar16 == 61 & ar17 == 1
replace yos = 14 if ar16 == 61 & ar17 == 2
replace yos = 15 if ar16 == 61 & ar17 == 3
replace yos = 16 if ar16 == 61 & ar17 == 4
replace yos = 16 if ar16 == 61 & ar17 == 5
replace yos = 16 if ar16 == 61 & ar17 == 6
replace yos = 16 if ar16 == 61 & ar17 == 7

*S1 UT
replace yos = 12 if ar16 == 13 & ar17 == 0
replace yos = 13 if ar16 == 13 & ar17 == 1
replace yos = 14 if ar16 == 13 & ar17 == 2
replace yos = 15 if ar16 == 13 & ar17 == 3
replace yos = 16 if ar16 == 13 & ar17 == 4
replace yos = 16 if ar16 == 13 & ar17 == 5
replace yos = 16 if ar16 == 13 & ar17 == 6
replace yos = 16 if ar16 == 13 & ar17 == 7

*S2 S3
replace yos = 16 if ar16 == 62
replace yos = 16 if ar16 == 63

/*Pendidikan berdasarkan Jenjang Edukasi*/
gen	educ_level=0 if yos <= 6
replace educ_level=1 if yos >= 7 & yos <=9
replace educ_level=2 if yos >= 10 & yos <=12
replace educ_level=3 if yos >= 13 & yos <=16
la val educ_level educ_level
lab def educ_level 0 "SD/Sederajad" 1 "SMP/Sederajad" 2 "SMA/Sederajad" 3 "Perguruan Tinggi/Sederajad"

*Pendidikan berdasarkan Sekolah Rendah dan Sekolah Tinggi*/
gen high_educ=0 if yos <= 12
replace high_educ=1 if yos >= 13 & yos <=16
la val high_educ high_educ
lab def high_educ 0 "0:Pendidikan Rendah" 1 "1:Pendidikan Tinggi"


keep hhid* pid* yos educ_level high_educ
save "$output\yearsofschooling.dta", replace
