	-- FORMAT, CAST and CONVERT Datas --
----------------------------------------------------------

	/* CAST e CONVERT mudam um tipo de dado para outro, mas o CONVERT 
	aceita códigos extras de estilo para datas. O FORMAT serve para formatar 
	a exibição visual de números e datas em textos, 
	sendo mais lento para grandes volumes. */

	-- FORMAT --
----------------------------------------------------------
USE biblioteca;

SELECT 
	data_cadastro, 
	FORMAT(data_cadastro, 'dd/MM/yyy', 'pt-BR') AS data_PTBR,
	-- testando outros formatos --
	FORMAT(data_cadastro, 'ddd') AS dia_abrev,
	FORMAT(data_cadastro, 'dddd') AS dia_compl,
	FORMAT(data_cadastro, 'MMM') AS mes_abrev,
	FORMAT(data_cadastro, 'MMMM') AS mes_compl
FROM clientes;

-- Formatar no layout: Wed, Mês_Abrev de ANO HH:MM:SS PM --
SELECT 
	data_cadastro,
	FORMAT(data_cadastro, 'ddd,' + ' MMM ' + 'yyyy hh:mm:ss tt')
FROM clientes;

SELECT
	nome,
	data_nasc,
	FORMAT(data_nasc, 'dd/MM/yyy', 'pt-BR') AS data_PTBR,
	
	FORMAT(data_nasc, 'ddd') AS dia_abrev,
	FORMAT(data_nasc, 'MMM') AS mes_abrev

FROM autores;


-- AGREGAR: resumir registros num único valor (GROUP BY) --
----------------------------------------------------------
SELECT
	FORMAT(data_nasc, 'MMM') AS nascimento, 
	COUNT(*)
FROM autores
GROUP BY FORMAT(data_nasc, 'MMM');

	-- CONVERT --
----------------------------------------------------------
SELECT
	CONVERT (VARCHAR, preco) AS Numb_to_String
FROM livros;

SELECT 
	data_cadastro,
	FORMAT(CONVERT(DATE, data_cadastro), 'dd-MM-yyy') AS [Datatime para Data]
FROM clientes;


	-- CAST --
----------------------------------------------------------
SELECT 
	data_cadastro,
	CAST(data_cadastro AS DATE) AS [Datatime para Data]
FROM clientes;

SELECT
	CAST(preco AS VARCHAR) AS Numb_to_String
FROM livros;
