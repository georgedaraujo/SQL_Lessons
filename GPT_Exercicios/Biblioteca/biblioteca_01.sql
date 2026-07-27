/*Exercício básico criado pelo CHATGPT
*/

CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE autores(
	id_autor INT PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	nacionalidade VARCHAR (100),
	data_nasc DATE
);

CREATE TABLE livros(
	id_livro INT PRIMARY KEY,
	titulo VARCHAR (100) NOT NULL,
	ano_publicacao INT,
	preco DECIMAL (4, 2),
	id_autor INT,
	FOREIGN KEY (id_autor) references autores(id_autor)
);

ALTER TABLE livros 
ALTER COLUMN preco NUMERIC(6, 2);

CREATE TABLE clientes(
	id_cliente INT PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	email VARCHAR (150) UNIQUE,
	telefone VARCHAR (50),
	data_cadastro DATETIME DEFAULT GETDATE()
);


CREATE TABLE emprestimos(
	id_emprestimos INT PRIMARY KEY IDENTITY(1,1),
	id_clientes INT,
	id_livros INT,
	data_emprestimo DATE NOT NULL,
	data_devolucao DATE,
	FOREIGN KEY (id_clientes) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_livros) REFERENCES livros (id_livro)
);


ALTER TABLE livros
	ADD categoria VARCHAR (50)

SELECT * FROM livros;

CREATE TABLE editoras(
	id_editora INT PRIMARY KEY,
	editora VARCHAR (50)
);

ALTER TABLE livros
	ADD id_editora INT,
	FOREIGN KEY (id_editora) REFERENCES editoras(id_editora)

SELECT * FROM livros AS l 
FULL JOIN editoras AS e
	ON l.id_editora = e.id_editora

INSERT INTO autores(id_autor, nome, nacionalidade, data_nasc)
	VALUES
		(1, 'Isaac Asimov', 'russia', '1920-01-02'),
		(2, 'Machado de Assis', 'brasil', '1839-06-21'),
		(3, 'Jane Austen', 'reino unido', '1775-12-16'),
		(4, 'Liev Tolstoi', 'russia', '1828-09-09'),
		(5, 'Gabriel Garcia Marquez', 'colombia', '1927-03-06')

SELECT * FROM autores;

INSERT INTO editoras (id_editora, editora)
	VALUES
		(1000, 'Record'),
		(1001, 'Aleph'),
		(1002, 'Via Leitura'),
		(1003, 'Garnier'),
		(1004, 'Companhia das Letras'),
		(1005, 'Principis'),
		(1006, 'Veríssimo'),
		(1007, 'Lafonte'),
		(1008, 'HarperKids'),
		(1009, 'Galera'),
		(1010, 'Rocco'),
		(1011, 'Harper Business')

SELECT * FROM editoras;
SELECT * FROM livros;

INSERT INTO livros (id_livro, titulo, ano_publicacao, preco, id_autor, categoria, id_editora)
	VALUES
		(10100, 'O Fim da Eternidade', 2019, 49.90, 1, 'Ficcao Cientifica', 1001),
		(10101, 'Eu, robô', 2014, 54.85, 1, 'Ficcao Cientifica', 1001),
		(10601, 'Casa Velha', 2024, 15.00, 2, 'Infantil', 1006),
		(10501, 'Dom Casmurro', 2019, 12.45, 2, 'Clássica Nacional', 1005),
		(10201, 'Persuasão', 2019, 47.20, 3, 'Clássica', 1002),
		(10301, 'Orgulho e Preconceito',  2023, 36.00, 3, 'Clássica', 1003),
		(10401, 'Anna Karienina', 2017, 108.3, 4, 'Clássica', 1004),
		(10402, 'Guerra e Paz', 2017, 216.3, 4, 'Clássica', 1004),
		(10403, 'Ressurreição', 2020, 73.50, 4, 'Clássica', 1004),
		(10001, 'Cem anos de solidão', 1977, 41.14, 5, 'Contemporanea', 1000),
		(10002, 'O amor nos tempos do cólera', 1986, 51.24, 5, 'Contemporanea', 1000),
		(10003, 'A revoada', 1980, 51.64, 5, 'Contemporanea', 1000)

INSERT INTO clientes (id_cliente, nome, email, telefone)
	VALUES
		(1, 'Antonio Bernardo', 'antoniob@gmail.com', '(11) 994375817'),
		(2, 'Bruno Rocha', 'bruno.rocha@paulicon.com.br', '(11) 995657899'),
		(3, 'Caio Brasil', 'caiobbrasil@gmail.com', '(11) 986643232'),
		(4, 'George Araujo', 'georgefpar@gmail.com', '(11) 991782097'),
		(5, 'Tatiane Verginia', 'tatiane.vergs@gmail.com', '(11) 987073649')

SELECT * FROM clientes;

INSERT INTO emprestimos(id_clientes, id_livros, data_emprestimo, data_devolucao)
	VALUES
		(1, 10100, '2026-07-25', '2026-07-27'),
		(4, 10003, '2026-07-14', ''),
		(2, 10100, '2026-07-27', ''),
		(5, 10001, '2026-06-29', '2026-07-12'),
		(3, 10601, '2026-07-17', '2026-07-25'),
		(4, 10201, '2026-07-17', '2026-07-26')

	

SELECT 
	id_clientes,
	id_livros,
	data_emprestimo,
	
	CASE
		WHEN data_devolucao = '' THEN NULL 
		ELSE data_devolucao
	END data_devolucao
FROM emprestimos;