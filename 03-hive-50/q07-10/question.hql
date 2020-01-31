-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne para cada valor único de la columna `t0.c2`, 
-- los valores correspondientes de la columna `t0.c1`. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--

!hdfs dfs -rm -r -f /output;
DROP TABLE IF EXISTS tbl0;
DROP TABLE IF EXISTS tbl1;
drop table if exists datos_final;

CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--

CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--




CREATE TABLE datos_final
AS
    select
    c2, concat_ws(':',COLLECT_LIST(cast(c1 as STRING))) c1
    from tbl0
    group by c2
;

INSERT OVERWRITE DIRECTORY '/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
    SELECT * FROM datos_final;

!hdfs dfs -copyToLocal /output output ;
