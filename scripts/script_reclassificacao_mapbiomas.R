# RECLASSIFICACAO DO RASTER MAPBIOMAS

# clean environ
rm(list = ls())

# PACOTES
library (raster)

# ARQUIVOS
gtiff <-raster ("D:/GIT_WORKSPACE/conectividade-no-campo/dados/processed/mapbiomas_col8_clip2.tif")
legenda <- read.csv2("D:/GIT_WORKSPACE/conectividade-no-campo/dados/raw/reclassificao_legenda_mapbiomas_col8.csv")

# PREPARANDO OS DADOS
legenda <- subset(legenda, select= -c(descricao, color))

# RECLASSFICACAO DO RASTER
gtiff_reclass <- reclassify(gtiff, legenda)

# SALVANDO O RASTER RECLASSIFICADO
writeRaster(gtiff_reclass, filename = "D:/GIT_WORKSPACE/conectividade-no-campo/dados/processed/mapbiomas_reclassificado_corrijido",
            format="GTiff", options = "COMPRESS=LZW")