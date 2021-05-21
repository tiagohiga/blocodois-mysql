CREATE DATABASE db_rh;
USE db_rh;

CREATE TABLE tb_funcionarios(
	id_funcionario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    data_nascimento DATE, 
    cargo VARCHAR(255),
    endereco VARCHAR(255),
    data_inicio DATE,
    salario FLOAT NOT NULL,
    
    PRIMARY KEY(id_funcionario)
);

insert into tb_funcionarios 
(nome, sobrenome, data_nascimento, cargo, endereco, data_inicio, salario) VALUES
('Mario', 'Frias', '1993-03-22', 'Operador de Loja', 'Rua Doze, nº 13', '2019-02-03', 1514.00),
('Renata', 'Silva', '1984-05-04', 'Caixa Líder', 'Avenida das Ruas, nº 1034', '2020-01-22', 2530.75),
('Enzo', 'Martins', '2000-12-18', 'Estoquista', 'Travessa São, S/N', '2020-11-14', 1380.00),
('Josealdo', 'Lins', '1983-01-12', 'Gerente', 'Rua do Tijolinho, nº 02', '1999-01-29', 5700.00);

SELECT nome, sobrenome, salario
FROM tb_funcionarios
WHERE salario > 2000.0;

SELECT nome, sobrenome, salario
FROM tb_funcionarios
WHERE salario < 2000.0
ORDER BY salario ASC;

UPDATE tb_funcionarios
SET cargo = 'Estoquista II'
WHERE id_funcionario = 3;



