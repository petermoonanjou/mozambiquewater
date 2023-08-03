Census DATA

#water1 = clean portugese
#water2 = english
#water3 = recode impr/unimpr

#locations of census + shapefiles
file_location_census = "C:/Users/asus/Dropbox/#Mozambique/Water/Census 2017/Amostra_10__AF_Pessoas_Pop_ANONIM.sav"
#not done yet, moved files to MOZ folder
file_location_shapeunicef = C:/Users/asus/Dropbox/#Mozambique/Water/INE/UNICEF_PROVINCIAIS.gdb/UNICEF_PROVINCIAIS.gdb
  
#read sav without variables
df_census <- read.spss(file_location_census, to.data.frame = TRUE,
                       use.value.labels = TRUE,
                       max.value.labels = Inf,
                       use.missings = TRUE,
                       reencode = "UTF-8",
                       trim.factor.names = TRUE,
                       trim_values = TRUE,
                       compression = NULL)

var_names <- read.spss(file_location_census, to.data.frame = FALSE) %>%
  attributes() %>%
  .$variable.labels
view(var_names)
write.csv2(var_names, file = "var_names_census2017.csv", row.names= FALSE)


#df census ws is only columns on water and sanitation |||| DID NOT WORK :))
df_census_ws <- df_census[ ,c("Provincia_first", "Distrito_first",
                             "Posto_first", "URB_RUR", "D10_FONTE_AGUA_PARA_BEBER","D11_SANEAMENTO")]
glimpse(df_census_ws)
rm(df_census)

df_census_ws$Provincia_first <- trimws(df_census_ws$Provincia_first)
df_census_ws$Distrito_first <- trimws(df_census_ws$Distrito_first)
df_census_ws$Posto_first <- trimws(df_census_ws$Posto_first)
df_census_ws$URB_RUR <- trimws(df_census_ws$URB_RUR)
df_census_ws$D10_FONTE_AGUA_PARA_BEBER <- trimws(df_census_ws$D10_FONTE_AGUA_PARA_BEBER)
df_census_ws$D11_SANEAMENTO <- trimws(df_census_ws$D11_SANEAMENTO)


##Fix the spelling en recode## into clean portugese

sources_census <- df_census_ws %>%
  group_by(water2) %>%
  summarise(n = n())
print(sources_census)

df_census_ws$water1 <- df_census_ws$D10_FONTE_AGUA_PARA_BEBER

df_census_ws$water1 <- gsub("^.gua Canalizada  dentro de casa$",	"Agua Canalizada  dentro de casa", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua Canalizada fora de casa/quintal$",	"Agua Canalizada fora de casa-quintal", df_census_ws$water1)
df_census_ws$water1 <- gsub(".gua Canalizada na casa do vizinho$",	"Agua Canalizada na casa do vizinho", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua da chuva$",	"Agua da chuva", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua da fontan.rio/ torneira p.blica$",	"Agua da fontanario - torneira publica ", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua de nascentes$",	"Agua de nascentes", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua de superf.cie \\(rio / lago / lagoa\\)$",	"Agua de superficie - rio lago lagoa", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua de tanques cami.es / carregada em tambores$",	"Agua de tanques camiaoes - carregada em tambores", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua do furo/po.o protegido com bomba manual$",	"Agua do furo-poco protegido com bomba manual", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua do po.o n.o protegido$",	"Agua do poco nao protegido", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua do po.o protegido sem bomba manual$",	"Agua do poco protegido sem bomba manual", df_census_ws$water1)
df_census_ws$water1 <- gsub("^.gua mineral / .gua engarrafada$",	"Agua mineral - Agua engarrafada", df_census_ws$water1)

##recode## into english

df_census_ws$water2 <- df_census_ws$water1

df_census_ws$water2 <- gsub("Agua Canalizada  dentro de casa", "Piped on premises", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua Canalizada fora de casa-quintal", "Piped on premises", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua Canalizada na casa do vizinho", "Piped into neighbour's yard/plot", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua da chuva", "Rainwater", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua da fontanario - torneira publica ", "Public tap/standpipe",df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua de nascentes", "Water from spring", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua de superficie - rio lago lagoa", "Surface water", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua de tanques camiaoes - carregada em tambores", "Delivered water (or cart or truck)", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua do furo-poco protegido com bomba manual", "Borehole or protected well (with handpump)", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua do poco nao protegido", "Unprotected well", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua do poco protegido sem bomba manual", "Protected well without handpump", df_census_ws$water2)
df_census_ws$water2 <- gsub("Agua mineral - Agua engarrafada", "Bottled Water", df_census_ws$water2)
df_census_ws$water2 <- gsub("Outra", "Other", df_census_ws$water2)

#check on Cabo Delgado with new names
check1 <- df_census_ws %>%
  group_by(Provincia_first, water3) %>%
  summarise(count = n()) %>%
  mutate(perc = count/sum(count)*100) %>%
  filter(Provincia_first == "Cabo Delgado")
view(check1)

#RECODE water2 in water3
df_census_ws$water3 <- df_census_ws$water2

df_census_ws$water3 <- gsub("Piped on premises", "Improved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Piped into neighbour's yard/plot", "Improved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Rainwater", "Improved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Public tap/standpipe", "Improved",df_census_ws$water3)
df_census_ws$water3 <- gsub("Water from spring", "Unimproved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Surface water", "Surface water", df_census_ws$water3)
df_census_ws$water3 <- gsub("Delivered water \\(or cart or truck\\)", "Improved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Borehole or protected well \\(with handpump\\)", "Improved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Unprotected well", "Unimproved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Protected well without handpump", "Unimproved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Bottled Water", "Improved", df_census_ws$water3)
df_census_ws$water3 <- gsub("Other", "Unimproved", df_census_ws$water3)

#NOW I PRODUCE THE TABLE IMP/UNIMP/SURF FOR EXCEL
#Census, by province,  IMPROVED/UNIM/SURFACE
pivot_INE_CENSUS <- df_census_ws %>%
  filter(Provincia_first != "") %>%
  select(Provincia_first, water3) %>%
  group_by(Provincia_first, water3) %>%
  summarise(count = n()) %>%
  mutate(perc = round(count/sum(count)*100, digits = 1)) 
view(pivot_INE_CENSUS)
write.csv2(pivot_INE_CENSUS, file = "pivot_INE_CENSUS.csv", row.names= FALSE)

#Census, national ||  IMPROVED/UNIM/SURFACE
pivot_INE_CENSUS_NAT <- df_census_ws %>%
  filter(Provincia_first != "") %>%
  select(water3) %>%
  group_by(water3) %>%
  summarise(count = n()) %>%
  mutate(perc = round(count/sum(count)*100, digits = 1)) 
view(pivot_INE_CENSUS_NAT)
write.csv2(pivot_INE_CENSUS_NAT, file = "pivot_INE_CENSUS_NAT.csv", row.names= FALSE)

head(df_census_ws)

#Census, prov || IMPROVED/UNIM/SURFACE  || Rural Urban
pivot_INE_CENSUS_RU_URB_TOT <- df_census_ws %>%
  filter(Provincia_first != "") %>%
  select(URB_RUR, water3) %>%
  group_by(URB_RUR, water3) %>%
  summarise(count = n()) %>%
  mutate(perc = round(count/sum(count)*100, digits = 1)) 
view(pivot_INE_CENSUS_RU_URB_TOT)
write.csv2(pivot_INE_CENSUS_RU_URB_TOT, file = "pivot_INE_CENSUS_RU_URB_TOT.csv", row.names= FALSE)

#Census, NATIONAL || IMPROVED/UNIM/SURFACE
pivot_INE_CENSUS_RU_URB <- df_census_ws %>%
  filter(Provincia_first != "") %>%
  select(Provincia_first, URB_RUR, water3) %>%
  group_by(Provincia_first, URB_RUR, water3) %>%
  summarise(count = n()) %>%
  mutate(perc = round(count/sum(count)*100, digits = 1)) 
view(pivot_INE_CENSUS_RU_URB)
write.csv2(pivot_INE_CENSUS_RU_URB, file = "pivot_INE_CENSUS_RU_URB.csv", row.names= FALSE)

#Census, District ||  IMPROVED/UNIM/SURFACE
pivot_INE_CENSUS_DISTRICT <- df_census_ws %>%
  filter(Provincia_first != "") %>%
  select(Provincia_first, Distrito_first, water3) %>%
  group_by(Provincia_first, Distrito_first, water3) %>%
  summarise(count = n()) %>%
  mutate(perc = round(count/sum(count)*100, digits = 1)) 
view(pivot_INE_CENSUS_DISTRICT)


################BELOW = OLD ##############################"
  
#Census, by province, filtered by surface water
pivot_census_w_surface <- df_census_ws %>%
  #filter(Provincia_first != "") %>%
  select(Provincia_first, D10_FONTE_AGUA_PARA_BEBER) %>%
  group_by(Provincia_first, D10_FONTE_AGUA_PARA_BEBER) %>%
  summarise(count = n()) %>%
  mutate(perc = count/sum(count)*100) %>%
  filter(D10_FONTE_AGUA_PARA_BEBER == ".gua de superf.cie (rio / lago / lagoa)")

class(pivot_census_w)
glimpse(pivot_census_w_surface)
view(pivot_census_w_surface)
write.csv2(pivot_census_w_surface, file = "pivot_census_w_surface.csv", row.names= FALSE)

#Census, by province | urban rural | filtered by surface water
pivot_census_w_surface_ru <- df_census_ws %>%
  filter(Provincia_first != "") %>%
  select(Provincia_first, URB_RUR, D10_FONTE_AGUA_PARA_BEBER) %>%
  group_by(Provincia_first, URB_RUR, D10_FONTE_AGUA_PARA_BEBER) %>%
  summarise(count = n()) %>%
  mutate(perc = count/sum(count)*100) %>%
  filter(D10_FONTE_AGUA_PARA_BEBER == ".gua de superf.cie (rio / lago / lagoa)")

glimpse(pivot_census_w_surface_ru)
view(pivot_census_w_surface_ru)
write.csv2(pivot_census_w_surface_ru, file = "pivot_census_w_surface_ru.csv", row.names= FALSE)
