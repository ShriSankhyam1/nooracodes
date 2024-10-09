/* Date: 20082024
The code presented herein was developed by ShriSankhyam Analytics and Research LLP for utilization by Noora Health. It is intended for processing raw data 
supplied directly by the client ( Noora Health). ShriSankhyam Analytics and Research LLP strictly adheres to the provided data and only modifies it as perpredefined analysis protocols. Upon completion of all analyses, the code is promptly handed over to Noora Health. It is important to note that any alterations or outcomes arising from the use of this code subsequent to the transfer date are not the responsibility of ShriSankhyam Analytics and Research LLP.
*/


/* Baseline-Midline */
use "H:\AMIT\New folder\work\25052022_Overall_CCP_data.dta", clear
keep if  pre_post!=.

keep submissiondate caseid dod begin age education delivery_type num_baby los_cat baby_sex bweight1 State new_date Hospital_name Hospital_id denom pre_post Program_Launch_date date_diff foods_24 foods_24_1 foods_24_2 foods_24_3 foods_24_4 foods_24_5 foods_24_6 foods_24_7 foods_24_77 foods_24_0 foods_24_other cord_items_applied cord_items_applied_1 cord_items_applied_2 cord_items_applied_3 cord_items_applied_4 cord_items_applied_5 cord_items_applied_77 cord_items_applied_0 cord_items_applied_88 cord_items_applied_other kmc_practiced_loc kmc_practiced_loc_1 kmc_practiced_loc_2 kmc_provider kmc_provider_1 kmc_provider_2 kmc_provider_3 kmc_provider_4 kmc_provider_5 kmc_aware kmc_practiced kmc_yn_24 kn_danger_signs kn_danger_signs_1 kn_danger_signs_2 kn_danger_signs_3 kn_danger_signs_4 kn_danger_signs_5 kn_danger_signs_6 kn_danger_signs_7 kn_danger_signs_8 kn_danger_signs_9 kn_danger_signs_10 kn_danger_signs_11 kn_danger_signs_77 kn_danger_signs_88 kn_danger_signs_other diet_items_stopped diet_items_stopped_1 diet_items_stopped_2 diet_items_stopped_3 diet_items_stopped_4 diet_items_stopped_5 diet_items_stopped_6 diet_items_stopped_7 diet_items_stopped_8 diet_items_stopped_9 diet_items_stopped_10 diet_items_stopped_11 diet_items_stopped_12 diet_items_stopped_0 diet_items_stopped_77 diet_items_stopped_other diet_restricted_ever wash_method wash_method_1 wash_method_2 wash_method_77 wash_method_99 baby_home_sick baby_sick_signs baby_sick_signs_1 baby_sick_signs_2 baby_sick_signs_3 baby_sick_signs_4 baby_sick_signs_5 baby_sick_signs_6 baby_sick_signs_7 baby_sick_signs_8 baby_sick_signs_9 baby_sick_signs_10 baby_sick_signs_11 baby_sick_signs_12 baby_sick_signs_13 baby_sick_signs_14 baby_sick_signs_15 baby_sick_signs_16 baby_sick_signs_77 baby_sick_signs_0 baby_sick_signs_other baby_sick_signs_prompted baby_sick_signs_prompted_1 baby_sick_signs_prompted_2 baby_sick_signs_prompted_3 baby_sick_signs_prompted_4 baby_sick_signs_prompted_5 baby_sick_signs_prompted_6 baby_sick_signs_prompted_7 baby_sick_signs_prompted_8 baby_sick_signs_prompted_9 baby_sick_signs_prompted_10 baby_sick_signs_prompted_11 baby_sick_signs_prompted_12 baby_sick_signs_prompted_13 baby_sick_signs_prompted_14 baby_sick_signs_prompted_15 baby_sick_signs_prompted_16 baby_sick_signs_prompted_77 baby_sick_signs_prompted_0 baby_sick_treatment baby_sick_treatment_1 baby_sick_treatment_2 baby_sick_treatment_3 baby_sick_treatment_4 baby_sick_treatment_5 baby_sick_treatment_6 baby_sick_treatment_7 baby_sick_treatment_8 baby_sick_treatment_9 baby_sick_treatment_77 baby_sick_treatment_other mom_home_sick mom_sick_signs mom_sick_signs_1 mom_sick_signs_2 mom_sick_signs_3 mom_sick_signs_4 mom_sick_signs_5 mom_sick_signs_6 mom_sick_signs_7 mom_sick_signs_8 mom_sick_signs_9 mom_sick_signs_10 mom_sick_signs_11 mom_sick_signs_12 mom_sick_signs_13 mom_sick_signs_14 mom_sick_signs_15 mom_sick_signs_16 mom_sick_signs_17 mom_sick_signs_18 mom_sick_signs_19 mom_sick_signs_77 mom_sick_signs_other mom_sick_treatment mom_sick_treatment_1 mom_sick_treatment_2 mom_sick_treatment_3 mom_sick_treatment_4 mom_sick_treatment_5 mom_sick_treatment_6 mom_sick_treatment_7 mom_sick_treatment_8 mom_sick_treatment_9 mom_sick_treatment_77 mom_sick_treatment_other

gen ebf_24hrs=foods_24 
gen ebf_24hrs_1=foods_24_1 
gen ebf_24hrs_2=foods_24_2 
gen ebf_24hrs_3=foods_24_3 
gen ebf_24hrs_4=foods_24_4 
gen ebf_24hrs_5=foods_24_5 
replace ebf_24hrs_5=1 if foods_24_7==1
gen ebf_24hrs_6=foods_24_6 
gen ebf_24hrs_77=foods_24_77 
gen ebf_24hrs_99=foods_24_0 

label variable ebf_24hrs_1 "Breast milk"
label variable ebf_24hrs_2 "Gripe water"
label variable ebf_24hrs_3 "Animal Milk"
label variable ebf_24hrs_4 "Water"
label variable ebf_24hrs_5 "Powder milk/Formula milk"
label variable ebf_24hrs_6 "Honey"
label variable ebf_24hrs_77 "Others"
label variable ebf_24hrs_77 "Nothing"

rename cord_items_applied_0 cord_items_applied_99

rename kmc_practiced_loc kmc_practiced_loc_s 

rename kmc_provider_3 kmc_provider_7
rename kmc_provider_4 kmc_provider_8
rename kmc_provider_5 kmc_provider_9

gen end_bab=kn_danger_signs 
gen end_bab_1=kn_danger_signs_1 
gen end_bab_2=kn_danger_signs_2 
gen end_bab_3=kn_danger_signs_3 
gen end_bab_4=kn_danger_signs_4 
gen end_bab_5=kn_danger_signs_5 
gen end_bab_6=kn_danger_signs_6 
gen end_bab_7=kn_danger_signs_7 
gen end_bab_8=kn_danger_signs_8 
gen end_bab_9=kn_danger_signs_9 
gen end_bab_10=kn_danger_signs_10 
gen end_bab_11=kn_danger_signs_11 
gen end_bab_77=kn_danger_signs_77 
gen end_bab_88=kn_danger_signs_88

rename wash_method_99 wash_method_0

 
gen problem_mother=mom_home_sick
gen treatment_mom=mom_sick_treatment
gen treatment_mom_1=mom_sick_treatment_1
gen treatment_mom_2=mom_sick_treatment_2
gen treatment_mom_3=mom_sick_treatment_3
replace treatment_mom_3=1 if mom_sick_treatment_4==1
gen treatment_mom_5=mom_sick_treatment_5
gen treatment_mom_6=mom_sick_treatment_6
gen treatment_mom_7=mom_sick_treatment_9
gen treatment_mom_8=mom_sick_treatment_7
gen treatment_mom_9=mom_sick_treatment_8
gen treatment_mom_77=mom_sick_treatment_77

 
gen problem_baby=baby_home_sick
gen baby_complication=baby_sick_signs
gen baby_complication_signs_1=baby_sick_signs_1
gen baby_complication_signs_2=baby_sick_signs_2
gen baby_complication_signs_3=baby_sick_signs_3
replace baby_complication_signs_3=1 if baby_sick_signs_7==1
gen baby_complication_signs_4=baby_sick_signs_5
replace baby_complication_signs_4=1 if baby_sick_signs_12==1
gen baby_complication_signs_5=baby_sick_signs_9
replace baby_complication_signs_5=1 if baby_sick_signs_10==1
replace baby_complication_signs_5=1 if baby_sick_signs_11==1
gen baby_complication_signs_6=baby_sick_signs_13
gen baby_complication_signs_7=baby_sick_signs_4
gen baby_complication_signs_8=baby_sick_signs_14
replace baby_complication_signs_8=1 if baby_sick_signs_15==1
gen baby_complication_signs_9=baby_sick_signs_6
gen baby_complication_signs_10=baby_sick_signs_8
gen baby_complication_signs_11=baby_sick_signs_16
gen baby_complication_signs_77=baby_sick_signs_77

gen treatment_baby=baby_sick_treatment
gen treatment_baby_1=baby_sick_treatment_1
gen treatment_baby_2=baby_sick_treatment_2
gen treatment_baby_3=baby_sick_treatment_3
replace treatment_baby_3=1 if baby_sick_treatment_4==1
gen treatment_baby_5=baby_sick_treatment_5
gen treatment_baby_6=baby_sick_treatment_6
gen treatment_baby_7=baby_sick_treatment_9
gen treatment_baby_8=baby_sick_treatment_7
gen treatment_baby_9=baby_sick_treatment_8
gen treatment_baby_77=baby_sick_treatment_77


gen kmc_practiced_ever=0 if kmc_aware==0
replace kmc_practiced_ever=0 if kmc_aware==1 & kmc_practiced==0
replace kmc_practiced_ever=1 if kmc_aware==1 & kmc_practiced==1

label define  kmc_practiced_ever 0 "No" 1 "Yes" , replace
label values kmc_practiced_ever kmc_practiced_ever

rename kmc_aware kmc_knw


rename new_date int_date

gen age_mother_cat=0 if age<20 & denom==1 & age!=.
replace age_mother_cat=1 if age_mother_cat==. & (age>=20 & age<30) & denom==1 & age!=.
replace age_mother_cat=2 if age_mother_cat==. & (age>=30 & age<88) & denom==1 & age!=.
replace age_mother_cat=88 if age_mother_cat==. & age==88 & denom==1 


label variable age_mother_cat "Mother age cateogry"
label define  age_mother_cat 0 "<20 years" 1 "20-<30 year" 2 ">=30 years" 88 "Donot know", replace
label values age_mother_cat age_mother_cat


gen mom_education_1=0 if (education>=0 & education<6) & denom==1
replace mom_education_1=1 if (education>=6 & education<=10) & denom==1
replace mom_education_1=2 if (education>10 & education<=13) & denom==1

label variable mom_education_1 "Mother's education"
label define  mom_education_1 0 "Less than 6th standard" 1 "6th to 10th standard" 2 "More than 10th standard" , replace
label values mom_education_1 mom_education_1 


gen birth_wt_cat=0 if bweight1>=2500 & bweight1!=. 
replace birth_wt_cat=1 if (bweight1>=1000 & bweight1<1500)  & birth_wt_cat==.  
replace birth_wt_cat=2 if (bweight1>=1500 & bweight1<2500)  & birth_wt_cat==. 
replace birth_wt_cat=1 if (bweight1>88 & bweight1<1000)
replace birth_wt_cat=3 if bweight1==88


label variable birth_wt_cat "Baby birth weight"
label define birth_wt_cat 1 "Very low birth weight 1000-1500 gm" 2 "Low birth weight 1500-2500 gm" 0 ">=2500 gm" 3 "Card not available or mother do not know", replace
label values birth_wt_cat birth_wt_cat
 
gen state_new_1=0 if State=="Mandhyapradesh"
replace state_new_1=1 if State=="Karnataka"
replace state_new_1=2 if State=="Punjab"
replace state_new_1=3 if State=="Maharashtra"

label variable state_new_1 "State"
label define  state_new_1 1 "Karnataka" 2 "Punjab" 0 "Madhya Pradesh" 3 "Maharashtra"
label values state_new_1  state_new_1



gen gen_bab=1 if baby_sex==2
replace gen_bab=2 if baby_sex==1

label define  gen_bab 1 "Male" 2 "Female" 
label values gen_bab gen_bab

rename num_baby num_bor
rename delivery_type typ_del


*tostring int_date, replace
gen data=0 if pre_post==1
replace data=1 if pre_post==2

merge m:1 Hospital_id using "H:\AMIT\New folder\work\MCH endline\Hospital_code_tot_dates.dta"
drop _merge

gen DOB_1=date( dod, "DM20Y")
split dod if DOB_1==., p(-)

gen dod_1= dod2+"-"+dod1+"-"+dod4 if DOB_1==.

drop dod1 dod2 dod3 dod4

gen DOB_2=date( dod_1, "DMY")

replace DOB_1=DOB_2 if DOB_1==.
format DOB_1 %td

rename DOB_1 DOB_baby
drop DOB_2 dod_1

gen missed_dod=int_date-30 if dod==""
format missed_dod %td
replace DOB_baby= missed_dod if dod==""



save "H:\AMIT\New folder\work\MCH endline\State-Baseline Midline\Base_Mid_MCH_data.dta", replace



/* Endline data */


use "H:\AMIT\New folder\work\MCH endline\MCH_endline140623.dta", clear
keep if confirm_ptdata==1  
replace communicate=16 if confirm_ptdata==1 & drop_cases==1
replace communicate=99 if communicate==.

gen begin="bdead" if communicate==5
replace begin="mdead" if communicate==6
replace begin="start" if communicate==1

label define  communicate 1 "Yes, Begin the survey" 2 "No, because the numberbelongs to the same patient/family" 3 "No, because family refused /disconnected " 4 "No, because familyunavailable " 5  "Baby died"  6  "Mother died" 7  "Number invalid" 8  "Call did not connect (switchedoff/ out of coverage/ notreachable)" 9 "Call connected(Phone rang)but never picked up" 10 "Call connected but wrongnumber" 11 "Other language " 12 "Baby/Mother readmitted" 13 "Baby/Mother still in hopsital" 14 "DND call" 15 "Mother cannot speak/hear" 88 "Not eligible" 99 "Others" 16 "Incomplete information", replace

label values communicate communicate

gen caseid=random_id
format %20.0g caseid
tostring caseid, replace

gen first_baby_m=1 if pri_mom==1 & typ_res==1 
replace first_baby_m=1 if pri_mom==0 & typ_res==1 & ord_bab==0
replace first_baby_m=0 if pri_mom==0 & typ_res==1 & first_baby_m==.
replace first_baby_m=1 if ord_bab_by_crg ==0 & typ_res!=1 & first_baby_m==.
replace first_baby_m=0 if ord_bab_by_crg ==1 & typ_res!=1 & first_baby_m==.

label variable first_baby_m "First baby"
label define first_baby_m 1 "Yes" 0 "No" 
label values first_baby_m first_baby_m


gen day_delivery_m=1 if (day_week==0 | day_week==6) 
replace day_delivery_m=0 if (day_week>=1 & day_week<6) 

label variable day_delivery_m "Day of delivery-Weekend"
label define day_delivery_m 0 "No" 1 "Yes", replace
label values day_delivery_m day_delivery_m


gen mother_caste_m=category_mom if typ_res==1
replace mother_caste_m=category_mom_by_crg if typ_res!=1 & mother_caste_m==.

gen mother_caste_1_m=0 if mother_caste_m==1 
replace mother_caste_1_m=1 if (mother_caste_m==2 | mother_caste_m==77)
replace mother_caste_1_m=88 if (mother_caste_m==88)

label variable mother_caste_1_m "Mother's Caste"
label define  mother_caste_1_m 0 "General" 1 "SC/ST/OBC (other backward class)" 88 "Donot know/No response" , replace
label values mother_caste_1_m mother_caste_1_m 

gen bpl_sta_m=bpl_hos_fam_mom if typ_res==1
replace bpl_sta_m=bpl_hos_fam_by_crg if typ_res!=1 & bpl_sta_m==.

label variable bpl_sta_m "BPL status"
label define  bpl_sta_m 0 "No" 1 "Yes" 
label values bpl_sta_m bpl_sta_m


gen mom_occu_m= occ_mom if typ_res==1
replace mom_occu_m= occ_mom_by_crg if typ_res!=1 & mom_occu_m==.

gen mom_occu_1_m=0 if ( mom_occu_m==1 | mom_occu_m==3)
replace mom_occu_1_m=1 if mom_occu_1_m==. & mom_occu_m!=. 

label variable mom_occu_1_m "Mother's occupation"
label define  mom_occu_1_m 0 "Unemployed or Homemaker" 1 "Employed" , replace
label values mom_occu_1_m mom_occu_1_m


gen mom_education_m= edn_mom if typ_res==1
replace mom_education_m= edn_mom_by_crg if typ_res!=1 & mom_education_m==.

gen mom_education_1_m=0 if (mom_education_m>=1 & mom_education_m<=3) 
replace mom_education_1_m=1 if mom_education_m==4 
replace mom_education_1_m=2 if (mom_education_m>4 & mom_education_m<=6) 

label variable mom_education_1_m "Mother's education"
label define  mom_education_1_m 0 "Less than 6th standard" 1 "6th to 10th standard" 2 "More than 10th standard" , replace
label values mom_education_1_m mom_education_1_m



gen age_mother_m= age_mom if typ_res==1 & age_mom<=100
replace age_mother_m= age_mom_by_cgr if typ_res!=1 & age_mother_m==. & age_mom_by_cgr<=100

replace age_mother_m=. if drop_cases==1
replace age_mother_m=32 if random_id==27421907 & corrected_age==1
replace age_mother_m=22 if random_id==25318222 & corrected_age==1
replace age_mother_m=27 if random_id==33998861 & corrected_age==1
replace age_mother_m=35 if random_id==8319318 & corrected_age==1
replace age_mother_m=31 if random_id==26307515 & corrected_age==1


gen age_mother_cat_m=0 if age_mother_m<20 & age_mother_m!=.
replace age_mother_cat_m=1 if age_mother_cat_m==. & (age_mother_m>=20 & age_mother_m<30) & age_mother_m!=.
replace age_mother_cat_m=2 if age_mother_cat_m==. & (age_mother_m>=30 & age_mother_m<88) & age_mother_m!=.

label variable age_mother_cat_m "Mother age cateogry"
label define  age_mother_cat_m 0 "<20 years" 1 "20-<30 year" 2 ">=30 years" 88 "Donot know", replace
label values age_mother_cat_m age_mother_cat_m

gen weight_kgs_corr_m=weight_kgs_corr
gen baby_weight_grams_corr_m=baby_weight_grams_corr
replace weight_kgs_corr_m= weight_kgs if weight_kgs_corr_m==. & corr_wt_merge!=3 
replace baby_weight_grams_corr_m = baby_weight_grams if baby_weight_grams_corr_m ==. & corr_wt_merge!=3 


gen birth_wt_cat_m=0 if baby_weight_grams_corr_m>=2500 & baby_weight_grams_corr_m!=. & birth_weight==1
replace birth_wt_cat_m=1 if baby_weight_grams_corr_m>=1000 & baby_weight_grams_corr_m<1500  & birth_wt_cat_m==.  & birth_weight==1
replace birth_wt_cat_m=2 if baby_weight_grams_corr_m>=1500 & baby_weight_grams_corr_m<2500  & birth_wt_cat_m==.  & birth_weight==1
replace birth_wt_cat_m=3 if baby_weight_grams_corr_m==. & birth_weight==0 &  birth_wt_cat_m==.


label variable birth_wt_cat_m "Baby birth weight"
label define birth_wt_cat_m 1 "Very low birth weight 1000-1500 gm" 2 "Low birth weight 1500-2500 gm" 0 ">=2500 gm" 3 "Card not available or mother do not know", replace
label values birth_wt_cat_m birth_wt_cat_m


keep v209 caseid begin gen_bab typ_del num_bor age_baby first_baby_m day_delivery_m mother_caste_1_m bpl_sta_m mom_occu_1_m mom_education_1_m age_mother_cat_m birth_wt_cat_m state_new_1 los_cat facility_text hospital_id soc_ccp communicate cord_items_applied cord_items_applied_1 cord_items_applied_2 cord_items_applied_3 cord_items_applied_4 cord_items_applied_5 cord_items_applied_77 cord_items_applied_99 cord_items_applied_88 kmc_practiced_loc kmc_provider kmc_provider_1 kmc_provider_2 kmc_provider_3 kmc_provider_4 kmc_provider_5 kmc_provider_6 kmc_provider_7 kmc_provider_8 kmc_provider_9 kmc_provider_10 kmc_provider_11 kmc_provider_12 kmc_provider_13 kmc_provider_14 kmc_provider_77 kmc_knw kmc_practiced ebf_24hrs ebf_24hrs_1 ebf_24hrs_2 ebf_24hrs_3 ebf_24hrs_4 ebf_24hrs_5 ebf_24hrs_6 ebf_24hrs_7 ebf_24hrs_8 ebf_24hrs_77 ebf_24hrs_99 ebf_birt ebf_birt_1 ebf_birt_2 ebf_birt_3 ebf_birt_4 ebf_birt_5 ebf_birt_6 ebf_birt_7 ebf_birt_8 ebf_birt_77 ebf_birt_99 end_bab end_bab_1 end_bab_2 end_bab_3 end_bab_4 end_bab_5 end_bab_6 end_bab_7 end_bab_8 end_bab_9 end_bab_10 end_bab_11 end_bab_77 end_bab_88 die_stp die_fod die_wat diet_restricted_ever wash_method wash_method_1 wash_method_2 wash_method_77 wash_method_0 wash_method_3 problem_baby baby_complication_signs baby_complication_signs_1 baby_complication_signs_2 baby_complication_signs_3 baby_complication_signs_4 baby_complication_signs_5 baby_complication_signs_6 baby_complication_signs_7 baby_complication_signs_8 baby_complication_signs_9 baby_complication_signs_10 baby_complication_signs_11 baby_complication_signs_88 baby_complication_signs_77 treatment_baby treatment_baby_1 treatment_baby_2 treatment_baby_3 treatment_baby_4 treatment_baby_5 treatment_baby_6 treatment_baby_7 treatment_baby_8 treatment_baby_9 treatment_baby_77 problem_mother mother_complications_vnd mother_complications_vnd_1 mother_complications_vnd_2 mother_complications_vnd_3 mother_complications_vnd_4 mother_complications_vnd_5 mother_complications_vnd_6 mother_complications_vnd_7 mother_complications_vnd_8 mother_complications_vnd_9 mother_complications_vnd_10 mother_complications_vnd_11 mother_complications_vnd_12 mother_complications_vnd_13 mother_complications_vnd_14 mother_complications_vnd_15 mother_complications_vnd_77 mother_complications_cs mother_complications_cs_1 mother_complications_cs_2 mother_complications_cs_3 mother_complications_cs_4 mother_complications_cs_5 mother_complications_cs_6 mother_complications_cs_7 mother_complications_cs_8 mother_complications_cs_9 mother_complications_cs_10 mother_complications_cs_11 mother_complications_cs_12 mother_complications_cs_13 mother_complications_cs_14 mother_complications_cs_15 mother_complications_cs_16 mother_complications_cs_17 mother_complications_cs_77 treatment_mom treatment_mom_1 treatment_mom_2 treatment_mom_3 treatment_mom_4 treatment_mom_5 treatment_mom_6 treatment_mom_7 treatment_mom_8 treatment_mom_9 treatment_mom_77

replace treatment_baby_3=1 if treatment_baby_4==1




rename v209 submissiondate 
rename age_baby dod
rename first_baby_m first_baby
rename day_delivery_m day_delivery
rename mother_caste_1_m mother_caste_1
rename bpl_sta_m bpl_sta
rename mom_occu_1_m mom_occu_1
rename mom_education_1_m mom_education_1
rename age_mother_cat_m age_mother_cat
rename birth_wt_cat_m birth_wt_cat 
rename hospital_id Hospital_id
gen data=2
gen int_date=date( submissiondate, "MDYhms")

format int_date %td
gen DOB_baby=date( dod, "YMDhms")

format DOB_baby %td

gen missed_dod=int_date-30 if dod==""
format missed_dod %td
replace DOB_baby= missed_dod if dod==""

save "H:\AMIT\New folder\work\MCH endline\State-Baseline Midline\Endline_MCH_data.dta", replace


append using "H:\AMIT\New folder\work\MCH endline\State-Baseline Midline\Base_Mid_MCH_data.dta"
tab data,m
tab begin

gen Year=year( int_date)
gen Month_Num=month( int_date)
gen modate=ym(Year ,Month_Num)
format modate %tm
tab modate

gen mother_mortality=1 if begin=="mdead" 
replace mother_mortality=0 if begin=="start" | begin=="bdead"

gen baby_mortality=1 if begin=="bdead" 
replace baby_mortality=0 if begin=="start" | begin=="mdead"


label variable mother_mortality "Mother dead"
label define  mother_mortality 1 "Yes" 0 "No" 
label values mother_mortality mother_mortality 

label variable baby_mortality "Baby dead"
label define  baby_mortality 1 "Yes" 0 "No" 
label values baby_mortality baby_mortality 


label variable data "Baseline_Midline_Endline"
label define  data 2 "Endline" 1 "Midline" 0 "Baseline" 
label values data data


gen soc_fac=1 if (Hospital_id=="dh024" | Hospital_id=="dh009" | Hospital_id=="dh013")


gen data_endline=1 if data==2
replace data_endline=0 if data<2

merge m:1 Hospital_id using "H:\AMIT\New folder\work\MCH endline\Hospital_code_tot_dates_24052024.dta", generate(_merge1)
drop _merge1  
 
gen TOT=date(firstccptotdate,"DMY", 2022)
format TOT  %td

gen int_pr_date_diff=int_date-Program_Launch_date  
gen dod_pr_date_diff=DOB_baby-Program_Launch_date

 
gen V_0=0 if int_pr_date_dif<0 & data_endline==0
replace V_0=1 if int_pr_date_dif>=0 & data_endline==0
replace V_0=2 if data_endline==1

gen V_0_1=0 if dod_pr_date_diff<0 & data_endline==0
replace V_0_1=1 if dod_pr_date_diff>=0 & data_endline==0
replace V_0_1=2 if data_endline==1

gen V1=0 if dod_pr_date_diff<0 & data_endline==0
replace V1=1 if dod_pr_date_diff>=0 & data_endline==0
replace V1=2  if data_endline==1
 
gen tot_15d=TOT+15  
gen tot_30d=TOT+30 

format tot_15d  %td 
format tot_30d  %td 
 
gen dob_tot15_diff=DOB-tot_15d
gen dob_tot30_diff=DOB-tot_30d
 
 
 
gen V2_1=0 if dob_tot15_diff<0 & data_endline==0
replace V2_1=1 if dob_tot15_diff>=0 & data_endline==0
replace V2_1=2  if data_endline==1 
 
gen V2_2=0 if dob_tot30_diff<0 & data_endline==0
replace V2_2=1 if dob_tot30_diff>=0 & data_endline==0
replace V2_2=2  if data_endline==1  
   

egen min_dod = min(DOB_baby), by(facility)
gen mindod=DOB_baby-min_dod
gen tot_select_mindod=1 if mindod==0
format min_dod  %td  
  
br facility Hospital_id data DOB_baby min_dod mindod tot_select_mindod if tot_select_mindod==1 
 
egen max_dod = max(DOB_baby) , by(facility)
gen maxdod=DOB_baby-max_dod 
gen tot_select_maxdod=1 if maxdod==0  
format max_dod  %td   
  
br facility Hospital_id data DOB_baby max_dod maxdod tot_select_maxdod if tot_select_maxdod==1   
  
egen min_int = min(int_date) , by(facility)
gen minint=int_date-min_int 
gen tot_select_minint=1 if minint==0 
format min_int  %td  

br facility Hospital_id data int_date min_int minint tot_select_minint if tot_select_minint==1   
  
egen max_int = max(int_date), by(facility)
gen maxint=int_date-max_int 
gen tot_select_maxint=1 if maxint==0
format max_int  %td     
  
br facility Hospital_id data int_date max_int maxint tot_select_maxint if tot_select_maxint==1    



gen dob_diff= DOB_baby-min_dod
univar dob_diff

logit baby_mortality i.V_0 , vce(cluster Hospital_id) or
logit baby_mortality i.V_0_1 , vce(cluster Hospital_id) or
logit baby_mortality i.V1 i.state_new_1, vce(cluster Hospital_id) or
logit baby_mortality i.V2_1 i.state_new_1, vce(cluster Hospital_id) or
logit baby_mortality i.V2_2 i.state_new_1, vce(cluster Hospital_id) or

gen h_id=substr( Hospital_id,-3,3)
destring h_id, replace

logit baby_mortality i.V1 i.h_id dob_diff, vce(cluster Hospital_id) or
logit baby_mortality i.V2_1 i.h_id dob_diff, vce(cluster Hospital_id) or
logit baby_mortality i.V2_2 i.h_id dob_diff, vce(cluster Hospital_id) or

gen int_V1=V1* dob_diff
logit baby_mortality i.V1 i.h_id dob_diff int_V1, vce(cluster Hospital_id) or
gen int_V2_1=V2_1* dob_diff
logit baby_mortality i.V2_1 i.h_id dob_diff int_V2_1, vce(cluster Hospital_id) or
gen int_V2_2=V2_2* dob_diff
logit baby_mortality i.V2_2 i.h_id dob_diff int_V2_2, vce(cluster Hospital_id) or




gen excl_facility=1 if facility_text=="Damoh DH" | facility_text=="Haveri DH" | facility_text=="Pathankot DH"

logit baby_mortality i.V_0_1 if excl_facility!=1, vce(cluster Hospital_id) or
logit baby_mortality i.V_0_1 i.state_new_1 if excl_facility!=1, vce(cluster Hospital_id) or


logit baby_mortality i.V1 if excl_facility!=1, vce(cluster Hospital_id) or
logit baby_mortality i.V1 i.state_new_1 if excl_facility!=1, vce(cluster Hospital_id) or
logit baby_mortality i.V1 i.state_new_1 if excl_facility!=1 & state_new_1!=3, vce(cluster Hospital_id) or

drop denom
gen denom=1 if begin=="start"
replace denom=0 if denom==.

gen Unrestricted_diet=1 if diet_restricted_ever==0
replace Unrestricted_diet=0 if diet_restricted_ever==1

label variable V1 "Period based on dod"
label define V1 0 "Baseline" 1 "Midline" 2 "Endline", replace
label values V1 V1

gen denom_comp=1 if denom==1 & begin=="start"
replace denom_comp=. if data==2 & excl_facility==1 & begin=="start"

save "H:\AMIT\New folder\work\MCH endline\State-Baseline Midline\Baseline_Midline_Endline_MCH_data.dta", replace
/* demographic */
use "H:\AMIT\New folder\work\MCH endline\State-Baseline Midline\Baseline_Midline_Endline_MCH_data.dta", clear

gen birth_wt_cat_n=1 if birth_wt_cat==0 & denom==1
replace birth_wt_cat_n=0 if (birth_wt_cat==1 | birth_wt_cat==2 | birth_wt_cat==4) & denom==1

label variable birth_wt_cat_n "Birth weight-Binary"
label define  birth_wt_cat_n 0 "Less than 2500 gm" 1 "More than or equal to 2500 gm" , replace
label values birth_wt_cat_n birth_wt_cat_n

/* Exclusive breastfeeding (Breastfeeding+Medicine+Medicine with water) in last 24 hours */
gen excl_bf_24=1 if ( ebf_24hrs_1==1 | ebf_24hrs_7==1 | ebf_24hrs_8==1) & (ebf_24hrs_2==0 & ebf_24hrs_3==0 & ebf_24hrs_4==0 & ebf_24hrs_5==0 & ebf_24hrs_6==0 & ebf_24hrs_77==0 & ebf_24hrs_99==0) & denom==1
replace excl_bf_24=0 if excl_bf_24==. & ebf_24hrs!="" & denom==1

gen excl_bf=1 if ( ebf_birt_1==1 | ebf_birt_7==1 | ebf_birt_8==1) & (ebf_birt_2==0 & ebf_birt_3==0 & ebf_birt_4==0 & ebf_birt_5==0 & ebf_birt_6==0 & ebf_birt_77==0 & ebf_birt_99==0) & denom==1
replace excl_bf=0 if excl_bf==. & ebf_birt!="" & denom==1

/* Complications & Readmission */

label variable treatment_baby_3 "Visited doctor/hospital/clinic/ANM/ASHA"
label variable treatment_mom_3 "Visited doctor/hospital/clinic/ANM/ASHA"

gen complications_baby=1 if (problem_baby==1 | problem_baby==2) & denom==1
replace complications_baby=0 if problem_baby==0 & denom==1

gen complications_mother=1 if (problem_mother==1 | problem_mother==2) & denom==1
replace complications_mother=0 if problem_mother==0 & denom==1


gen self_treated_baby=1 if (treatment_baby_1==1 | treatment_baby_5==1) & denom==1 & problem_baby==1
replace self_treated_baby=0 if self_treated_baby==. & denom==1 & problem_baby==1

gen healthcare_baby=1 if (treatment_baby_2==1 | treatment_baby_3==1 | treatment_baby_4==1 | treatment_baby_6==1 | treatment_baby_7==1) & denom==1 & problem_baby==1
replace healthcare_baby=0 if healthcare_baby==. & denom==1 & problem_baby==1

gen no_action_baby=1 if (treatment_baby_8==1 | treatment_baby_9==1) & denom==1 & problem_baby==1
replace no_action_baby=0 if no_action_baby==. & denom==1 & problem_baby==1

gen self_treated_mother=1 if (treatment_mom_1==1 | treatment_mom_5==1) & denom==1 & problem_mother==1
replace self_treated_mother=0 if self_treated_mother==. & denom==1 & problem_mother==1

gen healthcare_mother=1 if (treatment_mom_2==1 | treatment_mom_3==1 | treatment_mom_4==1 | treatment_mom_6==1 | treatment_mom_7==1) & denom==1 & problem_mother==1
replace healthcare_mother=0 if healthcare_mother==. & denom==1 & problem_mother==1

gen no_action_mother=1 if (treatment_baby_8==1 | treatment_baby_9==1) & denom==1 & problem_mother==1
replace no_action_mother=0 if no_action_mother==. & denom==1 & problem_mother==1

gen readmission_baby=1 if (treatment_baby_3==1 | treatment_baby_4==1) & denom==1 & problem_baby==1
replace readmission_baby=0 if denom==1 & problem_baby==1 & readmission_baby==.

gen readmission_mom=1 if (treatment_mom_3==1 | treatment_mom_4==1) & denom==1 & problem_mother==1
replace readmission_mom=0 if denom==1 & problem_mother==1 & readmission_mom==.


gen baby_complication_signs_h_1= baby_complication_signs_1 if problem_baby==1 & denom==1
gen baby_complication_signs_h_2= baby_complication_signs_2 if problem_baby==1 & denom==1
gen baby_complication_signs_h_3= baby_complication_signs_3 if problem_baby==1 & denom==1
gen baby_complication_signs_h_4= baby_complication_signs_4 if problem_baby==1 & denom==1
gen baby_complication_signs_h_5= baby_complication_signs_5 if problem_baby==1 & denom==1
gen baby_complication_signs_h_6= baby_complication_signs_6 if problem_baby==1 & denom==1
gen baby_complication_signs_h_7= baby_complication_signs_7 if problem_baby==1 & denom==1
gen baby_complication_signs_h_8= baby_complication_signs_8 if problem_baby==1 & denom==1
gen baby_complication_signs_h_9= baby_complication_signs_9 if problem_baby==1 & denom==1
gen baby_complication_signs_h_10= baby_complication_signs_10 if problem_baby==1 & denom==1
gen baby_complication_signs_h_11= baby_complication_signs_11 if problem_baby==1 & denom==1
gen baby_complication_signs_h_88= baby_complication_signs_88 if problem_baby==1 & denom==1
gen baby_complication_signs_h_77= baby_complication_signs_77 if problem_baby==1 & denom==1

label variable baby_complication_signs_h_1 "Fever"
label variable baby_complication_signs_h_2 "Jaundice"
label variable baby_complication_signs_h_3 "Running nose/cold"
label variable baby_complication_signs_h_4 "Cough /chest sounds duringbreathing"
label variable baby_complication_signs_h_5 "Umbilical bleeding or rednessor pus or swelling"
label variable baby_complication_signs_h_6 "Vomiting/spitting"
label variable baby_complication_signs_h_7 "Loose motion"
label variable baby_complication_signs_h_8 "Hard stomach/Constipation"
label variable baby_complication_signs_h_9 "Rash"
label variable baby_complication_signs_h_10 "Urine problem"
label variable baby_complication_signs_h_11 "Crying more than usual"
label variable baby_complication_signs_h_88 "Don't know"
label variable baby_complication_signs_h_77 "Other"


gen treatment_baby_h_1=treatment_baby_1 if denom==1 & problem_baby==1
gen treatment_baby_h_2=treatment_baby_2 if denom==1 & problem_baby==1
gen treatment_baby_h_3=treatment_baby_3 if denom==1 & problem_baby==1
gen treatment_baby_h_5=treatment_baby_5 if denom==1 & problem_baby==1
gen treatment_baby_h_6=treatment_baby_6 if denom==1 & problem_baby==1
gen treatment_baby_h_7=treatment_baby_7 if denom==1 & problem_baby==1
gen treatment_baby_h_8=treatment_baby_8 if denom==1 & problem_baby==1
gen treatment_baby_h_9=treatment_baby_9 if denom==1 & problem_baby==1
gen treatment_baby_h_77=treatment_baby_77 if denom==1 & problem_baby==1

gen treatment_mom_h_1=treatment_mom_1 if denom==1 & problem_mother==1 
gen treatment_mom_h_2=treatment_mom_2 if denom==1 & problem_mother==1 
gen treatment_mom_h_3=treatment_mom_3 if denom==1 & problem_mother==1 
gen treatment_mom_h_5=treatment_mom_5 if denom==1 & problem_mother==1
gen treatment_mom_h_6=treatment_mom_6 if denom==1 & problem_mother==1 
gen treatment_mom_h_7=treatment_mom_7 if denom==1 & problem_mother==1 
gen treatment_mom_h_8=treatment_mom_8 if denom==1 & problem_mother==1 
gen treatment_mom_h_9=treatment_mom_9 if denom==1 & problem_mother==1 
gen treatment_mom_h_77=treatment_mom_77 if denom==1 & problem_mother==1


label variable treatment_baby_h_1 "Self-treated"
label variable treatment_baby_h_2 "Treated using medicine received at time of delivery"
label variable treatment_baby_h_3 "Visited doctor/hospital/clinic/nurse/ANM/ASHA"
label variable treatment_baby_h_5 "Pharmacy"
label variable treatment_baby_h_6 "Anganwadi centre or othergovernment centre/dispensary"
label variable treatment_baby_h_7 "Went to traditional healer"
label variable treatment_baby_h_8 "Resolved without action"
label variable treatment_baby_h_9 "Ongoing without action"
label variable treatment_baby_h_77 "Other"


label variable treatment_mom_h_1 "Self-treated"
label variable treatment_mom_h_2 "Treated using medicine received at time of delivery"
label variable treatment_mom_h_3 "Visited doctor/hospital/clinic/nurse/ANM/ASHA"
label variable treatment_mom_h_5 "Pharmacy"
label variable treatment_mom_h_6 "Anganwadi centre or othergovernment centre/dispensary"
label variable treatment_mom_h_7 "Went to traditional healer"
label variable treatment_mom_h_8 "Resolved without action"
label variable treatment_mom_h_9 "Ongoing without action"
label variable treatment_mom_h_77 "Other"



/* KMC */
gen kmc_loc_hospital=1 if kmc_practiced_loc==1 & kmc_practiced==1 & data==2 & denom==1
replace kmc_loc_hospital=1 if kmc_practiced_loc_1==1 & kmc_practiced==1 & data<2 & denom==1
replace kmc_loc_hospital=0 if kmc_loc_hospital==. & kmc_practiced==1 & denom==1
gen kmc_loc_home=1 if (kmc_practiced_loc==2 | kmc_practiced_loc==3) & kmc_practiced==1 & data==2 & denom==1
replace kmc_loc_home=1 if kmc_practiced_loc_2==1 & kmc_practiced==1 & data<2 & denom==1
replace kmc_loc_home=0 if kmc_loc_home==. & kmc_practiced==1 & denom==1

gen KMC_provider_mother=1 if kmc_loc_home==1 & kmc_provider_1==1 & denom==1
replace KMC_provider_mother=0 if KMC_provider_mother==. & kmc_loc_home==1 & denom==1

gen KMC_provider_father=1 if kmc_loc_home==1 & kmc_provider_2==1 & denom==1
replace KMC_provider_father=0 if KMC_provider_father==. & kmc_loc_home==1 & denom==1


gen KMC_provider_caregiver=1 if kmc_loc_home==1 & (kmc_provider_3==1 | kmc_provider_4==1 | kmc_provider_5==1 | kmc_provider_6==1 | kmc_provider_7==1 | kmc_provider_8==1 | kmc_provider_9==1 | kmc_provider_10==1 | kmc_provider_11==1 | kmc_provider_12==1 | kmc_provider_13==1 | kmc_provider_14==1 | kmc_provider_77==1) & denom==1
replace KMC_provider_caregiver=0 if KMC_provider_caregiver==. & kmc_loc_home==1 & denom==1

/* KMC everpracticed*/
replace kmc_practiced_ever=1 if kmc_practiced==1 & data==2 & denom==1
replace kmc_practiced_ever=0 if kmc_practiced==0 & data==2 & denom==1
replace kmc_practiced_ever=0 if kmc_knw==0 & data==2 & denom==1


/* Dry cord care*/
gen dry_cord_care=1 if ( cord_items_applied_1==0 & cord_items_applied_2==0 & cord_items_applied_3==0 & cord_items_applied_4==0 & cord_items_applied_5==0 & cord_items_applied_77==0 & cord_items_applied_99==1 & cord_items_applied_88==0) & denom==1
replace dry_cord_care=0 if dry_cord_care==. & cord_items_applied!="" & denom==1


/* Day of delivery-Weekend*/
drop day_delivery
gen day_week=dow( DOB_baby)

gen day_delivery=1 if (day_week==0 | day_week==6) & denom==1
replace day_delivery=0 if (day_week>=1 & day_week<6) & denom==1

label variable day_delivery "Day of delivery-Weekend"
label define  day_delivery 0 "No" 1 "Yes" , replace
label values day_delivery day_delivery


gen los_cat1=los_cat if los_cat<88
gen age_mother_cat1=age_mother_cat if age_mother_cat<88

label variable los_cat1 "Length of stay-hospital"
label define los_cat1 0 "<48 hrs" 1 ">=48 hr-7days" 2 ">=7 days" 88 "Don't know", replace
label values los_cat1 los_cat1

label variable age_mother_cat1 "Mother age cateogry"
label define  age_mother_cat1 0 "<20 years" 1 "20-<30 year" 2 ">=30 years", replace
label values age_mother_cat1 age_mother_cat1


cd c:/results

foreach var of varlist gen_bab typ_del num_bor mom_education_1 los_cat birth_wt_cat birth_wt_cat_n age_mother_cat state_new_1 kmc_knw kmc_practiced kmc_practiced_ever kmc_loc_hospital kmc_loc_home KMC_provider_mother KMC_provider_father KMC_provider_caregiver excl_bf_24 ebf_24hrs_1 ebf_24hrs_2 ebf_24hrs_3 ebf_24hrs_4 ebf_24hrs_5 ebf_24hrs_6 ebf_24hrs_77 ebf_24hrs_99  dry_cord_care cord_items_applied_1 cord_items_applied_2 cord_items_applied_3 cord_items_applied_4 cord_items_applied_5 cord_items_applied_77 cord_items_applied_99 cord_items_applied_88 problem_baby complications_baby baby_complication_signs_h_1 baby_complication_signs_h_2 baby_complication_signs_h_3 baby_complication_signs_h_4 baby_complication_signs_h_5 baby_complication_signs_h_6 baby_complication_signs_h_7 baby_complication_signs_h_8 baby_complication_signs_h_9 baby_complication_signs_h_10 baby_complication_signs_h_11 baby_complication_signs_h_77 treatment_baby_h_1 treatment_baby_h_2 treatment_baby_h_3 treatment_baby_h_5 treatment_baby_h_6 treatment_baby_h_7 treatment_baby_h_8 treatment_baby_h_9 treatment_baby_h_77 self_treated_baby healthcare_baby no_action_baby problem_mother complications_mother treatment_mom_h_1 treatment_mom_h_2 treatment_mom_h_3 treatment_mom_h_5 treatment_mom_h_6 treatment_mom_h_7 treatment_mom_h_8 treatment_mom_h_9 treatment_mom_h_77 self_treated_mother healthcare_mother no_action_mother readmission_baby readmission_mom Unrestricted_diet wash_method_1 wash_method_2 wash_method_77 wash_method_0 end_bab_1 end_bab_2 end_bab_3 end_bab_4 end_bab_5 end_bab_6 end_bab_7 end_bab_8 end_bab_9 end_bab_10 end_bab_11 end_bab_77 end_bab_88{
asdoc tab `var' V1 if denom_comp==1 ,row col chi2 append save(tab_base_mid_end)
}

foreach var of varlist kmc_knw kmc_practiced kmc_practiced_ever excl_bf_24 dry_cord_care complications_baby complications_mother readmission_baby readmission_mom Unrestricted_diet{
asdoc logit `var' i.V1 if denom_comp==1 ,vce(cluster Hospital_id) or append save(all_unadj)
}

foreach var of varlist kmc_knw kmc_practiced kmc_practiced_ever excl_bf_24 dry_cord_care complications_baby complications_mother readmission_baby readmission_mom Unrestricted_diet{
asdoc logit `var' i.V1 i.gen_bab i.typ_del i.num_bor i.mom_education_1 birth_wt_cat_n i.los_cat1 i.age_mother_cat1 i.day_delivery i.state_new_1 if denom_comp==1 & (age_mother_cat<88 | los_cat<88) ,vce(cluster Hospital_id) or append save(all_adj)
}



logit healthcare_baby i.V1 if denom_comp==1 ,vce(cluster Hospital_id) or
logit healthcare_mother i.V1 if denom_comp==1 ,vce(cluster Hospital_id) or

logit healthcare_baby i.V1 i.gen_bab i.typ_del i.num_bor i.mom_education_1 birth_wt_cat_n i.los_cat1 i.age_mother_cat1 i.day_delivery i.state_new_1 if denom_comp==1 & (age_mother_cat<88 | los_cat<88) ,vce(cluster Hospital_id) or

logit healthcare_mother i.V1 i.gen_bab i.typ_del i.num_bor i.mom_education_1 birth_wt_cat_n i.los_cat1 i.age_mother_cat1 i.day_delivery i.state_new_1 if denom_comp==1 & (age_mother_cat<88 | los_cat<88) ,vce(cluster Hospital_id) or


logit self_treated_baby i.V1 if denom_comp==1 ,vce(cluster Hospital_id) or
logit self_treated_mother i.V1 if denom_comp==1 ,vce(cluster Hospital_id) or

logit self_treated_baby i.V1 i.gen_bab i.typ_del i.num_bor i.mom_education_1 birth_wt_cat_n i.los_cat1 i.age_mother_cat1 i.day_delivery i.state_new_1 if denom_comp==1 & (age_mother_cat<88 | los_cat<88) ,vce(cluster Hospital_id) or

logit self_treated_mother i.V1 i.gen_bab i.typ_del i.num_bor i.mom_education_1 birth_wt_cat_n i.los_cat1 i.age_mother_cat1 i.day_delivery i.state_new_1 if denom_comp==1 & (age_mother_cat<88 | los_cat<88) ,vce(cluster Hospital_id) or

logit no_action_baby i.V1 if denom_comp==1 ,vce(cluster Hospital_id) or
logit no_action_mother i.V1 if denom_comp==1 ,vce(cluster Hospital_id) or

logit no_action_baby i.V1 i.gen_bab i.typ_del i.num_bor i.mom_education_1 birth_wt_cat_n i.los_cat1 i.age_mother_cat1 i.day_delivery i.state_new_1 if denom_comp==1 & (age_mother_cat<88 | los_cat<88) ,vce(cluster Hospital_id) or

logit no_action_mother i.V1 i.gen_bab i.typ_del i.num_bor i.mom_education_1 birth_wt_cat_n i.los_cat1 i.age_mother_cat1 i.day_delivery i.state_new_1 if denom_comp==1 & (age_mother_cat<88 | los_cat<88) ,vce(cluster Hospital_id) or


use "H:\AMIT\New folder\work\MCH endline\State-Baseline Midline\Baseline_Midline_Endline_MCH_data.dta", clear
keep if denom==1
gen year=year( int_date)
gen month=month( int_date)
collapse (sum) tot =  denom  kmc_yes = kmc_knw   kmc_pr= kmc_practiced_ever dry_cord= dry_cord_care exbf= excl_bf bcompli= baby_compli mcompli= mom_compli un_diet=Unrestricted_diet exbfm=excl_bfm, by(year month)

gen KMC_awareness=(kmc_yes/tot)*100
gen KMC_practiced_ever=(kmc_pr/tot)*100
gen dry_cord_care=(dry_cord/tot)*100
gen Exclusive_breastfeeding=(exbf/tot)*100
gen Exclusive_breastfeeding_medicine=(exbfm/tot)*100
gen Baby_complication=(bcompli/tot)*100
gen Mother_complication=(mcompli/tot)*100
gen Unrestricted_diet=(un_diet/tot)*100

scatter 



collapse (sum) tot =  denom  readmission_mom_yes = readmission_mom   readmission_baby_yes = readmission_baby , by(year month)
gen Mother_Readmission=(readmission_mom_yes/tot)*100
gen Baby_Readmission=(readmission_baby_yes/tot)*100


