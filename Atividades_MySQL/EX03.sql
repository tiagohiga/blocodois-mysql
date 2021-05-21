CREATE DATABASE db_alunes;
USE db_alunes;

CREATE TABLE tb_alunes(
	id_alunes INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    matricula VARCHAR(255),
    sala VARCHAR(255),
    media FLOAT DEFAULT 0.0,
    data_nascimento DATE,
    
    PRIMARY KEY(id_alunes)
);

INSERT INTO tb_alunes(nome, matricula, sala, media, data_nascimento) 
VALUES
('Valentina Souza', '20058597', '209A', 9.7, '2000-05-08'),
('Ricardo Willis', '20067845', '301F', 6.75, '2001-12-30'),
('Ana Carolina Vieira', '20046527', '101D', 8.0, '1999-01-25'),
('Jennifer Lima', '20041257', '101D', 5.5, '2000-06-07'),
('Luccas Ferreira', '20063144', '325E', 7.0, '1997-11-12'),
('Enzo Rochas', '20030075', '012A', 4.5, '1998-07-22'),
('Martha Basttos', '20053211', '112D', 10.0, '1999-10-24'),
('Ana Maria', '20031125', '119A', 8.75, '2002-04-01');

SELECT nome, media
FROM tb_alunes
WHERE media > 7.0
ORDER BY nome DESC;

SELECT nome, media
FROM tb_alunes
WHERE media < 7.0
ORDER BY media ASC;

UPDATE tb_alunes
SET sala = '220B'
WHERE id_alunes = 4;