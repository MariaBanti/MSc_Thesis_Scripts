###############Graphs for each variable over time - Example:Station ID=1 / Loutra

library(ggplot2)

## Centered title as default: 
theme_update(plot.title = element_text(hjust = 0.5))

#SMAP Value
p<-ggplot(DF_Station_1,aes(DF_Station_1$Date,DF_Station_1$`SM Value_1`))+geom_line()
p+labs(x='Date',y='SMAP Value (%)')+ggtitle('Station 1 SMAP Soil Moisture Value over time')+
theme(plot.title = element_text(hjust = 0.5))

ggsave("S1_SMAP_Value.png", width = 6, height = 4)

#NDVI Mean Value
i<-ggplot(DF_Station_1,aes(DF_Station_1$Date,DF_Station_1$`NDVI Mean Values_1`))+geom_line()
i+labs(x='Date',y='NDVI Mean Value')+ggtitle('Station 1 NDVI Mean Value over time')

ggsave("S1_NDVI_Mean_Value.png", width = 6, height = 4)

#In Situ Soil Moisture 
#DF_Station_1$Soil_Hum_1<-(DF_Station_1$Soil_Hum_1)/100
j<-ggplot(DF_Station_1,aes(DF_Station_1$Date,DF_Station_1$Soil_Hum_1))+geom_line()
j+labs(x='Date',y='In Situ Soil Moisture (%)')+ggtitle('Station 1 In Situ Soil Moisture over time')

ggsave("S1_InSitu_Soil_Moisture.png", width = 6, height = 4)

#In Situ Air Temperature
k<-ggplot(DF_Station_1,aes(DF_Station_1$Date,DF_Station_1$Air_Temp_1))+geom_line()
k+labs(x='Date',y='In Situ Air Temperature (Celsius degrees)')+ggtitle('Station 1 In Situ Air Temperature over time')

ggsave("S1_Air_Temperature.png", width = 6, height = 4)

#In Situ Precipitation
l<-ggplot(DF_Station_1,aes(DF_Station_1$Date,DF_Station_1$Precipitation_1))+geom_line()
l+labs(x='Date',y='In Situ Precipitation (mm)')+ggtitle('Station 1 In Situ Precipitation over time')

ggsave("S1_Precipitation.png", width = 6, height = 4)



###############Graphs for each variable over time for all stations

#SMAP Value
P<-ggplot(DF_Final,aes(DF_Final$Date,DF_Final$SMAP_Value))+geom_line( aes(colour=factor(Station_ID)),size=1)
p+scale_colour_manual(name='Station Name',labels=c('1'='Loutra','2'=' Xrysopigi','3'='Pontokerasia','4'='Sani','5'='Cosmopolis'),values=c(' chartreuse4','brown4','darkmagenta','darkorange2','deepskyblue4'))
+ggtitle(‘SMAP Soil Moisture Value over time’)+theme(plot.title = elemen t_text(hjust = 0.5))
+xlab('Date')
+ylab('SMAP Value (%)')

ggsave('SMAP_Value.png',width=6,height=4)

#NDVI Mean Value
i<-ggplot(DF_Final,aes(DF_Final$Date,DF_Final$NDVI_Mean_Value))+geom_ line(aes(colour=factor(Station_ID)),size=1)
i+scale_colour_manual(name='Station Name',labels=c('1'='Loutra','2'=' Xrysopigi','3'='Pontokerasia','4'='Sani','5'='Cosmopolis'),values=c(' chartreuse4','brown4','darkmagenta','darkorange2','deepskyblue4'))
+ggtitle('NDVI Mean Value over time')+theme(plot.title = element_text(hj ust = 0.5))
+xlab('Date')
+ylab('NDVI Mean Value')

ggsave('NDVI_Mean_Value.png',width=6,height=4)

#In Situ Soil Moisture
j<-ggplot(DF_Final,aes(DF_Final$Date,DF_Final$Soil_Moisture))+geom_line(aes(colour=factor(Station_ID)),size=1)
j+scale_colour_manual(name='Station Name',labels=c('1'='Loutra','2'='Xrysopigi','3'='Pontokerasia','4'='Sani','5'='Cosmopolis'),values=c('chartreuse4','brown4','darkmagenta','darkorange2','deepskyblue4'))
+ggtitle('In Situ Soil Moisture over time')+theme(plot.title = element_text(hjust = 0.5))
+xlab('Date')
+ylab('In Situ Soil Moisture (%)')

ggsave('InSitu_SoilMoisture.png',width=6,height=4

#In Situ Air Temperature
k<-ggplot(DF_Final,aes(DF_Final$Date,DF_Final$Air_Temp))+geom_line(ae s(colour=factor(Station_ID)),size=1)
k+scale_colour_manual(name='Station Name',labels=c('1'='Loutra','2'=' Xrysopigi','3'='Pontokerasia','4'='Sani','5'='Cosmopolis'),values=c(' chartreuse4','brown4','darkmagenta','darkorange2','deepskyblue4'))
+gg title('In Situ Air Temperature over time')+theme(plot.title = element_text(hj ust = 0.5))
+xlab('Date')
+ylab('In Situ Air Temperature (Celsius degrees)')

ggsave('Air_Temperature.png',width=6,height=4)

#In Situ Precipitation
l<-ggplot(DF_Final,aes(DF_Final$Date,DF_Final$Precipitation))+geom_li ne(aes(colour=factor(Station_ID)),size=1)
l+scale_colour_manual(name='Station Name',labels=c('1'='Loutra','2'=' Xrysopigi','3'='Pontokerasia','4'='Sani','5'='Cosmopolis'),values=c(' chartreuse4','brown4','darkmagenta','darkorange2','deepskyblue4'))
+gg title('In Situ Precipitation over time')+theme(plot.title = element_text(hjus t = 0.5))
+xlab('Date')
+ylab('In Situ Precipitation(mm)')

ggsave('Precipitation.png',width=6,height=4)


