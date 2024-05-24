USE kaggle
GO

--EN CASO NO EXISTA LA TABLA netflix
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id = OBJECT_ID(N'dbo.netflix') AND type = 'U')
	CREATE TABLE netflix (
		show_id varchar(max),
		type_show varchar(max),
		title varchar(max),
		director varchar(max),
		cast_show varchar(max),
		country varchar(max),
		date_added varchar(max),
		release_year varchar(max),
		rating varchar(max),
		duration varchar(max),
			listed_in varchar(max),
		description_show varchar(max)
	)

--SI LA TABLA YA EXISTE, ENTONCES LA TRUNCO
TRUNCATE TABLE dbo.netflix

--INGESTAR DATASET
BULK INSERT dbo.netflix
FROM 'C:\Users\andyc\OneDrive\Escritorio\proyecto_parcial\python\dataset\netflix_titles.csv'
WITH
(
	FIRSTROW = 2,			--EMPIEZA EN LA 2DA FILA, YA QUE LA 1RA ES LA CABECERA
	FIELDTERMINATOR = ',', --INDICAMOS SEPARADOR DE COLUMNAS
	ROWTERMINATOR = '0x0a'	--HACE REFERENCIA A UN SALTO DE LINEA
)

GO