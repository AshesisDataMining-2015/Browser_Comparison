#Browser.R,agaglo  17/04/15


setwd("C:/Users/User/Documents/Final-Year/Second-Semester/Data-Mining/Browser_Comparison")
browser = list.files()
#read in content of january dataset into variable month1
month1 = read.csv("Browsers_for_January_2015.csv",header=TRUE)
summary(month1)
str(month1)
#read in content of febuary dataset into variable month2
month2 = read.csv("Browsers_for_February_2015.csv",header=TRUE)
summary(month2)
#read in content of March dataset into variable month3
month3 = read.csv("Browsers_for_March_2015.csv",header=TRUE)
summary(month3)
#read in content of April dataset into variable month4
month4 = read.csv("Browsers_for_April_2015.csv",header=TRUE)
summary(month4)
#exploring different forms of plot sequence
allmonth= rbind(month1,month2,month3,month4)
allmonth
#drawing graphs to see the relationship between the different browsers.
boxplot(allmonth$Chrome,allmonth$Mobile.Safari,allmonth$Internet.Explorer,allmonth$Android.Webkit,allmonth$Firefox,allmonth$Others,names=c("chrome","Mob-saf","Explorer","Android","firefox","others"),horizontal=TRUE,xlab="Browsers",ylab="Usage of Browser %")
#to observe the browser used most frequently during weekdays
#the command below shows the different levels i have for my month based on these i can group the 
#weeks within the month; from sun through to saturday.
allmonth[,1]
weekdays = c("Thu","Fri","Sat","Sun","Mon","Tue","Wed")
dayno = 1:97
weekdayno = (dayno+3)%%7
#to get the total week of the month which is 7
weekdayno = weekdayno + 1
days = weekdays[weekdayno]
fractions = allmonth[,-1]
#with the command below i should be able to get a level of 7
#from mon through to sun
days = as.factor(days)
#now to do comparison on the browsers during the weekends
boxplot(fractions[,1] ~ days)  #for chrome
boxplot(fractions[,2] ~ days)  #for Mobile.Safari
boxplot(fractions[,3] ~ days)  #for Internet.Explorer
boxplot(fractions[,4] ~ days)  #for Android.Webkit
boxplot(fractions[,5] ~ days)  #for Firefox
boxplot(fractions[,6] ~ days)  #for Others
#boxplot(fractions[,6] ~ days,col = c("red","sienna","palevioletred1","royalblue2","blue",))
boxplot(fractions[,6] ~ days,col = rainbow(12))
#analysing the browser usage for two past years 2013 and 2014
year13 = read.csv("Browser_for_2013_Year.csv",header=TRUE)
year14 = read.csv("Browsers_for_2014_Year.csv",header=TRUE)
summary(year13)
year15 = read.csv("Browsers_for_2015_Year.csv",header=TRUE)
summary(year15)
#exploring the data usage on three time periods,in this case 2013,2014,2015
allyear = rbind(year13,year14,year15)
boxplot(allyear$Chrome,allmonth$Mobile.Safari,allmonth$Internet.Explorer,allmonth$Android.Webkit,allmonth$Firefox,allmonth$Others,names=c("chrome","Mob-saf","Explorer","Android","firefox","others"),horizontal=TRUE,xlab="Browsers",ylab="Usage of Browser %")
boxplot(allyear,col= rainbow(12))