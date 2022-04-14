###########################################################
#Programa:    Grafico de Boxxplot
#Descripcion: Funciones principales
#Autor:       Winter School
#Fecha:       2020
#Notas:       Ninguna
###########################################################

######################################
#Importando datos de trabajo
######################################

#Asignar carpeta de trabajo
directory<-"C://Users//siedr//Documents//CursoR//Boxplot"
setwd(directory)

#Importar archivo
datosI <-read.csv("iris.csv")
datosI
str(datosI)

#Construir un boxplot simple
boxplot(Sepal.Width ~ Species,data=datosI,
        main="Sepal.Width",
        ylab="Longitud sepalo cm",
        col=c("darkorchid4","chartreuse2", "darkgoldenrod2"))

#Construir un boxplot metodo "jitter"
boxplot(Sepal.Width ~ Species, data = datosI, lwd = 2, main="Sepal.Width",ylab="Longitud sepalo cm")
stripchart(Sepal.Width ~ Species, vertical = TRUE, data = datosI, 
           method = "jitter", add = TRUE, pch = 20, cex = 1.5, col = '#3AC263')

####################


################################################
# Boxplot
################################################
library(ggplot2)

box <- ggplot(datosDE, aes(x= Species, 
                           y= Sepal.Width, 
                           fill= Species))
box + geom_boxplot() + scale_fill_manual(
  values=c("#460F7C","#85D135","#F9E15C"))


