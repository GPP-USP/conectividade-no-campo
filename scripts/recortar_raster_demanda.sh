gdalwarp -t_srs "PROJCS["Conica_Equivalente_de_Albers_Brasil",GEOGCS["GCS_SIRGAS2000",DATUM["D_SIRGAS2000",SPHEROID["Geodetic_Reference_System_of_1980",6378137,298.2572221009113]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Albers"],PARAMETER["standard_parallel_1",-2],PARAMETER["standard_parallel_2",-22],PARAMETER["latitude_of_origin",-12],PARAMETER["central_meridian",-54],PARAMETER["false_easting",5000000],PARAMETER["false_northing",10000000],UNIT["Meter",1]]" -te 4769350.64341917 8138046.97010598 6458232.70240898 11279679.3314372 -tr 1000 1000 -ot Byte -co "COMPRESS=DEFLATE" -co "ZLEVEL=9" -co "PREDICTOR=2" -co "BIGTIFF=IF_SAFER" -co "NUM_THREADS=6" D:\GIT_WORKSPACE\conectividade-no-campo\dados\raw\clip_demanda_v5.tif D:\GIT_WORKSPACE\conectividade-no-campo\dados\cleaned\clip_demanda_v5_albers_clip.tif


-t_srs: "PROJCS["Conica_Equivalente_de_Albers_Brasil",GEOGCS["GCS_SIRGAS2000",DATUM["D_SIRGAS2000",SPHEROID["Geodetic_Reference_System_of_1980",6378137,298.2572221009113]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Albers"],PARAMETER["standard_parallel_1",-2],PARAMETER["standard_parallel_2",-22],PARAMETER["latitude_of_origin",-12],PARAMETER["central_meridian",-54],PARAMETER["false_easting",5000000],PARAMETER["false_northing",10000000],UNIT["Meter",1]]"
-te: 4769350.64341917 8138046.97010598 6458232.70240898 11279679.3314372
-tr: 1000 1000
-ot: Byte
-co: "COMPRESS=DEFLATE" -co "ZLEVEL=9" -co "PREDICTOR=2" -co "BIGTIFF=IF_SAFER" -co "NUM_THREADS=6
-srcfile: clip_demanda_v5.tif
-dstfile: clip_demanda_v5_albers_clip.tif