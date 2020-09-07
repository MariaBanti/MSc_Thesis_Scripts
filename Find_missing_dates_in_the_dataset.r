#In a dataframe
DateRange <- seq(min(agg4.2$Date), max(agg4.2$Date), by = 1) 
DateRange[!DateRange %in% agg4.2$Date] 

#In a csv file
DateRange<-seq(min(STATION_4_SANI_2017.2018$Date),max(STATION_4_SANI_2017.2018$Date),by=1)
DateRange[!DateRange %in% STATION_4_SANI_2017.2018$Date] 

#How many NA values there are in a column of a dataframe
sum(is.na(DF_Station_1[2]))
length(which(is.na(DF_Station_1[,2])==T))
length(which(is.na(DF_Station_1[2])==T))

#The function na.omit() returns the object with listwise deletion of missing values. 
newdata <- na.omit(DF_Station_1)

dat<-as.data.frame(DF_Station_1$`SM Value_1`)
newdata <- na.omit(dat)

##Percentage of Nas
#For the whole dataframe
sum(is.na(x))/prod(dim(x))

#For a column 
apply(x, 2, function(col)sum(is.na(col))/length(col))