
#wat = orginal
#wat2 = cleaned
#wat3 = english
#wat4 = recode impr/unimpr INE
#wat 5 = not yet

#file location
location_df_harm = "C:/Users/asus/Dropbox/#Mozambique/Data Rob - Water Supply/Mozambique/Household data/_Harmonised datasets/MOZ_JMP.dta"
df_harm <- read_dta(location_df_harm)
# coing from latrin
df_harm2 <- read_dta(location_df_harm, encoding = "latin1")

df_harm2$wat2 <- df_harm2$wat

variable.names(df_harm)
write.csv2(df_harm, file = "complete_harmonized_data.csv", row.names= FALSE)
show_text(location_df_harm)

# list the water sources in df_harm
harm_sources <- df_harm2 %>%
  filter(wat2 != "") %>%
  select(wat2) %>%
  group_by(wat2) %>%
  summarise(n = n())

view(harm_sources)
print(harm_sources, n = 100)
options(max.print = 100)

#recode the portugese
    
df_harm2$wat2 <- gsub("Á", "A", df_harm2$wat2)
df_harm2$wat2 <- gsub("Ã", "A", df_harm2$wat2)\u0081
df_harm2$wat2 <- gsub("\u0081", "", df_harm2$wat2)
df_harm2$wat2 <- gsub("G", "g", df_harm2$wat2)
df_harm2$wat2 <- gsub("  Da", " Da", df_harm2$wat2)
df_harm2$wat2 <- gsub("De Chuva", "Da Chuva", df_harm2$wat2)
df_harm2$wat2 <- gsub("Agua Do  Furo", "Agua Do Furo", df_harm2$wat2)
df_harm2$wat2 <- gsub("ÇO", "co", df_harm2$wat2)
df_harm2$wat2 <- gsub("ç", "c", df_harm2$wat2)
df_harm2$wat2 <- gsub("Com", "com", df_harm2$wat2)
df_harm2$wat2 <- gsub("Torneira PAºBlica/FontanA¡Rio", "Torneira Pública/Fontanario", df_harm2$wat2)
df_harm2$wat2 <- gsub("Torneira PúBlica/FontanáRio", "Torneira Pública/Fontanario", df_harm2$wat2)
df_harm2$wat2 <- gsub("Torneira Publica/Fontanio", "Torneira Pública/Fontanario", df_harm2$wat2)
df_harm2$wat2 <- gsub("PoA§O NA£O Protegido, A¡gua Da Chuva", "Poco nao Protegido, Agua da Chuva", df_harm2$wat2)
df_harm2$wat2 <- gsub("PoA§O Protegido", "Poco Protegido", df_harm2$wat2)
df_harm2$wat2 <- gsub("Agua Do Rio, Lagoa", "Agua Do Rio, Lago, Lagoa", df_harm2$wat2)
df_harm2$wat2 <- gsub("NãO", "nao", df_harm2$wat2)
df_harm2$wat2 <- gsub("Nao", "nao", df_harm2$wat2)
df_harm2$wat2 <- gsub("NAO", "nao", df_harm2$wat2)
df_harm2$wat2 <- gsub("River/Dam/Lake/Ponds/Stream/Canal/Irirgation Channel", "Surface water", df_harm2$wat2)
df_harm2$wat2 <- gsub("River/Dam/Lake/Ponds/Stream/Canal/Irrigation Channel", "Surface water", df_harm2$wat2)
df_harm2$wat2 <- gsub("River/Lake", "Surface water", df_harm2$wat2)
df_harm2$wat2 <- gsub("Co", "co", df_harm2$wat2)
df_harm2$wat2 <- gsub("Sem Info", "", df_harm2$wat2)
df_harm2$wat2 <- gsub("Da", "da", df_harm2$wat2)
df_harm2$wat2 <- gsub("Proveniente De PocO Ou Furo Protegido com Bomba Manual", "Poco ou Furo protegido com Bomba Manual", df_harm2$wat2)
df_harm2$wat2 <- gsub("Da", "da", df_harm2$wat2)
df_harm2$wat2 <- gsub("Agua da Cisterna (Ou Tanque MÓVel Ou CamiAO)", "Agua da Cisterna", df_harm2$wat2)


#change all sources to english, in wat3
#make copies
df_harm3 <- df_harm2
df_harm3$wat3 <- df_harm3$wat2
# correct spelling mistakes using stringr package

#these were hard to correct | first done these individually
df_harm3$wat3 <- gsub("^Poco nao Protegido, Agua da Chuva$",	"Unprotected well or rainwater", df_harm3$wat3)
df_harm3$wat3 <- gsub(" \\(Ou Tanque MÓVel Ou CamiAO\\)", "", df_harm3$wat3)

#now the rest all at once

df_harm3$wat3 <- str_replace_all(df_harm3$wat2,
            c(
"^Agua Canalizada Dentro da Casa Ou No Quintal$" =	"Piped on premises",
"^Agua Canalizada Dentro da Casa$"	= "Piped on premises",
"^Agua Canalizada Na Casa Do Vizinho$" =	"Piped into neighbour's yard/plot",
"^Agua Canalizada No Quintal$" = "Piped on premises",
"^Agua da Chuva$" =	"Rainwater",
"^Poco nao Protegido, Agua da Chuva$" = "Unprotected well or rainwater",
"^Agua da Cisterna$" = "Delivered water (or cart or truck)",
"^Agua da Cisterna \\(Ou Tanque MÓVel Ou CamiAO\\)$" = "Delivered water (or cart or truck)",
"^Agua De Fontanario$" =	"Public tap/standpipe",
"^Agua De Nascentes nao Protegidas$" =	"Unprotected spring",
"^Agua De Nascentes Protegidas$" = "Protected spring",
"^Agua Do FontanARio$"	= "Public tap/standpipe",
"^Agua Do Furo$" =	"Borehole (with handpump)",
"^Agua Do Poco com Bomba Manual$" =	"Protected well with handpump",
"^Agua Do Poco nao Protegido$" =	"Unprotected well",
"^Agua Do Poco Ou Furo com Bomba Manual$" =	"Borehole or protected well (with handpump)",
"^Agua Do Poco Protegido Sem Bomba$"	= "Protected well without handpump",
"^Agua Do Rio, Lago, Lagoa$" =	"Surface water",
"^Agua Em garrafa$"	= "Bottled Water",
"^Agua Engarrafada/Mineral$" =	"Bottled Water",
"^Agua Mineral/Agua Engarrafada$" =	"Bottled Water",
"^Borehole With Pump$" =	"Borehole (with handpump)",
"^Bottled Water$"	= "Bottled Water",
"^Cart With Small Tank$" =	"Delivered water (or cart or truck)",
"^compra De Outros, Cisterna$" =	"Delivered water (or cart or truck)",
"^Dentro da Casa$" =	"Piped on premises",
"^Fora da Casa/Quintal$" =	"Piped on premises",
"^Furo/Poco Protegido$" =	"Borehole or protected well (with handpump)",
"^In Neighbor'S Land$" =	"Piped into neighbour's yard/plot",
"^In Own Land$" =	"Piped on premises",
"^Inside Neighbor'S House$" =	"Piped into neighbour's yard/plot",
"^Inside The House$"	= "Piped on premises",
"^Na Casa Do Vizinho$" =	"Piped into neighbour's yard/plot",
"^Neighbor'S House$" =	"Piped into neighbour's yard/plot",
"^Other$" = "Other",
"^Outras Fontes$"	= "Other",
"^Outro$" =	"Other",
"^Piped Into Dwelling$" =	"Piped on premises",
"^Piped Into Neighbour'S Yard/Plot$" =	"Piped into neighbour's yard/plot",
"^Piped To Yard/Plot$" =	"Piped on premises",
"^Poco nao Protegido, Agua da Chuva$" =	"Unprotected well or rainwater",
"^PocO nao Protegido$" =	"Unprotected well",
"^Poco ou Furo protegido com Bomba Manual$" =	"Borehole or protected well (with handpump)",
"^Poco Protegido$" =	"Protected well",
"^Protected Public Well$" = "Protected well",
"^Protected Spring$" =	"Protected spring",
"^Protected Well$" =	"Protected well",
"^Public Tap/Standpipe$"	= "Public tap/standpipe",
"^Public Water$" =	"Public tap/standpipe",
"^Rainwater$" =	"Rainwater",
"^Rio, Lago, Lagoa$" =	"Surface water",
"^Sem Bomba Manual$" =	"Protected well without handpump",
"^Surface water$" =	"Surface water",
"^Tanker Truck$" =	"Delivered water (or cart or truck)",
"^Torneira Pública/Fontanario$" =	"Public tap/standpipe",
"^Tube Well Or Borehole$" =	"Borehole (with handpump)",
"^Unprotected Public Well$" = "Unprotected well",
"^Unprotected Spring$" =	"Unprotected spring",
"^Unprotected Well$" =	"Unprotected well",
"^Agua da Chuva$" =	"Rainwater"))

u <- df_harm3 %>%
  group_by(wat3) %>%
  summarise(n = n())
print(u, n = 100)

# recode into wat4
df_harm3$wat4 <- df_harm3$wat3

df_harm3$wat4 <- str_replace_all(df_harm3$wat3,
                                 c(
                                   "^Borehole \\(with handpump\\)$" = "Improved",
                                   "^Borehole or protected well \\(with handpump\\)$" = "Improved",
                                   "^Bottled Water$" = "Improved",
                                   "^Delivered water \\(or cart or truck\\)$" = "Improved",
                                   "^Other$" = "Unimproved",
                                   "^Piped into neighbour's yard/plot$" = "Improved",
                                   "^Piped on premises$" = "Improved",
                                   "^Protected spring$" = "Improved",
                                   "^Protected well$" = "Unimproved",
                                   "^Protected well with handpump$" = "Improved", 
                                   "^Protected well without handpump$" = "Unimproved",
                                   "^Public tap/standpipe$" = "Improved",
                                   "^Rainwater$" = "Improved",
                                   "^Surface water$" = "Surface water",
                                   "^Unprotected spring$" = "Unimproved",
                                   "^Unprotected well$" = "Unimproved",
                                   "^Unprotected well or rainwater$" = "Unimproved"))

u <- df_harm3 %>%
  group_by(wat4) %>%
  summarise(n = n())
print(u, n = 100)
view(u)

#this is weighted for PROVINCE || IMPROVED/UNIM/SURFACE
pivot_INE <- df_harm3 %>%
  filter(wat2 != "") %>%
  select(year, survey, prov, popwt, wat4) %>%
  group_by(year, survey, prov, wat4) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = round(sum_pop_weight/sum(sum_pop_weight)*100, digits = 1))
  #filter(prov == "Cabo Delgado")
  #filter(wat4 == "Improved")
view(pivot_INE)

write.csv2(pivot_INE, file = "pivot_INE_HARM.csv", row.names= FALSE)

#this is weighted for province | NATIONAL |  IMPROVED/UNIM/SURFACE
pivot_INE_NAT <- df_harm3 %>%
  filter(wat2 != "") %>%
  select(year, survey, popwt, wat4) %>%
  group_by(year, survey, wat4) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = round(sum_pop_weight/sum(sum_pop_weight)*100, digits = 1))
#filter(prov == "Cabo Delgado")
#filter(wat4 == "Improved")
view(pivot_INE_NAT)

write.csv2(pivot_INE_NAT, file = "pivot_INE_HARM_NAT.csv", row.names= FALSE)

#this is weighted for PROVINCE |  IMPROVED/UNIM/SURFACE  || rural urban
pivot_INE_RU_URB <- df_harm3 %>%
  filter(wat2 != "") %>%
  select(year, survey, prov, popwt, ru, wat4) %>%
  group_by(year, survey, prov, ru, wat4) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = round(sum_pop_weight/sum(sum_pop_weight)*100, digits = 1))
view(pivot_INE_RU_URB)

write.csv2(pivot_INE_RU_URB, file = "pivot_INE_HARM_RU_URB.csv", row.names= FALSE)

#this is weighted for NATIONAL |  IMPROVED/UNIM/SURFACE  || rural urban
pivot_INE_RU_URB_TOT <- df_harm3 %>%
  filter(wat2 != "") %>%
  select(year, survey, popwt, ru, wat4) %>%
  group_by(year, survey, ru, wat4) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = round(sum_pop_weight/sum(sum_pop_weight)*100, digits = 1))
view(pivot_INE_RU_URB_TOT)

write.csv2(pivot_INE_RU_URB_TOT, file = "pivot_INE_HARM_RU_URB_TOT.csv", row.names= FALSE)

####################################### below is old source names

#this is weighted for province | all water sources
pivot_harm <- df_harm3 %>%
  filter(wat2 != "") %>%
  select(year, survey, prov, popwt, wat2) %>%
  group_by(year, survey, prov, wat2) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = sum_pop_weight/sum(sum_pop_weight)*100)
class(pivot_harm)
glimpse(pivot_harm)
view(pivot_harm)
write.csv2(pivot_harm, file = "pivot_harm.csv", row.names= FALSE)



#check if perc = 100
x <- sum(pivot_harm$perc[pivot_harm$survey == "DHS 2003" & pivot_harm$prov == "Gaza"])
print(x)  

#this is weighted for National | all water sources

pivot_harm_nat <- df_harm %>%
  filter(wat != "") %>%
  select(year, survey, prov, popwt, wat) %>%
  group_by(year, survey, wat) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = sum_pop_weight/sum(sum_pop_weight)*100)
class(pivot_harm_nat)
glimpse(pivot_harm_nat)
view(pivot_harm_nat)
write.csv2(pivot_harm_nat, file = "pivot_harm_nat.csv", row.names= FALSE)

x <- sum(pivot_harm_nat$perc[pivot_harm_nat$survey == "DHS 2003"])
print(x)  

#this is weighted for national | Rural & Urban | all water sources
pivot_harm_nat_ru <- df_harm %>%
  filter(wat != "") %>%
  select(year, survey, prov, popwt, ru, wat) %>%
  group_by(year, survey, prov, ru, wat) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = sum_pop_weight/sum(sum_pop_weight)*100)
class(pivot_harm_nat)
glimpse(pivot_harm_nat_ru)
view(pivot_harm_nat_ru)
write.csv2(pivot_harm_nat, file = "pivot_harm_nat_ru.csv", row.names= FALSE)


#this is weighted for provincial | Rural & Urban | all water sources
pivot_harm_ru <- df_harm %>%
  filter(wat != "") %>%
  select(year, survey, prov, popwt, ru, wat) %>%
  group_by(year, survey, ru, wat) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = sum_pop_weight/sum(sum_pop_weight)*100)
class(pivot_harm_ru)
glimpse(pivot_harm_ru)
view(pivot_harm_ru)
write.csv2(pivot_harm_ru, file = "pivot_harm_ru.csv", row.names= FALSE)


#location of source | variable = "w30"
location <- df_harm %>%
  group_by(survey, w30) %>%
  summarise(n = n())
class(location)
    write.csv2(location, file = "location.csv", row.names= FALSE)

#New files that inlcude location | provincial | all water sources
pivot_harm_loc_prov <- df_harm %>%
  filter(wat != "") %>%
  select(year, survey, prov, popwt, w30, wat) %>%
  group_by(year, survey, prov, w30, wat) %>%
  summarise(sum_pop_weight = sum(popwt))%>%
  mutate(perc = sum_pop_weight/sum(sum_pop_weight)*100)
glimpse(pivot_harm_loc_prov)
view(pivot_harm_loc_prov)
write.csv2(pivot_harm, file = "pivot_harm.csv", row.names= FALSE)
