if ("leaflet" %in% rownames(installed.packages()) == FALSE) {
  install.packages("leaflet")
}
library(leaflet)
if ("htmlwidgets" %in% rownames(installed.packages()) == FALSE) {
  install.packages("htmlwidgets")
}
library(htmlwidgets)

#empty world map
map <- leaflet()

#publish a tile layer on the map - To zoom in the map to see different
#                                  countries and streets in detail.
map <- addTiles(map)

#%>% - result of left is is passed as first param of func on right

# same as
map <- leaflet() %>% addTiles(map)

#add marker
map <- leaflet() %>% addTiles(map) %>%
  addMarkers(lng = -73.9851, lat = 40.7589, popup = "Times Square")

#add style
map <- leaflet() %>% addProviderTiles("Stamen.Watercolor") %>%
  addMarkers(lng = -73.9851, lat = 40.7589, popup = "Times Square")

#using vector for marks
map <- leaflet(quakes) %>% addTiles() %>%
  addCircleMarkers(lng = quakes$long, lat = quakes$lat)

#improved markers
map <- leaflet(quakes) %>% addTiles() %>%
  addMarkers(clusterOptions = markerClusterOptions(),
  lng = quakes$long, lat = quakes$lat)

#"highlight" an area of interest with a rectangle
map <- leaflet() %>% addTiles() %>%
  addMarkers(lng = 86.92, lat = 27.99, popup = "Mount Everest") %>%
  addRectangles(86.9, 27.95, 87, 28.05)

#polygon by matrix
tri <- matrix(c(86.87, 27.95, 86.97, 27.95, 86.92, 28.05),
  ncol = 2, byrow = TRUE)
map <- leaflet() %>% addTiles() %>%
  addMarkers(lng = 86.92, lat = 27.99, popup = "Mount Everest") %>%
  addPolygons(lng = tri[, 1], lat = tri[, 2])

#save as html
filepath <- "output/map.html"
saveWidget(map, file.path(normalizePath(dirname(filepath)), basename(filepath)), selfcontained = F)


#polygon by sp object
#This example uses the library rgdal to read a geojson file
#with the countries' borders information and convert it to
#a sp object
if ("rgdal" %in% rownames(installed.packages()) == FALSE) {
  install.packages("rgdal")
}
library(rgdal)
countries <- readOGR("testfiles/countries.geojson.txt", "OGRGeoJSON")
map <- leaflet(countries) %>% addTiles() %>% addPolygons(weight = 1)

#Colors and legends

energy <- read.csv("testfiles/EnergyConsumption.csv")
#merge the energy data frame with countries
countries <- sp::merge(countries, energy[, c(1, 3)], by = "geounit", all.x = T)
color <- colorNumeric("YlOrRd", energy$Value)
map <- leaflet(countries) %>% addTiles() %>%
  addPolygons(stroke = FALSE, fillColor = ~color(Value), fillOpacity = 1) %>%
  addLegend("topright", pal = color, values = countries@data$Value,
  title = "kWh per capita", opacity = 1)

#color factor
color <- colorFactor("Set1", countries$continent)
map13 <- leaflet(countries) %>% addTiles() %>%
  addPolygons(stroke = F, fillColor = ~color(continent), fillOpacity = 1) %>%
  addLegend("bottomleft", pal = color, values = ~continent, opacity = 1,
  title = "Continent")
