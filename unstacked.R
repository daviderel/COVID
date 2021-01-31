#data_unstacked<-read.csv("specimenDate_ageDemographic-unstacked.csv")
#data_stacked<-read.csv("specimenDate_ageDemographic-stacked.csv")
dataDerby<-data_unstacked%>%filter(areaName=="Derby" & date>"2021-01-01")
dataDerby80PlusSpecimen<-summarise(dataDerby,date=date,cases=newCasesBySpecimenDate.80_84+newCasesBySpecimenDate.85_89+newCasesBySpecimenDate.90.)
dataDerby80PlusSpecimen%>%ggplot(aes(date,cases))+geom_point()




dataDerbyRates<-dataDerby%>%select(c(starts_with("newCasesBySpecimenDateRollingRate") , date))


dataDerbyRates%>%ggplot(aes(date))+geom_point(aes(y=newCasesBySpecimenDateRollingRate.0_4))+geom_line(aes(y=newCasesBySpecimenDateRollingRate.0_4))

  
  
  #summarise(dataDerby,date=date,rate80=newCasesBySpecimenDateRollingRate.80_84+
  #                              newCasesBySpecimenDateRollingRate.85_89+
  #                               newCasesBySpecimenDateRollingRate.90.,rateyoung=newCasesBySpecimenDateRollingRate.0_4+
  #                               newCasesBySpecimenDateRollingRate.5_9+
  #                               newCasesBySpecimenDateRollingRate.10_14+
  #                               newCasesBySpecimenDateRollingRate.15_19+
  #                               newCasesBySpecimenDateRollingRate.20_24+
  #                               newCasesBySpecimenDateRollingRate.25_29+
  #                               newCasesBySpecimenDateRollingRate.30_34+
  #                               newCasesBySpecimenDateRollingRate.80_84)
dataDerby80PlusRate%>%ggplot(aes(date,rate))+geom_point()

