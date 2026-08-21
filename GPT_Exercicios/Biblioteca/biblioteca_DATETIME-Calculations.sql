/* DATEADD serve para somar ou subtrair um intervalo de tempo 
(como dias, meses ou anos)[day, month, year, hour, etc.] de uma data, gerando uma nova data. 
Já o DATEDIFF calcula a diferença numérica entre duas datas com 
base em uma unidade de medida específica (como dias ou horas).
*/
USE biblioteca;
SELECT * FROM clientes;

	-- DATEADD --
--------------------------------------------
SELECT
	nome,
	data_cadastro,
	DATEADD(day, 3, data_cadastro)
FROM clientes
WHERE nome = 'Bruno Rocha';

	-- Atualizando tabela de cientes --
--------------------------------------------
UPDATE clientes
SET data_cadastro = DATEADD(day, 3, data_cadastro)
WHERE nome = 'Bruno Rocha';

UPDATE clientes
SET data_cadastro = DATEADD(month, -2, data_cadastro)
WHERE nome = 'George Araujo';

UPDATE clientes
SET data_cadastro = DATEADD(year, -1, data_cadastro)
WHERE nome = 'Tatiane Verginia';


	-- DATEDIFF --
--------------------------------------------

-- Idade dos autores em relação a data atual--
SELECT 
	nome,
	data_nasc,
	DATEDIFF(year, data_nasc, GETDATE()) AS Idade_Atual
FROM autores;

-- Diferença em dias entre emprestimo e devolução
-- (dias de emprestimo)
SELECT
	e.id_emprestimos,
	e.id_livros,
	l.titulo,
	e.data_emprestimo,
	e.data_devolucao,
	DATEDIFF(day, data_emprestimo, data_devolucao) AS Dias_Emprestado
FROM emprestimos AS e
	INNER JOIN livros AS l
		ON e.id_livros = l.id_livro

-- Diferença de dias entre pedidos de empréstimos --
SELECT 
	e.id_emprestimos,
	e.id_livros,
	l.titulo,
	e.data_emprestimo,
	e.data_devolucao,
	LAG(data_emprestimo) OVER(ORDER BY data_emprestimo) AS UltimoEmprestimo,
	DATEDIFF(day,LAG(data_emprestimo) OVER(ORDER BY data_emprestimo), data_emprestimo) AS Dias_entre
FROM emprestimos AS e
	INNER JOIN livros AS l
		ON e.id_livros = l.id_livro;

SELECT * FROM livros;
SELECT * FROM emprestimos;