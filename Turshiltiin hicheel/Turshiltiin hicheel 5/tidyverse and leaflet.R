rm(list = ls())

# 1. Tidyverse ------------------------------------------------------------

library(tidyverse)

# Syntax

iris
head(iris,5)

iris %>% group_by(Species) %>% summarise(avg=mean(Sepal.Length))

# Reshape data

economics

gecon<-gather(economics,"indicators","values",-date)
gecon

# Subset observations (Rows)

econ<-economics %>% filter(date<=as.Date("1970-01-01"))
econ

# Subset variables (Columns)

diamonds %>% select(starts_with("c"))
diamonds %>% select(ends_with("e"))

# Summarise data

diamonds %>% summarise(minimum=min(price),maximum=max(price))

# Group data

diamonds %>% group_by(cut)

# Make new variables

diamonds %>% mutate(xy=x*y)

# Combine data sets

df1<-econ %>% select("date","pop")
df2<-econ %>% select("unemploy")

df1
df2

a<-bind_cols(df1,df2)
a
# Aggregate

library(scales)

my_plot<-ggplot(gecon,aes(x=date,y=values))+geom_line(color="darkblue")+scale_y_continuous(labels = scales::comma) +
  facet_wrap(~indicators, scales = "free", ncol = 3) + 
  labs(x="Date",y="values",title="Economics")

ggsave(plot =my_plot , filename = "my_plot.pdf", width = 25.4, height = 10.73)

my_plot

library(plotly)

ggplotly(my_plot)

EuStockMarkets
head(EuStockMarkets,5)

stock<-as.data.frame(EuStockMarkets) %>%
  gather(index,price) %>% 
  mutate(date=rep(time(EuStockMarkets),4))

attach(stock)

plot_ly(x=date, y=price, color = index,mode= "line")

attach(gecon)

plot_ly(x=date ,y=values, color = indicators, mode="line")


# 2. Leaflet --------------------------------------------------------------

library(leaflet)

map1 <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
map1


map2 <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=106.930831, lat=47.918574, 
             popup="University of financial economics")
map2

# 3. How to find something---------------------------------------------

# Datacamp - 
# Edx - 

# Youtube - 
# Google - 
# Stackoverflow - 
# Facebook group - 

# 4. Thanks my brothers------------------------------------------------



