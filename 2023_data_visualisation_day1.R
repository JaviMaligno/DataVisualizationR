## ----xaringan-scribble, echo=FALSE--------------------------------------------
xaringanExtra::use_scribble()
xaringanExtra::use_share_again()


## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, 
                      fig.align = "center", 
                      message = FALSE, 
                      warning = FALSE, 
                      comment = "  #>", 
                      collapse = T)


## ----libs---------------------------------------------------------------------
library(tidyverse)
library(MASS) 
library(skimr)
library(viridis)
library(gganimate)
library(highcharter)


## ---- out.width="70%", fig.cap="<center><b> </center></b>"--------------------
knitr::include_graphics("img/ggplot2_masterpiece.png")


## ---- out.width="20%", fig.cap="<center><b> </center></b>"--------------------
knitr::include_graphics("img/hex-ggplot2.png")


## ---- echo=TRUE, eval=FALSE---------------------------------------------------
## ?plot


## ---- echo=TRUE, eval=FALSE---------------------------------------------------
## ?par


## ----plot1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
plot(x)


## ----plot2, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
plot(x, y)


## ----plot3, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
plot(y, x)


## ----plot4, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
plot(y = y, x = x)


## ----plot5, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
plot(y = y, x = x, type = 'l')


## ----plot6, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
plot(y = y, x = x, type = 'b')


## ----plot7, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
plot(y = y, x = x, type = 'h')


## ----plot8, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
plot(y = y, x = x, type = 'h', 
     col = 2, 
     lty = 2)


## ----plot9, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
plot(y = y, x = x, type = 'b', 
     col = 4, 
     lty = 4,
     pch = 16)


## ----plot10, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18

par(mfrow = c(1, 2))

plot(y = y, x = x, type = 'b', 
     col = 4, 
     lty = 4,
     pch = 16)

plot(y = y, x = x, type = 'h', 
     col = 4, 
     lty = 4)


## ----plot11, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18

par(mfrow = c(2, 2))

plot(y = y, x = x, type = 'b', 
     col = 4, lty = 4, pch = 16)

plot(y = y, x = x, type = 'h', 
     col = 4, lty = 4)

plot(y = y, x = x, type = 'l', 
     col = "darkviolet", lty = 5)

plot(y = y, x = x, type = 'o', 
     col = "royalblue", lty = 3)


## ----plot12, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
z <- y + 3
w <- z + 3

plot(x, y, type = 'l')

lines(x, z, col = 2)

points(x, w, col = 4)


## ----plot13, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
x <- 3:15
y <- 6:18
z <- y + 3
w <- z + 3

plot(x, y, type = 'l', 
     ylim = c(5, 24)) #<<

lines(x, z, col = 2)

points(x, w, col = 4)


## ----plot14, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
boxplot(mtcars$mpg ~ mtcars$cyl, 
        ylab = "Miles per gallon",
        xlab = "Cylinders")


## ---- echo=T, eval=F, results = 'markup', out.width="90%"---------------------
## ggplot(data) +
##   aesthetics +
##   geometries


## ---- out.width="90%", fig.cap=""---------------------------------------------
knitr::include_graphics("img/ggplot_sintaxe.png")


## ---- echo=T, eval=F, results = 'markup', out.width="90%"---------------------
## ggplot(data) +
##   aesthetics +
##   geometries +
##   facets +
##   coordinates +
##   theme


## ---- out.width="90%", fig.cap=""---------------------------------------------
knitr::include_graphics("img/grammar_ggplot.png")


## ---- echo=T, out.width="90%"-------------------------------------------------
d <- tibble(var_x = 1:4,
            var_y = seq(2, 8, 2),
            var_group = c(rep("a", 3), "b"))
d


## ----plot-gg1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d)


## ----plot-gg2, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d, aes(x = var_x, y = var_y))


## ----plot-gg3, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) + 
  aes(x = var_x, y = var_y)


## ----plot-gg4, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) + 
  aes(x = var_group, y = var_y)


## ----plot-gg5, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) + 
  aes(x = var_x, y = var_y) + 
  geom_point()


## ----plot-gg6, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) + 
  aes(x = var_x, y = var_y) + 
  geom_line()


## ----plot-gg7, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_point(color = "darkviolet")


## ----plot-gg8, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  geom_point(aes(x = var_x, y = var_y, 
                 color = var_group))


## ----plot-gg9, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  geom_line(aes(x = var_x, y = var_y, 
                 color = var_group))


## ----plot-gg10, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
d <- tibble(var_x = 1:5,
            var_y = seq(2, 10, 2),
            var_group = c("a", "a", "a",
                          "b", "b"))

ggplot(d) +  
  geom_line(aes(x = var_x, y = var_y, 
                 color = var_group))


## ----plot-gg11, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  geom_line(aes(x = var_x, y = var_y, 
                 linetype = var_group))


## ----plot-gg12, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  geom_line(aes(x = var_x, y = var_y, 
                 color = var_group)) +
  geom_point(aes(x = var_x, y = var_y))


## ----plot-gg13, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(aes(color = var_group)) +
  geom_point()


## ----plot-gg14, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_point() + 
  geom_line(aes(color = var_group))


## ----plot-gg15, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y, color = var_group) +
  geom_point() + 
  geom_line()


## ----plot-gg16, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line() + 
  geom_point(aes(color = var_group)) 


## ----plot-gg17, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(aes(color = var_group)) 


## ----plot-gg18, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") 


## ----plot-gg19, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") + 
  facet_wrap(~ var_group) #<<


## ----plot-gg20, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") + 
  facet_wrap(~ var_group, 
             scales = "free_x") #<<


## ----plot-gg21, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") + 
  facet_wrap(~ var_group, 
             scales = "free_y") #<<


## ----plot-gg22, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") + 
  facet_wrap(~ var_group, 
             scales = "free") #<<


## ----plot-gg23, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") + 
  facet_wrap(~ var_group) + 
  coord_equal() #<<


## ----plot-gg24, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") + 
  facet_wrap(~ var_group) + 
  coord_equal() + 
  theme_bw() #<<


## ----plot-gg25, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") + 
  facet_wrap(~ var_group) + 
  coord_equal() + 
  theme_minimal() #<<


## ----plot-gg26, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(d) +  
  aes(x = var_x, y = var_y) +
  geom_line(color = "yellow") + 
  geom_point(color = "darkviolet") + 
  facet_wrap(~ var_group) + 
  coord_equal() + 
  theme_classic() #<<


## ---- echo=TRUE, eval=FALSE---------------------------------------------------
## library(ggplot2)
## data(diamonds)
## ?diamonds


## ---- echo=TRUE, eval=FALSE---------------------------------------------------
## library(skimr)
## skim(diamonds)


## ---- echo=TRUE---------------------------------------------------------------
library(janitor)
tabyl(diamonds$cut)


## ---- echo=TRUE---------------------------------------------------------------
library(janitor)
tabyl(diamonds, cut, color)


## ----plot-geom1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  aes(x = cut) +
  geom_bar()


## ----plot-pie, echo=T, collapse=T, comment = "  #>", out.width="80%"----------
pie(table(diamonds$cut))


## ----plot-funny, echo=F, collapse=T, comment = "  #>", out.width="50%"--------
knitr::include_graphics("img/funny-pie-charts.png")


## ----plot-geom2, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  aes(x = cut) +
  geom_bar(fill = "royalblue")


## ----plot-geom3, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  aes(x = cut) +
  geom_bar(color = "royalblue")


## ----plot-geom4, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
cont_table <- tabyl(diamonds, cut)
cont_table

ggplot(cont_table) +  
  aes(x = cut, y = n) +
  geom_bar(fill = "royalblue", 
           stat = "identity") #<<


## ----plot-geom5, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(cont_table) +  
  theme_bw() + 
  aes(x = cut, y = n) +
  geom_bar(fill = "royalblue", 
           stat = "identity")  + 
  geom_text(aes(label = n), #<<
            color = "royalblue") #<<


## ----plot-geom6, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(cont_table) +  
  theme_bw() + 
  aes(x = cut, y = n) +
  geom_bar(fill = "royalblue", 
           stat = "identity")  + 
  geom_text(aes(label = n), 
            color = "royalblue", 
            nudge_y = 1000) #<<


## ----plot-geom7, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(cont_table) +  
  theme_bw() + 
  aes(x = cut, y = n) +
  geom_bar(fill = "royalblue", 
           stat = "identity")  + 
  geom_text(aes(label = n), 
            color = "royalblue", 
            nudge_y = 1000) + 
  geom_text(aes(label = round(percent, 2)), 
            color = "grey25", 
            nudge_y = 2000)


## ----plot-geom7_1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(cont_table) +  
  theme_bw() + 
  aes(x = cut, y = n) +
  geom_bar(fill = "royalblue", 
           stat = "identity")  + 
  geom_text(aes(label = n), 
            color = "royalblue", 
            nudge_y = 1000) + 
  geom_text(aes(label = round(percent, 2)), 
            color = "grey25", 
            nudge_y = 2000) + 
  coord_flip() #<<


## ----plot-geom8, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut) +
  geom_bar(fill = "royalblue")  + 
  facet_wrap(~ color)


## ----plot-geom9, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut) +
  geom_bar(fill = "royalblue")  + 
  facet_wrap(~ color, scales = "free_y", 
             ncol = 4) #<<


## ----plot-geom10, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + #<<
  geom_bar()  


## ----plot-geom11, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "fill")  #<<


## ----plot-geom12, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "fill")  + 
  labs(y = "Percentage of clarity", #<<
       title = "Distribution of clarity", #<<
       subtitle = "by different cuts") #<<


## ----plot-geom13, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "dodge")  #<<


## ----plot-geom14, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "dodge") +  
  facet_wrap( ~ cut, scales = "free") #<<


## ----plot-geom15, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = color, fill = color) + #<<
  geom_bar(position = "dodge") +  
  facet_wrap( ~ cut, scales = "free") 


## ----plot-geom16, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = color, fill = color) + 
  geom_bar(position = "dodge") +  
  facet_wrap( ~ cut, scales = "free") + 
  theme(legend.position = "none") #<<


## ----plot-num1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price) + 
  geom_point() #<<


## ----plot-num2, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price) + 
  geom_point(alpha = 0.1) #<<


## ----plot-num3, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price, 
      colour = cut) + #<<
  geom_point(alpha = 0.1) 


## ----plot-num4, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price, 
      colour = cut) + 
  geom_point() + 
  facet_wrap(~ clarity) #<<


## ----plot-num5, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price, 
      color = color) + 
  geom_point() + 
  facet_grid(cut ~ clarity) #<<


## ----plot-num6, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price) + 
  geom_histogram() #<<


## ----plot-num7, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price) + 
  geom_histogram(fill = "darkviolet", #<<
                 color = "grey75") #<<


## ----plot-num8, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price, y = ..density..) + #<<
  geom_histogram(fill = "darkviolet", 
                 color = "grey75") + 
  geom_density() #<<


## ----plot-num9, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price, y = ..density..) + 
  geom_histogram(fill = "darkviolet", 
                 color = "grey75") + 
  geom_density(color = "royalblue") #<<


## ----plot-num10, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price, y = ..density..) + 
  geom_density(aes(color = clarity)) #<<


## ----plot-num11, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price, y = ..density..) + 
  geom_density(aes(fill = clarity)) #<<


## ----plot-num12, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price, y = ..density..) + 
  geom_density(aes(fill = clarity), 
               alpha = 0.5) #<<


## ----plot-num13, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price, y = ..density..) + 
  geom_histogram(fill = "darkviolet", 
                 color = "grey75") + 
  facet_wrap(~ clarity) #<<


## ----plot-num14, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = price, y = ..density..) + 
  geom_histogram(fill = "darkviolet", 
                 color = "grey75") + 
  facet_wrap(~ clarity, 
             scales = "free_y") #<<


## ----plot-num15, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(y = price) + 
  geom_boxplot(fill = "darkviolet", #<<
                 color = "black") #<<


## ----plot-num16, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(y = price, x = cut) + 
  geom_boxplot(fill = "darkviolet", 
                 color = "black") 


## ----plot-num17, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(y = price, x = cut) + 
  geom_boxplot(aes(fill = clarity)) 


## ----plot-num18, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
# Just for purposes of illustration
ggplot(diamonds) +  
  theme_bw() +
  aes(y = price, x = cut) + 
  geom_boxplot(aes(fill = clarity), 
               outlier.alpha = 0) #<<

