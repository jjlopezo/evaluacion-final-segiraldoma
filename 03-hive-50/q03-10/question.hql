-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--


!hdfs dfs -rm -r -f /input;
!hdfs dfs -rm -r -f /output;
!hdfs dfs -mkdir /input;
!hdfs dfs -copyFromLocal data.tsv  /input/data.tsv;

DROP TABLE IF EXISTS datos;
CREATE TABLE datos (letra STRING,
                    fecha STRING,
                    cantidad INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA INPATH '/input/data.tsv' OVERWRITE INTO TABLE datos;

DROP TABLE IF EXISTS datos_final;

CREATE TABLE datos_final
AS
    SELECT DISTINCT cantidad
    FROM
        datos
    ORDER BY cantidad
    LIMIT 5;

INSERT OVERWRITE DIRECTORY '/output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

	select * 
	from datos_final;

!hdfs dfs -copyToLocal /output  output;
