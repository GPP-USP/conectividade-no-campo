#Limpeza do ambiente
rm(list=ls())

#carregar os pacotes
library(raster)
library(sf)
library(dplyr)


#caregar arquivos necessário
demanda <- raster('caminho/do/arquivo.tif')