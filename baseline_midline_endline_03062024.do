
use "H:\AMIT\New folder\work\MCH endline\State-Baseline Midline\mortality_data_mid_end_03062024.dta", clear

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

