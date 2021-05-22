CREATE DATABASE db_farmacia_do_bem;
USE db_farmacia_do_bem;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nome_categoria VARCHAR(255),
    descricao VARCHAR(255),
    estoque_total INT,
    
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_produto(
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome_produto VARCHAR(255),
    recomendacao VARCHAR(255),
    quantidade INT,
    precisa_receita BOOLEAN DEFAULT true,
    preco FLOAT,
    fk_categoria INT,
    
    PRIMARY KEY(id_produto),
    FOREIGN KEY(fk_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria(nome_categoria, descricao, estoque_total)
VALUES
('Medicamentos', 'Medicamentos diversos', 5038),
('Saúde', 'Cuidados com saúde', 2231),
('Beleza', 'Cuidado diário', 755),
('Genéricos', 'O remédio, no precinho', 1257),
('Promoções', 'No precinho mesmo', 317);

INSERT INTO tb_produto(nome_produto, recomendacao, quantidade, precisa_receita, preco, fk_categoria)
VALUES
('Vitamina C c/ 10 Comprimidos', 'Duas capsulas por dia', 32, 0, 52.99, 2),
('Sal de Fruta 2 Envelopes', '1 envelope para 250ml de água', 25, 0, 2.79, 5),
('Dipirona 500mg c/ 20 Comprimidos', '1 a 2 comprimidos até 4 vezes ao dia', 122, 0, 8.99, 4),
('Enalapril 20mg c/ 30 Comprimidos', 'Conforme bula', 109, 1, 9.99, 4),
('Creme Facial Bobby c/ 100g', 'Uso externo', 22, 0, 27.90, 3),
('Removedor de Esmalte c/ 100ml', 'Manter fora do alcance de crianças', 47, 0, 4.57, 3),
('Lexotan 3mg c/ 30 Comprimidos', 'Conforme receita médica', 37, 1, 84.70, 1),
('Amoxilina 500mg c/ 21 Cápsulas', 'Conforme receita médica', 26, 1, 9.73, 1);

SELECT nome_produto, preco, quantidade
FROM tb_produto
WHERE preco > 50.00;

SELECT nome_produto, preco, quantidade
FROM tb_produto
WHERE preco BETWEEN 3.00 AND 60.00;

SELECT nome_produto, recomendacao
FROM tb_produto
WHERE nome_produto LIKE '%b%';

SELECT *
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria;

SELECT nome_produto, nome_categoria, quantidade, estoque_total AS estoque, precisa_receita, preco
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE nome_categoria = 'Genéricos';