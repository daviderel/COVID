
data_stacked<-read.csv("specimenDate_ageDemographic-stacked.csv")
data<-data_stacked%>%filter(areaName=="England" & date>="2020-12-01")
data[is.na(data)]<-0
data$date<-as.Date(data$date)
data<-data%>%group_by(date)%>%mutate(mean_total=mean(newCasesBySpecimenDateRollingRate))%>%ungroup()

data%>%ggplot(aes(x=date,y=newCasesBySpecimenDateRollingRate,color=age,group=age))+geom_line()

data%>%filter(age=="0_4")%>%ggplot(aes(x=date))+geom_line(aes(y=newCasesBySpecimenDateRollingRate,group=age))+geom_line(aes(y=mean_total,group=age))


data%>%filter(age=="80_84" | age=="85_89" | age=="90+")%>%
   ggplot(aes(x=date))+geom_line(aes(y=newCasesBySpecimenDateRollingRate,group=age,color=age))+
    geom_line(aes(y=mean_total,group=age))
    
data_elderly<-data%>%filter(age=="80_84" | age=="85_89" | age=="90+")%>%group_by(date)%>%
    summarize(rate=mean(newCasesBySpecimenDateRollingRate), mean_total=mean(mean_total))

data_elderly%>%ggplot(aes(x=date))+geom_line(aes(y=rate,group=1))+geom_line(aes(y=mean_total,group=1))



variation_elderly<-data_elderly%>%summarize(date=date[1:(length(date)-1)],rate_diff=diff(rate),mean_diff=diff(mean_total))

variation_elderly%>%ggplot(aes(x=date))+geom_line(aes(y=rate_diff,group=1))+geom_line(aes(y=mean_diff,group=1))

#the below is wrong
variation_elderly%>%ggplot(aes(x=date))+geom_line(aes(y=(mean_diff+rate_diff/mean_diff),group=1)) + scale_x_date(date_labels = "%Y (%b)")



#data%>%filter(age=="80_84" | age=="85_89" | age=="90+")%>%
#  ggplot(aes(x=mean_total))+geom_line(aes(y=newCasesBySpecimenDateRollingRate,group=age,color=age))
#  geom_line(aes(y=mean_total,group=age))

#%>%ggplot(aes(x=date,y=mean,group=date))+geom_line()

