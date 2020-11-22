# options(warn=-1)
#lecture du fichier

 #borja_id=read_excel("Donnees_test/Borja/Instant_Discharges.xls",col_types = c("numeric", "text", "date", "numeric","text","text"))
 #borja_dd=read_excel("Donnees_test/Borja/Daily_Discharges.xls",col_types = c("numeric", "text", "date", "numeric","text","text"))



 # borja_id=read.csv(file="Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_date_heure.csv", header=TRUE, sep=";",stringsAsFactors=FALSE)
 # borja_dd= read.csv(file="Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_date_heure.csv", header=TRUE, sep=";",stringsAsFactors=FALSE)
 #
 #
 # saveRDS( borja_id, "Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_date_heure.rds")
 #
 # saveRDS( borja_dd, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_date_heure.rds")
 #


 borja_id=readRDS(file="Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_date_heure.rds")
 borja_dd= readRDS(file="Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_date_heure.rds")






 # as_tibble(borja_id)
 # as_tibble(borja_dd)
 # 
  colnames(borja_id) = c("date","Time","valeur","Qualit", "Interpolation","Tags", "Comments")
 colnames(borja_dd) = c("date","Time","valeur","Qualit", "Interpolation","Tags", "Comments")

 # as_tibble(borja_id)
 # as_tibble(borja_dd)
 borja_id <- subset( borja_id, select = -c(Time,Interpolation,Tags,Comments ) )
borja_dd <- subset( borja_dd, select = -c(Time,Interpolation,Tags,Comments ) )



 # #renommage du nm de la colonne valeur
# names(borja_dd)[4] <-"valeur"
# #suppression de la ligne vide
# borja_id <- borja_id[-c(1),]
# borja_dd<- borja_dd[-c(1),]

# #changement en factor du type de la colone date
  borja_id$date<-type.convert(borja_id$date)
  borja_dd$date<-type.convert(borja_dd$date)

# # conversion en format caractère de a colone date
 borja_id$date<- strptime(borja_id$date, "%d/%m/%Y %H:%M:%S")
 borja_dd$date<-strptime(borja_dd$date, "%d/%m/%Y %H:%M:%S")

 # Temp_id<-borja_id
 # Temp_dd<-borja_dd

   borja_id$date<-as.Date(borja_id$date)
   borja_dd$date<-as.Date(borja_dd$date)


#conversion de la date en POSIXT
  borja_id$date<-as.POSIXct(borja_id$date)
  borja_dd$date<-as.POSIXct(borja_dd$date)
 #supression des valeurs NA
  borja_id<-na.omit(borja_id)
 borja_dd<-na.omit(borja_dd)

 borja_id$valeur<- as.double(borja_id$valeur)
 borja_dd$valeur<- as.double(borja_dd$valeur)
 # as_tibble(borja_id)
 # as_tibble(borja_dd)

#preparation des donnees a afficher pour dygraph




 borja_id <- tidyr::separate(data=borja_id,
                       col=Qualit,
                       into=c("Code", "Niveau"),
                       sep=" ",
                       remove=FALSE)
 borja_dd <- tidyr::separate(data=borja_dd,
                             col=Qualit,
                             into=c("Code", "Niveau"),
                             sep=" ",
                             remove=FALSE)

 borja_id$Niveau <- stringr::str_replace_all(borja_id$Niveau , "[(]", "")
 borja_id$Niveau <- stringr::str_replace_all(borja_id$Niveau , "[)]", "")

 borja_dd$Niveau <- stringr::str_replace_all(borja_dd$Niveau , "[(]", "")
 borja_dd$Niveau <- stringr::str_replace_all(borja_dd$Niveau , "[)]", "")
 borja_id$Code<- as.double(borja_id$Code)
 borja_dd$Code<- as.double(borja_dd$Code)
 #
 borja_id <- subset( borja_id, select = -c(Qualit) )
 borja_dd <- subset( borja_dd, select = -c(Qualit) )
 #
 #
 saveRDS( borja_id, "Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_propre_index_date.rds")
 saveRDS( borja_dd, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_propre_index_date.rds")
 write.csv(borja_id,"Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_propre_index_date.csv")
 write.csv(borja_dd,"Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_propre_index_date.csv")
 
 
 borja_id_2019<- subset(borja_id, (year(borja_id$date))==2019)
 borja_id_2018<- subset(borja_id, (year(borja_id$date))==2018)
 borja_id_2017<- subset(borja_id, (year(borja_id$date))==2017)
 saveRDS( borja_id_2019, "Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2019.rds")
 saveRDS( borja_id_2018, "Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2018.rds")
 saveRDS( borja_id_2017, "Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2017.rds")
 
 write.csv(borja_id_2019,"Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2019.csv")
 write.csv(borja_id_2018,"Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2018.csv")
 write.csv(borja_id_2017,"Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2017.csv")

 borja_dd_2019<- subset(borja_dd, (year(borja_dd$date))==2019)
 borja_dd_2018<- subset(borja_dd, (year(borja_dd$date))==2018)
 borja_dd_2017<- subset(borja_dd, (year(borja_dd$date))==2017)
 borja_dd_2016<- subset(borja_dd, (year(borja_dd$date))==2016)
 borja_dd_2015<- subset(borja_dd, (year(borja_dd$date))==2015)
 borja_dd_2014<- subset(borja_dd, (year(borja_dd$date))==2014)
 borja_dd_2013<- subset(borja_dd, (year(borja_dd$date))==2013)
 
 saveRDS( borja_dd_2019, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2019.rds")
 saveRDS( borja_dd_2018, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2018.rds")
 saveRDS( borja_dd_2017, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2017.rds")
 saveRDS( borja_dd_2016, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2016.rds")
 saveRDS( borja_dd_2015, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2015.rds")
 saveRDS( borja_dd_2014, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2014.rds")
 saveRDS( borja_dd_2013, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2013.rds")

 write.csv(borja_id_2019,"Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2019.csv")
 write.csv(borja_dd_2018,"Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2018.csv")
 write.csv(borja_dd_2017,"Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2017.csv")
 write.csv(borja_dd_2016,"Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2016.csv")
 write.csv(borja_dd_2015,"Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2015.csv")
 write.csv(borja_dd_2014,"Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2014.csv")
 write.csv(borja_dd_2013,"Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2013.csv")

#creation du marqueur temporel des valeurs

 don_borja_id2019_mt=xts(x = borja_id_2019$Code, order.by = borja_id_2019$date)
 don_borja_id2018_mt=xts(x = borja_id_2018$Code, order.by = borja_id_2018$date)
 don_borja_id2017_mt=xts(x = borja_id_2017$Code, order.by = borja_id_2017$date)
# 
 don_borja_dd2019_mt=xts(x = borja_dd_2019$Code, order.by = borja_dd_2019$date)
 don_borja_dd2018_mt=xts(x = borja_dd_2018$Code, order.by = borja_dd_2018$date)
 don_borja_dd2017_mt=xts(x = borja_dd_2017$Code, order.by = borja_dd_2017$date)
don_borja_dd2016_mt=xts(x = borja_dd_2016$Code, order.by = borja_dd_2016$date)
 don_borja_dd2015_mt=xts(x = borja_dd_2015$Code, order.by = borja_dd_2015$date)
don_borja_dd2014_mt=xts(x = borja_dd_2014$Code, order.by = borja_dd_2014$date)
 don_borja_dd2013_mt=xts(x = borja_dd_2013$Code, order.by = borja_dd_2013$date)

# don_borja_id_mt=xts(x = borja_id$Niveau, order.by = borja_id$date)
# don_borja_dd_mt=xts(x = borja_dd$Niveau, order.by = borja_dd$date)
# 
# as_tibble(don_borja_id_mt)
# as_tibble(don_borja_dd_mt)

# summary(borja_id)
# summary(borja_dd)
# dim(don_borja_id_mt)
# dim(don_borja_id)

#[ reached getOption("max.print") -- omitted 806007 rows ]xts
# [ reached 'max' / getOption("max.print") -- omitted 806674 rows ]borja_id
#[ reached 'max' / getOption("max.print") -- omitted 1825043 rows ]
#fusion avec ls autres données


#
 borja_id_temp_2019 <-merge(don_borja_id2019_mt,borja_id_2019$valeur)
 borja_id_temp_2018 <-merge(don_borja_id2018_mt,borja_id_2018$valeur)
 borja_id_temp_2017 <-merge(don_borja_id2017_mt,borja_id_2017$valeur)
# 
# 
borja_dd_temp_2019 <-merge(don_borja_dd2019_mt,borja_dd_2019$valeur)
borja_dd_temp_2018 <-merge(don_borja_dd2018_mt,borja_dd_2018$valeur)
borja_dd_temp_2017 <-merge(don_borja_dd2017_mt,borja_dd_2017$valeur)
borja_dd_temp_2016 <-merge(don_borja_dd2016_mt,borja_dd_2016$valeur)
borja_dd_temp_2015 <-merge(don_borja_dd2015_mt,borja_dd_2015$valeur)
borja_dd_temp_2014 <-merge(don_borja_dd2014_mt,borja_dd_2014$valeur)
borja_dd_temp_2013 <-merge(don_borja_dd2013_mt,borja_dd_2013$valeur)


# borja_id_temp <- subset( borja_id, select = -c(borja_id.Code) )
# borja_dd_temp <- subset( borja_dd, select = -c(borja_dd.Code) )

 #  as_tibble(borja_id_temp)
 #   as_tibble(borja_dd_temp)
 #  view(borja_id_temp)
 # view(borja_dd_temp)

# view(borja_dd_temp)
# as_tibble(borja_dd_temp)


# colnames(borja_id_temp_2019) = c("Code_Quali", "Debit") 
# colnames(borja_id_temp_2018) = c("Code_Quali", "Debit") 
# colnames(borja_id_temp_2017) = c("Code_Quali", "Debit") 

# saveRDS( borja_id_temp_2019, "Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2019_ord.rds")
# saveRDS( borja_id_temp_2018, "Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2018_ord.rds")
# saveRDS( borja_id_temp_2017, "Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2017_ord.rds")
# 
# colnames(borja_dd_temp_2019) = c("Code_Quali", "Debit") 
# colnames(borja_dd_temp_2018) = c("Code_Quali", "Debit") 
# colnames(borja_dd_temp_2017) = c("Code_Quali", "Debit") 
# colnames(borja_dd_temp_2016) = c("Code_Quali", "Debit") 
# colnames(borja_dd_temp_2015) = c("Code_Quali", "Debit") 
# colnames(borja_dd_temp_2014) = c("Code_Quali", "Debit") 
# colnames(borja_dd_temp_2013) = c("Code_Quali", "Debit") 

# saveRDS( borja_dd_temp_2019, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2019_ord.rds")
# saveRDS( borja_dd_temp_2018, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2018_ord.rds")
# saveRDS( borja_dd_temp_2017, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2017_ord.rds")
# saveRDS( borja_dd_temp_2016, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2016_ord.rds")
# saveRDS( borja_dd_temp_2015, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2015_ord.rds")
# saveRDS( borja_dd_temp_2014, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2014_ord.rds")
# saveRDS( borja_dd_temp_2013, "Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2013_ord.rds")
# #creation du marqueur   des capteur
# don_borja_id_marque=xts(x = borja_id$nom, order.by = borja_id$date)
# don_borja_dd_marque=xts(x = borja_dd$nom, order.by = borja_dd$date)
# 
# #fusion données et marqueurs
# don_borja_id_valeur_et_marque=merge(don_borja_id,don_borja_id_marque)
# don_borja_dd_valeur_et_marque=merge(don_borja_dd,don_borja_dd_marque)
# 
# #conversion du marqueur en format numérique
# don_borja_id_valeur_et_marque$don_borja_id_marque <-as.double(don_borja_id_valeur_et_marque$don_borja_id_marque)
# don_borja_dd_valeur_et_marque$don_borja_dd_marque <-as.double(don_borja_dd_valeur_et_marque$don_borja_dd_marque)
# 
# #1 pour instant discharge et 2 pour daily discharges
# don_borja_id_valeur_et_marque$don_borja_id_marque<- 1
# don_borja_dd_valeur_et_marque$don_borja_dd_marque<- 2
# 
# #Suppressio des valleurs NULLES
# don_borja_id_valeur_et_marque<-na.omit(don_borja_id_valeur_et_marque)
# don_borja_dd_valeur_et_marque<-na.omit(don_borja_dd_valeur_et_marque)
# 
# #combinaison des deux marqueur 
# combi_id_dd <- rbind(don_borja_id_valeur_et_marque,don_borja_dd_valeur_et_marque)


#affichage dygraph 

#dygraph(borja_id_temp)
#dygraph(don_borja_dd)

# dygraph(weather) %>%
#   dyAxis("y", label = "Temperature (C)") %>%
#   dyAxis("y2", label = "Rainfall") %>%
#   dySeries("rainfall", axis = 'y2')


#dy_graph_Borja_id<- list(avec des virgules



  
  
  
  
  #)
#
#htmltools::browsable(htmltools::tagList(dy_graph_Borja_id))
