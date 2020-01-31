-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
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
    SELECT letra, cantidad, fecha FROM datos order BY 1 ASC, 2 ASC, 3 ASC;

INSERT OVERWRITE DIRECTORY '/output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

SELECT  letra, fecha, cantidad FROM datos_final;

!hdfs dfs -copyToLocal /output  output;
