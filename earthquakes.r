# This is iwi and Sebastian first ever R code, how exciting



#1
california_data <- earthquakes %>% filter(longitude >= -125 & longitude <= -114 & latitude <= 42.5 & latitude >= 32.5)
#2
map_california <- us_states %>% filter(NAME == "California")
#3
df <- st_as_sf(x = california_data, coords = c("longitude", "latitude"), crs = st_crs(map_california))
#4
p <- tm_shape(map_california) 
#5
p <- p + tm_style("classic") + tm_fill(col = "palegreen4") + tm_borders() 
#6  
p <- p + tm_layout(main.title = paste("California earthquakes map from ", paste(as.Date(california_data$time[1]), as.Date(california_data$time[nrow(california_data)]), sep = " to "))) 
#7
p <- p + tm_compass(type = "8star", position = c("right", "top")) 
#8
p <- p + tm_scale_bar(breaks = c(0, 100, 200), size = 1, position = c("left", "bottom")) 
#9
p <- p + tm_shape(df) 
#10
p <- p + tm_dots(size = 0.1, col = "mag", palette = "YlOrRd")
p
