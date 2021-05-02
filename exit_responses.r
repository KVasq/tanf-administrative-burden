library(tidyverse)
library(cowplot)
library(haven)

survey05_sas <- read_xpt('04582-0005-Data.xpt') %>%
  summarise(HHID,RESPID,STATE,SITE,KASWHY,KASLEFTA,KASLEFTB,KASLEFTC,KASCUTA,KASCUTB,KASCUTC) %>%
  filter(KASWHY %in% c(1,2)) %>%
  distinct(HHID, .keep_all = TRUE) -> exit_responses

exit_responses %>%
  filter(KASCUTA %in% c(3,7,9) | KASCUTB == 3 | KASLEFTA %in% c(9,14) | KASLEFTB %in% c(9,14)) -> proc_exit_responses
  
nrow(proc_exit_responses) / nrow(exit_responses) * 100 -> procedural_exit_pct

exit_responses %>%
  mutate(procedural = (KASCUTA %in% c(3,7,9) | KASCUTB == 3 | KASLEFTA %in% c(9,14) | KASLEFTB %in% c(9,14))) -> exit_responses

ggplot(exit_responses, mapping = aes(x=procedural,fill=procedural)) + 
  geom_bar() +
  geom_text(stat= "count", aes(label=after_stat(sprintf("(%d)",count))), nudge_x = .075,vjust=2) +
  geom_text(stat= "count", aes(label=after_stat(sprintf("%1.1f%%",prop*100)), group=1), nudge_x= -.07, vjust=2) +
  scale_y_continuous(labels = scales::percent) +
  labs(title="Exit Cases Due To Administrative Burden",caption="Data from NSAF 2002")

#checking against income 

survey05_sas <- read_xpt('04582-0005-Data.xpt') %>%
  summarise(HHID,RESPID,STATE,SITE,KASWHY,KASLEFTA,KASLEFTB,KASCUTA,KASCUTB,JABPOV,JAB2POV,JAB4POV) %>%
  filter(KASWHY %in% c(1,2) & (JABPOV %in% c(1,2) | JAB2POV %in% c(1,2) | JAB4POV %in% c(1,2))) %>%
  mutate(procedural = (KASCUTA %in% c(3,7,9) | KASCUTB == 3 | KASLEFTA %in% c(9,14) | KASLEFTB %in% c(9,14))) -> income_responses

income_responses$JABPOV <- as.character(income_responses$JABPOV)

income_responses[income_responses$JABPOV == "1",]$JABPOV <- "Below"
income_responses[income_responses$JABPOV == "2",]$JABPOV <- "Above"

income_responses$JABPOV <- as.factor(income_responses$JABPOV)
income_responses$procedural <- as.factor(income_responses$procedural)

income_responses$procedural <- ifelse(income_responses$procedural == TRUE, "Procedural", "Non-Procedural")

ggplot(income_responses, mapping = aes(x=JABPOV, fill=JABPOV)) +
  geom_bar() +
  facet_grid(~procedural) +
  geom_text(stat= "count", aes(label=after_stat(sprintf("%1.1f%%",prop*100)), group=1, vjust=-.5)) +
  labs(x="Family Income Relative to Poverty Threshold") +
  theme(legend.position = "none")

#checking against family size

survey06_sas <- read_xpt('04582-0006-Data.xpt') %>%
  summarise(HHID, STATE, SITE, QSC3, QSC5, UHHCOUNT, CHLD0_5, CHLD6_17) -> famsize_responses

exit_famsize_responses <- merge(exit_responses, famsize_responses, by="HHID")

exit_famsize_responses$UHHCOUNT <- as.factor(exit_famsize_responses$UHHCOUNT)

ggplot(exit_famsize_responses, mapping = aes(x= UHHCOUNT)) +
  geom_bar() +
  labs(x="Members in Social Family Household") +
  facet_grid(~procedural)

#checking against person level data

survey07_sas <- read_xpt('04582-0007-Data.xpt') %>%
  summarise(HHID, STATE, SITE, UBCPSED, UBRACE, UBRACE4, UBETH, URACETH, UAGE, MARSTAT) -> race_responses

exit_race_responses <- merge(race_responses, summarise(exit_responses, HHID,procedural))
  
colnames(exit_race_responses) <- c('hhid', 'state', 'site', 'education','race3', 'race4', 'hispanic', 'hispanic2','age','martial','procedural')

exit_race_responses[exit_race_responses$hispanic2 == 1,]$hispanic2 <- 'H'
exit_race_responses[exit_race_responses$hispanic2 == 2,]$hispanic2 <- 'B'
exit_race_responses[exit_race_responses$hispanic2 == 3,]$hispanic2 <- 'O'

exit_race_responses[exit_race_responses$martial == 1,]$martial <- "Married"
exit_race_responses[exit_race_responses$martial == 2,]$martial <- "Widowed"
exit_race_responses[exit_race_responses$martial == 3,]$martial <- "Divorced"
exit_race_responses[exit_race_responses$martial == 4,]$martial <- "Separated"
exit_race_responses[exit_race_responses$martial == 5,]$martial <- "Never Married"

exit_race_responses[exit_race_responses$education == "A",]$education <- "No Diploma"
exit_race_responses[exit_race_responses$education == "B",]$education <- "Diploma/No Degree"
exit_race_responses[exit_race_responses$education == "C",]$education <- "Degree"



exit_race_responses$state <- as.factor(exit_race_responses$state)
exit_race_responses$education <- as.factor(exit_race_responses$education)
exit_race_responses$race3 <- as.factor(exit_race_responses$race3)
exit_race_responses$race4 <- as.factor(exit_race_responses$race4)
exit_race_responses$hispanic <- as.factor(exit_race_responses$hispanic)
exit_race_responses$hispanic2 <- as.factor(exit_race_responses$hispanic2)
exit_race_responses$martial <- as.factor(exit_race_responses$martial)
exit_race_responses$procedural <- as.factor(exit_race_responses$procedural)

exit_race_responses %>%
  filter(hispanic %in% c("H","N")) %>%
  ggplot(mapping=aes(x=hispanic, fill=hispanic)) +
  geom_bar() +
  facet_grid(~procedural) +
  labs(x= "Race", fill="Race") +
  scale_fill_discrete(labels = c("Hispanic", "Non-Hispanic")) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())


exit_race_responses %>%
  filter(hispanic2 %in% c("H","B","O")) %>%
  ggplot(mapping=aes(x=hispanic2, fill=hispanic2)) +
  geom_bar() +
  labs(x="Race", fill="Race") +
  facet_grid(~procedural) +
  scale_fill_discrete(labels = c("Black Non-Hispanic", "Hispanic", "Other Non-Hispanic")) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())


exit_race_responses %>%
  filter(race4 %in% c('A','B','I','W')) %>%
  ggplot(mapping=aes(x=race4, fill=race4)) +
  geom_bar() +
  facet_grid(~procedural) + 
  labs(x="Race", fill="Race") +
  scale_fill_discrete(labels = c("Asian/Pacific Islander", "Black", "Native American", "White"))

exit_race_responses %>%
  filter(race3 %in% c('W','B','O')) %>%
  ggplot(mapping=aes(x=race3, fill=race3)) +
  geom_bar() +
  facet_grid(~procedural) + 
  labs(x="Race", fill="Race") 
#check against age

exit_race_responses %>%
  filter(age != -8) %>%
  ggplot(mapping = aes(x=age)) +
  geom_bar() +
  facet_grid(~procedural)

#check against marital status

exit_race_responses %>%
  filter(!(martial %in% c(-1,-9))) %>%
  ggplot(mapping = aes(x=martial, fill=martial)) +
  geom_bar() +
  labs(x = "Marriage Status", fill = "Marriage Status") +
  facet_grid(~procedural) +
  theme(axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

#check against education

exit_race_responses %>%
  filter(education %in% c("Degree","Diploma/No Degree","No Diploma")) %>%
  ggplot(mapping = aes(x=education, fill=education)) +
  geom_bar() + 
  facet_grid(~procedural) +
  labs(x="Education Attainment")

#logistic regression 

#marriage status
exit_race_responses %>%
  filter(martial != -9) -> martial_df
summary(glm(procedural ~ martial, data = martial_df, family = "binomial"))
#hispanic 
summary(glm(procedural ~ hispanic , data = exit_race_responses, family = "binomial"))
#hispanic 2
summary(glm(procedural ~ hispanic2 , data = exit_race_responses, family = "binomial"))
#race 3
summary(glm(procedural ~ race3 , data = exit_race_responses, family = "binomial"))
#race 4
summary(glm(procedural ~ race4 , data = exit_race_responses, family = "binomial"))
#state
summary(glm(procedural ~ state , data = exit_race_responses, family = "binomial"))
#famsize
summary(glm(procedural ~ UHHCOUNT, data = exit_famsize_responses, family = "binomial"))
#income
summary(glm(procedural ~ JABPOV, data = income_responses, family = "binomial"))
income_responses %>%
  filter(JAB2POV %in% c(1,2)) -> income_df
income_df$procedural <- as.factor(income_df$procedural)
summary(glm(procedural ~ JAB2POV, data = income_df, family = "binomial"))
income_responses %>%
  filter(JAB4POV %in% c(1,2)) -> income_df
income_df$procedural <- as.factor(income_df$procedural)
summary(glm(procedural ~ JAB4POV, data = income_df, family = "binomial"))


#all demographic information
summary(glm(procedural ~ ., data = select(exit_famsize_responses, -c("HHID","RESPID","KASWHY","KASLEFTA","KASLEFTB","KASCUTA")), family = "binomial"))
summary(glm(procedural ~ ., data = select(exit_race_responses, -c("hhid")), family = "binomial"))
summary(stepAIC(glm(procedural ~ ., data = select(exit_famsize_responses, -c("HHID","RESPID","KASWHY","KASLEFTA","KASLEFTB","KASCUTA")), family = "binomial")))
#confidence in acquiring healthcare
survey05_sas <- read_xpt('04582-0005-Data.xpt') %>%
  summarise(HHID, BCONMED)

survey05_sas <- merge(survey05_sas, summarise(exit_responses,HHID,procedural),by="HHID")

ggplot(survey05_sas, mapping = aes(x=BCONMED)) +
geom_bar() +
facet_grid(~procedural)

#out of pocket expenses
survey05_sas <- read_xpt('04582-0005-Data.xpt') %>%
  summarise(HHID, FOUTPOK2)

survey05_sas <- merge(survey05_sas, summarise(exit_responses,HHID,procedural),by="HHID")

ggplot(survey05_sas, mapping = aes(x=FOUTPOK2)) +
  geom_bar() +
  facet_grid(~procedural)

#Hours sorted for childcare
survey05_sas <- read_xpt('04582-0005-Data.xpt') %>%
  summarise(HHID, IARRNG) %>%
  filter(IARRNG %in% c(1,2))

survey05_sas <- merge(survey05_sas, summarise(exit_responses,HHID,procedural),by="HHID")

ggplot(survey05_sas, mapping = aes(x=IARRNG)) +
  geom_bar() +
  facet_grid(~procedural)

summary(glm(procedural ~ IARRNG, data = survey05_sas, family = "binomial"))
