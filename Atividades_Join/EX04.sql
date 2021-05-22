CREATE DATABASE db_cidade_das_frutas;
USE db_cidade_das_frutas;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nome_categoria VARCHAR(255),
    estoque_total INT,
    tipo_estoque VARCHAR(255),
    
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_produto(
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    preco FLOAT,
    data_abastecimento DATE,
    fornecedor VARCHAR(255),
    fk_categoria INT,
    
    PRIMARY KEY(id_produto),
    FOREIGN KEY(fk_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria(nome_categoria, estoque_total, tipo_estoque)
VALUES
('Verduras', 200, 'un'),
('Legumes', 250, 'kg'),
('Frutas', 300, 'kg'),
('Grãos', 300, 'kg');

INSERT INTO tb_produto(nome, preco, data_abastecimento, fornecedor, fk_categoria)
VALUES
('Soja', 4.20, '2021-05-10', 'Dona Irma Grãos', 4),
('Maçã', 3.80, '2021-05-13', 'Irmãos Maçã', 3),
('Alface', 1.99, '2021-05-14', 'Horta do Dede', 1),
('Repolho', 4.99, '2021-05-14', 'Horta do Dede', 1),
('Batata-Doce', 3.99, '2021-05-10', 'Maria & Filhos', 2),
('Maracujá', 8.99, '2021-05-12', 'Empório das Frutas', 3),
('Abacaxi', 6.59, '2021-05-09', 'Empório das Frutas', 3);

SELECT nome, preco, data_abastecimento AS Abastecido, fornecedor
FROM tb_produto
WHERE preco > 5.00;

SELECT nome, preco
FROM tb_produto
WHERE preco BETWEEN 3.00 AND 6.00;

SELECT nome
FROM tb_produto
WHERE nome LIKE '%c%';

SELECT *
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria;

SELECT nome, preco, tipo_estoque, data_abastecimento
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE nome_categoria = 'Frutas';