#load packages
library(readr)
library(ggplot2)
library(tidyverse)
library(ggspatial)
library(dplyr)
library(sf)

require(rnaturalearth)
devtools::install_github("ropensci/rnaturalearthhires")
require(rnaturalearthhires)


#read gdb data

######make sure you extract the zip so its just a folder ###################
gdb_path <- "/Users/caliyenabrown/Documents/GitHub/ibof-kelts/IBOF_MarineCriticalHabitats.gdb"
########################################################################################
layer <- st_layers(gdb_path)
mpa <- st_read(gdb_path, layer = layer$name)


atl <- rnaturalearthhires::countries10 %>%
dplyr::filter(NAME_EN == "Canada" | grepl("United States", NAME_EN))

#zoom in on iBof

ibof <- ggplot(data = atl) +
  geom_sf(fill = "darkseagreen", color = "darkblue") +
  geom_sf(data = mpa, fill = NA, color = "black", size = 0.3) +
  coord_sf(xlim=c(-69, -63), ylim=c(43.5, 46)) +
  theme_classic() +
  labs(x = "Longitude", y = "Latitude") +
  theme(panel.background = element_rect(fill = "lightblue"))

ibof

