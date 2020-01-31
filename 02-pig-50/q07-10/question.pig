-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        bolsa:bag{(a:CHARARRAY)},
        mapa:map[]);
DUMP datos;

rank_datos = rank datos;

tabla_cruce = foreach rank_datos generate $0,$1;

datos_bolsa= FOREACH rank_datos GENERATE rank_datos, letra, FLATTEN(bolsa) as f_bolsa;
DUMP datos_bolsa;

agrupa_bolsa = group datos_bolsa by rank_datos;
DUMP agrupa_bolsa;

conteo_bolsa = FOREACH agrupa_bolsa GENERATE group,  COUNT(datos_bolsa);
DUMP conteo_bolsa;

datos_mapa= FOREACH rank_datos GENERATE rank_datos, letra, FLATTEN(mapa) as f_mapa;
DUMP datos_mapa;

agrupa_mapa = group datos_mapa by rank_datos;
DUMP agrupa_mapa;

conteo_mapa = FOREACH agrupa_mapa GENERATE group,  COUNT(datos_mapa);
DUMP conteo_mapa;

join_1 = JOIN conteo_bolsa by $0 , conteo_mapa by $0;

join_2 = JOIN join_1 by $0 , tabla_cruce by $0;

tabla_tmp = foreach join_2 generate $5,$1,$3;

tabla_final = order tabla_tmp by $0, $1 ,$2;

store tabla_final into 'output' using PigStorage(',');