install.packages("ggpattern")
library(ggpattern)
library(tidyverse)
library(RColorBrewer)
library(write)
library(sf)
library(ggthemes)
library(readxl)

#Mauritania
file_mau_adm2 = "C:/Users/asus/Dropbox/_Mauritania/Shapefile/mrt_admbnda_adm2_gov_20200801.shp"
MAU_2 <- read_sf(file_mau_adm2)

file_mau_adm1 = "C:/Users/asus/Dropbox/_Mauritania/Shapefile/mrt_admbnda_adm1_gov_20200801.shp"
MAU_1 <- read_sf(file_mau_adm1)
view(MAU_1)

MAU_1 %>%
  group_by(ADM1_EN) %>%
  summarise(count = n())

MAU_1$DIA <- c(17, 15, 8, 5, 20, 15, 14, 11, 17, 11, 21, 13, 17)
MAU_1$H2S <- c(33, 36, 50, 59, 50, 50, 36, 36 ,59, 8, 33, 8, 33)
MAU_1$H2S_CAT <- cut(MAU_1$H2S,
                     breaks=c(-Inf, 10, 20, 30, 40, Inf),
                     labels=c("0-10%","10-20%","20-30%", "30-40%", ">40%"))
MAU_1$UNIMP <- c(6, 29, 16, 0, 42, 38, 47, 36, 1, 0, 21, 2, 1)
MAU_1$UNIMP_CAT <- cut(MAU_1$UNIMP,
                     breaks=c(-Inf, 10, 20, 30, 40, Inf),
                     labels=c("0-10%","10-20%","20-30%", "30-40%", ">40%"))
MAU_1$NO_BASIC <- c(25,45,22,1,57,47,61,46,14,13,32,6,13)
MAU_1$NO_BASIC_CAT <- cut(MAU_1$NO_BASIC,
                       breaks=c(-Inf, 10, 20, 30, 40, Inf),
                       labels=c("0-10%","10-20%","20-30%", "30-40%", ">40%"))
levels(MAU_1$H2S_CAT)

MAU_MAP <- ggplot(MAU_2)+
  geom_sf(fill="grey",alpha=.9)+labs(title="Solid Map",x="Longitude",y="Lattitude")+
  geom_sf_text(data = MAU_2, aes(label = ADM2_EN), alpha = .7, size = 2)
  
MAU_MAP

#colour brewer package - make more colours of brewer
colourCount_M = length(unique(MAU_2$ADM2_EN)) # = 57
colourCount_M1 = length(unique(MAU_1$ADM1_EN)) # = 13
print(colourCount_M1)
getPalette_M = colorRampPalette(brewer.pal(9, "Set1"))
getPalette_M1 = colorRampPalette(brewer.pal(9, "Paired"))


MAU_MAP1 <- ggplot()+
  geom_sf(data = MAU_1, aes(fill=ADM1_EN), alpha = 0.6, colour = "white", size = .4)+
  scale_fill_manual(values = getPalette_M1(colourCount_M1))+
  theme(legend.position = "none")
MAU_MAP1

#map with diarrhea rates
MAU_MAP1B <- ggplot()+
  geom_sf(data = MAU_1, aes(fill=DIA), alpha = 0.6, colour = "white", size = .4)+
  scale_fill_gradient(low = "ivory2", high = "hotpink4") +
  geom_sf_text(data = MAU_1, aes(label = DIA), alpha = NA , size = 3) +
  geom_sf_label(data = MAU_1, aes(label = ADM1_EN),
                alpha = .7,
                colour ="black",
                fill = "lightgray",
                size = 3,
                hjust = 0,
                nudge_x = 0.35,
                nudge_y = 0.1)+
  theme(legend.position = "none")
MAU_MAP1B

#map with diarrhea rates + universal pattern "stripe"
MAU_MAP1C <- ggplot()+
  #geom_sf(data = MAU_1, aes(fill=DIA), alpha = 0.6, colour = "white", size = .4)+
  #scale_fill_gradient(low = "ivory2", high = "hotpink4") +
  geom_sf_pattern(data = MAU_1, aes(fill = DIA, pattern_density = H2S),
  pattern = "circle",
  pattern_alpha = 0.5,
  pattern_angle = 45,
  pattern_spacing = 0.01)+
  #pattern_density = 0.02)+
  #scale_pattern_manual(values = c("stripe", "crosshatch", "circle", "star")) +
  scale_fill_gradient(low = "ivory2", high = "hotpink4") +
  theme_minimal()
MAU_MAP1C

class(MAU_1$HS2_CAT)

#map with diarrhea rates + specific pattern + data H2S
MAU_MAP1D <- ggplot() +
    geom_sf_pattern(data = MAU_1, aes(fill = DIA, pattern = H2S_CAT),
    pattern_angle = 45,
    pattern_spacing = 0.04,
    pattern_density = 0.01) +
    scale_pattern_manual(values = c("circle", "stripe", "crosshatch", "wave")) +
    scale_fill_gradient(low = "ivory3", high = "hotpink4") +
    geom_sf_text(data = MAU_1, aes(label = H2S),
                 fontface = "bold",
                 size = 3,
                 colour ="gray66",
                 hjust = 1,
                 nudge_x = 0.0,
                 nudge_y = 0.0)+
    geom_sf_label(data = MAU_1, aes(label = ADM1_EN),
                alpha = .7,
                colour ="black",
                fill = "lightgray",
                size = 3.5,
                hjust = 0,
                nudge_x = 0.0,
                nudge_y = 0.0)+
  theme_minimal()


MAU_MAP1D



#map with diarrhea rates in colour and H2S data
MAU_MAP1E <- ggplot() +
  geom_sf(data = MAU_1, aes(fill = DIA), colour = "white", size = .3)+
  scale_fill_gradient(low = "ivory3", high = "brown") +
  geom_sf_text(data = MAU_1, aes(label = H2S),
               fontface = "bold",
               size = 3,
               colour ="white",
               hjust = 1,
               nudge_x = -0.1,
               nudge_y = 0.0)+
  geom_sf_label(data = MAU_1, aes(label = ADM1_EN),
                alpha = .7,
                colour ="black",
                fill = "lightgray",
                size = 3.5,
                hjust = 0,
                nudge_x = 0,
                nudge_y = 0.0)+
  theme_minimal()

###############labs

MAU_MAP1B + labs(title = "Prévalence de la diarrhée en Mauritanie",
                             subtitle = "[%] EDS 2019-2021",
                             x = "",
                             y = "",
                             fill = "Prévalence\nde la diarrhée [%]",
                             caption = "Pourcentage d’enfants de moins de 5 ans\nayant eu la diarrhée au cours des 2 semaines\nayant précédé l’interview.\nDonnées issues de EDS 2019-2021") +
  theme_map(base_size = 12) +
  theme(
    plot.background = element_rect(colour = NA, fill = "gray"),
    legend.background = element_rect(colour = NA, fill = "gray"),
    legend.position = c(0.1, 0.6),
    legend.key.width = unit(0.4, 'cm'),
    legend.margin = margin(2, 2, 2, 2),
    legend.key.height = unit(0.4, 'cm')
  )

MAU_MAP1E
#MAPe = LABS
MAU_MAP1E + labs(title = "Diarrhée et qualité de l'eau en Mauritanie",
                 subtitle = "La prévalence de la diarrhée [couleurs en %]\net la part des sources d'eau positives pour H2S [nombres en %]",
                 x = "",
                 y = "",
                 fill = "Prévalence\nde la diarrhée [%]",
                 caption = "données issues de EDS 2020 et EPCV 2019") +
  theme_map(base_size = 12) +
  theme(
    plot.background = element_rect(colour = NA, fill = "gray"),
    legend.background = element_rect(colour = NA, fill = "gray"),
    legend.position = c(0.1, 0.6),
    legend.key.width = unit(0.4, 'cm'),
    legend.margin = margin(2, 2, 2, 2),
    legend.key.height = unit(0.4, 'cm')
  )


  

#good one ! lot's of colours
MAU_MAP2 <- ggplot()+
  geom_sf(data = MAU_2, aes(fill=ADM2_EN), alpha = 0.6, colour = "white", size = .4)+
  scale_fill_manual(values = getPalette_M(colourCount_M))+
  geom_sf_text(data = MAU_2, aes(label = ADM2_EN), alpha = .7, size = 0.8) +
  theme(legend.position = "none")
MAU_MAP2


########## DHS DATA (NOT USED) ###################"
#location of DHS data
file_mau_dhs = "C:/Users/asus/Dropbox/_Mauritania/DHS 2020/Data/MRHR71SV/MRHR71FL.sav"
MAU_DHS <- read_sav(file_mau_dhs)
dim(MAU_DHS)
write_labelled
install.packages("expss")
library(expss)
check <- MAU_DHS[1:5,]
view(check)


##################### GRAPHS


# Data
data <- data.frame(
  Type_de_source = c("Robinet (logement/concession / jardin / parcelle)", "Robinet chez le voisin", "Robinet public  (borne fontaine, forage)", "Puits protegé", "Puits non protege", "Camion citerne", "Charrette avec petite citerne", "Eau de Surface)", "Autre", "National"),
  Presence = c(19, 21, 25, 37, 54, 41, 17, 68, 68, 30)
)

view(data)

# Reorder factor levels based on Presence values
data$Type_de_source <- with(data, reorder(Type_de_source, -Presence))

# Horizontal bar chart
H2S_SOURCE <- ggplot(data, aes(x = Presence, y = Type_de_source, fill = Type_de_source)) +
  geom_col(width = 0.6) +
  theme_minimal() +
  labs(x = "% de tests positifs",
       y = "Type de source",
       title = "Pourcentage de tests H2S positive par type de source d'eau potable",
      subtitle = "en Mauritanie en 2019",
      caption = "Données issues de l'EPCV 2019")+
  scale_fill_brewer(palette = "Paired")+
  geom_text(aes(label = paste0(Presence, "%")), size = 3, hjust = -0.3) +
  #theme_map(base_size = 10)+
  theme(
    axis.title.y = element_text(size = 10),
    axis.title.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    plot.caption = element_text(hjust = 0),
    plot.subtitle = element_text(hjust = 0.5), # Center the title horizontally
    plot.title = element_text(hjust = 0.5), # Center the title horizontally
    plot.title.position = "plot")+
  guides(fill = FALSE)
H2S_SOURCE
ggsave("H2S et source.png", H2S_SOURCE, width = 10, height = 6, units = "cm", dpi = 300,
       bg = "white", limitsize = FALSE)
ggsave('my_plot3.pdf', H2S_SOURCE, width=11, height=6, units='in')



H2S_SOURCE2 <- ggplot(data, aes(x = Presence, y = Type_de_source, fill = Type_de_source)) +
  geom_col(width = 0.7) +
  theme_minimal() +
  labs(x = "% de tests positifs",
       y = "Type de source",
       title = "Pourcentage de tests H2S positive par type de source d'eau potable",
       subtitle = "en Mauritanie en 2019",
       caption = "Données issues de l'EPCV 2019") +
  scale_fill_brewer(palette = "Paired") +
  geom_text(aes(label = paste0(Presence, "%")), size = 3, hjust = -0.3) +
  theme(
    text = element_text(size = 10),
    axis.title.y = element_text(size = 10),
    axis.title.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    plot.caption = element_text(hjust = 0),
    plot.subtitle = element_text(hjust = 0.5), # Center the title horizontally
    plot.title = element_text(hjust = 0.5), # Center the title horizontally
    plot.title.position = "plot") +
  guides(fill = FALSE)

H2S_SOURCE2
ggsave("H2S et source.png", plot = H2S_SOURCE2, width = 10, height = 6, units = "cm", dpi = 300,
       bg = "white", limitsize = FALSE)


########## DHS DATA ###################"
#location of DHS data
file_mau_dhs = "C:/Users/asus/Dropbox/_Mauritania/DHS 2020/Data/MRHR71SV/MRHR71FL.sav"
MAU_DHS <- read_sav(file_mau_dhs)
dim(MAU_DHS)
MAU_DHS <- MAU_DHS[,1:80]
MAU_DHS_labelled <- haven::as_factor(MAU_DHS)
view(MAU_DHS_labelled)

# Calculate the WEIGHTED counts and percentages for water supply (Regional)
#NEED to multiply household weight * household size ! = HV009 * HV005)
MAU_DHS_regional_weighted <- MAU_DHS_labelled %>% #weight * household size
  group_by(HV024, HV201) %>%
  summarise(weighted_count = sum(HV009 * HV005, na.rm = TRUE)) %>%
  mutate(percentage = round(weighted_count / sum(weighted_count) * 100,1))
view(MAU_DHS_regional_weighted)
write_xlsx(MAU_DHS_summary_weighted, "MAU_DHS_water_region_weighted.xls")

# Calculate the WEIGHTED counts and percentages for water supply (NATIONAL)
#NEED to multiply household weight * household size ! = HV009 * HV005)
MAU_DHS_national_weighted <- MAU_DHS_labelled %>% #weight * household size
  group_by(HV201) %>%
  summarise(weighted_count = sum(HV009 * HV005, na.rm = TRUE)) %>%
  mutate(percentage = round(weighted_count / sum(weighted_count) * 100,1))
view(MAU_DHS_national)
write_xlsx(MAU_DHS_national_weighted, "MAU_DHS_water_national_weighted.xls")
library(write_xlsx)

###################POINTS D'EAU DCQE##################

file_mau_points = "C:/Users/asus/Dropbox/_Mauritania/_Data partners/SIPPE2/SIG/ArcView/pt_eau/SR-ListeDesPE-new_font_point.dbf"
MAU_POINTS <- read_sf(file_mau_points)


POINTSTEN <- MAU_POINTS[1:10,]
view(POINTSTEN)

# Number 1 = all points in mauritania (more or less)
MAU_POINTS2 <- MAU_POINTS %>%
  filter(XCOORD > 3) %>%
  filter(YCOORD > 14.5)
dim(MAU_POINTS2)

# Number 2 = productif + no duplicates
productif_MAU_POINTS2 <- MAU_POINTS2 %>%
  filter(PRODUCTIVI == "productif")
dim(productif_MAU_POINTS2)

productif_MAU_POINTS2_no_dupl2 <- productif_MAU_POINTS2 %>%
  group_by(geometry) %>%
  sample_n(size = 1) %>%
  ungroup()

dim(productif_MAU_POINTS2_no_dupl2)


# Number 3 = strict filter + no duplicates

productif_MAU_POINTS3 <- MAU_POINTS2 %>%
  filter(PRODUCTIVI == "productif") %>%
  filter(TYPEEXHAUR != "aucune") %>%
  filter(TYPEEXHAUR != "vide") %>%
  filter(USAGE != "vide") %>%
  filter(DIAMETRECH != 0)

productif_MAU_POINTS2_no_dupl3 <- productif_MAU_POINTS3 %>%
  group_by(geometry) %>%
  sample_n(size = 1) %>%
  ungroup()
dim(productif_MAU_POINTS2_no_dupl3)

# 3 maps - orginal -> weak filter -> strict filter

#Map 1 = points in mauritania)
MAP_MAU_allpoints <- ggplot() +
  geom_sf(data = MAU_1, fill = "white", size = 0.3) +
  geom_sf(data = MAU_POINTS2, size = 0.00005, colour = "purple")+
  labs(title = "Points d'eau 1",
       subtitle = "Tous les points d'eau dans le BdD DCQE (n = +11.000)")
MAP_MAU_allpoints

#MAP 2 = productif + no duplicates
MAP_MAU_productivepoints <- ggplot() +
  geom_sf(data = MAU_1, fill = "white", size = 0.3) +
  geom_sf(data = productif_MAU_POINTS2_no_dupl2, size = 0.00005, colour = "darkgreen") +
  base
  labs(title = "Points d'eau 2",
       subtitle = "Sans points dupliqués + productifs (n = +7000)")
MAP_MAU_productivepoints

#Map 3 = strict filter + no duplicates
MAP_MAU_strict <- ggplot() +
  geom_sf(data = MAU_1, fill = "white", size = 0.3) +
  geom_sf(data = productif_MAU_POINTS2_no_dupl3, size = 0.00005, colour = "blue") +
    labs(title = "Points d'eau 3",
       subtitle = "Sans points dupliqués + filtre strict (n = +5000)")
MAP_MAU_strict + theme_map(base_size = 12)

#maps without grid
MAP_MAU_allpoints + theme_map(base_size = 12)
MAP_MAU_productivepoints + + theme_map(base_size = 12)
MAP_MAU_strict + theme_map(base_size = 12)


#count duplicates
duplicates_count <- productif_MAU_POINTS3 %>%
  group_by(geometry) %>%
  filter(n() > 1) %>%
  summarise(num_duplicates = n())
duplicates_count
print(n = )

##############test

MAP_MAU_allpoints_cond <- ggplot() +
  geom_sf(data = MAU_1, fill = "white", size = 0.3) +
  geom_sf(data = productif_MAU_POINTS2_no_dupl3, aes(color = CONDUCTIVI > 3000), size = 0.00005) +
  scale_color_manual(values = c("FALSE" = "lightgray", "TRUE" = "red")) +
  labs(title = "Points d'eau 1",
       subtitle = "Tous les points d'eau dans le BdD DCQE (n = +11.000)")
MAP_MAU_allpoints_cond

MAP_MAU_allpoints_cond2 <- ggplot() +
  #geom_sf(data = MAU_1, fill = "lightblue", size = 0.3) +
  geom_sf(data = MAU_2, alpha = 0.6, colour = "white", size = .4) +
  geom_sf(data = MAU_POINTS2, aes(color = ifelse(CONDUCTIVI > 2500, "red", ifelse(CONDUCTIVI > 1500, "purple", "NA" ))), size = 0.00005) +
  scale_color_manual(values = c("purple", "red")) +
  labs(title = "Points d'eau 1B",
       subtitle = "Conductivité > 1500 & >2500)")+
  theme(legend.position = "none")
MAP_MAU_allpoints_cond2

MAP_MAU_allpoints_cond3 <- ggplot() +
  #geom_sf(data = MAU_1, fill = "lightblue", size = 0.3) +
  geom_sf(data = MAU_2, alpha = 0.6, colour = "white", size = 0.4) +
  geom_sf(data = MAU_POINTS2, subset = (MAU_POINTS2$CONDUCTIVI > 1500), aes(color = ifelse(CONDUCTIVI > 2500, "red", ifelse(CONDUCTIVI > 1500, "purple", "NA" ))), 
          size = 0.00005) +
  scale_color_manual(values = c("purple", "red")) +
  labs(title = "Points d'eau 1B",
       subtitle = "Conductivité > 1500 & >2500)") +
  theme(legend.position = "none")

 #### Map 4 Conductivity map DCQE ####

conductivity_MAU_POINTS <- MAU_POINTS2 %>%
  filter(CONDUCTIVI > 1000)

MAP_MAU_allpoints_cond <- ggplot() +
  #geom_sf(data = MAU_1, fill = "lightblue", size = 0.3) +
  geom_sf(data = MAU_2, fill = "white", colour = "black", size = 0.1) +
  geom_sf(data = conductivity_MAU_POINTS, aes(color = ifelse(CONDUCTIVI > 2500, "red", ifelse(CONDUCTIVI > 1500, "purple", "green3"))), size = 1) +
  scale_color_manual(values = c("green3", "purple", "red"),
                     labels = c(">1000", ">1500", ">2500")) +
  labs(title = "Points d'eau. Conductivité",
       subtitle = "Conductivité >1000 > 1500 & >2500",
       color = "Conductivité")+
  guides(color = guide_legend(override.aes = list(size = 3)))
MAP_MAU_allpoints_cond

############ CNRS  ######

file_mau_cnre = "C:/Users/asus/Dropbox/_Mauritania/_Data partners/CNRE/CNRE_for_R.xlsx"
MAU_CNRE <- read_excel(file_mau_cnre)
MAU_CNRE_cleaned <- MAU_CNRE[complete.cases(MAU_CNRE2$Latitude, MAU_CNRE2$Longitude), ]
MAU_CNRE2 <- st_as_sf(MAU_CNRE_cleaned, coords = c("Longitude", "Latitude"), crs = 4326)
dim(MAU_CNRE2)

#remove a datapoint that is located in Niger
MAU_CNRE3 <- MAU_CNRE2 %>%
  filter(Sample_Name != "Kaedi")
head(MAU_CNRE3)

#change nitrate column name it contains special character
MAU_CNRE3 <- MAU_CNRE3 %>%
  rename(Nitrate = `NO3-_`)

# Convert non-numeric values in Nitrate to NA



#MAP ZERO
MAP_CNRE <- ggplot(MAU_CNRE3)+
  geom_sf(data = MAU_2, fill = "white", colour = "black", size = 0.1) +
  geom_sf(fill="grey",alpha=.9)+labs(title="Solid Map",x="Longitude",y="Lattitude")

#MAP 1 conductivity
MAP_CNRE_cond <- ggplot() +
  geom_sf(data = MAU_2, fill = "white", colour = "black", size = 0.1) +
  geom_sf(data = MAU_CNRE3, aes(color = ifelse(CE_µS_cm > 2500, "red", ifelse(CE_µS_cm > 1500, "purple", "green3"))), size = 1) +
  scale_color_manual(values = c("green3", "purple", "red"),
                     labels = c(">1000", ">1500", ">2500")) +
  labs(title = "Points d'eau CNRE. Conductivité",
       subtitle = "Conductivité >1000 > 1500 & >2500",
       color = "Conductivité")+
  guides(color = guide_legend(override.aes = list(size = 3)))
MAP_CNRE_cond

#MAP 2 Nitrate
#first need to do some data cleaning, remove all non-numeric values
MAU_CNRE3 <- MAU_CNRE3 %>%
  mutate(Nitrate = as.numeric(Nitrate))


MAP_CNRE_nitrate2 <- ggplot() +
  geom_sf(data = MAU_2, fill = "white", colour = "black", size = 0.1) +
  geom_sf(data = (MAU_CNRE3[complete.cases(MAU_CNRE3$Nitrate), ]), aes(color = ifelse(Nitrate > 100, "red", ifelse(Nitrate >75, "purple", ifelse(Nitrate > 50, "orange", "green")))), size = 2, alpha = 0.5) +
  scale_color_manual(values = c("green", "orange", "purple", "red"), 
                     labels = c("0-50", "50-75", "75-100",">100")) +
  labs(title = "Points d'eau CNRE. Conductivité",
       subtitle = "Nitrate",
       color = "Nitrate")+
  guides(color = guide_legend(override.aes = list(size = 3)))
MAP_CNRE_nitrate2

############### this is the one ........
# Convert to a factor and define the order of the levels
MAU_CNRE3$Nitrate_levels <- factor(MAU_CNRE3$Nitrate_levels, 
                                   levels = c(">100", "75-100", "50-75", "0-50"))

# Arrange the data by Nitrate_levels
MAU_CNRE3 <- MAU_CNRE3 %>%
  arrange(desc(Nitrate_levels))

# Plot
MAP_CNRE_nitrate3 <- ggplot() +
  geom_sf(data = MAU_2, fill = "white", colour = "black", size = 0.1) +
  geom_sf(data = MAU_CNRE3[complete.cases(MAU_CNRE3$Nitrate_levels), ], 
          aes(color = Nitrate_levels), size = 1) +
  scale_color_manual(values = c(">100" = "red", "75-100" = "purple", "50-75" = "orange", "0-50" = "green")) +
  labs(title = "Points d'eau CNRE. Nitrate",
       subtitle = "Nitrate",
       color = "Nitrate") +
  guides(color = guide_legend(override.aes = list(size = 3)))

MAP_CNRE_nitrate3





