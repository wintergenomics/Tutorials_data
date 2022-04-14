#####################################################################################
#Programa: Estadistica decriptiva y ANOVA de una via
#Desarrolladores: Winter Genomics 
#Evento:  Mini talleres de R
#Fecha: julio 2020
####################################################################################

#Instalacion de librerias
install.packages("dplyr")
install.packages("rapportools")
install.packages("tidyr")
install.packages("ggplot2")

library(dplyr)
library(rapportools)
library(tidyr)
library(ggplot2)


#Paso 1: Acceder a los datos
directory<-"C:/Users/siedr/Documents/CursoR/Estadistica"
setwd(directory)

#Descargar los datos de starwars
data(starwars)
sw <- starwars

#Importar los datos de starwars filtrados. Estos datos debes descargarlos de GitHub y colocarlos en tu directorio
datasw <-read.csv("datastarwars.csv",row.names = 1)

##############################

#Paso 2: Describir los datos

##############################

#Sumatoria de datos
sum(datasw$peso)

#promedio
mean(datasw$peso)

#Media
median(datasw$peso)

#Desviacion estandar
sd(datasw$peso)

#Varianza
var(datasw$peso)

#Maximos y minimos
max(datasw$peso)
min(datasw$peso)

#Cuartiles
quantile(datasw$peso, probs = c(0,0.25,0.5,0.75,1))

#Resumen
summary(datasw)

#Funcion para correlacion
cor(datasw$peso, datasw$edad)

#Puedes seleccionar la correlación por Pearson o Spearman
cor(datasw$peso, datasw$edad, method = 'pearson')
cor(datasw$peso, datasw$edad, method = 'spearman')

#Datos atipicos
rp.outlier(datasw[datasw$ojos=="yellow","peso"])
rp.outlier(datasw[datasw$ojos=="brown","peso"])
rp.outlier(datasw[datasw$ojos=="blue","peso"])

##############################

#Paso 3: Distribucion normal

##############################
by(datasw$peso, datasw$ojos, shapiro.test)

#Grafica
boxplot(peso ~ ojos, data = datasw, main = 'Datos peso y ojos')

##############################

#Paso 4: ANOVA

##############################

res.aov <- aov(peso ~ ojos, data = datasw)
#Resumen del analisis
summary(res.aov)

##############################

#Paso 5: En que grupos hay diferencia

##############################

TukeyHSD(res.aov)


##############################

#Revision de extra de datos

##############################

#Filtrar por altura
sw %>%
  filter(height < 90) %>%
  select(name, gender, species, height)

#Filtrar por genero
sw %>% 
  arrange(name) %>%
  select(name, gender, species, height)

##############################

#Graficas

###############################

#Graficar altura 
plot(datasw$altura, type='p', col='red', pch=16)


#Graficar altura de tres especies
ggplot(subset(datasw, especie %in% c('Droid', 'Human', "Wookiee")),
       aes(x=especie, y=altura)) + 
  geom_boxplot()

#Graficar el numero de especies de diferentes planetas 
datasw %>%
  filter(planeta %in% c("Naboo", "Tatooine")) %>%
  ggplot(aes(especie)) +
  geom_bar() +
  facet_grid(. ~ planeta)

sw%>%
  filter(!is.na(sex))%>%
  group_by(sex)%>%
  ggplot()+
  geom_bar(aes(x=sex))+
  labs(
    x="Gender",
    y="Characters",
    title="Number of Characters"
  )

