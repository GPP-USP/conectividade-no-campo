# Limpeza do ambiente
rm(list=ls())

# Carregando bilbiotecas
library(pacman)
p_load(data.table, raster, rgdal, sf, fasterize, dplyr,exactextractr,tidyr)

# Carregando rasters
setwd("D:/GIT_WORKSPACE/conectividade-no-campo/dados/cleaned")
values <- raster("clip_demanda_v5_albers_clip.tif")
zones<-raster("mun_conectividade_albers.tif")

# Contagem dos pixels
bss <- blockSize(values, minrows = 78)
bss$n
value <- NA
area <- NA
zone <- NA
z <- data.frame(zone = zone, value = value, area = area)
for(i in 1:bss$n) {
  print(i)
  x <- data.frame(zone = getValues(zones,  row = bss$row[i], nrows = bss$nrows[i]),
                  value = getValues(values,  row = bss$row[i], nrows = bss$nrows[i]))
  x <- drop_na(x)
  y <- x %>% group_by(zone, value)%>%summarise(area = n()*1)  
  z <- rbind(z,y)
  z <- z%>%group_by(zone, value)%>%summarise(area = sum(area, na.rm = T))
}

#Tratamento
z<-z%>%rename(
  demanda=value,
  area_km2=area,
  cd_mun=zone
)

table_conec <- z[-c(1:10, 80),]

# Exportar tabela
write.table(table_conec, "D:/GIT_WORKSPACE/conectividade-no-campo/dados/cleaned/demanda_conectividade_mun.csv",
             row.names = F, sep = ";", dec = ",")