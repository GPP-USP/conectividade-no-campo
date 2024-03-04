# MAPAS DE CONECTIVIDADE

# clean environment
rm(list=ls())

# Pacotes
library (pacman)
p_load(sf, raster, ggplot2, dplyr, tidyr, cowplot, ggspatial, ggmap)

# Arquivos
setwd("D:/GIT_WORKSPACE/conectividade-no-campo/dados/processed")
conec <- raster("clip_demanda_final2_clip_to_mun2.tif")
br_mun <-st_read("br_mun_albers.shp")

# Conversao do raster em data frame e organizacao do df
conec_df <- as.data.frame(conec, xy=TRUE)
conec_df <- rename(conec_df, classe = layer)
conec_df <- conec_df[complete.cases(conec_df$classe),]

# Parametros da plotagem (ggplot)
cores <- c("#1a9641", "#96d265", "#4143d2", "#af92e6", "#f7c709", 
           "#fffb94", "#fe7d64", "#d7191c", "#e8aaa1", "#e72b2b","#000000")
legenda <- c("Muito baixa", "Baixa", "Média comunicação", "Informatização renda\nmédia", "Alta comunicação", 
             "Informatização renda\nalta", "Infraestruturas produtivas", 
             "Logística", "Monitoramento ambiental", 
             "Escolas", "Uso urbano")

# Criacao de vetor para ser usado no for lopp (cd_mun)
municipios <- c("1501808", "2903805", "3130804", "3501103",
                "3508702", "3524600", "3526308", "3550209",
                "4322509", "5004106")

# PLOT MAPS: For loop
for (mun in municipios) {
  df_mun <- filter(br_mun, cd_mun == mun)  # selecao do municipio
  centroide_mun <- st_centroid(df_mun)  # centroide do municipio
  centroide_mun <- st_coordinates(centroide_mun)
  limite_mun <- c(centroide_mun[1, "X"] - 75000,  # escala xy do mapa
                  centroide_mun[1, "X"] + 75000,
                  centroide_mun[1, "Y"] - 75000,
                  centroide_mun[1, "Y"] + 75000)

  plot_map <- ggplot() +
    geom_sf(fill="transparent", color = "black", data = br_mun) + # plot do limite municipios
    geom_raster(aes(x=x, y=y, fill=factor(classe)), data = conec_df, # plot raster conec.
                key_glyph = circle_key_glyph(  # editando icones da legenda
                  size = 0.3,
                  padding = unit(c(3, 3, 3, 3), "pt")
                )) +
    scale_fill_manual(values = cores,  # paleta de cores e classes do raster
                      name = "Classes",
                      labels = legenda) +
    xlim (limite_mun[1], limite_mun[2]) +  # comprimento dos eixos x e y
    ylim (limite_mun[3], limite_mun[4]) +
    labs (x = '', y = '',
          title = "Demanda por Conectividade Municipal",  # titulo e subtitulo do mapa
          subtitle = paste0("Município de ",df_mun$nm_mun," (",df_mun$sigla_uf,")")) +
    theme_classic()+  # estilo do layout
    annotation_scale (location = "bl") +  #  escala
    annotation_north_arrow(location = "tr", which_north = "true",  # seta norte
                           style = north_arrow_fancy_orienteering) +
    theme(  # ajustes de elementos textuais e outros
      text = element_text(family = "sans"),
      plot.title = element_text(face="bold", size = 14),
      plot.subtitle = element_text(face="italic", size = 12),
      legend.title = element_text(face="bold"),
      legend.margin = margin(5,5,5,5),
      legend.background = element_rect(fill = "white", color = "gray"),
      axis.text = element_text (size = 9),
      axis.text.y =  element_text(angle=90, hjust = 0.5)
    )

  ggsave(
    plot = plot_map,
    dpi = 300,
    width = 2075,
    height = 1518,
    units = "px",
    path = "D:/GPP/CONECTIVIDADE/Mapas_Conectividade",
    filename = paste0("Mapa_",gsub(" ", "_", df_mun$nm_mun),".png")
  )
}
