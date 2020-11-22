options(warn=-1)
#lecture du fichier
borja_phys=read_excel("Donnees_test/Borja/Phisyco-chimie_propre.xls",col_types = c("numeric", "text", "date", "numeric","numeric","numeric"))
#borja_dd=read_excel("Donnees_test/Borja/Daily_Discharges.xls",col_types = c("numeric", "text", "date", "numeric","text","text"))
#renommage du nm de la colonne valeur
#names(borja_dd)[4] <-"valeur"
#suppression de la ligne vide
#borja_phys <- borja_phys[-c(1),]
#borja_dd<- borja_dd[-c(1),]
#changement en factor du type de la colone date 
borja_phys$date<-type.convert(borja_phys$date)
#borja_dd$date<-type.convert(borja_dd$date)
# conversion en format caractère de a colone date
borja_phys$date<-as.character(unlist(borja_phys$date))
#borja_dd$date<-as.character(unlist(borja_dd$date))
#conversion de la date en POSIXT 
borja_phys[["date"]]<-as.POSIXct(borja_phys[["date"]])
#borja_dd[["date"]]<-as.POSIXct(borja_dd[["date"]])
#preparation des donnees a afficher pour dygraph

# borja_phys$conductivite<-as.double(borja_phys$conductivite)
# borja_phys$ph<-as.double(borja_phys$ph)
# borja_phys$sediment<-as.double(borja_phys$sediment)

don_borja_phys_nom=xts(x = borja_phys$nom, order.by = borja_phys$date)#selection d'un champ pour les dates

don_borja_phys_ok=merge(don_borja_phys_nom,borja_phys$conductivite,borja_phys$ph,borja_phys$sediment)
don_borja_phys_ok <- subset( don_borja_phys_ok, select = -don_borja_phys_nom )


colnames(don_borja_phys_ok) = c("Conductivite", "PH", "Sediments") 

#don_borja_phys=xts(borja_phys, order.by = borja_phys$date)
#dygraph(don_borja_phys_ok) 
# 
# dygraph(don_borja_phys_ok) %>%
#   dySeries("Conductivite(µS)", label = "Conductivite(µS)") %>%
#   dySeries("PH", label = "PH") %>%
#   dySeries("Sediments(mg/l)", label = "Sediments(mg/l)") %>%
#   dyOptions(stackedGraph = TRUE) %>%
#   dyRangeSelector(height = 20)





# don_borja_phys$conductivite<-as.double(borja_phys$conductivite)
# don_borja_phys$ph<-as.double(borja_phys$ph)
# don_borja_phys$sediment<-as.double(borja_phys$sediment)
# 
# View(don_borja_phys)
# dygraph(borja_phys)


# #creation du marqueur temporel des valeurs
# don_borja_phys=xts(x = borja_phys$valeur, order.by = borja_phys$date)
# don_borja_dd=xts(x = borja_dd$valeur, order.by = borja_dd$date)
# 
# #creation du marqueur   des capteur
# don_borja_phys_marque=xts(x = borja_phys$nom, order.by = borja_phys$date)
# don_borja_dd_marque=xts(x = borja_dd$nom, order.by = borja_dd$date)
# 
# #fusion données et marqueurs
# don_borja_phys_valeur_et_marque=merge(don_borja_phys,don_borja_phys_marque)
# don_borja_dd_valeur_et_marque=merge(don_borja_dd,don_borja_dd_marque)

#conversion du marqueur en format numérique
#don_borja_phys_valeur_et_marque$don_borja_phys_marque <-as.double(don_borja_phys_valeur_et_marque$don_borja_phys_marque)

# #don_borja_dd_valeur_et_marque$don_borja_dd_marque <-as.double(don_borja_dd_valeur_et_marque$don_borja_dd_marque)
# 
# #1 pour instant discharge et 2 pour daily discharges
# don_borja_phys_valeur_et_marque$don_borja_phys_marque<- 1
# don_borja_dd_valeur_et_marque$don_borja_dd_marque<- 2
# 
# #Suppressio des valleurs NULLES
# don_borja_phys_valeur_et_marque<-na.omit(don_borja_phys_valeur_et_marque)
# don_borja_dd_valeur_et_marque<-na.omit(don_borja_dd_valeur_et_marque)
# 
# #combinaison des deux marqueur 
# combi_id_dd <- rbind(don_borja_phys_valeur_et_marque,don_borja_dd_valeur_et_marque)
# 
# 
# #affichage dygraph 
# 
# #dygraph(don_borja_phys)
# #dygraph(don_borja_dd)
# 
# dy_graph_Borja <- list(
#   dygraphs::dygraph(don_borja_phys, main = "Debit instant", group = "Debit site BORJA")%>% dyRangeSelector(),
#   dygraphs::dygraph(don_borja_dd, main = "Debit jour", group = "Debit site BORJA")%>% dyRangeSelector()
#   
# )
# #
#htmltools::browsable(htmltools::tagList(dy_graph_Borja))
