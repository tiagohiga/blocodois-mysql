CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    tipo_massa VARCHAR(255),
    doce_salgado VARCHAR(255),
    dieta VARCHAR(255),
    
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_pizza(
	id_pizza INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    preco FLOAT,
    tamanho INT,
    fk_categoria INT,
    
    PRIMARY KEY(id_pizza),
    FOREIGN KEY(fk_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria(tipo_massa, doce_salgado, dieta)
VALUES
('Nova-iorquina', 'Salgada', 'N/A'),
('Pan', 'Salgada', 'N/A'),
('Nova-iorquina', 'Doce', 'N/A'),
('Nova-iorquina', 'Salgada', 'Sem glúten'),
('Pan', 'Salgada', 'Vegana');

INSERT INTO tb_pizza(nome, descricao, preco, tamanho, fk_categoria)
VALUES
('Havaiana', 'Presunto picado, abacaxi, muçarela e azeitonas pretas', 69.99, 35, 4),
('Verdinha', 'Brócolis, pedaços de pimentão, alho frito e cebola roxa', 54.99, 35, 5),
('Calabresa', 'Calabresa fatiada com cebola', 44.99, 35, 1),
('Napolitana', 'Muçarela com rodelas de tomate e orégano', 44.99, 35, 4),
('Chocolate com Morango', 'Chocolate ao leite, raspas de chocolate com morangos', 65.99, 35, 3),
('Banana', 'Banana com canela', 25.99, 25, 3),
('Atum', 'Atum em pedaços com cebola em rodelas', 32.99, 25, 2);

SELECT nome, descricao, preco
FROM tb_pizza
WHERE preco > 45.00;

SELECT nome, descricao, preco
FROM tb_pizza
WHERE preco BETWEEN 29.00 AND 60.00;

SELECT nome, descricao, preco
FROM tb_pizza
WHERE nome OR descricao LIKE '%c%';

SELECT nome, descricao, preco, tipo_massa, dieta
FROM tb_pizza
INNER JOIN tb_categoria
ON tb_pizza.fk_categoria = tb_categoria.id_categoria
ORDER BY nome ASC;

SELECT nome, descricao, preco, tipo_massa, dieta
FROM tb_pizza
INNER JOIN tb_categoria
ON tb_pizza.fk_categoria = tb_categoria.id_categoria
WHERE doce_salgado = 'Doce';