##################################################
#Titulo= Graficos animados con gganimate (2)
#Imparte= Winter Genomics
#Contacto: cursos@wintergenomics.com
##################################################

####################################################
#Instalacion y llamado de librerias
####################################################

#Instalacion
#install.packages("ggplot2")
#install.packages("gganimate")
#install.packages("gapminder")

#Llamado de librerias
library(ggplot2)
library(gganimate)
library(gapminder)

#####################################################
# Ruta de trabajo
#####################################################
getwd()
setwd("C:/Users/HUAWEI/Documents/graficos_animados")

#####################################################
# Datos 
#####################################################

head(gapminder)

#No los guardamos en ninguna variable porque puedo acceder a ellos desde
#R, pero si tengo una tabla, lo ideal es guardar los datos en una variable 

######################################################
#Paises por continente explorando los datos
######################################################

ggplot(gapminder, aes(x=continent, fill=continent)) + 
  geom_bar(aes(y=..count../12)) +
  scale_colour_manual(values = continent_colors)+
  labs(y="Numero de países", x= "Continentes") +
  guides(fill=FALSE)

######################################################
#Scatterplot
######################################################

grafica1<- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = continent)) +
  geom_point(alpha = 0.7, show.legend = T)+
  theme_bw()+  
  labs(x = "PIB per Capita" ,y = "Esperanza de Vida",  col = "") 

grafica1

#######################################################
#Animar una grafica
#######################################################

GDP_time= grafica1 +
  transition_time(year) +
  labs(title = "Fecha: {frame_time}")

GDP_time

#######################################################
#Guardar la animacion como gif
#######################################################

anim_save("GDP_time.gif", GDP_time)
 
#######################################################
#Paneles multiples
####################################################### 
grafica2<-ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
    geom_point(alpha = 0.7, show.legend = FALSE) +
    scale_size(range = c(1, 10))+
    scale_x_log10() +
    facet_wrap(~continent)+
    theme_bw()+
    labs(x = "PIB per Capita" ,y = "Esperanza de Vida",  col = "") 
  
grafica2

########################################################
#Animar 
########################################################

GDP_multiple= grafica2 +labs(title = 'Fecha: {frame_time}', x = 'PIB per capita', y = 'Esperanza de Vida') +
  transition_time(year) +
  ease_aes('linear')

GDP_multiple

anim_save("GDP_multiple.gif", GDP_multiple)

#Opciones de animacion

GDP_multiple +
  shadow_wake(wake_length = 0.2, alpha = FALSE) 

#######################################################
#Otros graficos
#######################################################

#Supongamos que ahora deseamos observar el comportamiento de un pais
#especificamente

library(dplyr)

#Graficar un sólo país
gapminder %>%
  filter(country == "Mexico") %>%
  ggplot(aes(year, pop)) + geom_point() + geom_line() +
  theme_bw() +
  transition_reveal(year)

#Mejorar la grafica
gapminder %>%
  filter(country == "Mexico") %>%
  ggplot(aes(year, pop)) + geom_point() + geom_line() + 
  geom_text(aes(x = min(year), y = min(pop), label = as.factor(year)) , hjust=-2, vjust = -0.2, alpha = 0.5,  col = "gray", size = 20) +
  theme_minimal() +
  transition_reveal(year) + 
  view_follow()



