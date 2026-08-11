CREATE DATABASE MinhaEstante;

USE MinhaEstante;

CREATE TABLE autores(
	id_autor INT PRIMARY KEY,
	nome VARCHAR (50) NOT NULL,
	sobrenome VARCHAR (50) NOT NULL,
	pais VARCHAR (50),
);

CREATE TABLE livros(
	id_livro INT IDENTITY(1,1) PRIMARY KEY,
	titulo VARCHAR (100) NOT NULL,
	id_autor INT,
	ano_publicacao INT,
	preco_atual decimal (10,2),
	FOREIGN KEY (id_autor) REFERENCES autores (id_autor)
);

SELECT * FROM livros

INSERT INTO autores (id_autor, nome, sobrenome, pais)
	VALUES (1, 'Philip', 'Roth', 'EUA');

INSERT INTO livros (titulo, id_autor, ano_publicacao, preco_atual)
	VALUES ('Entre Nós', 1, 2001, 22.00)