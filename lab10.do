use "/Users/ishaandey/Documents/UVA 2018-19/Spring 2019/ECON 3720/Lab 10/Lab 10.dta"
reg Wet Baptist Catholic Percent_nonwhite RUC_code
predict LPM_predict, xb
estat imtest, white
reg Wet Baptist Catholic Percent_nonwhite RUC_code, vce(hc3)
predict LPM_predict, xb
reg Wet Baptist Catholic Percent_nonwhite RUC_code
 estat hettest, iid rhs
gen class=0
replace class = 1 if predict > 0.5
replace class = . if predict == .
replace class = 1 if LPM_predict > 0.5
replace class = . if LPM_predict == .
table return class
table Wet class
display 0.5(69/(69+18)+6/(6+27))
display 0.5*(69/(69+18)+6/(6+27))
logistic Wet Baptist Catholic Percent_nonwhite RUC_code
logistic Wet Baptist Catholic Percent_nonwhite RUC_code, coef
estat classification
tostring RUC_code, replace
logistic Wet Baptist Catholic Percent_nonwhite i.RUC_code, coef
save "/Users/ishaandey/Documents/UVA 2018-19/Spring 2019/ECON 3720/Lab 10/Lab 10.dta", replace
encode RUC_code, generate(RUC_code2)
logistic Wet Baptist Catholic Percent_nonwhite i.RUC_code2, coef
estat ovtest
logit Wet Baptist Catholic Percent_nonwhite i.RUC_code2, coef
logistic Wet Baptist Catholic Percent_nonwhite i.RUC_code2, coef
logit Wet Baptist Catholic Percent_nonwhite i.RUC_code2
estat ovtest
logistic Wet Baptist Catholic Percent_nonwhite i.RUC_code2
estat ovtest
estat aic
estat ic
reg Wet Baptist Catholic Percent_nonwhite RUC_code2
estat ic
logistic Wet Baptist Catholic Percent_nonwhite i.RUC_code2
estat ic
logistic Wet Baptist Catholic Percent_nonwhite i.RUC_code2
logistic Wet Baptist Catholic Percent_nonwhite RUC_code2
estat ic
probit Wet Baptist Catholic Percent_nonwhite RUC_code2
predict probit_predict, xb
estat classification
set obs 121
replace Baptist = 15 in 121
replace Catholic = 4 in 121
replace Percent_nonwhite = 5 in 121
replace RUC_code = "4" in 121
logistic Wet Baptist Catholic Percent_nonwhite RUC_code2
predict logit_predict, p
replace RUC_code2 = 4 in 121
drop logit_predict
predict logit_predict, p
drop logit_predict
replace Catholic = 50 in 121
predict logit_predict, p
margins Baptist, at (Baptist =(15))
margins Baptist, at (Baptist =15)
margins, at(Baptist=(15))
margins, at(Catholic=(50))
margins, at(Percent_nonwhite=(5))
margins, at(RUC_code2=(5))
