-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
data = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);

datos = FOREACH data GENERATE birthday as fecha, SUBSTRING(birthday,5,7) as mes_largo,(int) SUBSTRING(birthday,5,7) as mes_corto;

datos_final = foreach datos generate fecha,
				case mes_largo
				when '01'  then 'ene'
				when '02'  then 'feb'
				when '03'  then 'mar'
				when '04'  then 'abr'
				when '05'  then 'may'
				when '06'  then 'jun'
				when '07'  then 'jul'
				when '08'  then 'ago'
				when '09'  then 'sep'
				when '10'  then 'oct'
				when '11'  then 'nov'
				when '12'  then 'dic'
				end as nom_mes,
				mes_largo,
				mes_corto;



store datos_final into 'output' USING PigStorage(',');