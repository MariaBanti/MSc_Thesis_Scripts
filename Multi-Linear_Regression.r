DF_F_LU$Date<-NULL
DF_F_LU$Station_ID<-NULL

#Apply Linear Regression
SM.LU.multreg<-lm(Soil_Moisture~SMAP_Value+NDVI_Mean_Value+Air_Temp+Precipitation+LandUse,data=DF_F_LU)

summary(SM.LU.multreg)