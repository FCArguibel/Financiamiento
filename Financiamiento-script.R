## Cargo paquetes

library(tidyverse)
library(ggplot2)
library(readxl)
library(scales)

# Leo los datos desde el repo de Juan
df <- read_csv("https://raw.githubusercontent.com/juanbntz17/Repo/main/enero2020.csv",
               col_types = cols(Misiones = col_number())) # Especifico que las columnas que me interesan sean leídas como number, sino trae todo como character

df <- df %>% 
  dplyr::filter(!is.na(Misiones)) %>% 
  arrange(Misiones) %>% 
  dplyr::filter(Actividad %in% c("Producción Primaria", "Agricultura, ganadería, caza y silvicultura",
                  "Cultivos y servicios agrícolas", "Producción de madera (31)",
                  "Elaboración de productos de tabaco",
                  "Servicios agrícolas", "Cultivos industriales (9)",
                  "Silvicultura, extracción de madera (22)", "Caza, captura de animales vivos y silvicultura",
                  "	
Otros cultivos industriales"))

ggplot(data = df, aes(Actividad, Misiones)) +
  geom_bar(stat = "identity") +
  scale_y_continuous("", labels = comma_format()) +
  coord_flip()
