-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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
        mapeo:map[]);
DUMP datos;

temp= FOREACH datos GENERATE FLATTEN(bolsa) as letra;
dump temp;


red= group temp by letra;
dump red;

conteo = FOREACH red GENERATE group, COUNT(temp);
dump conteo;

store conteo into 'output' using PigStorage('\t');
