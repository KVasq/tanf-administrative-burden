library(tidyverse)
library(haven)

survey_sas <- read_xpt('04582-0005-Data.xpt') %>%
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

survey_sas %>%
  summarise(HHID,RESPID,STATE,SITE,KASWHY,KASLEFTA,KASLEFTB,KASCUTA,KASCUTB,JABPOV) %>%
  mutate()

#checking against family size

