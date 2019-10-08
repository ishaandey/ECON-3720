log using "/Users/ishaandey/Documents/UVA 2018-19/Spring 2019/ECON 3720/Recitations/heterosked.smcl", append
use "/Users/ishaandey/Documents/UVA 2018-19/Spring 2019/ECON 3720/Lab 9/Lab 9.dta"
display ttail(84,.025)
display invttail(84,.025)
display 295.2079+1.9886097*60.43193
display 295.2079-1.9886097*60.43193
reg Price Lotsize Sqrft Bdrms
estat ovtest
predict resids_price, residuals
twoway (scatter resids_price pred_price)
twoway (scatter resids_price Sqrft)
estat hettest, iid
estat imtest, white
reg Price Lotsize Sqrft Bdrms, robust
reg Price Lotsize Sqrft Bdrms, vce(hc3)
estat ovtest
reg Price Lotsize Sqrft Bdrms, robust
estat ovtest
reg lnprice lnsqrft lnlotsize lnbdrms
estat ovtest
display .7161486 + .1692116 + .1004995
test (_b[lnlotsize] + _b[lnsqrft]+ _b[lnbdrms] = 1)
test (lnlotsize + lnsqrft + lnbdrms = 1)
gen pred_lnprice, xb
predict pred_lnprice, xb
predict resid_lnprice, residuals
twoway (scatter resid_lnprice pred_lnprice)
twoway (scatter resid_lnprice lnsqrft)
estat hettest, iid
estat imtest, white
predict resid_lnprice, stdf
predict SE_lnforecast, stdf
drop SE_lnforecast
drop pred_lnprice
display ln(8500)
display ln(2100)
display ln(3)
replace lnlotsize = 9.0478214 in 89
replace lnsqrft = 7.6496926 in 89
replace lnbdrms = 1.0986123 in 89
predict SE_lnforecast, stdf
predict pred_lnprice, xb
display 5.697965+1.9886097*.1876026
display 5.697965-1.9886097*.1876026
display exp(6.0710334)
display exp(5.3248966)
gen m_hat_t = exp(pred_lnprice)
regress Price m_hat_t, noconstant
predict pred_logmodel, xb
display 1 – ((248535.622/88-3-1) /  (917280.678/88-1))
display ((248535.622/88-3-1) /  (917280.678/88-1))
display 1- .2705905
