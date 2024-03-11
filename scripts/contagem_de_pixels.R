# LIMPEZA DO AMBIENTE
rm(list=ls())

# BIBLIOTECAS
library(pacman)
p_load(data.table, raster, rgdal, dplyr, tidyr)

# ARQUIVOS
values <- raster("C:/Users/bryan/Desktop/processed/mapbiomas_reclassificado_corrijido.tif")
zones<-raster("C:/Users/bryan/Desktop/processed/mun_conectividade_albers_2.tif")

# CONTAGEM POR ZONAS
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
  y <- x %>% group_by(zone, value)%>%summarise(area = n()*0.084)  
  z <- rbind(z,y)
  z <- z%>%group_by(zone, value)%>%summarise(area = sum(area, na.rm = T))
}

print(z)

# Organizando o data frame
z<-z%>%rename(   #renomeando colunas
  classe=value,
  area_ha=area,
  cd_mun=zone
)
z_filtrado <- z %>%   #removendo valores nulos e NA
  filter(!is.na(cd_mun) & cd_mun !=0)

# Exportar tabela
write.table(z, "C:/Users/bryan/Desktop/cleaned/areas_usoeocupacao.csv",
             row.names = F, sep = ";", dec = ",")
