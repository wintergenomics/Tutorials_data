# Tema:    ggplot2
# Descripcion: Modificar leyendas y texto en gpplot2 con theme()
# Autor:       Winter School.
# Notas:       Ninguna

#----Instalar librerías----
# Instalar lterdatasampler
# https://lter.github.io/lterdatasampler/

# remotes::install_github("lter/lterdatasampler")

#----Llamar librerías----
library(tidyverse)
library(lterdatasampler)
library(randomcoloR)


#----Cargar datos----
# Conocer los datasets que están disponibles
data(package = "lterdatasampler")

# Utilizar dataset de knz_bison
bisontes <- knz_bison

#----Exploracion inicial----
# Conocer los nombres de columnas
colnames(bisontes)

# Conocer las primeras lineas del datafram 
head(bisontes)

#----Crear un grafico----
# Colores
colores <- randomColor(2, luminosity = "light")

# Generar gráfico sencillo
ggplot(bisontes, aes(x = animal_sex, y = animal_weight, fill= animal_sex)) + 
  geom_violin() + 
  scale_fill_manual(values = colores) + 
  theme_bw() -> plot1
plot1

# Agregar titulos
plot1 +
  labs(x = "Sexo" ,y = "Peso", subtitle = "Violinplot", tag = "A") +
  ggtitle("Peso de los bisontes en función del sexo") -> plot1

# Modificar el titulo de la leyenda
plot1 + guides(fill = guide_legend(title = "Sexo")) -> plot1
plot1

# Modificar le tamaño de los cuadros
plot1 + 
  theme(legend.key.size = unit(0.5, 'cm'),
        legend.key.height = unit(0.1, 'cm'),
        legend.key.width = unit(0.4, 'cm')) -> plot1
plot1

# Modificar la posicion de la leyenda y el fondo
plot1 + 
  theme(legend.position = "left",
      legend.background = element_rect(fill = "#CCDDE0")) -> plot1
  

# Modificar el estilo del texto del plot
plot1 +
  theme(
    axis.title.x = element_text(colour = "#3B6064", face = "bold"),
    axis.text.x = element_text(colour = "#3B6064", face = "bold"),
    axis.title.y = element_text(colour = "#8E5572", face = "bold"),
    axis.text.y = element_text(colour = "#8E5572", face = "bold"),
    legend.title = element_text(face = "bold")
  )
