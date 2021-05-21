CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classe(
	id_classe INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    afinidade VARCHAR(255),
    
    PRIMARY KEY(id_classe)
);

CREATE TABLE tb_personagem(
	id_personagem INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    atq INT,
    def INT,
    arc INT,
    agi INT,
    fe INT,
    fk_classe INT,
    
    PRIMARY KEY(id_personagem),
    FOREIGN KEY(fk_classe) REFERENCES tb_classe(id_classe)
);
-- Popule esta tabela classe com até 5 dados.
INSERT INTO tb_classe (nome, descricao, afinidade)
VALUES
('Bárbaro', 'Bate forte', 'Força'),
('Ladino', 'Bate sorrateiro', 'Agilidade'),
('Paladino', 'Bate e protege de maneira justa', 'Força e Fé'),
('Feiticeiro', 'Bate covardemente', 'Arcano'),
('Guerreiro', 'Defende a galera', 'Defesa');

-- Popule esta tabela personagem com até 8 dados.
INSERT INTO tb_personagem (nome, atq, def, arc, agi, fe, fk_classe)
VALUES
('STRONG', 1200, 3400, 400, 600, 700, 5),
('Uther', 2100, 1200, 300, 1000, 2500, 3),
('John McStabby', 1700, 900, 500, 2300, 100, 2),
('Strugaheim', 3400, 1200, 900, 1100, 0, 1),
('xX_Merlim_Xx', 0, 0, 6000, 1000, 0, 4),
('dArK_lEgOlAsss_', 1500, 800, 1000, 2000, 500, 2),
('Crasher Destroyer', 600, 700, 3500, 1200, 0, 4);

-- Faça um select que retorne os personagens 
-- com o poder de ataque maior do que 2000.
SELECT nome AS Nome, atq AS Ataque
FROM tb_personagem
WHERE atq > 2000;

-- Faça um select trazendo  os personagens 
-- com poder de defesa entre 1000 e 2000.
SELECT nome AS Nome, def AS Defesa
FROM tb_personagem
WHERE def BETWEEN 1000 AND 2000;

-- Faça um select  utilizando LIKE 
-- buscando os personagens com a letra C.
SELECT *
FROM tb_personagem
WHERE nome LIKE '%c%';

-- Faça um um select com Inner join entre  tabela classe e personagem.
SELECT * 
FROM tb_personagem
INNER JOIN tb_classe
ON tb_personagem.fk_classe = tb_classe.id_classe;

-- Faça um select onde traga todos os personagem de uma classe 
-- específica (exemplo todos os personagens que são arqueiros).
SELECT tb_personagem.nome AS Nome, 
	tb_classe.nome AS Classe, tb_classe.descricao AS Resumo
FROM tb_personagem
INNER JOIN tb_classe
ON tb_personagem.fk_classe = tb_classe.id_classe
WHERE tb_classe.id_classe = 4;
