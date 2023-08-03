#failed


#here it tried to replace all values in df_harm3$wat2 by using vectors in which the replacements were stored. Failed.


harm_sources2 <- harm_sources[,-2]
print(harm_sources2, n= 100)
write.csv2(harm_sources2, file = "harm_sources_clean.csv", row.names= FALSE)

#in excel, i have recoded all the sources
getwd()
vector_original <- read.csv2("vector_original.csv", header = FALSE)
vector_original2 <- unlist(vector_original)
class(vector_original2)
length(vector_original2)

vector_new <- read.csv2("vector_new.csv", header = FALSE)
vector_new2 <- unlist(vector_new)
class(vector_new2)
length(vector_new2)

df_harm3 <- df_harm2

# find indices of matching values in wat column of df
idx <- match(df_harm3$wat2, vector_original2)
print(idx)
# replace matching values in wat column with corresponding values in b
df_harm3$wat2[idx %in% which(!is.na(idx))] <- vector_new2[idx %in% which(!is.na(idx))]



########## NOT SURE WHAT THIS WAS

#trimming df2 (work out the problem with the whitespace)
df2_trimmed <- apply(df2, 2, trimws)
df2_trimmed <- as.data.frame(df2_trimmed)
colnames(water_surface_trimmed2) <- colnames(df2)
head(df2_trimmed)

#Census data - ALL POSTOS (regardless of water data)
all_postos_in_census <- df2 %>%
  group_by(Provincia_first, Distrito_first, Posto_first) %>%
  summarise(count = n()) %>% #household count
  mutate(percentage = round(count/sum(count)*100, digits = 1))
#this seems to generate % of households compared to the total households in respective District
#the statistics are not so interesting.
head(water_z)
dim(water_z)
write_xlsx(all_postos_in_census,"all_postos_census.xlsx")

#Census data _ water data
#water by posto sav
water_posto_census <- df2 %>%
  group_by(Provincia_first, Distrito_first, Posto_first, D10_FONTE_AGUA_PARA_BEBER) %>%
  summarise(count = n()) %>%
  mutate(percentage = round(count/sum(count)*100, digits = 1))
head(water_posto_census)
write_xlsx(water_posto_census,"water_posto_census.xlsx")

water_surface_posto_census <- water_posto_census %>% filter(D10_FONTE_AGUA_PARA_BEBER == "?gua de superf?cie (rio / lago / lagoa)")
head(water_surface_posto_census)
write_xlsx(water_surface_posto_census,"water_surface_posto_census.xlsx")

water_surface_trimmed <- apply(water_surface_posto_census, 2, trimws)
water_surface_trimmed2 <- as.data.frame(water_surface_trimmed)
colnames(water_surface_trimmed2) <- colnames(water_surface_trimmed)
view(water_surface_trimmed2)
####test_barchart

class(water_surface_trimmed)

water_cabo_map <- water_surface_trimmed2 %>%
  filter(Provincia_first == "Cabo Delgado") %>%
  group_by(Posto_first) %>%
  ggplot() + 
  geom_bar(aes(x = Distrito_first, y = percentage), stat = "identity") +
  ggtitle("Water Usage in Cabo") +
  xlab("Posto") +
  ylab("Percentage")

water_cabo_map

#####################

posto_dis_prov4 <- ggplot()+
  geom_sf(data = moz_data_prov, aes(fill= ADM1_PT), alpha = 1, colour = "magenta4", size = .2)+
  scale_fill_brewer(palette = "Paired")+
  new_scale_fill()+
  geom_sf(data = moz_data_district, fill=NA, colour = "darkblue", size = .1)+
  geom_sf(data = UNICEF1, aes(fill=CodPost), alpha = 0.4, colour = "black", size =.1)+
  scale_fill_brewer(palette = "BuPu")+
  theme(legend.position = "none")
posto_dis_prov4

posto_dis_prov5 <- ggplot()+
  geom_sf(data = moz_data_prov, aes(fill= ADM1_PT), alpha = 1, colour = "magenta4", size = .1)+
  scale_fill_brewer(palette = "Paired")+
  new_scale_fill()+
  geom_sf(data = moz_data_district, fill=NA, colour = "darkblue", size = .1)+
  geom_sf(data = UNICEF1, aes(fill=CodPost), alpha = 0.6, colour = "black", size =.1)+
  scale_fill_brewer(palette = "BuPu")+
  theme(legend.position = "none")
posto_dis_prov5

posto_dis_prov6 <- ggplot()+
  #geom_sf(data = moz_data_district, aes(fill=ADM2_PT), alpha = 1, colour = "black", size = .1)+
  geom_sf(data = UNICEF1, aes(fill=Distrito), alpha = 0.6, colour = "white", size = .4)+
  scale_fill_manual(values = getPalette2(colourCount))+
  geom_sf(data = moz_data_prov, fill= NA, alpha = 1, colour = "magenta4", size = .4)+
  theme(legend.position = "none")
posto_dis_prov6

#three maps: posto + district + province
posto_dis_prov <- ggplot()+
  geom_sf(data = moz_data_district, aes(fill=NA), colour = "black", size = .3)+
  geom_sf(data = moz_data_prov, fill= NA, colour = "darkblue", size = .5)+
  geom_sf(data = UNICEF1, fill = "Cego", colour = "white", size =.5)

posto_dis_prov


#################

library(dplyr)

# create a sample data frame with numeric values and missing values
my_df <- data.frame(category = c("A", "A", "B", "B", "C", "C"), value = c(0, 5, 10, NA, 20, 0))

# calculate the percentage of non-zero and non-missing values in each category
my_summary <- my_df %>%
  group_by(category) %>%
  summarize(non_zero_pct = sum(value > 0 & !is.na(value)) / sum(!is.na(value)) * 100)

# view the resulting summary table
my_summary

library(dplyr)

# create a sample data frame with numeric values and missing values
my_df <- data.frame(category = c("A", "A", "B", "B", "C", "C"), value = c(0, 5, 10, NA, 20, 0))

# calculate the percentage of non-zero and non-missing values in each category
my_summary <- my_df %>%
  group_by(category) %>%
  summarize(non_zero_pct = ifelse(sum(value > 0 & !is.na(value)) == 0, 0, sum(value > 0 & !is.na(value)) / sum(!is.na(value)) * 100))

# view the resulting summary table
my_summary

##############



"colours)"
colourss = c("lightblue", "red", "darkblue", "purple", "lightblue", "yellow", "green", "red","lightblue", "red", "darkblue","lightblue", "red", "darkblue", "red", "lightblue", "yellow", "green", "red","lightblue", "red", "darkblue")
colourss2 = c("khaki", "lavender", "lightblue", "lightpink", "ivory", "palegreen", "peru", "skyblue", "violet", "tomato", "yellowgreen")

#colour brewer package - make more colours of brewer
colourCount = length(unique(UNICEF_merge3))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))
getPalette2 = colorRampPalette(brewer.pal(9, "Paired"))
print(colourCount)

#colour brewer package - make more colours of brewer
colourCount2 = length(unique(UNICEF_merge$P.Surface))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))
getPalette2 = colorRampPalette(brewer.pal(9, "Paired"))
print(colourCount)

# Find values in df1$key that are not in df2$key
not_matched_in_df1 <- setdiff(UNICEF_merge2$key, check_df_census$key)
# Find values in df2$key that are not in df1$key
not_matched_in_df2 <- setdiff(check_df_census$key, UNICEF_merge2$key)
# Combine and print the not matched values from both dataframes
not_matched_values <- list(df1 = not_matched_in_df1, df2 = not_matched_in_df2)
not_matched_values


######convert SF to Tibble for Tidyverse
UNICEF_check <- st_cast(UNICEF_merge, "POINT") %>%
  as_tibble()

UNICEF_check %>%
  group_by(Distrito, P.Surface) %>%
  filter(Provincia == "Maputo Cidade") %>%
  summarise(count = n())

# Get the names of all objects in the environment
object_names <- ls(envir = .GlobalEnv)

# Calculate the size (in memory) for each object
object_sizes <- sapply(object_names, function(x) object.size(get(x)))

# Sort objects by size in descending order
sorted_objects <- sort(object_sizes, decreasing = TRUE, index.return = TRUE)

# Print the sorted object names and their sizes
cat("Objects ranked by size (in bytes):\n")
for (i in seq_along(sorted_objects$x)) {
  cat(i, object_names[sorted_objects$ix[i]], ":", sorted_objects$x[i], "\n")
}

rm(df_harm3)


#test, create a new column with Posto_Pop

#sample df to test
sample_df <- UNICEF_merge3 %>%
  sample_frac(size = 0.05)


factors <- c("Cabo Delgado" =  1.179,
            "Gaza" =  1.058,
            "Inhambane" =  1.077,
            "Manica" =  1.210,
            "Maputo Cidade" =  1.050,
            "Maputo Provincia" =  1.256,
            "Nampula" =  1.186,
            "Niassa" =  1.247,
            "Sofala" =  1.187,
            "Tete" =  1.209,
            "Zambezia" =  1.173)
            
print(factors)

sample_df <- sample_df %>%
  mutate(Posto_Pop2022 = round(Posto_Pop * case_when(
    Provincia == "Cabo Delgado" ~ factors["Cabo Delgado"],
    Provincia == "Gaza" ~ factors["Gaza"],
    Provincia == "Inhambane" ~ factors["Inhambane"],
    Provincia == "Manica" ~ factors["Manica"],
    Provincia == "Maputo Cidade" ~ factors["Maputo Cidade"],
    Provincia == "Maputo Provincia" ~ factors["Maputo Provincia"],
    Provincia == "Nampula" ~ factors["Nampula"],
    Provincia == "Niassa" ~ factors["Niassa"],
    Provincia == "Sofala" ~ factors["Sofala"],
    Provincia == "Tete" ~ factors["Tete"],
    Provincia == "Zambezia" ~ factors["Zambezia"])))

view(sample_df)

#adjust surface water rate
factors2 <- c("Cabo Delgado" =  1.35,
             "Gaza" =  0.59,
             "Inhambane" =  0.32,
             "Manica" =  0.93,
             "Maputo Cidade" =  0.76,
             "Maputo Provincia" =  0.24,
             "Nampula" =  1.53,
             "Niassa" =  1.30,
             "Sofala" =  0.50,
             "Tete" =  1.26,
             "Zambezia" =  1.81)

sample_df <- sample_df %>%
  mutate(P.Surface2022 = round(P.Surface * case_when(
    Provincia == "Cabo Delgado" ~ factors2["Cabo Delgado"],
    Provincia == "Gaza" ~ factors2["Gaza"],
    Provincia == "Inhambane" ~ factors2["Inhambane"],
    Provincia == "Manica" ~ factors2["Manica"],
    Provincia == "Maputo Cidade" ~ factors2["Maputo Cidade"],
    Provincia == "Maputo Provincia" ~ factors2["Maputo Provincia"],
    Provincia == "Nampula" ~ factors2["Nampula"],
    Provincia == "Niassa" ~ factors2["Niassa"],
    Provincia == "Sofala" ~ factors2["Sofala"],
    Provincia == "Tete" ~ factors2["Tete"],
    Provincia == "Zambezia" ~ factors2["Zambezia"]), digits = 1))
view(sample_df)

write_xlsx(sample_df,"sample_df.xlsx")



# Create a color scale using colorRampPalette()
color_scale <- colorRampPalette(c("green", "purple"))
# Generate 13 color shades
colors <- color_scale(13)




#map with diarrhea rates
MAU_NO_BASIC <- ggplot()+
  geom_sf(data = MAU_1, aes(fill=NO_BASIC), alpha = 0.6, colour = "white", size = .4)+
  scale_fill_gradient(low = "ivory2", high = "hotpink4") +
  geom_sf_text(data = MAU_1, aes(label = NO_BASIC), alpha = NA , size = 3) +
  geom_sf_label(data = MAU_1, aes(label = ADM1_EN),
                alpha = .7,
                colour ="black",
                fill = "lightgray",
                size = 3,
                hjust = 0,
                nudge_x = 0.35,
                nudge_y = 0.1)+
  theme(legend.position = "none")
MAU_NO_BASIC


# Sample data with values
data <- c(3, 6, 12, 16, 0.2, 0.07, 0.11, 0.18)

# Cut-off values
cut_points <- c(0, 2, 5, 10, 20)

# Labels for new categories
labels <- c("Low: 0>5%", "Moderate: 5>10%", "High: 10>15%", "Very High: 15>20%")

# Recode values using cut function
recoded_data <- cut(data, breaks = cut_points, labels = labels, right = FALSE)

# Display the recoded data
print(recoded_data)


# remove pdf

# List all objects in the RStudio environment
all_objects <- ls()

# Filter objects with names containing ".pdf"
pdf_objects <- grep("\\.pdf$", all_objects, value = TRUE)

# Remove the PDF objects from the environment
rm(list = pdf_objects)


##### RECODE for map ##########
# Cut-off values
cut_points <- c(0, 50, 75, 100)
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


# Recode the Nitrate variable into a new variable
MAU_CNRE3$Nitrate_levels <- cut(MAU_CNRE3$Nitrate, 
                                breaks = c(-Inf, 50, 75, 100, Inf),
                                labels = c("0-50", "50-75", "75-100", ">100"))

# Convert to a factor and define the order of the levels
MAU_CNRE3$Nitrate_levels <- factor(MAU_CNRE3$Nitrate_levels, 
                                   levels = c(">100", "75-100", "50-75", "0-50"))



# Plot
MAP_CNRE_nitrate2 <- ggplot() +
  geom_sf(data = MAU_2, fill = "white", colour = "black", size = 0.1) +
  geom_sf(data = MAU_CNRE3[complete.cases(MAU_CNRE3$Nitrate_levels), ], 
          aes(color = Nitrate_levels), size = 1) +
  scale_color_manual(values = -dotcol1) +
  labs(title = "Points d'eau CNRE. Conductivité",
       subtitle = "Nitrate",
       color = "Nitrate") +
  guides(color = guide_legend(override.aes = list(size = 3)))

MAP_CNRE_nitrate2

library(dplyr)

# Recode the Nitrate variable into a new variable
MAU_CNRE3$Nitrate_levels <- cut(MAU_CNRE3$Nitrate, 
                                breaks = c(-Inf, 50, 75, 100, Inf),
                                labels = c("0-50", "50-75", "75-100", ">100"))

# Convert to a factor and define the order of the levels
MAU_CNRE3$Nitrate_levels <- factor(MAU_CNRE3$Nitrate_levels, 
                                   levels = c(">100", "75-100", "50-75", "0-50"))

# Arrange the data by Nitrate_levels
MAU_CNRE3 <- MAU_CNRE3 %>%
  arrange(desc(Nitrate_levels))

# Plot
MAP_CNRE_nitrate2 <- ggplot() +
  geom_sf(data = MAU_2, fill = "white", colour = "black", size = 0.1) +
  geom_sf(data = MAU_CNRE3[complete.cases(MAU_CNRE3$Nitrate_levels), ], 
          aes(color = Nitrate_levels), size = 1) +
  scale_color_manual(values = c(">100" = "red", "75-100" = "purple", "50-75" = "orange", "0-50" = "green")) +
  labs(title = "Points d'eau CNRE. Conductivité",
       subtitle = "Nitrate",
       color = "Nitrate") +
  guides(color = guide_legend(override.aes = list(size = 3)))

MAP_CNRE_nitrate2

