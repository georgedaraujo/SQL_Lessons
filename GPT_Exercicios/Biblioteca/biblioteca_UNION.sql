USE biblioteca;

SELECT 
	nome AS TodosNomes
FROM clientes

UNION

SELECT 
	nome
FROM autores;