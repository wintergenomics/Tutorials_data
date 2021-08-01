##################################################
#Titulo= Graficos animados con gganimate
#Imparte= Winter Genomics
#Contacto: cursos@wintergenomics.com
##################################################

####################################################
#Instalacion y llamado de librerias
####################################################

#Instalacion
#install.packages("ggplot2")
#install.packages("gganimate")

#Llamado de librerias
library(ggplot2)
library(gganimate)

#####################################################
# Ruta de trabajo
#####################################################
getwd()
setwd("C:/Users/HUAWEI/Documents/graficos_animados")

#####################################################
#Cargar datos 
#####################################################

head(iris)
datos<- iris

#Set de datos (Iris): El set de datos se compone de 150 observaciones de 
#flores de la planta iris. Existen tres tipos de clases de flores iris: 
#virginica, setosa y versicolor. Hay 50 observaciones de cada una. 
#Las variables o atributos que se miden de cada flor son: El tipo de flor como
#variable categorica, el largo y el ancho del petalo en cm como variables 
#numericas, el largo y el ancho del sepalo en cm como variables numericas.

#######################################################
#Construccion de una grafica con ggplot
#######################################################

#Crear grafico 
p <- ggplot(datos, aes(x = Petal.Width, y = Petal.Length)) + 
  geom_point()
p

#Colorear por especie de flor
p1 <- ggplot(datos, aes(x = Petal.Width, y = Petal.Length, color=Species)) + 
  geom_point()+
  labs(x = "Ancho del petálo" ,y = "Longitud del petálo") 
p1

#########################################################
#Animar una grafica mediante una transicion por estados
#########################################################

#transition_states

gga1 <- p1 + 
  transition_states(Species,
                    transition_length = 2,
                    state_length =1 )

gga1

 ##########################################################
 #Etiquetado de una grafica
 ##########################################################
 
 #ggtitle
 
 gga1 + 
   ggtitle('Especie: {closest_state}')

#hay dos opciones para insetar un titulo ya sea utilizando 
#ggtitle o utilizando el argumento labs(title="")

#########################################################
#Diferentes formas de animar un grafico
########################################################
 
#Observar transiciones (deja una sombra de cada especie)

gga1 +
  labs(title = 'Especie: {closest_state}') +
  shadow_mark(alpha = 0.3, size = 0.5)

#shadow_define como se presentan los datos de otros puntos en el 
#tiempo

###########################################################
 #Modificar la estetica de los graficos
##########################################################
 
gga2 <- ggplot(datos, aes(x = Petal.Width, y = Petal.Length)) + 
   geom_point(aes(colour = Species), size = 2) + 
  labs(x = "Ancho del petálo" ,y = "Longitud del petálo",  col = "") +
   transition_states(Species,
                     transition_length = 2,
                     state_length = 1)
 
 gga2 + 
   enter_fade() + 
   exit_shrink()
 
 #enter/exit_opciones para modificar la entrada y la salida de los datos
 
 gga2 +  labs(title ='Especie: {closest_state}')
 
 ##########################################################
 #Otras opciones
 ##########################################################
 
 gga3<-ggplot(datos, aes(x = Petal.Width, y = Petal.Length)) + 
   geom_point(aes(colour = Species, group = 4L)) + 
   labs(x = "Ancho del petálo" ,y = "Longitud del petálo",  col = "")+
   transition_states(Species,
                     transition_length = 2,
                     state_length = 1)
 
 gga3 +  labs(title ='Especie: {closest_state}')

 gga3 + labs(title ='Especie: {closest_state}') +
   shadow_wake(wake_length = 0.05, alpha = FALSE) 
 