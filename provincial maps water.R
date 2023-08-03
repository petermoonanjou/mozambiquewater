

moz_data_district <- read_sf("MOZ/moz_admbnda_adm2_ine_20190607.shp")
moz_data_prov <- read_sf("MOZ/moz_admbnda_adm1_ine_20190607.shp")
moz_data_posto <- read_sf("MOZ/moz_admbnda_adm3_ine_20190607.shp")

#add LEVEL column to province data for surface water (PAY ATTENTION, FIRST MAP PRO then MAP CITY)
moz_data_prov$LEVEL_SUR <- as.numeric(c(9.3, 5.3, 1.5, 14.1, 0.7, 0.1, 14.8, 17.9, 4.0, 16.8, 17.7))

#add number of people that use Surface water in 2022
moz_data_prov$POPSUR2022 <- as.factor(c(249, 77, 24, 316, 16, 1, 960, 382, 104, 516, 1039))

##### RECODE for map ##########
# Cut-off values
cut_points <- c(0, 2, 5, 10, 20)
# Labels for new categories
labels_sur <- c("Low", "Moderate", "High", "Very High")
# Recode values using cut function
moz_data_prov$LEVEL_SUR_MAP <- cut(moz_data_prov$LEVEL_SUR, breaks = cut_points, labels = labels_sur, right = FALSE)
view(moz_data_prov$LEVEL_SUR_MAP)

# Display the recoded data
print(recoded_data)

#change levels of factors LEVEL_SUR_MAP column (for the legend etc.)
moz_data_prov$LEVEL_SUR_MAP <- fct_relevel(moz_data_prov$LEVEL_SUR_MAP, "Low", after = 0)
moz_data_prov$LEVEL_SUR_MAP <- fct_relevel(moz_data_prov$LEVEL_SUR_MAP, "Moderate", after = 1)
moz_data_prov$LEVEL_SUR_MAP <- fct_relevel(moz_data_prov$LEVEL_SUR_MAP, "High", after = 2)
moz_data_prov$LEVEL_SUR_MAP <- fct_relevel(moz_data_prov$LEVEL_SUR_MAP, "Very High", after = 3)
levels(moz_data_prov$LEVEL_SUR_MAP)

#new legend (change labels and caption to get % !)
#map of provinces + data labels and Province labels

cols = c("ivory2", "lemonchiffon", "lemonchiffon3","rosybrown3")

MAP_SURFACE_PROV <- ggplot()+
  geom_sf(data = moz_data_prov, aes(fill=LEVEL_SUR_MAP), size = 0.5)+
  scale_fill_manual(na.translate = F,
                    values = cols,
                    labels = c("Low. 0>2%",
                               "Moderate. 2>5%",
                               "High. 5>10%",
                               "Very High. 10>20%"))+
  geom_sf_label(data = moz_data_prov,aes(label = ADM1_PT),
                alpha = .7,
                colour = "black",
                label.size = NA,
                size = 2.2,
                fill = "lightblue",
                nudge_y = c(-0.8,0,0,0,0.5,0,0,1,-1,1,-1),
                nudge_x = c(0,-2,1.7,-2,-1.5,1.7,1.5,0,1,0,1))+
  #hjust = "outward")
  geom_sf_label(data = moz_data_prov, aes(label = POPSUR2022),
                alpha = NA,
                colour = "black",
                label.size = NA,
                size = 2.2,
                fontface = "bold",
                fill = NA,
                nudge_y = c(0,0,0,0,0.5,0,0,0,0,0,0),
                nudge_x = c(0,0,0,0,0,0.7,0,0,0,0,0))+
  labs(title = "Prevalence of Surface Water use by Province",
       subtitle = "The number and percentage\nof people using surface water as the main\nsource of drinking water, in 2022",
       x = "",
       y = "",
       fill = "Level of\nsurface water\nusage",
       caption = "Map shows the prevalence of surface water use per province.\nValues on the map represent thousands.\nColours represent percentages")+
  theme_map(base_size = 10)+
  theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
  theme(legend.margin = margin(2,2,2,2))+
  theme(legend.key.height = unit(0.4, 'cm'))+
  theme(plot.background = element_rect(color = NA))+
  theme(legend.key = element_rect(colour = "lightgray"))+
  guides(fill = guide_legend(override.aes = list(color = "darkgray", linewidth = 0.005)))
  

MAP_SURFACE_PROV

ggsave("_MOZ_PRO_FINAL_PER_POP.png", map_moz_prov_leg2, width = 10, height = 15, units = "cm")