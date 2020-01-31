-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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

datostmp= FOREACH datos GENERATE FLATTEN(mapa) as clave;
dump datostmp;


resumen= group datostmp by clave;
dump resumen;

conteo = FOREACH resumen GENERATE group, COUNT(datostmp);
dump conteo;

store conteo into 'output' using PigStorage(',');