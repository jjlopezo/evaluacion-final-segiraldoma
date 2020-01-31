-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color 
--    FROM 
--        u 
--    WHERE 
--        color REGEXP '[aeiou]$';
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


datos = FOREACH data GENERATE firstname,color;

filtro = FILTER datos BY ENDSWITH(color, 'a') or ENDSWITH(color, 'e') or ENDSWITH(color, 'i') or ENDSWITH(color, 'o') or ENDSWITH(color, 'u');

store filtro into 'output' USING PigStorage(',');