

library(ggplot2)

str(mpg)

qplot(displ,hwy, data = mpg)

qplot(displ,hwy, data = mpg , color = drv)

qplot(displ,hwy, data = mpg , color = drv , facets = .~drv)

qplot(displ,hwy, data = mpg , color = drv , facets = drv~.)

qplot(displ,hwy, data = mpg , geom = c("point" , "smooth"))




qplot(hwy , data = mpg)

qplot(hwy , data = mpg, fill = drv)

qplot(hwy , data = mpg, fill = drv, facets = .~drv)

qplot(hwy , data = mpg, fill = class)

qplot(hwy , data = mpg, fill = class , facets = .~class)






qplot(displ,hwy, data = mpg, facets = .~ drv)

qplot(displ,hwy, data = mpg, facets = drv~.)




qplot(hwy , data = mpg, facets = drv~. , binwidth = 2)

qplot(hwy , data = mpg, facets = .~drv , binwidth = 2)




load(file = "maacs.Rda")

str(maacs)



qplot(eno, data = maacs)

qplot(log(eno), data = maacs)
 
qplot(log(eno), data = maacs, fill = mopos)

qplot(log(eno), data = maacs, fill = mopos, facets = .~mopos)

qplot(log(eno), data = maacs, geom = "density")


qplot(log(eno), data = maacs, geom = "density" ,color = mopos)


qplot(pm25,eno, data = maacs)


qplot(log(pm25),log(eno), data = maacs)



qplot(log(pm25),log(eno), data = maacs , shape= mopos)

qplot(log(pm25),log(eno), data = maacs , color = mopos)



qplot(log(pm25),log(eno), data = maacs, geom = c("point","smooth"),method ="lm")

qplot(log(pm25),log(eno), data = maacs, geom = c("point","smooth"),method ="lm", facets = .~mopos)





data <-read.csv("bmi_pm25_no2_sim.csv")

str(data)


qplot(logpm25,NocturnalSympt, data=data, facets = .~bmicat,geom = c("point","smooth"),method ="lm")

g <- ggplot(data,aes(logpm25 ,NocturnalSympt) )
g
summary(g)


p <- g + geom_point(color = "steelblue",size = 4, alpha = 1/2)
p

# se = F means CI = False 
p1 <- p + geom_smooth(method = "lm",size = 4,linetype = 3 , se = F) 
p1


p2 <- p1 + facet_grid(.~bmicat)
p2


p3 <- p2 + labs(title = "MAACS COHORT") +labs(x = expression("log" * PM[2.5]) , y = "Nocturnal Syptoms")
p3

p4 <- p3 + theme_bw()
p4

