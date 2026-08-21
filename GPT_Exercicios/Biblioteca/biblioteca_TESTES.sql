SELECT * FROM livros;

INSERT INTO livros (id_livro, titulo, ano_publicacao, preco, id_autor, categoria, id_editora)
	VALUES(10404, 'Satantango', 1985, 60.11, 6, 'Contemporanea', 1004);

SELECT * FROM emprestimos;
INSERT INTO emprestimos (id_clientes, id_livros, data_emprestimo, data_devolucao)
	VALUES( 4, 10404, '2026-08-10', ' ');

SELECT * FROM editoras;

SELECT * FROM autores;

INSERT INTO autores(id_autor, nome, nacionalidade, data_nasc)
	VALUES(6, ' László Krasznahorkai', 'hungria', '1954-01-05');

SELECT * FROM clientes;



