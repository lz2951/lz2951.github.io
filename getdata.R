library(dplyr)
library(rnoaa)

# Get a list of all NY station IDs
stations <- ghcnd_stations()
nystationids <-  stations %>% 
  filter(state == "NY") %>% 
  distinct(id)

# Pull the desired weather data for all of these stations
nydat <- meteo_pull_monitors(nystationids$id, 
                             date_min = "1981-01-01", 
                             date_max = "2010-12-31", 
                             var = c("PRCP", "SNOW", "SNWD", "TMAX", "TMIN"))

# Save the resulting data
save(nystationids, nydat, file = "nynoaadat.RData")

