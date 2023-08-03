
PROVINCE3 = c("Cabo Delgado","Gaza","Inhambane","Manica",
              "Maputo Cidade","Maputo Provincia","Nampula",
              "Niassa","Sofala","Tete","Zambezia")

YEAR_SURFACE = c(2096,
                 2029,
                 2026,
                 2048,
                 NA,
                 2023,
                 2088,
                 2178,
                 2028,
                 2043,
                 2075)
                 
                 



YEAR_IMP = c(2188,
             2031,
             2041,
             2067,
             2022,
             2024,
             2090,
             2180,
             2037,
             2057,
             2077)
             

moz_lolly <- data.frame(x =PROVINCE3,
                        value1 =YEAR_SURFACE,
                        value2 =YEAR_IMP)
dim(moz_lolly)
glimpse(moz_lolly)
view(moz_lolly3)

moz_lolly2 <- moz_lolly

#reorder ? (doesn't do the job)
moz_lolly2 <- moz_lolly2[order(-moz_lolly2$value2),]

#reorder attempt 2, yes !
#moz_lolly3 = ordered by IMPROVED + Legend
moz_lolly3 <- moz_lolly %>% 
  arrange(-value2) %>%
  mutate(x=factor(x, levels=x)) %>%
  ggplot()+
  geom_segment( aes(x=x, xend=x, y=value1, yend=value2), color="lightblue", size=0.4, linetype=3) +
  geom_point( aes(x=x, y=value1, color="Use of surface water declined to zero"), size=2 ) +
  geom_point( aes(x=x, y=value2, color="Universal access to\nimproved drinking water source"), size=2 ) +
  coord_flip()+
  scale_color_manual(values = c("lemonchiffon3","rosybrown3"), name = "")+
  theme_classic(base_size = 7)+
  xlab("") +
  ylab("")+
  #theme(plot.background = element_rect(colour = NA, fill = "lightgray"))+
  theme(legend.background = element_rect(colour = NA, fill = NA))+
  theme(legend.position = c(0.8,0.9), legend.key.width = unit(0.4, 'cm'))+
  theme(legend.margin = margin(2,2,2,2))+
  theme(legend.key.height = unit(0.4, 'cm'))+
  theme(legend.title = element_text(""))+
  scale_y_continuous(limits=c(2020, 2200), breaks=seq(2020,2200,25))

  scale_y_continuous(breaks=seq(2015,2100,10))

moz_lolly3
ggsave("moz_lolly3.png", moz_lolly3, width = 12, height = 5, units = "cm")


#reorder attempt 2, yes !
#moz_lolly5 = ordered by IMPROVED, with legend2
moz_lolly5 <- moz_lolly %>% 
  arrange(-value2) %>%
  mutate(x=factor(x, levels=x)) %>%
  ggplot()+
  geom_segment( aes(x=x, xend=x, y=value1, yend=value2), color="lightblue") +
  geom_point( aes(x=x, y=value1, color="Use of surface water as\na main source of drinking water declined to zero"), size=3 ) +
  geom_point( aes(x=x, y=value2, color="Universal access to\nimproved drinking water source"), size=3 ) +
  scale_color_manual(values = c("orange", "deepskyblue4"),
                   guide  = guide_legend(), 
                   name   = "") +
  xlab("") +
  ylab("Projected year")  +
  coord_flip()  +
  theme_classic() +
  theme(legend.position = "bottom",
        panel.border    = element_blank())+
  scale_y_continuous(limits=c(2020, 2200), breaks=seq(2020,2200,30))


moz_lolly5

#reorder attempt 2, yes !
#moz_lolly4 = ordered by OD
moz_lolly4 <- moz_lolly %>% 
  arrange(-value1) %>%
  mutate(x=factor(x, levels=x)) %>%
  ggplot()+
  geom_segment( aes(x=x, xend=x, y=value1, yend=value2), color="lightblue") +
  geom_point( aes(x=x, y=value1), color=("gray"), size=3 ) +
  geom_point( aes(x=x, y=value2), color=("darkblue"), size=3 ) +
  coord_flip()+
  theme_classic()+
  theme(legend.position = "none",) +
  xlab("") +
  ylab("Projected year")

moz_lolly4
