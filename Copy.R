


file_location = "C:/Users/asus/Dropbox/#Mozambique/Water/Census 2017/Amostra_10__AF_Pessoas_Pop_ANONIM.sav"
df_census <- read.spss(file_location, to.data.frame = TRUE)
df_census2 <- df_census
df_census2 <- df_census2 %>% mutate_all(trimws)
df_census2 <- as.data.frame(df_census2)
colnames(df_census2) <- colnames(df_census)
head(df_census2)
view(df_census2)
glimpse(df_census)
