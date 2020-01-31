-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
-- salida esperada es la siguiente:
-- 
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
datos = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:INT, 
        nombre:CHARARRAY,
        apellido:CHARARRAY,
        fecha:CHARARRAY,
        color:CHARARRAY,
        numero: int
        );


apellidos = FOREACH datos GENERATE apellido, SUBSTRING($2,0,1) as letra;
filtro = FILTER apellidos BY letra >= 'D' and letra <= 'K';

resultado = FOREACH filtro GENERATE apellido;

store resultado into 'output' USING PigStorage (' ');
