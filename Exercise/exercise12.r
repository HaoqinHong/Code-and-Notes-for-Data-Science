# Problem 1 (Easy)
library(leaflet)

# Create a leaflet map
map <- leaflet() %>%
  addTiles() # Add a tile layer to the map (you can use other tile providers too)

# Add markers representing changes
# Assuming we have a dataset called 'changes' with columns 'latitude', 'longitude', 'type', and 'timestamp'
for (i in 1:nrow(changes)) {
  map <- addMarkers(map, lng = changes$longitude[i], lat = changes$latitude[i],
                    color = get_color(changes$type[i]), 
                    popup = paste("Type:", changes$type[i], "<br>Timestamp:", changes$timestamp[i]))
}

# Display the map
map
