CREATE DATABASE db_cursoDaMinhaVida;
USE db_cursoDaMinhaVida;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nome_categoria VARCHAR(255),
    descricao_categoria VARCHAR(255),
    area VARCHAR(255),
    
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_produto(
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    professor VARCHAR(255),
    turno VARCHAR(255),
    numero_aulas INT,
    preco FLOAT,
    fk_categoria INT,
    
    PRIMARY KEY(id_produto),
    FOREIGN KEY(fk_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria(nome_categoria, descricao_categoria, area)
VALUES
('Aprova Med 1957', 'Intensivão para garantir a aprovação', 'Biológicas'),
('Prepara Matemática', 'Agora com listas diárias de exercícios', 'Exatas'),
('Intensivo ENEM', 'Com aulas diárias', ' ');

INSERT INTO tb_produto(nome, professor, turno, numero_aulas, preco, fk_categoria)
VALUES
('Anatomia Básica', 'Marco Silva e Antônia', 'Vespertino', 30, 120.0, 1),
('Equações Lineares', 'Maria do Carmo Onório', 'Noturno', 12, 53.90, 2),
('Matemática Discreta', 'Adelaide Villa', 'Matutino', 24, 49.90, 2),
('Português com João Antônio', 'João Antônio Marques', 'Diurno', 36, 34.90, 3),
('Biologia', 'Dani Aguear', 'Diurno', 24, 24.90, 3),
('Física Básica', 'Juli Riveres', 'Diurno', 46, 129.90, 3);

SELECT nome, professor, turno, preco
FROM tb_produto
WHERE preco > 50.0;

SELECT nome, professor, turno, preco
FROM tb_produto
WHERE preco BETWEEN 3.0 AND 60.0;

SELECT nome, professor, turno, preco
FROM tb_produto
WHERE nome LIKE '%j%';

SELECT *
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria;

SELECT nome, nome_categoria, professor, turno
FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE id_categoria = 3;