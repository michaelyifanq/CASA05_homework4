library(sf)
library(here)
library(janitor)
library(tidyverse)

countries <- st_read(here("World_Countries_(Generalized)", "World_Countries__Generalized_.shp"))%>% 
  clean_names()
head(countries,10)

csv <- read_csv('Gender Inequality Index (GII)_trim.csv',skip=5)%>%
  clean_names()

joined_data <- countries  %>%
  left_join(., 
            csv,
            by = c("country" = "country"))
head(joined_data,10)
