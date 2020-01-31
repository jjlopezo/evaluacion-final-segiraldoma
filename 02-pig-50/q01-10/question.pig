-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por key. 
-- Escriba el resultado a la carpeta `output` del directorio actual.

fs -rm -f -r output;

data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (key:CHARARRAY, 
        date:CHARARRAY,
        cantidad:INT);
DUMP data;

groupkey = GROUP data BY key;
DUMP groupkey;

conteo = FOREACH groupkey GENERATE $0, COUNT(data);
DUMP conteo;

STORE conteo INTO 'output' using PigStorage('\t');

