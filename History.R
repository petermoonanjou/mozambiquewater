posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_label(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7,
colour ="black",
fill = "lightblue",
size = 2.2)
library(tidyverse)
library(sf)
library(ggthemes)

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_label(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7,
colour ="black",
fill = "lightblue",
size = 2.2)

posto_dis_prov9
#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_label(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7,
colour ="black",
fill = "lightblue",
size = 0.3)
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_label(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7,
#colour ="black",
#fill = "lightblue",
size = 0.3)
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_label(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7,
colour = NA,
fill = NA,
size = 0.3)
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_label(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7,
colour = "black",
fill = NA,
size = 0.3)
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_label(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7, size = 0.3)
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_text(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7, size = 0.4)
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
geom_sf(data = moz_prov_shape, fill= NA, alpha = 1, colour = "purple", size = .35)+
theme_map(base_size = 14)+ #this is quite good when printing on A4
theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.background = element_rect(colour = NA, fill = "lightgray"))+
theme(legend.position = c(0.7,0.1), legend.key.width = unit(0.4, 'cm'))+
theme(legend.margin = margin(2,2,2,2))+
theme(legend.key.height = unit(0.4, 'cm'))+
theme(plot.background = element_rect(color = NA))+
geom_sf_text(data = UNICEF_merge4, aes(label = Posto_key), alpha = .7, size = 0.5)
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
fill = "lightblue",
size = 2.2,
nudge_y = c(0,0,0,0,0,0,0,0,-1,0,-1),
nudge_x = c(0,0,1,-1,-1.5,2,0,0,1,0,1))
posto_dis_prov9
moz_prov_shape %>%
groupby(ADM1_PT) %>%
summarise(count = n())
moz_prov_shape %>%
group_by(ADM1_PT) %>%
summarise(count = n())

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
fill = "lightblue",
size = 2.2,
nudge_y = c(0,0,0,0,0,0,0,0,-1,2,-1),
nudge_x = c(1.5,-1.5,1.5,-1.5,-1.5,2,2,-2,1,0,1.5))

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
fill = "lightblue",
size = 1.8,
nudge_y = c(0,0,0,0,0,0,0,0,-1,2,-1),
nudge_x = c(1.5,-1.5,1.5,-1.5,-1.5,2,2,-2,1,0,1.5))
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
fill = "lightblue",
size = 1.5,
nudge_y = c(0,0,0,0,0,0,0,0,-1,2,-1),
nudge_x = c(1.8,-1.6,1.6,-1.5,-1.5,1.5,2.1,-2.2,1,0,1.3))
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
nudge_x = c(1.9,-1.6,1.6,-1.5,-1.5,1.4,2.15,-2.2,1,0,1.3))
posto_dis_prov9

#this is first posto map with surface water data POPULATION
posto_dis_prov9 <- ggplot()+
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
posto_dis_prov9

UNICEF_merge4 %>%
filter(Provincia == "Gaza") %>%
group_by(Posto_key, N.Surface2022) %>%
summarise(count = (n))
UNICEF_merge4 %>%
filter(Provincia == "Gaza") %>%
group_by(Posto_key, N.Surface2022) %>%
summarise(count = n())
UNICEF_merge4 %>%
filter(Provincia == "Gaza") %>%
group_by(Posto_key, P.Surface2022) %>%
summarise(count = n())
UNICEF_merge4$P.Surface2022MAP <- round(UNICEF_merge4$P.Surface2022)

#this is first posto map with surface water data PERCENTAGE
posto_dis_prov8 <- ggplot()+
geom_sf(data = UNICEF_merge4, aes(fill=SurfaceMap2022), alpha = 0.6, colour = "white", size = .2)+
scale_fill_manual(values = my_palette,
na.value = "yellow",
labels = my_labels)+
labs(title = "Surface water",
subtitle = "The percentage\nof people using surface water as\nthe main source of drinking water\nin 2017, per Posto",
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
geom_sf_text(data = UNICEF_merge4, aes(label = P.Surface2022MAP), alpha = .7, size = 0.5) +
geom_sf_label(data = moz_prov_shape, aes(label = ADM1_PT), alpha = .7,
colour ="black",
fill = "lightgray",
size = 1.5,
nudge_y = c(0,0,0,0,0,0,0,0,-1,2,-1),
nudge_x = c(1.9,-1.6,1.6,-1.5,-1.5,1.4,2.2,-2.2,1,0,1.3))
posto_dis_prov8

my_labels <- c("<1%", "1-10%", "10-20%", "20-30%", "30-40%", ">40%")

#this is first posto map with surface water data PERCENTAGE
posto_dis_prov8 <- ggplot()+
geom_sf(data = UNICEF_merge4, aes(fill=SurfaceMap2022), alpha = 0.6, colour = "white", size = .2)+
scale_fill_manual(values = my_palette,
na.value = "yellow",
labels = my_labels)+
labs(title = "Surface water",
subtitle = "The percentage\nof people using surface water as\nthe main source of drinking water\nin 2017, per Posto",
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

posto_dis_prov8

#this is first posto map with surface water data PERCENTAGE
posto_dis_prov8 <- ggplot()+
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

posto_dis_prov8
