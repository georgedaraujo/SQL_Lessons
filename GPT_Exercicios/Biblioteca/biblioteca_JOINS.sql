-- JOINS --
USE biblioteca;

-- NO JOIN (without combine)  --
SELECT * FROM emprestimos;
SELECT * FROM clientes;
SELECT * FROM livros;

-- INNER JOIN --
SELECT
	e.id_emprestimos,
	e.id_livros,
	l.titulo,
	e.data_emprestimo,
	e.data_devolucao,
	c.id_cliente,
	c.nome,
	c.telefone

FROM emprestimos AS e 
	INNER JOIN clientes AS c 
		ON e.id_clientes = c.id_cliente
	INNER JOIN livros AS l
		ON e.id_livros = l.id_livro;

-- LEFT JOIN --

SELECT
	c.id_cliente,
	c.nome,
	e.id_emprestimos,
	e.id_clientes,
	e.id_livros
FROM clientes AS c
	LEFT JOIN emprestimos AS e
	ON e.id_clientes = c.id_cliente;


-- FULL JOIN --
SELECT
	e.id_emprestimos,
	e.id_livros,
	l.titulo,
	e.data_emprestimo,
	e.data_devolucao,
	c.id_cliente,
	c.nome,
	c.telefone

FROM emprestimos AS e 
	FULL JOIN clientes AS c 
		ON e.id_clientes = c.id_cliente
	FULL JOIN livros AS l
		ON e.id_livros = l.id_livro;