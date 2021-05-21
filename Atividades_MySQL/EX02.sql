CREATE DATABASE db_ecommerce;
USE db_ecommerce;

CREATE TABLE tb_produtos(
	id_produto INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255),
	ean VARCHAR(255),
	quantidade INT,
	setor VARCHAR(255),
    preco FLOAT NOT NULL,
	data_entrada DATE,

	PRIMARY KEY(id_produto)
);

CREATE TABLE tb_clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    email VARCHAR(255),
    cpf VARCHAR(255),
    
    PRIMARY KEY(id_cliente)
);

CREATE TABLE tb_vendas(
	id_venda INT NOT NULL AUTO_INCREMENT,
    data_venda DATETIME,
    fk_produto INT,
    fk_cliente INT,
    
    PRIMARY KEY(id_venda),
    FOREIGN KEY(fk_produto) REFERENCES tb_produtos(id_produto),
    FOREIGN KEY(fk_cliente) REFERENCES tb_clientes(id_cliente)
);

INSERT INTO tb_produtos(nome, ean, quantidade, setor, preco, data_entrada) 
VALUES
('Camiseta Estampada', '7896518589124', 40, 'Vestuário', 35.99, '2021-05-01'),
('Camiseta Básica', '7896518587951', 30, 'Vestuário', 42.99, '2021-05-01'),
('Smartphone XRTJN', '7896518536584', 10, 'Telefonia', 2399.99, '2020-06-03'),
('Telefone com fio', '7896518532857', 3, 'Telefonia', 129.99, '2017-03-25'),
('Bota Cano Curto', '7896518578235', 15, 'Calçados', 159.90, '2021-03-22'),
('Bota Cortuno', '7896518568421', 10, 'Calçados', 539.90, '2021-04-01'),
('Bolsa Cross', '7896518536147', 4, 'Acessórios', 78.90, '2021-05-12');

INSERT INTO tb_clientes(nome, email, cpf) VALUES
('Maria Josefina', 'mariaj@email.com', '25485532110'),
('Eduardo Rochas', 'doubled@email.com', '44125876278'),
('Uri Kell', 'kads@email.com', '32475465211');

INSERT INTO tb_vendas(data_venda, fk_produto, fk_cliente) VALUES
('2021-05-01 04:05:32', 4, 3),
('2021-05-20 17:57:01', 1, 1),
('2021-05-20 17:58:15', 2, 1),
('2021-05-20 18:32:59', 6, 1),
('2021-05-19 13:32:01', 7, 2);

SELECT nome, ean, preco
FROM tb_produtos
WHERE preco > 500.0
ORDER BY setor;

SELECT nome, ean, preco
FROM tb_produtos
WHERE preco < 500.0
ORDER BY preco DESC;

SELECT * FROM tb_clientes;
SELECT * FROM tb_vendas;

UPDATE tb_produtos
SET quantidade = 2
WHERE id_produto = 4;