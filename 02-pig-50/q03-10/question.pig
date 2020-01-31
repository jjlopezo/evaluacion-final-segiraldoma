-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY,
        numero:INT);
DUMP data;

order1 = ORDER data BY numero;
DUMP order1;
order2 = FOREACH  order1 GENERATE numero ; 
DUMP order2;

order3 = LIMIT order2 5;
DUMP order3;

STORE order3 INTO 'output' using PigStorage('\t');