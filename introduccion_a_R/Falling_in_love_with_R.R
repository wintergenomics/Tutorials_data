############################
#Mini taller: Enamorándose de R
#Autor: Winter Genomics
#Julio del 2020
#https://stackoverflow.com/questions/8082429/plot-a-heart-in-r
###########################

###########################
#Grafica 1
###########################
datas<- data.frame(t=seq(0, 2*pi, by=0.1) )
xhrt <- function(t) 16*sin(t)^3
yhrt <- function(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
datas$y=yhrt(datas$t)
datas$x=xhrt(datas$t)
with(datas, plot(x,y, type="l"))
with(datas, polygon(x,y, col="hotpink"))  
points(c(10,-10, -15, 15), c(-10, -10, 10, 10), pch=169, font=5)

###########################
#Grafica 2
###########################
install.packages("MASS")
MASS::eqscplot(0:1,0:1,type="n",xlim=c(-1,1),ylim=c(-0.8,1.5))
curve(4/5*sqrt(1-x^2)+sqrt(abs(x)),from=-1,to=1,add=TRUE,col=2)
curve(4/5*-sqrt(1-x^2)+sqrt(abs(x)),from=-1,to=1,add=TRUE,col=2)

###########################
#Grafica 3
###########################
install.packages("ggplot2")
library(ggplot2)
dat <- data.frame(x=seq(0, 2*pi, length.out=100))
cardioid <- function(x, a=1)a*(1-cos(x))
ggplot(dat, aes(x=x)) + stat_function(fun=cardioid) + coord_polar()
heart <- function(x)2-2*sin(x) + sin(x)*(sqrt(abs(cos(x))))/(sin(x)+1.4)
ggplot(dat, aes(x=x)) + stat_function(fun=heart) + coord_polar(start=-pi/2)

###########################
#Grafica 4
###########################
dat <- data.frame(t = seq(0, 2*pi, by = 0.01))
x <-  function(t) 16 * sin(t)^3
y <- function(t) 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)
dat$y <- y(dat$t)
dat$x <- x(dat$t)
heart <- ggplot(dat, aes(x,y)) +
  geom_polygon(fill = "red", col = "firebrick", alpha = 0.9) +
  theme_classic()
heart

###########################
#Grafica 5
###########################
r <- 0.618
n <- 10000
re <- sqrt(1-r*r);
x <- rnorm(n);
y <- x*r+rnorm(n)*re
y[x<0] <- -y[x<0];
par(mar=rep(0,4))
plot(x,y, col=rgb(1,0,1), axes=F, asp=1)
