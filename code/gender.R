
# Packages ------------------------------------------------------------------------------------

library(ggplot2)
library(tibble)
library(tidyr)
library(readr)
library(purrr)
library(dplyr)
library(stringr)
library(forcats)
library(lubridate)
library(glue)
library(fs)
library('janitor')
library('scales')
library('ggtext')
library('ggthemes')
library('wesanderson')
library('RColorBrewer')
library('read2xl')
# Gender ------------------------------------------------------------------------------------


## Cabinet ------------------------------------------------------------------------------------
gender_cabinet <- 
  readxl::read_xlsx('data/gender-cabinet-agencies.xlsx', skip = 1) %>%
  clean_names()  %>%
  rename(agency = employment_as_values) %>%
  mutate(
    across(
      .cols = -c('agency'),
      .fns = ~ as.numeric(.x)
    )
  )

gender_cabinet %>%
  filter(agency == 'Cabinet Level Agencies') %>%
  select(-unspecified) %>%
  pivot_longer(c(male, female)) %>%
  ggplot(aes(y= agency, x=value, fill =name)) +
  geom_bar(stat = 'identity', position='dodge')

gender_cabinet %>%
  filter(agency != 'Cabinet Level Agencies') %>%
  select(-unspecified) %>%
  pivot_longer(c(male, female)) %>%
  filter(!is.na(value)) %>%
  mutate(value = value/gender_all)%>%
  ggplot(aes(x = agency, y = value, fill = name)) +
  geom_bar(stat = 'identity',position= 'dodge') +
  coord_flip()+
  scale_y_continuous(labels =  scales::label_percent()) +
  theme_hc() +
  labs(x = '', y = '')+
  scale_fill_brewer(type='qual',palette= 'Paired',direction = 1) +
  ggsave('geneder-cabinet.png')



# Race ethnicity ------------------------------------------------------------------------------

race <- 
  readxl::read_xlsx('data/minority-cabinet-agencies.xlsx', sheet = 'race-ethnicity', skip = 1) %>%
  clean_names()  %>%
  rename(agency = employment_as_values,
         total = ethnicity_and_race_indicator_all,
         native_american = american_indian_or_alaskan_native,
         hispanic_latino = hispanic_latino_h_l,
         multi_racial = more_than_one_race,
         black = black_african_american) %>%
  mutate(
    across(
      .cols = -c('agency'),
      .fns = ~ as.numeric(.x)
    )
  ) %>% 
  pivot_longer(c(white, asian, black, 
                 hispanic_latino, native_american, multi_racial),
               names_to = 'race')

race %>%
  ggplot(aes(x = agency, y = value, fill = race)) +
  geom_bar(stat = 'identity',position = 'dodge') +
  coord_flip()
race %>%
  mutate(value = value/total)%>%
  ggplot(aes(x = agency, y = value, fill = race)) +
  geom_bar(stat = 'identity',position = 'dodge') +
  coord_flip() +
  scale_y_continuous(labels =  scales::label_percent())


minority<-
  readxl::read_xlsx('data/minority-cabinet-agencies.xlsx', skip = 1) %>%
  clean_names()  %>%
  rename(agency = employment_as_values,
         total = ethnicity_and_race_indicator_all) %>%
  mutate(
    across(
      .cols = -c('agency'),
      .fns = ~ as.numeric(.x)
    )
  ) 
minority %>%
  pivot_longer(c('minority', 'non_minority'))%>%
  mutate(value = value/total,
         agency = str_remove_all(agency,"-")) %>%
  filter(agency != 'Cabinet Level Agencies') %>%
  ggplot(aes(x = agency,
             y = value,
             fill = name)) +
  geom_bar(stat  =  'identity', position = 'dodge') +
  scale_y_continuous(labels= label_percent())+
  coord_flip() +
  theme_hc() +
  labs(x = '', y = '')+
  scale_fill_brewer(type='qual',palette= 'Paired',direction = 1)


minority_all <-
  readxl::read_xlsx('data/minority-all-agencies.xlsx', skip = 1) %>%
  clean_names()  %>%
  rename(agency = employment_as_values,
         total = ethnicity_and_race_indicator_all) %>%
  mutate(
    across(
      .cols = -c('agency'),
      .fns = ~ as.numeric(.x)
    )
  ) 

agencies <- c('AF', 'AR', 'CT00', 'FRFT', 'AG01')
minority_all %>%
  select(-unspecified)%>%
  filter(across(where(is.numeric),
                ~ !is.na(.))) %>%
  pivot_longer(c('minority', 'non_minority'))%>%
  mutate(value = value/total,
         agency = str_remove_all(agency,"-")) %>%
  filter(agency != 'Cabinet Level Agencies')

%>%
  ggplot(aes(x = agency,
             y = value,
             fill = name)) +
  geom_bar(stat  =  'identity', position = 'dodge') +
  scale_y_continuous(labels= label_percent())+
  coord_flip() +
  theme_hc() +
  labs(x = '', y = '')+
  scale_fill_brewer(type='qual',palette= 'Paired',direction = 1)

