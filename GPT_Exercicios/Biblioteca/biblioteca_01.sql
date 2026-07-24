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

CREATE TABLE clientes(
	id_cliente INT PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	email VARCHAR (150) UNIQUE,
	telefone VARCHAR (50),
	data_cadastro DATETIME DEFAULT GETDATE()
);

