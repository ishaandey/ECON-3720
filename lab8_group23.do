use "/Users/ishaandey/Documents/UVA 2018-19/Spring 2019/ECON 3720/Lab 8/Lab 8.dta"
gen time = tm(1980m0) + _n -1
log using "/Users/ishaandey/Documents/UVA 2018-19/Spring 2019/ECON 3720/Lab 8/lab8_log.smcl"
use "/Users/ishaandey/Documents/UVA 2018-19/Spring 2019/ECON 3720/Lab 8/Lab 8.dta"
gen time = tm(1980m1) + _n - 1
gen death_rate = deadly_accidents / accidents
sum accidents deadly_accidents weekend speed_law belt_law month unemploy time death_rate
reg death_rate unemploy speed_law belt_law weekend time i.month
test (2.month 3.month 4.month 5.month 6.month 7.month 8.month 9.month 10.month 11.month 12.month)
predict step2_resid, residuals
twoway (scatter step2_resid time)
twoway (scatter step2_resid L.time)
tsset time, monthly
twoway (scatter step2_resid L.time)
twoway (scatter step2_resid L.step2_resid)
reg step2_resid unemploy speed_law belt_law weekend time i.month L.step2_resid
display 107*0.0806 
display invchitest(1,.01)
display invchi(1,.01)
display ttest(1,.05
display ttest(1,.05)
display invchi2tail(1,.01)
reg step2_resid unemploy speed_law belt_law weekend time i.month L.step2_resid
estat bgodfrey, nomiss0
reg death_rate unemploy speed_law belt_law weekend time i.month
estat bgodfrey, nomiss0
 estat dwatson
display dstat(17,108)
display dstat(17,108,0.05)
display invdtail(17,108)
death_rate unemploy speed_law belt_law weekend time i.month
 prais death_rate unemploy speed_law belt_law weekend time i.month, rhotype(regress) corc ssesearch
display 108^0.25
 newey death_rate unemploy speed_law belt_law weekend time i.month, lag(3)
test (2.month 3.month 4.month 5.month 6.month 7.month 8.month 9.month 10.month 11.month 12.month)
 prais death_rate unemploy speed_law belt_law weekend time i.month, rhotype(regress) corc ssesearch
test (2.month 3.month 4.month 5.month 6.month 7.month 8.month 9.month 10.month 11.month 12.month)
display mean(accidents)
display 0.0006757*42831.23
display 0.0006542*42831.23
display -0.000298*42831.23
display -0.0002494*42831.23 
reg accidents weekend speed_law belt_law month unemploy time
reg accidents weekend speed_law belt_law i.month unemploy time
reg accidents weekend speed_law belt_law unemploy time i.month 
reg death_rate unemploy speed_law belt_law weekend time i.month
test (2.month 3.month 4.month 5.month 6.month 7.month 8.month 9.month 10.month 11.month 12.month)
reg accidents unemploy speed_law belt_law weekend time i.month
test (2.month 3.month 4.month 5.month 6.month 7.month 8.month 9.month 10.month 11.month 12.month)
predict step1_resid, residuals
twoway (scatter step1_resid time)
twoway (scatter step2_resid L.time)
estat bgodfrey, nomiss0
 estat dwatson
display 1-(1.14555/2)
 prais accidents unemploy speed_law belt_law weekend time i.month, rhotype(regress) corc ssesearch
 newey accidents unemploy speed_law belt_law weekend time i.month, lag(3)
test (2.month 3.month 4.month 5.month 6.month 7.month 8.month 9.month 10.month 11.month 12.month)
 prais accidents unemploy speed_law belt_law weekend time i.month, rhotype(regress) corc ssesearch
test (2.month 3.month 4.month 5.month 6.month 7.month 8.month 9.month 10.month 11.month 12.month)
