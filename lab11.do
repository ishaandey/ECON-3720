use "/Users/ishaandey/Documents/UVA Coursework/Spring 2019/ECON 3720/Lab 11/Lab 11.dta"
encode day_of_week, generate(day_of_week2)
encode sea_conditions, generate(sea_conditions2)
reg Lnprice i.sea_conditions2
test (2.sea_conditions2 3.sea_conditions2)
predict pred_Lnprice, xb
reg Lnqty pred_Lnprice b1.day_of_week2
display (-.946192 + .5635262)/.3596387
display 1-ttail(111,-1.0640284)
ivregress 2sls Lnqty b1.day_of_week2 (Lnprice = i.sea_conditions2), first small
estat firststage
estat overid
estat endog
reg Lnprice Lnqty i.sea_conditions2
reg Lnqty i.day_of_week2 i.sea_conditions2
test (2.day_of_week2 3.day_of_week2 4.day_of_week2 5.day_of_week2)
ivregress 2sls Lnprice i.sea_conditions2 (Lnqty = i.day_of_week2), small
estat overid
estat endog
