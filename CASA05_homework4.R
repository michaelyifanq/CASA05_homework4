library(sf)
library(here)
library(janitor)
library(tidyverse)
library(countrycode)#1 really great stuff

countries <- st_read(here("World_Countries_(Generalized)", "World_Countries__Generalized_.shp"))%>% 
  clean_names()
head(countries,20)

csv <- read_csv(here('Gender Inequality Index (GII)_trim.csv',skip=5,na = "..",col_types=cols(year_2010=col_number(),year_2019=col_number())))%>%
  clean_names()

head(csv,20)

joined_data <- countries  %>%
  left_join(., 
            csv,
            by = c("country" = "country"))
head(joined_data,10)
