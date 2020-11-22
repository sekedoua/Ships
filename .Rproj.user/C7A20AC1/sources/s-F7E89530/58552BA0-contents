options(warn=-1)
#lecture du fichier
borja_iwl=read_excel("Donnees_test/Borja/Instant_water_level.xls",col_types = c("numeric", "text", "date", "numeric","text","text"))
borja_dwl=read_excel("Donnees_test/Borja/Daily_water_level.xls",col_types = c("numeric", "text", "date", "numeric","text","text"))
#renommage du nm de la colonne valeur
names(borja_dwl)[4] <-"valeur"
names(borja_iwl)[4] <-"valeur"
#suppression de la ligne vide
borja_iwl <- borja_iwl[-c(1),]
borja_dwl<- borja_dwl[-c(1),]
#changement en factor du type de la colone date 
borja_iwl$date<-type.convert(borja_iwl$date)
borja_dwl$date<-type.convert(borja_dwl$date)
# conversion en format caractère de a colone date
borja_iwl$date<-as.character(unlist(borja_iwl$date))
borja_dwl$date<-as.character(unlist(borja_dwl$date))
#conversion de la date en POSIXT 
borja_iwl[["date"]]<-as.POSIXct(borja_iwl[["date"]])
borja_dwl[["date"]]<-as.POSIXct(borja_dwl[["date"]])
#preparation des donnees a afficher pour dygraph

#creation du marqueur temporel des valeurs
don_borja_iwl=xts(x = borja_iwl$valeur, order.by = borja_iwl$date)
don_borja_dwl=xts(x = borja_dwl$valeur, order.by = borja_dwl$date)

#creation du marqueur   des capteur
don_borja_iwl_marque=xts(x = borja_iwl$nom, order.by = borja_iwl$date)
don_borja_dwl_marque=xts(x = borja_dwl$nom, order.by = borja_dwl$date)

#fusion données et marqueurs
don_borja_iwl_valeur_et_marque=merge(don_borja_iwl,don_borja_iwl_marque)
don_borja_dwl_valeur_et_marque=merge(don_borja_dwl,don_borja_dwl_marque)

#conversion du marqueur en format numérique
don_borja_iwl_valeur_et_marque$don_borja_iwl_marque <-as.double(don_borja_iwl_valeur_et_marque$don_borja_iwl_marque)
don_borja_dwl_valeur_et_marque$don_borja_dwl_marque <-as.double(don_borja_dwl_valeur_et_marque$don_borja_dwl_marque)

#1 pour instant discharge et 2 pour daily discharges
don_borja_iwl_valeur_et_marque$don_borja_iwl_marque<- 1
don_borja_dwl_valeur_et_marque$don_borja_dwl_marque<- 2

#Suppressio des valleurs NULLES
don_borja_iwl_valeur_et_marque<-na.omit(don_borja_iwl_valeur_et_marque)
don_borja_dwl_valeur_et_marque<-na.omit(don_borja_dwl_valeur_et_marque)

#combinaison des deux marqueur 
combi_id_dd <- rbind(don_borja_iwl_valeur_et_marque,don_borja_dwl_valeur_et_marque)


#affichage dygraph 

#dygraph(don_borja_iwl)
#dygraph(don_borja_dwl)

dy_graph_Borja_iwldwl <- list(
  dygraphs::dygraph(don_borja_iwl, main = "Niveau deau instant (cm)", group = "Debit site BORJA")%>% dyRangeSelector(),
  dygraphs::dygraph(don_borja_dwl, main = "Niveau deau journalier(cm) ", group = "Debit site BORJA")%>% dyRangeSelector()
  
)
#
#htmltools::browsable(htmltools::tagList(dy_graph_Borja_iwldwl))
