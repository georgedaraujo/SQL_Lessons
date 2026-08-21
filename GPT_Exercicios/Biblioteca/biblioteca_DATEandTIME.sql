	-- DATE AND TIME FUNCTIONS --
	/* Formato da data: AAAA/MM/DD
	   Formato da hora: HH:MM:SS */

	/* Há três origens para os dados das datas e tempo:
	das tabelas, inserido manualmente no código e o GETDATE,
	que recolhe o date time atual*/


USE biblioteca;

SELECT data_devolucao
FROM emprestimos;

SELECT
	'2026-08-20' AS HardCoded,
	GETDATE() AS Agora;

	-- EXTRAIR PARTES (Dia, mês e ano) --
SELECT data_devolucao,
	DAY(data_devolucao) AS Dia,
	MONTH(data_devolucao) AS Mês,
	YEAR(data_devolucao) AS Ano
	
FROM emprestimos;

	-- DATEPART --
	/*extrai e retorna um valor inteiro que representa 
	uma parte específica de uma data ou hora 
	(como o ano, o mês, o dia, a hora ou o dia da semana) 
	year ou yy (Ano), month ou mm (Mês), day ou dd (Dia), 
	hour ou hh (Hora), weekday ou dw (Dia da semana)*/

SELECT 
	data_cadastro,
	DATEPART(dd, data_cadastro) AS Dia,
	DATEPART(mm, data_cadastro) AS Mês,
	DATEPART(year, data_cadastro) AS Ano,
	DATEPART(hour, data_cadastro) AS Hora,
	DATEPART(quarter, data_cadastro) AS Quarto,
	DATEPART(weekday, data_cadastro) AS Dia_Semana,
	DATEPART(week, data_cadastro) AS Semana_Ano
FROM clientes;


	-- DATENAME --
	/*extrai uma parte específica de uma data (como o mês, 
	o dia da semana ou o ano) e retorna esse valor em formato 
	de texto*/
SELECT 
	data_cadastro,
	DATEPART(mm, data_cadastro) AS Mês,
	DATENAME(mm, data_cadastro) AS Nome_Mes,
	DATEPART(year, data_cadastro) AS Ano,
	DATEPART(weekday, data_cadastro) AS Dia_Semana,
	DATENAME(dw, data_cadastro) AS Dia_Sem_Nome	
FROM clientes;

	-- DATETRUNC --
	/* reduz um valor de data e hora para uma precisão específica. 
	Ela define as unidades menores como zero ou o valor inicial do 
	período (como o dia 1 para meses ou meia-noite para horas), 
	mantendo o tipo de dado original */

SELECT
	data_cadastro,
	DATETRUNC(second, data_cadastro) AS Miliseg_Zerados
FROM clientes;

/* DATETRUNC pode ser usada em análise para verificar, p.ex.,
quantidade de registros por período, com GROUPBY*/

SELECT
	DATETRUNC(month, data_cadastro),
	COUNT(*) AS Cad_PMes
FROM clientes
GROUP BY DATETRUNC(month, data_cadastro);

	-- EOMONTH --
	/*retorna o ultimo dia de um mês */
SELECT
	id_livros,
	data_emprestimo,
	EOMONTH(data_emprestimo) AS Fim_do_Mes
FROM emprestimos;