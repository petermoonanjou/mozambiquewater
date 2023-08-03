library(tidyverse)
library(sf)
library(ggthemes)


######COPY OF IMPORTANT FILES FOR MAP#####

SF_POSTO_MAP1 <- UNICEF_merge4

############################


##### MAPS WITH OLD POP GROUPINS  ######################

#this is posto map with surface water data POPULATION
POSTO_MAP_POP1 <- ggplot()+
  geom_sf(data = UNICEF_merge4, aes(fill=SurfaceMapPop2022), alpha = 0.6, colour = "white", size = .2)+
  scale_fill_manual(values = my_palette2,
                    na.value = "yellow",
                    labels = my_labels2)+
  labs(title = "Surface water",
       subtitle = "The number of people\nusing surface water as\nthe main source of drinking water\nin 2022, per Posto",
       x = "",
       y = "",
       fill = "Number of people",
       caption = "k = 1000.  White borders = Posto, black = District, purple = Province")+
  geom_sf(data = UNICEF2, fill=NA, alpha = 1, colour = "black", size = .2)+
  geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .3)+
  theme_map(base_size = 14)+ #this is quite good when printing on A4
  theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
  theme(legend.margin = margin(2,2,2,2))+
  theme(legend.key.height = unit(0.4, 'cm'))+
  theme(plot.background = element_rect(color = NA))+
  geom_sf_text(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7, size = 0.5) +
  geom_sf_label(data = moz_prov_shape, aes(label = ADM1_PT), alpha = .7,
                colour ="black",
                fill = "lightgray",
                size = 1.5,
                nudge_y = c(0,0,0,0,0,0,0,0,-1,2,-1),
                nudge_x = c(1.9,-1.6,1.6,-1.5,-1.5,1.4,2.2,-2.2,1,0,1.3))
POSTO_MAP_POP1


#this is Posto map with surface water data PERCENTAGE
POSTO_MAP_PERC1 <- ggplot()+
  geom_sf(data = UNICEF_merge4, aes(fill=SurfaceMap2022), alpha = 0.6, colour = "white", size = .2)+
  scale_fill_manual(values = my_palette,
                    na.value = "yellow",
                    labels = my_labels)+
  labs(title = "Surface water",
       subtitle = "The percentage\nof people using surface water as\nthe main source of drinking water\nin 2022, per Posto",
       x = "",
       y = "",
       fill = "% of population",
       caption = "White borders = Posto, black = District, purple = Province")+
  geom_sf(data = UNICEF2, fill=NA, alpha = 1, colour = "black", size = .2)+
  geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
  theme_map(base_size = 14)+ #this is quite good when printing on A4
  theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
  theme(legend.margin = margin(2,2,2,2))+
  theme(legend.key.height = unit(0.4, 'cm'))+
  theme(plot.background = element_rect(color = NA)) +
  geom_sf_text(data = UNICEF_merge4, aes(label = P.Surface2022MAP), alpha = .7, size = 0.8) +
  geom_sf_label(data = moz_prov_shape, aes(label = ADM1_PT), alpha = .7,
                colour ="black",
                fill = "lightgray",
                size = 1.5,
                nudge_y = c(0,0,0,0,0,0,0,0,-1,2,-1),
                nudge_x = c(1.9,-1.6,1.6,-1.5,-1.5,1.4,2.2,-2.2,1,0,1.3))

POSTO_MAP_PERC1


############# MAPS WITH NEW POP GROUPING / LEGEBD ############


#RECODE POP
cut_points <- c(0, 1000, 25000, 50000, Inf)
labelsPOP <- as.factor(c("<1K", "1K > 25K", "25K > 50K", ">50K"))
SF_POSTO_MAP1$SurfaceMapPop2022_B <- cut(SF_POSTO_MAP1$N.Surface2022, breaks = cut_points, labels = labelsPOP, right = FALSE)

labelsPOP <- fct_relevel(labelsPOP, "<1K", after = 0)
labelsPOP <- fct_relevel(labelsPOP, "1K > 25K", after = 1)
labelsPOP <- fct_relevel(labelsPOP, "25K > 50K", after = 2)
labelsPOP <- fct_relevel(labelsPOP, "<>50K", after = 0)
levels(labelsPOP)

#####new maps

my_palette_blue_to_purple <- c("#D6EAF8", "#85C1E9", "#1F618D", "#6C3483")


#POSTO Population , new legend, BASESIZE = 12
POSTO_MAP_POP2 <- ggplot()+
  geom_sf(data = SF_POSTO_MAP1, aes(fill=SurfaceMapPop2022_B), alpha = 0.6, colour = "white", size = .2)+
  scale_fill_manual(values = my_palette_blue_to_purple,
                    na.value = "yellow",
                    labels = labelsPOP)+
  labs(title = "Surface water",
       subtitle = "The number of people\nusing surface water as\nthe main source of drinking water\nin 2022, per Posto",
       x = "",
       y = "",
       fill = "Number of\npeople that\nuse surface\nwater",
       caption = "k = 1000.  White borders = Posto\nblack = District, purple = Province")+
  geom_sf(data = UNICEF2, fill=NA, alpha = 1, colour = "black", size = .2)+
  geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .3)+
  theme_map(base_size = 10)+ #this is quite good when printing on A4
  theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
  theme(legend.margin = margin(2,2,2,2))+
  theme(legend.key.height = unit(0.4, 'cm'))+
  theme(plot.background = element_rect(color = NA))+
  #geom_sf_text(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7, size = 0.5) +
  geom_sf_label(data = moz_prov_shape, aes(label = ADM1_PT), alpha = .7,
                colour ="black",
                fill = "lightgray",
                size = 2,
                nudge_y = c(0,0,0,0,0,0,0,0,-1,2,-1),
                nudge_x = c(1,
                            -1.6,
                            1.6,
                            -1.5,
                            -1.5,
                            1.4,
                            1.5,
                            -2.2,
                            1,
                            0,
                            1.3))+
  guides(fill = guide_legend(override.aes = list(color = "darkgray", linewidth = 0.005)))

                    
POSTO_MAP_POP2

########## POSTO Map without any legend #############

POSTO_MAP_POP3 <- ggplot()+
  geom_sf(data = SF_POSTO_MAP1, aes(fill=SurfaceMapPop2022_B), alpha = 0.6, colour = "white", size = .2)+
  scale_fill_manual(values = my_palette_blue_to_purple,
                    na.value = "yellow",
                    labels = labelsPOP)+
  #labs(title = "Surface water",
  #     subtitle = "The number of people\nusing surface water as\nthe main source of drinking water\nin 2022, per Posto",
  #     x = "",
  #     y = "",
  #     fill = "Number of\npeople that\nuse surface\nwater",
  #     caption = "k = 1000.  White borders = Posto\nblack = District, purple = Province")+
  geom_sf(data = UNICEF2, fill=NA, alpha = 1, colour = "black", size = .2)+
  geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .3)+
  theme_map(base_size = 12)+ #this is quite good when printing on A4
  theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
  guides(fill = "none")
  
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))
  theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
  theme(legend.margin = margin(2,2,2,2))+
  theme(legend.key.height = unit(0.4, 'cm'))+
  theme(plot.background = element_rect(color = NA))+
  #geom_sf_text(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7, size = 0.5) +
  geom_sf_label(data = moz_prov_shape, aes(label = ADM1_PT), alpha = .7,
                colour ="black",
                fill = "lightgray",
                size = 2,
                nudge_y = c(0,0,0,0,0,0,0,0,-1,2,-1),
                nudge_x = c(1,
                            -1.6,
                            1.6,
                            -1.5,
                            -1.5,
                            1.4,
                            1.5,
                            -2.2,
                            1,
                            0,
                            1.3))
  
  POSTO_MAP_POP3
