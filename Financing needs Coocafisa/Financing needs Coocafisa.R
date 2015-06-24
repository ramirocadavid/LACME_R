
# Import and clean data ---------------------------------------------------

# Bajar reportes de https://na5.salesforce.com/00O70000004rjlS y https://na5.salesforce.com/00O70000004rjgX 
# y guardarlos con el nombre del título del reporte
farm<-read.csv("AS - Inversión finca Coocafisa.csv", header=TRUE,sep=";",quote="\"",na.strings="",encoding="UTF-8")
nf<-dim(farm)[1]
farm<-farm[1:(nf-5),]
farm<-farm[complete.cases(farm[,3]),] #Remover las filas donde haya NAs en la columna 3

wm<-read.csv("AS - InversiónBeneficio húmedo Coocafisa.csv", header=TRUE,sep=";",quote="\"",na.strings="",encoding="latin1")
nwm<-dim(wm)[1]
wm<-wm[1:(nwm-5),]


# General Information -----------------------------------------------------

names(farm)
farmers<-length(unique((farm$Agricultor..LAC.Farmer.Details.Record.Id)))
farms<-dim(farm)[1]
names(wm)
farmers.w.wm<-length(unique(wm$LÃ.nea.Base..Agricultor..LAC.Farmer.Details.Record.Id))
wetmills<-dim(wm)[1]
wm.per.farmer<-wetmills/farmers
general.info<-data.frame(
  Variable=c("Total farmers","Farms","Wetmills","Farmers with wetmill"),
  Valor=c(farmers,farms,wetmills,farmers.w.wm))


# Financing needs --------------------------------------------------------




