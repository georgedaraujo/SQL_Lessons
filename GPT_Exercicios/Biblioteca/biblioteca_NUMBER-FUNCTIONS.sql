-- SQL NUMBER FUNCTIONS --

-- ROUND --
-- (arredondar: (valor, n de casas dec) )
SELECT 
	24.482915, 
	ROUND (24.482915, 2) AS arredondado;

SELECT 
	24.482915, 
	CEILING (24.482915) AS para_cima;
	--Arredonda numero para cima como inteiro --


-- ABS --
-- torna o valor absoluto, removendo qualquer negativo--
SELECT 
	-3.1415,
	ABS(-3.1415) AS absoluto;


-- RAND --
-- criar numero aleatorio entre 0 e 1 --
SELECT RAND();

-- gerando aleatíro entre 0 e 100 --
/*FLOOR arrendonda numero decimam para baixo,
-- ao contrario do CEILING */
SELECT FLOOR(RAND() *100);

/* A função RAND() retorna o mesmo valor se chamada repetidamente na mesma linha. 
Para garantir números diferentes em cada linha de uma consulta, 
use NEWID*/

SELECT 
	ABS(CHECKSUM(NEWID())) % 100 + 1; -- (Gera um número de 1 a 100)



-- POWER --
-- potencia (valor, potencia) --
SELECT POWER (3, 3);



-- SQRT --
-- raiz quadrada --
SELECT SQRT(81);

