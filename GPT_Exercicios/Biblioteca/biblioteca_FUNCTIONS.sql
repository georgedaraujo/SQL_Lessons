-- SQL FUNCTIONS --
USE biblioteca;

SELECT * FROM autores;

SELECT 
	nome, 
	nacionalidade,
	CONCAT (LOWER(nome), ' ', nacionalidade) AS NovaColuna
	
FROM autores;

-- REPLACE --

SELECT
	'(11) 99178-2097' AS telefone,
	REPLACE ('(11) 99178-2097', '-', '') AS telefonelimpo


-- TRANSLATE --
/* o Translate permite mais caracteres na troca e pode ser usado 
em conjunto com o REPLACE. Abaixo, apaguei traços e parentese com
Translate e substitui o espaço vazio com REPLACE*/

SELECT
	'(11) 99178-2097' AS telefone,
	REPLACE(TRANSLATE ('(11) 99178-2097', '()-', '   '), ' ', '');

-- LEN (contar numero de caracteres) --
SELECT 
	editora,
	LEN(editora) AS tam_edit
FROM editoras;

-- Extraindo partes de strings --
/*LEFT and RIGHT (extrair certo numero de caracteres
a direita ou a esquerda) ou SUBSTRING  */

SELECT 
	nome,
	LEFT(nome, 3) tres_primeiros_ch
FROM autores;

SELECT 
	nome,
	RIGHT(nome, 3) tres_ultimos_ch
FROM autores;

SELECT
	nome,
	SUBSTRING(nome, 2, 6) ch_pelo_meio
	-- seleciona entre posição inicial e final fixa --
FROM autores;

SELECT
	nome,
	SUBSTRING(nome, 2, len(nome)) resto_nome
	-- seleciona entre posição inicial e final dinamica --
FROM autores;