USE biblioteca;

-- brincando com SELECT

-- Selecionando apenas alguns campos da tabela
SELECT 
	id_cliente,
	nome,
	email
FROM clientes;

-- Selecionando tudo de uma tabela
SELECT * FROM emprestimos;

-- Selecionando só os russos - condicional (WHERE)
SELECT * FROM autores
	WHERE nacionalidade = 'russia';

-- Selecionando qualquer que não seja russo (!=)
SELECT * FROM autores
	WHERE nacionalidade != 'russia';

SELECT * FROM emprestimos
	WHERE id_clientes = 4 AND id_emprestimos = 6;

SELECT * FROM emprestimos
	WHERE id_clientes = 2 OR id_livros = 10100;

SELECT * FROM autores
	WHERE nacionalidade IN ('brasil', 'colombia');

SELECT * FROM clientes
	WHERE nome LIKE 'G%';

SELECT * FROM clientes
	WHERE nome LIKE '%a';

SELECT * FROM clientes
	WHERE nome LIKE '%Brasil%';

-- Selecionando por ordem (nesse caso, alfabética) ORDER BY
SELECT * FROM autores
	ORDER BY nome DESC;

-- Selecionando por ordem (nesse caso, ano de publicação)
SELECT * FROM livros
	ORDER BY ano_publicacao ASC;

-- Selecionando com base em mais de uma coluna (autor e ano)
SELECT * FROM livros 
	ORDER BY id_autor ASC, ano_publicacao ASC;

/*
SELECT id_autor, SUM (preco) AS total_autor
	FROM livros
	GROUP BY id_autor;
*/

-- Fazendo a soma de todos os livros de cada autor e exibindo total por nome
-- GROUP BY
SELECT a.nome, SUM (preco) AS total_autor
	FROM livros AS l
	INNER JOIN autores AS a
	ON l.id_autor = a.id_autor
	GROUP BY a.nome;

-- Fazendo o agrupamento da soma, mas exibindo apenas os condicionais
-- HAVING
SELECT a.nome, SUM (preco) AS total_autor
	FROM livros AS l
	INNER JOIN autores AS a
	ON l.id_autor = a.id_autor
	GROUP BY a.nome
	HAVING SUM (preco) > 300;

-- Trazendo a lista dos autores no BD
-- DISTINCT retorna apenas a ocorrencia uma vez
SELECT DISTINCT nome FROM autores;