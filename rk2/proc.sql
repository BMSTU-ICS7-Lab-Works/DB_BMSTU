CREATE OR REPLACE procedure
info_tbl(tbl_name VARCHAR(100)) AS $$
AS $$
SELECT * FROM pg_indexes WHERE tablename = $1;
$$
LANGUAGE plpgspql;
									
CALL info_db('executor');