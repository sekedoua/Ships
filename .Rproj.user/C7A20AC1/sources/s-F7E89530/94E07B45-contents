library(shiny)
library(leaflet)
library(dplyr)
library(shiny)
library(tidyr)
library(tidyverse)
library(varhandle)
library(plotly)
library(reshape2) 
library(qdap)
library(xts)
library(dygraphs)

library(plotly)
require(scales)
require(gridExtra)
library(dslabs)

library(ggthemes)

library(rAmCharts)
library(rainbow)
head(x = get("iris", "package:datasets"), n = 3)
data("data_bar")

amBarplot(x = "country", y = "visits", data = data_bar, 
          show_values = TRUE, labelRotation = -90)

dfPC = read.csv(file="PhysicoChimie.csv",header=TRUE, sep=";", stringsAsFactors = F)

dfPC_hap = read.csv(file="physico_Chimie_propre_HAP.csv",header=TRUE, sep=",", stringsAsFactors = F)
dfPC_metx = read.csv(file="physico_Chimie_propre_metaux.csv",header=TRUE, sep=",", stringsAsFactors = F)
dfPC_pesti= read.csv(file="physico_Chimie_propre_PESTICIDES.csv",header=TRUE, sep=",", stringsAsFactors = F)



# colnames(dfPC) = c("Site", "Station", "DtHechanti","Parametre","Valeur","Symbol","Signe","LimiteInf","Labo","Methode")
# # (dfPC,"dfPC_propre.csv")
# # remplacer les virgule par des point
# 
# 
# dfPC$Valeur<-str_replace_all(dfPC$Valeur, ",", ".")
# 
# dfPC$LimiteInf<-str_replace_all(dfPC$LimiteInf, ",", ".")
# 
# dfPC2
# 
# 
# dfPC$Valeur<-as.double(dfPC$Valeur)
# dfPC$LimiteInf<-as.double(dfPC$LimiteInf)
# 
# write.csv(dfPC,"dfPC_propre.csv")
# 
# 
# export_station <- dfPC %>% group_by(Site, Station) %>% summarize(count=n())
# export_param <- dfPC %>% group_by(Parametre, Station,Site) %>% summarize(count=n())
# 
# view(dfPC %>% group_by(Site, Station) %>% summarize(count=n()))
# 
# dfPC$DtHechanti <- strptime(dfPC$DtHechanti,"%d/%m/%Y %H:%M:%S")
# dfPC$DtHechanti <-as.POSIXct(dfPC$DtHechanti)

#dfPC_hap$DtHechanti <- strptime(dfPC_hap$DtHechanti,"%d/%m/%Y %H:%M:%S")

dfPC_hap$DtHechanti<- strptime(str_glue(substr(dfPC_hap$DtHechanti,9,10),"/",substr(dfPC_hap$DtHechanti,6,7),"/",substr(dfPC_hap$DtHechanti,1,4)," ",substr(dfPC_hap$DtHechanti,12,19)),"%d/%m/%Y %H:%M:%S")

dfPC_hap$DtHechanti<-str_replace_all(dfPC_hap$DtHechanti,"-","/")
dfPC_metx$DtHechanti<-str_replace_all(dfPC_metx$DtHechanti,"-","/")
dfPC_pesti$DtHechanti<-str_replace_all(dfPC_pesti$DtHechanti,"-","/")
# for (  x in  1:length(dfPC_hap$DtHechanti))
#   dfPC_hap$DtHechanti[x]<- strptime(str_glue(substr(dfPC_hap$DtHechanti[x],9,10),"/",substr(dfPC_hap$DtHechanti[x],6,7),"/",substr(dfPC_hap$DtHechanti[x],1,4)," ",substr(dfPC_hap$DtHechanti[x],12,19)),"%d/%m/%Y %H:%M:%S")

  
dfPC_hap_BO3 = read.csv(file="dfPC_hap_BO3.csv",header=TRUE, sep=",", stringsAsFactors = F)
dfPC_hap_vAB= read.csv(file="dfPC_hap_VAB.csv",header=TRUE, sep=",", stringsAsFactors = F)
dfPC_hap_EcoQuaChez = read.csv(file="dfPC_hap_EcoQuaChez.csv",header=TRUE, sep=",", stringsAsFactors = F)

dfPC_metx_BO3 = read.csv(file="dfPC_metx_BO3.csv",header=TRUE, sep=",", stringsAsFactors = F)
dfPC_metx_EcoQuaChez = read.csv(file="dfPC_metx_EcoQuaChez.csv",header=TRUE, sep=",", stringsAsFactors = F)
dfPC_metx_VAB = read.csv(file="dfPC_metx_VillauB.csv",header=TRUE, sep=",", stringsAsFactors = F)

dfPC_pesti_BO3= read.csv(file="dfPC_pesti_BO3.csv",header=TRUE, sep=",", stringsAsFactors = F)
dfPC_pesti_EcoQuaChez= read.csv(file="dfPC_pesti_EcoQuaChez.csv",header=TRUE, sep=",", stringsAsFactors = F)
dfPC_pesti_VAB= read.csv(file="dfPC_pesti_VillauB.csv",header=TRUE, sep=",", stringsAsFactors = F)





dfPC_hap_BO3$DtHechanti<-str_replace_all(dfPC_hap_BO3$DtHechanti,"-","/")
dfPC_hap_BO3$DtHechanti <- strptime(dfPC_hap_BO3$DtHechanti,"%Y/%m/%d %H:%M")
dfPC_hap_BO3$DtHechanti <-as.POSIXct(dfPC_hap_BO3$DtHechanti)


dfPC_hap_vAB$DtHechanti<-str_replace_all(dfPC_hap_vAB$DtHechanti,"-","/")
dfPC_hap_vAB$DtHechanti <- strptime(dfPC_hap_vAB$DtHechanti,"%Y/%m/%d %H:%M")
dfPC_hap_vAB$DtHechanti <-as.POSIXct(dfPC_hap_vAB$DtHechanti)

dfPC_hap_EcoQuaChez$DtHechanti<-str_replace_all(dfPC_hap_EcoQuaChez$DtHechanti,"-","/")
dfPC_hap_EcoQuaChez$DtHechanti <- strptime(dfPC_hap_EcoQuaChez$DtHechanti,"%Y/%m/%d") #toujours vérifier lordre et ne nombre jmahms
dfPC_hap_EcoQuaChez$DtHechanti <-as.POSIXct(dfPC_hap_EcoQuaChez$DtHechanti)



dfPC_metx_BO3$DtHechanti<-str_replace_all(dfPC_metx_BO3$DtHechanti,"-","/")
dfPC_metx_BO3$DtHechanti <- strptime(dfPC_metx_BO3$DtHechanti,"%Y/%m/%d %H:%M")
dfPC_metx_BO3$DtHechanti <-as.POSIXct(dfPC_metx_BO3$DtHechanti)

dfPC_metx_EcoQuaChez$DtHechanti<-str_replace_all(dfPC_metx_EcoQuaChez$DtHechanti,"-","/")
dfPC_metx_EcoQuaChez$DtHechanti <- strptime(dfPC_metx_EcoQuaChez$DtHechanti,"%Y/%m/%d %H:%M")
dfPC_metx_EcoQuaChez$DtHechanti <-as.POSIXct(dfPC_metx_EcoQuaChez$DtHechanti)

dfPC_metx_VAB$DtHechanti<-str_replace_all(dfPC_metx_VAB$DtHechanti,"-","/")
dfPC_metx_VAB$DtHechanti <- strptime(dfPC_metx_VAB$DtHechanti,"%Y/%m/%d %H:%M")
dfPC_metx_VAB$DtHechanti <-as.POSIXct(dfPC_metx_VAB$DtHechanti)



dfPC_pesti_BO3$DtHechanti<-str_replace_all(dfPC_pesti_BO3$DtHechanti,"-","/")
dfPC_pesti_BO3$DtHechanti <- strptime(dfPC_pesti_BO3$DtHechanti,"%Y/%m/%d %H:%M")
dfPC_pesti_BO3$DtHechanti <-as.POSIXct(dfPC_pesti_BO3$DtHechanti)

dfPC_pesti_EcoQuaChez$DtHechanti<-str_replace_all(dfPC_pesti_EcoQuaChez$DtHechanti,"-","/")
dfPC_pesti_EcoQuaChez$DtHechanti <- strptime(dfPC_pesti_EcoQuaChez$DtHechanti,"%Y/%m/%d %H:%M")
dfPC_pesti_EcoQuaChez$DtHechanti <-as.POSIXct(dfPC_pesti_EcoQuaChez$DtHechanti)

dfPC_pesti_VAB$DtHechanti<-str_replace_all(dfPC_pesti_VAB$DtHechanti,"-","/")
dfPC_pesti_VAB$DtHechanti <- strptime(dfPC_pesti_VAB$DtHechanti,"%Y/%m/%d %H:%M")
dfPC_pesti_VAB$DtHechanti <-as.POSIXct(dfPC_pesti_VAB$DtHechanti)

dfPC_hap$DtHechanti <-as.POSIXct(dfPC_hap$DtHechanti)

dfPC_metx$DtHechanti <- strptime(dfPC_metx$DtHechanti,"%d/%m/%Y %H:%M:%S")
dfPC_metx$DtHechanti <-as.POSIXct(dfPC_metx$DtHechanti)
dfPC_pesti$DtHechanti <- strptime(dfPC_pesti$DtHechanti,"%d/%m/%Y %H:%M:%S")
dfPC_pesti$DtHechanti <-as.POSIXct(dfPC_pesti$DtHechanti)

#suppression des NA
dfPC_hap <- dfPC_hap %>% filter(!is.na(Valeur))
dfPC_metx <- dfPC_metx %>% filter(!is.na(Valeur))
dfPC_pesti <- dfPC_pesti %>% filter(!is.na(Valeur))

#     strsplit("PZ6 / PDM_0006", " / ")[[1]][2]
#Abeviation_Station
      
      # dfPC_hap$Station<-strsplit(dfPC_hap$Station, " / ")[[1]][2]
      # dfPC_metx$Station<-strsplit(dfPC_metx$Station, " / ")[[1]][2]
      # dfPC_pesti$Station<-strsplit(dfPC_pesti$Station, " / ")[[1]][2]
 

          for (  x in  1:length(strsplit(dfPC_hap$Station, " / ")) ) 
            dfPC_hap$Station[x]<- strsplit(dfPC_hap$Station, " / ")[[x]][2]
    
      for (  x in  1:length(strsplit(dfPC_metx$Station, " / ")) ) 
        dfPC_metx$Station[x]<- strsplit(dfPC_metx$Station, " / ")[[x]][2]
      
      for (  x in  1:length(strsplit(dfPC_pesti$Station, " / ")) ) 
        dfPC_pesti$Station[x]<- strsplit(dfPC_pesti$Station, " / ")[[x]][2]
      
      #Abbreviation parametres
      dfPC_hap$Parametre<- str_replace_all(dfPC_hap$Parametre,"Benzo","BbF")
      dfPC_hap$Parametre<- str_replace_all(dfPC_hap$Parametre,"fluoranthÃ¨ne","")
      dfPC_hap$Parametre<- str_replace_all(dfPC_hap$Parametre," (11,12)(k) ","")
      dfPC_hap$Parametre<-gsub(" ", "", dfPC_hap$Parametre, fixed = TRUE)
      dfPC_hap$Parametre<- str_replace(dfPC_hap$Parametre,"NaphtalÃ¨ne solide","Nap")
      dfPC_hap$Parametre<- str_replace(dfPC_hap$Parametre,"NaphtalÃ¨nesolide","Nap")
      dfPC_hap$Parametre<- str_replace(dfPC_hap$Parametre, "AnthracÃ¨nesolide","Ant")
      dfPC_hap$Parametre<- str_replace(dfPC_hap$Parametre,"ChrysÃ¨ne","Chr")
      
#selection_stricte

dfPC_hap <- dfPC_hap %>% filter( Parametre  %in% 
    c("AnthracÃ¨ne solide",
      "BaAnt_f0.45um" ,
      "BaPyr_f0.45um" ,
      "Benzo (11,12)(k) fluoranthÃ¨ne", 
      "BkFla_f0.45um",
      "ChrysÃ¨ne"  ,
      "Fla_f0.45um","Fla_sol",
      "NaphtalÃ¨ne solide" ,
      "Pyr_f0.45um"
      ))
 
dfPC_metx <- dfPC_metx %>% filter( Parametre  %in% 
                                   c("As",
                                     "Cd" ,
                                     "Co",
                                      "Cr",
                                     "Cu",
                                     "Mo",
                                     "Ni",
                                     "Pb"  ,
                                     "Sr",
                                     "Ti",
                                     "V",
                                     "Zn"
                                     
                                   ))
# dfPC_pesti <- dfPC_pesti %>% filter( Parametre  %in% 
#                                      c("As",
#                                        "Cd" ,
#                                        "Co",
#                                        "Cr",
#                                        "Cu",
#                                        "Mo",
#                                        "Ni",
#                                        "Pb" ,
#                                        "Sr",
#                                        "Ti",
#                                        "V",
#                                        "Zn"
#                                        
#                                      ))

# [1] "Prairie de Mauves"               "Ã‰coquartier BottiÃ¨re-Chesnaie" "Bassin Ville au Blanc"           "Noue ZAC de la Brosse"          
# [5] "Bassin ChÃ©zine BO3"   
dfPC_hap_PDM <- dfPC_hap %>% filter( Site == "Prairie de Mauves")
dfPC_hap_VAB <- dfPC_hap %>% filter( Site == "Bassin Ville au Blanc")
dfPC_hap_EcoQuaChez <- dfPC_hap %>% filter( Site == "Ã‰coquartier BottiÃ¨re-Chesnaie")
dfPC_hap_NoueZacBr <- dfPC_hap %>% filter( Site ==  "Noue ZAC de la Brosse" )
dfPC_hap_BO3<- dfPC_hap %>% filter( Site ==  "Bassin ChÃ©zine BO3" )

write.csv(dfPC_hap_PDM,"dfPC_hap_PDM.csv")
write.csv(dfPC_hap_VAB,"dfPC_hap_VAB.csv")
write.csv(dfPC_hap_EcoQuaChez,"dfPC_hap_EcoQuaChez.csv")
write.csv(dfPC_hap_NoueZacBr,"dfPC_hap_NoueZacBr.csv")
write.csv(dfPC_hap_BO3,"dfPC_hap_BO3.csv")

 






# [1] "BV Pin Sec"                      "Prairie de Mauves"               "Ã‰coquartier BottiÃ¨re-Chesnaie" "Noue ZAC de la Brosse"          
# [5] "Bassin ChÃ©zine BO3"             "BV ChÃ©zine"                     "Autres sites LEE"                "AgglomÃ©ration Nantaise"        
# [9] "Bassin Ville au Blanc"

dfPC_metx_BVPINSEC<- dfPC_metx %>% filter( Site ==  "BV Pin Sec" )
dfPC_metx_BO3<- dfPC_metx %>% filter( Site ==  "Bassin ChÃ©zine BO3" )
dfPC_metx_PDM<- dfPC_metx %>% filter( Site ==  "Prairie de Mauves" )
dfPC_metx_EcoQuaChez<- dfPC_metx %>% filter( Site ==  "Ã‰coquartier BottiÃ¨re-Chesnaie" )
dfPC_metx_VillauB<- dfPC_metx %>% filter( Site ==  "Bassin Ville au Blanc")
dfPC_metx_BVChez<- dfPC_metx %>% filter( Site ==  "BV ChÃ©zine")
dfPC_metx_AutrLEE<- dfPC_metx %>% filter( Site ==  "Autres sites LEE" )
dfPC_metx_NantesAgglo<- dfPC_metx %>% filter( Site ==  "AgglomÃ©ration Nantaise"  )
dfPC_metx_NoueZacBr<- dfPC_metx %>% filter( Site ==  "Noue ZAC de la Brosse"  )

write.csv(dfPC_metx_BVPINSEC,"dfPC_metx_BVPINSEC.csv")
write.csv(dfPC_metx_BO3,"dfPC_metx_BO3.csv")
write.csv(dfPC_metx_PDM,"dfPC_metx_PDM.csv")
write.csv(dfPC_metx_EcoQuaChez,"dfPC_metx_EcoQuaChez.csv")
write.csv(dfPC_metx_VillauB,"dfPC_metx_VillauB.csv")
write.csv(dfPC_metx_BVChez,"dfPC_metx_BVChez.csv")
write.csv(dfPC_metx_AutrLEE,"dfPC_metx_AutrLEE.csv")
write.csv(dfPC_metx_NantesAgglo,"dfPC_metx_NantesAgglo.csv")
write.csv(dfPC_metx_NoueZacBr,"dfPC_metx_NoueZacBr.csv")

#[1] "Ã‰coquartier BottiÃ¨re-Chesnaie" "Bassin Ville au Blanc"           "Bassin ChÃ©zine BO3" 
dfPC_pesti_EcoQuaChez<- dfPC_pesti %>% filter( Site ==  "Ã‰coquartier BottiÃ¨re-Chesnaie"  )
dfPC_pesti_VillauB<- dfPC_pesti %>% filter( Site ==  "Bassin Ville au Blanc"  )
dfPC_pesti_BO3<- dfPC_pesti %>% filter( Site ==  "Bassin ChÃ©zine BO3"  )

write.csv(dfPC_pesti_EcoQuaChez,"dfPC_pesti_EcoQuaChez.csv")
write.csv(dfPC_pesti_VillauB,"dfPC_pesti_VillauB.csv")
write.csv(dfPC_pesti_BO3,"dfPC_pesti_BO3.csv")




write.csv(dfPC_hap,"physico_Chimie_propre_HAP.csv")
write.csv(dfPC_metx,"physico_Chimie_propre_metaux.csv")
write.csv(dfPC_pesti,"physico_Chimie_propre_PESTICIDES.csv")
#Abbreviation stations

# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"PZ5 / PDM_0005","PZ5")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station, "PZ7 / PDM_0007","PZ7")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"Puits 4 / PDM_0019","Puits 4")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"Puits 7 / PDM_0022","Puits 7")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"F4 / PDM_0077","F4")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"C1 / PDM_0068","C1")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"C2 / PDM_0069","C2")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"C3 / PDM_0070","C3")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"F1 / PDM_0076","F1")
# dfPC_hap_PDM$Station <- str_replace(dfPC_hap_PDM$Station,"PZ8 / PDM_0008","PZ8")




#Diagramme


ggplot(dfPC_hap_PDM, aes( Parametre, Valeur, colour = Parametre)) + 
  geom_boxplot()+facet_grid(rows = vars(Parametre),scales = "free")

#Top_graphs total
#HAP
ggplot(dfPC_hap, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+ coord_flip()+geom_jitter()+ facet_grid(Site ~ ., scale = "free_y")

ggplot(dfPC_hap, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+  geom_jitter()+ facet_grid(Site ~ ., scale = "free_y")
ggplot(dfPC_hap, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre)) +
  geom_boxplot()+  geom_jitter()+ facet_grid(Site ~ ., scale = "free_y")
#HAP
#MTX
ggplot(dfPC_metx, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+ coord_flip()+geom_jitter()+ facet_grid(Site ~ ., scale = "free_y")
ggplot(dfPC_metx, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+  geom_jitter()+ facet_grid(Site ~ ., scale = "free_y")

ggplot(dfPC_metx, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+  geom_jitter()+ facet_grid(Site ~ Station, scale = "free_y")
#MTX
#PESTI


ggplot(dfPC_pesti, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+ coord_flip()+geom_jitter()+ facet_grid(Site ~ ., scale = "free_y")
ggplot(dfPC_pesti, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+  geom_jitter()+ facet_grid(Site ~ ., scale = "free_y")

ggplot(dfPC_pesti, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+  geom_jitter()+ facet_grid(Site ~ Station, scale = "free_y")


ggplot(dfPC_pesti, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+  geom_jitter()+ facet_grid(Site ~ ., scale = "free_y") +
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())

ggplot(dfPC_pesti, aes(x=Parametre, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_boxplot()+  geom_jitter()+ facet_grid(Site ~ Station, scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())
 + theme(strip.text = element_text(margin = margin(5))
#PESTI


#Top_graphs total
#Top_graphs detail

 
  ggplot(dfPC_hap_PDM, aes( Parametre, Valeur, colour = Parametre)) + 
  geom_boxplot()+ coord_flip()+geom_jitter()+facet_grid(rows = vars(Station),scales = "free")+ theme_classic()

  

  
  ggplot(dfPC_hap_PDM, aes( Parametre, Valeur, colour = Parametre)) + 
  geom_boxplot()+geom_jitter()+facet_grid(rows = vars(Station),scales = "free")+ theme_classic()

ggplot(dfPC_hap_PDM, aes( Parametre, Valeur, colour = Parametre)) + 
  geom_boxplot()+geom_jitter()+facet_grid(rows = vars(Station),scales = "free")+ theme_classic()

ggplot(dfPC_pesti_BO3, aes( Parametre, Valeur, colour = Parametre)) + 
  geom_boxplot()+ coord_flip()+geom_jitter()+facet_grid(rows = vars(Station),scales = "free")+ theme_classic()

ggplot(dfPC_hap_PDM, aes( Parametre, Valeur, colour = Parametre)) + 
  geom_boxplot()+facet_grid(rows = vars(Station),scales = "free")

ggplot(dfPC_hap_PDM, aes( Parametre, Valeur, colour = Parametre)) + 
  geom_boxplot()+geom_jitter()+facet_grid(rows = vars(Station),scales = "free")

ggplot(dfPC_hap_PDM, aes(x=Parametre, y=Valeur, colour=Parametre,fill=Parametre))+
  geom_boxplot()


ggplot(dfPC_hap_PDM, aes(x=Parametre, y=Valeur, colour=Parametre,fill=Parametre))+
  geom_boxplot()+geom_jitter()

ggplot(dfPC_hap_PDM, aes(x=Parametre, y=Valeur, colour=Parametre))+
  geom_boxplot()+geom_jitter()

#Top_graphs detail


 
ggplot(dfPC_hap_PDM, aes(x=Parametre, y=Valeur, colour=Parametre))+
  geom_boxplot()+geom_jitter()


 
qplot(DtHechanti, Valeur, data = dfPC_hap, geom = "line", group = Parametre) +
  facet_grid(Parametre ~ ., scale = "free_y") +
  theme_bw() 

ggplot(dfPC_hap, aes(x=DtHechanti, y=Valeur, color=Parametre, group=Parametre,fill=Parametre)) +
  geom_line()+
  facet_grid(Site ~ ., scale = "free_y")

 
 
#TOP du TOP

ggplot(dfPC_hap_PDM, aes(x = Parametre, y = Valeur)) +
  geom_boxplot()+    facet_wrap(Station ~ ., scale = "free_y")+
 theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())

ggplot(dfPC_pesti, aes(x = Parametre, y = Valeur)) +
  geom_boxplot()+    facet_wrap(Station ~ ., scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())

ggplot(dfPC_hap, aes(x = Parametre, y = Valeur)) +
  geom_boxplot()+    facet_wrap(Station ~ ., scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())

ggplot(dfPC_metx, aes(x = Parametre, y = Valeur)) +
  geom_boxplot()+    facet_wrap(Station ~ ., scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())
#TOP du TOP

#TOP du TOP AVEC COULEUR
ggplot(dfPC_hap_PDM, aes(x = Parametre, y = Valeur,colour = Parametre)) +
  geom_boxplot()+    facet_wrap(Station ~ ., scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())
ggplot(dfPC_pesti, aes(x = Parametre, y = Valeur,colour = Parametre)) +
  geom_boxplot()+    facet_wrap(Station ~ ., scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())
ggplot(dfPC_hap, aes(x = Parametre, y = Valeur,colour = Parametre)) +
  geom_boxplot()+    facet_wrap(Station ~ ., scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())

ggplot(dfPC_metx, aes(x = Parametre, y = Valeur,colour = Parametre)) +
  geom_boxplot()+    facet_wrap(Station ~ ., scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())

ggplot(dfPC_metx, aes(x = Parametre, y = Valeur,colour = Parametre)) +
  geom_boxplot()+    facet_wrap(Station ~ Site, scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())
#TOP du TOP AVEC COULEUR
#TOP du TOP+ AVEC COULEUR
ggplot(dfPC_hap, aes(x = Parametre, y = Valeur,colour = Parametre)) +
  geom_boxplot()+    facet_wrap(Site ~ Station, scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())



ggplot(dfPC_pesti, aes(x = Parametre, y = Valeur,colour = Parametre)) +
  geom_boxplot()+    facet_wrap(Site ~ Station, scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())


ggplot(dfPC_metx, aes(x = Parametre, y = Valeur,colour = Parametre)) +
  geom_boxplot()+    facet_wrap(Site ~ Station, scale = "free_y")+
  theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())


ggplot(dfPC_metx_EcoQuaChez, aes(x = Parametre, y = Valeur,colour = Parametre)) + geom_boxplot()+  facet_wrap(Site ~ Station, scale = "free_y")+theme(axis.text.x = element_text(angle = 90,  hjust = 1, vjust = 0),  axis.line = element_blank(), axis.ticks.x = element_blank())


#TOP du TOP+ AVEC COULEUR

as_tibble(dfPC_pesti)



dfPC$DtHechanti<-type.convert(dfPC$DtHechanti)
dfPC$DtHechanti<-as.character(unlist(dfPC$DtHechanti))
dfPC[["DtHechanti"]]<-as.POSIXct(dfPC[["DtHechanti"]])