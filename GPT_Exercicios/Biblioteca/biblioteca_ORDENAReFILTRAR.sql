USE biblioteca;

-- Filtrar por data --
SELECT * FROM emprestimos
	WHERE data_emprestimo > '2026-07-14';

-- Ordenar por ordem alfabética --
SELECT * FROM editoras
	ORDER BY editora ASC;

-- Contar registros com a condição --
SELECT COUNT(*) AS TotalEditoras
	FROM editoras;

-- Soma valores de uma coluna numérica --
SELECT SUM(preco) AS TotalPreco
	FROM livros;

-- Tira a media de uma coluna numérica --
SELECT AVG(preco) AS MediaPreco
	FROM livros;

