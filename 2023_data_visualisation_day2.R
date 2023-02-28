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


## ----plot-extra1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price) + 
  geom_point() + 
  scale_x_continuous(breaks = c(0, 1.2, 1.4, 2, 3, 4.5, 5)) #<<


## ----plot-extra2, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price) + 
  geom_point() + 
  scale_x_continuous(breaks = c(0, 1.2, 1.4, 2, 3, 4.5, 5)) + 
  scale_y_continuous(breaks = seq(0, 2000, by = 250)) #<<


## ----plot-extra3, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price) + 
  geom_point() + 
  geom_vline(xintercept = c(1.2, 1.4, 2, 3, 4.5, 5), #<<
              color = "red", linetype = 2) + #<<
  scale_y_continuous(breaks = seq(0, 20000, by = 2500)) 


## ----plot-extra4, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() +
  aes(x = carat, y = price) + 
  geom_point() + 
  geom_vline(xintercept = c(0, 1.2, 1.4, 2, 3, 4.5, 5), 
                 color = "red", linetype = 2) + 
  geom_hline(yintercept = c(7500, 12600), #<<
             color = "blue", #<<
             linetype = "dotted") + #<<
  scale_y_continuous(breaks = seq(0, 20000, by = 2500)) 


## ----plot-extra5, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
# Using a different data set
library(gapminder)
data(gapminder)

gapminder_2007 <- subset(gapminder, 
                         year == 2007)

ggplot(gapminder_2007) +  
  theme_bw() +
  aes(x = gdpPercap, y = lifeExp) + 
  geom_point(aes(size = pop, color = continent))


## ----plot-extra6, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
# Using a different data set
library(gapminder)
data(gapminder)

gapminder_2007 <- subset(gapminder, 
                         year == 2007)

ggplot(gapminder_2007) +  
  theme_bw() +
  aes(x = gdpPercap, y = lifeExp) + 
  geom_point(aes(size = pop, color = continent)) +
  scale_size(name = "Population") + 
  scale_color_viridis_d(name = "Continent")


## ----plot-extra7, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "fill") + 
  coord_flip() + 
  scale_fill_brewer(palette = "Purples", #<<
                    direction = 1) #<<


## ----plot-extra8, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "fill") + 
  coord_flip() + 
  scale_fill_brewer(palette = "Purples", #<<
                    direction = -1) #<<


## ----plot-extra9, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "fill") + 
  coord_flip() + 
  scale_fill_brewer(palette = "Reds", #<<
                    direction = -1) #<<


## ----plot-extra10, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "fill") + 
  coord_flip() + 
  scale_fill_grey() #<<


## ----plot-extra11, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "fill") + 
  coord_flip() + 
  scale_fill_viridis_d(option = "B", #<<
                       direction = -1) #<<


## ----plot-geom8_8, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut) +
  geom_bar(fill = "royalblue")  + 
  facet_wrap(~ color)


## ----plot-extra12, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut) +
  geom_bar(fill = "royalblue")  + 
  facet_wrap(~ color) + 
  theme(axis.text.x = element_text(angle = 45)) #<<


## ----plot-extra13, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut) +
  geom_bar(fill = "royalblue")  + 
  facet_wrap(~ color) + 
  theme(axis.text.x = element_text(angle = 45, 
                                   vjust = 0.5), #<<
        axis.title.y = element_text(size = 15, #<<
                                    color = "red"))   #<<


## ---- echo=TRUE, eval=FALSE---------------------------------------------------
## ?ggsave


## ---- echo=TRUE, eval=FALSE---------------------------------------------------
## g <- ggplot(diamonds) +
##   theme_bw() +
##   aes(x = cut, fill = color) +
##   geom_bar(position = "fill") +
##   coord_flip() +
##   scale_fill_viridis_d(option = "B", direction = -1)
## 
## ggsave("my_plot.png", plot = g)


## ----plot11_1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
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


## ---- echo=TRUE, verbose=FALSE------------------------------------------------
library(COVID19)
italy <- covid19(country = "Italy", verbose = FALSE)
us <- covid19(country = "US", verbose = FALSE)
uk <- covid19(country = "United Kingdom", verbose = FALSE)


## ----plot-patch1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot() +  
  theme_bw() + 
  geom_line(data = italy, color = "blue") + 
  geom_line(data = us, color = "orange") + 
  geom_line(data = uk, color = "red") + 
  aes(x = date, y = deaths)


## ----plot-patch2, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
g1 <- ggplot() +  
  theme_bw() + 
  geom_line(data = italy, color = "blue") + 
  geom_line(data = us, color = "orange") + 
  geom_line(data = uk, color = "red") + 
  aes(x = date, y = deaths) + 
  scale_x_date(date_breaks = "3 months") + 
  theme(axis.text.x = element_text(angle = 45, 
                                   vjust = 0.5))
g1


## ---- echo=TRUE---------------------------------------------------------------
library(season)


## ---- echo=TRUE, eval=FALSE---------------------------------------------------
## ?schz


## ----plot-patch3, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
g2 <- ggplot(schz, aes(year, month, 
                       fill = SczBroad)) + 
  geom_tile(colour = "gray20", 
            size = 1.5, 
            stat = "identity") + 
  scale_fill_viridis(option = "A") +
  scale_y_continuous(breaks = 1:12, 
                     labels = month.abb[1:12]) + 
  xlab("") + 
  ylab("") +
  ggtitle("Total Australian Schizophrenics Born By Month and Year") + 
  theme(
    legend.position = "bottom", 
    legend.title = element_blank(), 
    panel.background = element_blank()
  )
g2


## ----plot-patch4, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
library(patchwork)
g <- ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = color) + 
  geom_bar(position = "fill") + 
  coord_flip() + 
  scale_fill_viridis_d(option = "B", direction = -1)
 
(g + g1) / g2


## ----plot-patch5, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
library(patchwork)
g4 <- ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = clarity) + 
  geom_bar(position = "dodge") + 
  coord_flip() + 
  scale_fill_brewer(palette = "Reds", 
                    direction = -1)
 
g + g1 + g4 + g2 + 
  plot_layout(nrow = 4)


## ----plot-patch6, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
library(patchwork)
g4 <- ggplot(diamonds) +  
  theme_bw() + 
  aes(x = cut, fill = clarity) + 
  geom_bar(position = "dodge") + 
  coord_flip() + 
  scale_fill_brewer(palette = "Reds", 
                    direction = -1)
 
g + g1 + g4 + g2 + 
  plot_layout(widths = c(1, 2))


## ----plot-patch7, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
p1 <- ggplot(mtcars) + 
  geom_point(aes(mpg, disp)) + 
  ggtitle('Plot 1')

p2 <- ggplot(mtcars) + 
  geom_boxplot(aes(gear, disp, group = gear)) + 
  ggtitle('Plot 2')

p1 + inset_element(p2, 
                   left = 0.6, 
                   bottom = 0.6, 
                   right = 1, 
                   top = 1)


## ----plot-patch8, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
g5 <- ggplot(diamonds) + 
  geom_bar(aes(x = clarity, fill = cut))

g6 <- ggplot(diamonds) + 
  geom_bar(aes(x = color, fill = cut))

g5 / g6 + plot_layout(guides = 'collect')


## ----plot-map-uk0, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
library(sf)
uk <- read_sf('Counties_and_Unitary_Authorities_(December_2022)_UK_BFC/Counties_and_Unitary_Authorities_(December_2022)_UK_BFC.shp')
ggplot(uk) + geom_sf() + theme_bw()


## ----plot-map-uk00, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
uk_simpl <- uk %>% st_simplify(dTolerance = 1e-03)

ggplot(uk_simpl) + geom_sf() + theme_bw()


## ---- echo=TRUE---------------------------------------------------------------
head(uk_simpl)


## ---- echo = TRUE-------------------------------------------------------------
library(readxl)
data_pop <- readxl::read_xlsx('data_to_plot.xlsx')


## ---- echo = TRUE-------------------------------------------------------------
head(data_pop)


## ---- echo=TRUE---------------------------------------------------------------
uk_simpl <- uk_simpl %>% 
  left_join(data_pop, by = c("CTYUA22CD" = "area_code"))


## ----plot-map-uk, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(uk_simpl) + 
  geom_sf(aes(fill = median_age)) + 
  theme_bw() 


## ----plot-map-uk2, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(uk_simpl) + 
  geom_sf(aes(fill = Unemployment)) + 
  theme_bw() 


## ---- echo = FALSE------------------------------------------------------------
uk_simpl$random <- runif(length(uk_simpl$Unemployment))


## ----plot-map-uk3, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(uk_simpl) + 
  geom_sf(aes(fill = random)) + 
  theme_bw() 


## ----plot-map-uk4, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
ggplot(uk_simpl) + 
  aes(fill = random)
  geom_sf(color = "black", size = 0.1) + #<<
  theme_void() #<<


## ----plot-extra5_1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%"----
gapminder_2007 <- subset(gapminder, 
                         year == 2007)

ggplot(gapminder_2007) +  
  theme_bw() +
  aes(x = gdpPercap, y = lifeExp) + 
  geom_point(aes(size = pop, color = continent))


## ----plot-anim1, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%", eval=FALSE----
  #> library(gganimate)
  #> p <- ggplot(gapminder,
  #>             aes(gdpPercap,
  #>                 lifeExp,
  #>                 size = pop,
  #>                 colour = country)) +
  #>   geom_point(alpha = 0.7) +
  #>   scale_colour_manual(values = country_colors) +
  #>   scale_size(range = c(2, 12)) +
  #>   scale_x_log10() +
  #>   facet_wrap(~ continent) +
  #>   theme(legend.position = 'none') +
  #>   labs(title = 'Year: {frame_time}',
  #>        x = 'GDP per capita', y = 'life expectancy') +
  #>   transition_time(year) + #<<
  #>   ease_aes('linear') #<<
  #> 
  #> animate(p)


## ----ref.label = 'plot-anim1', echo = FALSE-----------------------------------


## ----plot-anim2, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%", eval=FALSE----
  #> p <- ggplot(gapminder,
  #>             aes(gdpPercap,
  #>                 lifeExp,
  #>                 size = pop,
  #>                 colour = country)) +
  #>   geom_point(alpha = 0.7) +
  #>   scale_colour_manual(values = country_colors) +
  #>   scale_size(range = c(2, 12)) +
  #>   scale_x_log10() +
  #>   theme(legend.position = 'none') +
  #>   labs(title = 'Year: {frame_time}',
  #>        x = 'GDP per capita', y = 'life expectancy') +
  #>   transition_time(year) +
  #>   ease_aes('linear')
  #> 
  #> animate(p)


## ----ref.label = 'plot-anim2', echo = FALSE-----------------------------------


## ----plot-anim3, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%", eval=FALSE----
  #> p <- ggplot(gapminder,
  #>             aes(gdpPercap,
  #>                 lifeExp,
  #>                 size = pop,
  #>                 colour = continent)) +
  #>   geom_point(alpha = 0.7) +
  #>   scale_size(range = c(2, 12)) +
  #>   scale_x_log10() +
  #>   theme(legend.position = 'bottom') + #<<
  #>   labs(title = 'Year: {frame_time}',
  #>        x = 'GDP per capita', y = 'life expectancy') +
  #>   transition_time(year) +
  #>   ease_aes('linear')
  #> 
  #> animate(p)


## ----ref.label = 'plot-anim3', echo = FALSE-----------------------------------


## ----plot-anim4, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%", eval=FALSE----
  #> p <- ggplot(gapminder,
  #>             aes(gdpPercap,
  #>                 lifeExp,
  #>                 size = pop,
  #>                 colour = continent)) +
  #>   geom_point(alpha = 0.7) +
  #>   scale_colour_manual(values = country_colors) +
  #>   scale_size(range = c(2, 12)) +
  #>   scale_x_log10() +
  #>   theme(legend.position = 'none') +
  #>   labs(title = 'Year: {frame_time}',
  #>        x = 'GDP per capita', y = 'life expectancy') +
  #>   transition_time(year) +
  #>   ease_aes('linear') +
  #>   view_follow(fixed_y = TRUE) #<<
  #> 
  #> animate(p)


## ----ref.label = 'plot-anim4', echo = FALSE-----------------------------------


## ----plot-anim5, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%", eval=FALSE----
  #> p <- ggplot(gapminder,
  #>             aes(gdpPercap,
  #>                 lifeExp,
  #>                 size = pop,
  #>                 colour = country)) +
  #>   geom_point(alpha = 0.7) +
  #>   scale_colour_manual(values = country_colors) +
  #>   scale_size(range = c(2, 12)) +
  #>   scale_x_log10() +
  #>   theme(legend.position = 'none') +
  #>   labs(title = 'Year: {frame_time}',
  #>        x = 'GDP per capita', y = 'life expectancy') +
  #>   transition_time(year) +
  #>   ease_aes('linear') +
  #>   shadow_wake(wake_length = 0.1, alpha = FALSE) #<<
  #> 
  #> animate(p)


## ----ref.label = 'plot-anim5', echo = FALSE-----------------------------------


## ----plot-static, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%", eval=FALSE----
  #> p <- ggplot(
  #>   airquality,
  #>   aes(Day, Temp, group = Month, color = factor(Month))
  #>   ) +
  #>   geom_line() +
  #>   scale_color_viridis_d() +
  #>   labs(x = "Day of Month", y = "Temperature") +
  #>   theme(legend.position = "top")
  #> p


## ----ref.label = 'plot-static', echo = FALSE----------------------------------


## ----plot-static-not, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%", eval=FALSE----
  #> p + transition_reveal(Day)


## ----ref.label = 'plot-static-not', echo = FALSE------------------------------


## ----plot-highchart, echo=T, fig.show="hide", collapse=T, comment = "  #>", out.width="90%", eval=FALSE----
  #> library(highcharter)
  #> mpgman2 <- count(mpg, manufacturer, year)
  #> 
  #> hchart(
  #>   mpgman2,
  #>   "bar",
  #>   hcaes(x = manufacturer, y = n, group = year),
  #>   color = c("#7CB5EC", "#F7A35C"),
  #>   name = c("Year 1999", "Year 2008")
  #>   )


## ----ref.label = 'plot-highchart', echo = FALSE-------------------------------

