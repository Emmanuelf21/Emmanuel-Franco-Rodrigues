-- Database: saep_db

-- DROP DATABASE IF EXISTS saep_db;

CREATE DATABASE saep_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE login (
    id_login SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
	nome VARCHAR(100) NOT NULL,
);

CREATE TABLE produto (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco_unit DECIMAL(10,2) NOT NULL,
    quantidade NUMERIC NOT NULL,
    qtd_minima NUMERIC NOT NULL,
    qtd_maxima NUMERIC NOT NULL,
	tipo_produto VARCHAR(100) not null,
	tensao VARCHAR(50) NOT NULL,
	dimensoes NUMERIC NOT NULL,
	resolucao VARCHAR(100) NOT NULL,
	armazenamento VARCHAR(50),
	conectividade VARCHAR (100)
);

CREATE TABLE historico (
    id_historico SERIAL PRIMARY KEY,
    fk_produto INT NOT NULL REFERENCES produto(id_produto) ON DELETE CASCADE,
    tipo_movimentacao VARCHAR(100) NOT NULL,
    qtd_movimentada NUMERIC NOT NULL,
    custo_total DECIMAL(10,2) NOT NULL,
    fk_usuario INT NOT NULL REFERENCES login(id_login) ON DELETE CASCADE,
    data_movimentacao DATE NOT NULL
);

insert into login(email, senha, nome)
values('administrador1@teste.com', 'senai103@', 'Jorge'),
('administrador2@teste.com', 'senai103@', 'Cleber'),
('administrador3@teste.com', 'senai103@', 'Maria');

INSERT INTO produto (
    nome, preco_unit, quantidade, qtd_minima, qtd_maxima,
    tensao, dimensoes, resolucao, armazenamento, conectividade, tipo_produto
) VALUES
( 'Smartphone Galaxy S24', 4999.90, 60, 10, 100, 'Bivolt', 6.8, '3200x1440', '256GB', 'Wi-Fi, 5G, Bluetooth', 'smartphone'),
( 'Smart TV LG OLED 55', 6999.00, 23, 5, 40, '110/220v', 55, '3840x2160 (4K)', NULL, 'Wi-Fi, HDMI, Bluetooth', 'smart TV'),
( 'poco x7', 300.00, 3, 10, 30, '110/220v', 6.5, '1920x1080', '512GB', 'Wi-Fi, HDMI, Bluetooth', 'smartphone'),
( 'Notebook Dell XPS 13', 8999.00, 25, 5, 60, 'Bivolt', 13.3, '1920x1080', '512GB SSD', 'Wi-Fi, Bluetooth', 'notebook');


INSERT INTO historico (
     fk_produto, tipo_movimentacao, qtd_movimentada, custo_total, fk_usuario, data_movimentacao
) VALUES
( 1, 'entrada', 10, 49999.00, 1, '2025-11-06'),
( 2, 'saida', 5, 44995.00, 1, '2025-11-06'),
( 2, 'entrada', 3, 20997.00, 1, '2025-11-06');

