# Requisitos funcionais

## Usuário
Requisito 001 - Login<br>
Usuário precisa conseguir logar no sistema, a partir de um usuário e senha


## Produto
Requisito 003 - Cadastro de produto<br>
O sistema deve permitir cadastrar os novos produtos adquiridos pela empresa.

Requisito 004 - Visualizar produto<br>
O sistema deve permitir visualizar todos os produtos que estiverem cadastrados, assim como a quantidade disponível em estoque.

Requisito 005
Gerenciar Produto<br>
O sistema deve permitir adicionar ou remover a quantidade de produtos cadastrados no estoque

Requisito 006 - Controle de Estoque (Mínimo)
O sistema deve permitir cadastrar uma quantidade mínima de produtos

Requisito 007 - Alerta de nível de estoque<br>
O sistema deve exibir um aviso para o usuário, informando quando o estoque do produto estiver chegando a um nível crítico, definido de acordo com o produto em questão

## Administrador
Requisito 008 - Histórico de movimentações<br>
O sistema deve permitir verificar o histórico de movimentações realizadas dentro do sistema, exibindo todas as transações realizadas (cadastro de produtos, adição de estoque, remoção de estoque).<br>
O histórico deve conter qual produto foi alterado, qual foi o usuário que fez a alteração, a data da alteração e a quantidade de produtos que foi alterada.

# Conectar ao banco criado antes de criar as tabelas:

Alterar as configurações do banco no 'app.py' de acordo com as suas configurações
```
# CONFIGURAÇÕS DO BANCO
DB_USER = 'postgres'
DB_PASS = 'senai103'
DB_HOST = 'localhost'
DB_NAME = 'saep_db'
DB_PORT = '5432'
```
## Relacionamento do banco de dados
<img width="579" height="365" alt="modelo bd" src="https://github.com/user-attachments/assets/7adf9a05-5d79-4162-a1c0-4c46714b154d" />

CREATE DATABASE saep_db;

-- Tabela de Login
```
CREATE TABLE login (
    id_login SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
	nome VARCHAR(100) NOT NULL
);
```

-- Tabela de Produto
```
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
```

-- Tabela de Histórico
```
CREATE TABLE historico (
    id_historico SERIAL PRIMARY KEY,
    fk_produto INT NOT NULL REFERENCES produto(id_produto) ON DELETE CASCADE,
    tipo_movimentacao VARCHAR(100) NOT NULL,
    qtd_movimentada NUMERIC NOT NULL,
    custo_total DECIMAL(10,2) NOT NULL,
    fk_usuario INT NOT NULL REFERENCES login(id_login) ON DELETE CASCADE,
    data_movimentacao DATE NOT NULL
);
```

## Inserindo os dados nas tabelas
```
insert into login(email, senha, nome)
values('administrador1@teste.com', 'senai103@', 'Jorge),
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
(1, 'entrada', 10, 49999.00, 1, '2025-11-06'),
(2, 'saida', 5, 44995.00, 1, '2025-11-06'),
(2, 'entrada', 3, 20997.00, 1, '2025-11-06');

```

# Criar pasta venv e instalar requisitos
Comandos do terminal para instalar os requisitos
```
npm install
npm install vite@v4
python -m venv venv
.\venv\Scripts\Activate
pip install -r requirements.txt
```

No terminal com a venv ativa, rodar o comando:
```
python app.py
```

Abrir outro terminal sem fechar o anterior e rodar o comando:
```
npm run dev
```

# Ferramentas utilizadas
- HTML, CSS, JavaScript e React (Front-ent)
- Python e Flask (Back-end)
- SQL e PostgreSQL (banco de dados)

#  Casos de teste
 - Teste manual com inserção de dados, edição e exclusão pelos formulários na aplicação
 - Teste manual do login de usuário
