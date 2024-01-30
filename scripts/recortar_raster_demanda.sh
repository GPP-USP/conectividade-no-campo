gdalwarp -t_srs "+proj=aea +lat_0=-12 +lon_0=-54 +lat_1=-2 +lat_2=-22 +x_0=5000000 +y_0=10000000 +ellps=GRS80 +units=m +no_defs" -te 4769350.64341917 8138046.97010598 6458232.70240898 11279679.3314372 -tr 1000 1000 -ot Byte -co "COMPRESS=DEFLATE" -co "ZLEVEL=9" -co "PREDICTOR=2" -co "BIGTIFF=IF_SAFER" -co "NUUM_THREADS=6" D:\GIT_WORKSPACE\conectividade-no-campo\dados\raw\clip_demanda_v5.tif D:\GIT_WORKSPACE\conectividade-no-campo\dados\cleaned\clip_demanda_v5_albers_clip.tif


-t_srs: "+proj=aea +lat_0=-12 +lon_0=-54 +lat_1=-2 +lat_2=-22 +x_0=5000000 +y_0=10000000 +ellps=GRS80 +units=m +no_defs"
-te: 4769350.64341917 8138046.97010598 6458232.70240898 11279679.3314372
-tr: 1000 1000
-ot: Byte
-co: "COMPRESS=DEFLATE" -co "ZLEVEL=9" -co "PREDICTOR=2" -co "BIGTIFF=IF_SAFER" -co "NUM_THREADS=6
-srcfile: clip_demanda_v5.tif
-dstfile: clip_demanda_v5_albers_clip.tif