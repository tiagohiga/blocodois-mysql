CREATE DATABASE db_construindo_a_nossa_vida;
USE db_construindo_a_nossa_vida;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nome_categoria VARCHAR(255),
    material VARCHAR(255),
    estoque_total INT,
    
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_produto(
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    preco FLOAT,
    quantidade_estoque INT,
    avaliacao FLOAT,
    disponivel_loja BOOLEAN,
    fk_categoria INT,
    
    PRIMARY KEY(id_produto),
    FOREIGN KEY(fk_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria(nome_categoria, material, estoque_total)
VALUES
('Areia a Granel', 'Areia Grossa', 500),
('Areia a Granel', 'Areia Fina', 389),
('Barreiras de Proteção', 'Poliestireno', 267),
('Barreiras de Proteção', 'Divisórias de Mesa', 174),
('Pré-Moldados', 'Fornos e Fogões de Concreto', 23);

INSERT INTO tb_produto(nome, preco, quantidade_estoque, avaliacao, disponivel_loja, fk_categoria)
VALUES
('Chapa Poliestireno 1000x1000x4mm Lisa', 23.90, 127, 4.5, 0, 3),
('Chapa Poliestireno 1000x1000x1,8mm Cristal', 45.90, 34, 4.7, 1, 3),
('Barreira Proteção 60x65cm RTB', 234.90, 27, 3.5, 1, 4),
('Barreira Proteção Supermercado', 179.90, 12, 4.9, 1, 4),
('Areia Grossa 5m³', 580.90, 250, 5.0, 1, 1),
('Areia Fina 5m³', 513.90, 314, 4.8, 1, 2),
('Forno de Concreto com Frente 80cm', 814.90, 6, 4.7, 1, 5),
('Fogão Lenha Concreto Estilo Cerâmica', 2399.90, 4, 4.6, 1, 5);

SELECT nome, preco, avaliacao, disponivel_loja
FROM tb_produto
WHERE preco > 50.0;

SELECT nome, preco, avaliacao, disponivel_loja
FROM tb_produto
WHERE preco BETWEEN 3.0 AND 60.0;

SELECT nome, preco, avaliacao, disponivel_loja
FROM tb_produto
WHERE nome LIKE '%c%';

SELECT *
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria;

SELECT nome, nome_categoria, preco, quantidade_estoque
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE id_categoria = 5;