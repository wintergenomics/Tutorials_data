# Tema: esquisse
# Descripcion: Usar esquisse para visualizacion interactiva
# Autor: Winter Genomics
# Notas: Usar dataset de palmerpenguins

#----Instalacion----
# Instalar esquise
# Opcion 1
#install.packages("esquisse")

# Opcion 2
#remotes::install_github("dreamRs/esquisse")

# Instalar palmerpenguins
# Opcion 1
# install.packages("palmerpenguins")
# Opcion 2
# remotes::install_github("allisonhorst/palmerpenguins")

#----Llamar librerias----
library(palmerpenguins)
library(esquisse)


#----Cargar datos----
# Conocer los datasets de una paqueteria
data(package = "palmerpenguins")

#----Correr esquisse----
esquisser()


#---Grafico---

library(ggplot2)

ggplot(penguins) +
  aes(x = species, y = bill_length_mm, fill = species) +
  geom_boxplot() +
  geom_jitter() +
  scale_fill_brewer(palette = "Dark2", direction = 1) +
  labs(x = "Especies", y = "Tamaño del pico (mm)", 
    title = "Tamaño del pico por especie.", fill = "Especies") +
  coord_flip() +
  theme_minimal() -> plot_penguins

plot_penguis

