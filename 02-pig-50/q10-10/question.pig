-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:INT, 
        nombre:CHARARRAY,
        apellido:CHARARRAY,
        fecha:CHARARRAY,
        color:CHARARRAY,
        numero: int
        );

apellido = foreach datos generate apellido;

apellido_conteo = foreach apellido generate apellido,SIZE(apellido);

apellido_conteo = ORDER apellido_conteo by $1 DESC, $0 ASC;

apellido_final = LIMIT apellido_conteo 5 ;

store apellido_final into 'output' USING PigStorage (',');