#data_unstacked<-read.csv("specimenDate_ageDemographic-unstacked.csv")
#data_stacked<-read.csv("specimenDate_ageDemographic-stacked.csv")
dataSDerby<-data_stacked%>%filter(areaName=="South Derbyshire" & date>="2021-01-01")
dataSDerby%>%ggplot(aes(x=date,y=newCasesBySpecimenDateRollingRate,color=age,group=age))+geom_line()
dataSDerby_baby<-dataSDerby%>%filter(age=="0_4")
dataSDerby_baby%>%ggplot(aes(x=date,y=newCasesBySpecimenDateRollingRate,group=age))+geom_line()



testdate<-dataSDerby%>%group_by(date)%>%summarize(mean=mean(newCasesBySpecimenDateRollingRate))
testdate
