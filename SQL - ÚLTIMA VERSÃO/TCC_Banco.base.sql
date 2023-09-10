drop database hot_rolls_club
use master

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'hot_rolls_club')
    DROP DATABASE hot_rolls_club
go
CREATE DATABASE hot_rolls_club
go
USE hot_rolls_club
go
-- Criação da tabela Cliente
CREATE TABLE Cliente (
  cpf VARCHAR(11) NOT NULL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  data_nascimento DATE,
  sexo CHAR(1),
  senha VARCHAR(MAX) NOT NULL,
  img_cliente VARBINARY(MAX)
);
go
-- Criação da tabela Funcionario
CREATE TABLE Funcionario (
  id_funcionario INT IDENTITY NOT NULL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  turno VARCHAR(30) NOT NULL,
  salario DECIMAL(10, 2) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  CEP VARCHAR(10) NOT NULL,
  cpf VARCHAR(11) NOT NULL UNIQUE,
  data_nascimento DATE NOT NULL,
  sexo CHAR(1) NOT NULL,
  senha VARCHAR(8) NOT NULL,
  data_contratacao DATE NOT NULL
);
go
-- Criação da tabela Mesa
CREATE TABLE Mesa (
numero_mesa INT PRIMARY KEY,
status_mesa VARCHAR(15) not null default 'Disponível',
capacidade_mesa INT NOT NULL
);
go
-- Criação da tabela Pedido
CREATE TABLE Pedido (
  id_pedido INT IDENTITY NOT NULL PRIMARY KEY,
  cpf VARCHAR(11) NULL,
  id_funcionario INT NULL,
  data_pedido DATETIME NOT NULL,
  valor_total DECIMAL(10, 2) NOT NULL,
  formapagamento VARCHAR(100) NOT NULL,
  numero_mesa INT NOT NULL,
  FOREIGN KEY (cpf) REFERENCES Cliente (cpf),
  FOREIGN KEY (id_funcionario) REFERENCES Funcionario (id_funcionario),
  FOREIGN KEY (numero_mesa) REFERENCES Mesa (numero_mesa)
);
go
-- Criação da tabela StatusPedido
CREATE TABLE StatusPedido (
id_pedido INT NOT NULL,
id_funcionario INT,
status_pedido VARCHAR(50) NOT NULL default 'Em Preparo',
PRIMARY KEY (id_pedido),
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);
go
-- Criação da tabela CategoriaProduto
CREATE TABLE CategoriaProduto (
  id_categoriaprod INT IDENTITY NOT NULL PRIMARY KEY,
  nome_categoria VARCHAR(50) NOT NULL,
  descricao VARCHAR(200)
);
go
-- Criação da tabela Produtos
CREATE TABLE Produtos (
  id_produto INT IDENTITY NOT NULL PRIMARY KEY,
  nome_produto VARCHAR(50) NOT NULL,
  descricao VARCHAR(200) NOT NULL,
  id_categoriaprod INT NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  unidade_medida VARCHAR(10) NOT NULL,
  img_prato VARBINARY(MAX)
  FOREIGN KEY (id_categoriaprod) REFERENCES CategoriaProduto (id_categoriaprod)
);
go
-- Criação da tabela Fornecedor
CREATE TABLE Fornecedor (
  id_fornecedor INT IDENTITY NOT NULL PRIMARY KEY,
  nome_fornecedor VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  endereco VARCHAR(100) NOT NULL
);
go
-- Criação da tabela Insumos
CREATE TABLE Insumos (
  id_insumo INT IDENTITY NOT NULL PRIMARY KEY,
  nome_insumo VARCHAR(50) NOT NULL,
  descricao VARCHAR(200) NOT NULL,
  id_fornecedor INT NOT NULL,
  estoque NUMERIC(10,2) NOT NULL,
  unidade_medida VARCHAR(20),
  data_entrada DATE NOT NULL,
  data_validade DATE NOT NULL,
  FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);
go
-- Criação da tabela InsumosProduto
CREATE TABLE InsumosProduto (
  id_produto INT NOT NULL,
  id_insumo INT NOT NULL,
  quantidade_insumo NUMERIC(10,2) NOT NULL,
  unidade_medida VARCHAR(20),
  PRIMARY KEY (id_produto, id_insumo),
  FOREIGN KEY (id_produto) REFERENCES Produtos (id_produto),
  FOREIGN KEY (id_insumo) REFERENCES Insumos (id_insumo)
);
go
-- Criação da tabela Reserva
CREATE TABLE Reserva (
   id_reserva INT IDENTITY PRIMARY KEY,
   cpf VARCHAR(11) NOT NULL,
   numero_mesa INT NOT NULL,  
   data_reserva DATETIME NOT NULL,
   FOREIGN KEY (cpf) REFERENCES Cliente(cpf),
   FOREIGN KEY (numero_mesa) REFERENCES Mesa(numero_mesa)
);
go
-- Criação da tabela Avaliação
CREATE TABLE Avaliacao (
   id_avaliacao INT IDENTITY PRIMARY KEY,
   cpf VARCHAR(11) NOT NULL,
   id_produto INT NOT NULL,
   estrelas INT NOT NULL,
   comentario_avaliacao VARCHAR(255),
   data_avaliacao DATETIME NOT NULL,
   FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
   FOREIGN KEY (cpf) REFERENCES Cliente(cpf)
);
go
-- Criação da tabela DetalhesPedido
CREATE TABLE DetalhesPedido (
   id_pedido INT NOT NULL,
   id_produto INT NOT NULL,
   valor_unitario Decimal(10,2) NOT NULL,
   quantidade_produto INT NOT NULL,
   observacoes VARCHAR(100),
   PRIMARY KEY (id_pedido, id_produto),
   FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
   FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
CREATE TABLE Favorito(
cpf VARCHAR(11) NOT NULL,
id_produto INT NOT NULL,
PRIMARY KEY (id_produto),
FOREIGN KEY (cpf) REFERENCES Cliente(cpf),
FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
go
	CREATE  TYPE dbo.ProdutosType AS TABLE
(
    id_produto INT,
    quantidade_produto INT,
    observacoes VARCHAR(100)
)
go
---------------------------CLIENTES---------------------------------------------------------------------------------------------------------------
INSERT INTO Cliente (cpf, nome, telefone, email, data_nascimento, sexo, senha)
VALUES ('12345678900', 'Maria da Silva', '(11) 99999-9999', 'maria.silva@gmail.com', '1990-01-01', 'F', '12345678');
go
---------------------------FUNCIONARIOS-------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('João Souza', '(11) 98888-8888', 'joao.souza@gmail.com', 'Atendente', 'Noturno', 2000.00, 'Rua A, 123', '01000-000', '11122233344', '1995-05-10', 'M', '12345678', '2022-01-01');
go
-----------------------------MESAS-----------------------------------------------------------------------------------------
INSERT INTO Mesa (numero_mesa, capacidade_mesa) VALUES 
(1, 4),(2, 6),(3, 2),(4, 8),(5, 4),(6, 2),
(7, 6),(8, 4),(9, 2),(10, 6),(11, 4),(12, 2),
(13, 8),(14, 4),(15, 2),(16, 6),(17, 4),(18, 2)
go
--------------------------FORNECEDORES--------------------------------------------------------------------------------------
INSERT INTO Fornecedor (nome_fornecedor, telefone, email, endereco)
VALUES ('Fornecedor A', '(11) 1111-1111', 'fornecedora@teste.com', 'Rua A, 123');
go
INSERT INTO Fornecedor (nome_fornecedor, telefone, email, endereco)
VALUES ('Fornecedor B', '(22) 2222-2222', 'fornecedorb@teste.com', 'Rua B, 456');
go
-----------------------CATEGORIAS PRODUTOS----------------------------------------------------------------------------------
INSERT INTO CategoriaProduto (nome_categoria, descricao)
VALUES
('Sushi', 'Pequenos rolos de arroz com recheios variados, envolvidos em algas marinhas'),
('Sashimi', 'Fatias finas de peixe ou frutos do mar crus, servidos com molhos especiais'),
('Tempurá', 'Pedacinhos de legumes, frutos do mar ou carne empanados e fritos'),
('Yakissoba', 'Macarrão frito com legumes, carne e molho especial'),
('Temaki', 'Cone de alga recheado com arroz, peixe e vegetais.'),
('Nigiri', 'Bolinhas de arroz com um pedaço de peixe, fruto do mar ou ovo em cima.'),
('Robata', 'Espetinhos de carne, frutos do mar ou legumes grelhados em carvão vegetal'),
('Bebidas', 'Acompanhamento')
-------------------------------Produtos---------------------------------------------------------------------------------------
--1
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida)
VALUES ('Hot Roll', 'Sushi roll recheado com salmão, cream cheese, pepino', 1, 12.99, '8 unidades');
go
--2
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida)
VALUES ('Temaki', 'Enrolado de alga recheado com arroz, peixe, legumes e molho especial', 5, 21.99, 'unidade');
go
--3
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida)
VALUES ('Robata', 'Espetinho grelhado com diversos tipos de carnes e legumes', 7, 14.99, 'unidade');
go
--4
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida)
VALUES ('Yakisoba Tradicional', 'Macarrão frito com legumes, carne ou frango e molho especial', 2, 24.99, 'unidade');
-- Inserir bebida 1
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Cerveja', 'Cerveja gelada de marca famosa', 8, 5.99, 'Unidade', NULL);

-- Inserir bebida 2
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Refrigerante', 'Refrigerante de cola', 8, 5.99, 'Unidade', NULL);

-- Inserir bebida 3
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Água Mineral', 'Água mineral sem gás', 8, 2.49, 'Unidade', NULL);
-------------------------------Insumos----------------------------------------------------------------------------------------
--1
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Arroz', 'Arroz japonês', 1, 100000, 'gramas', '2023-02-01', '2023-06-30');
go
--2
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Alga Nori', 'Alga seca para enrolar o sushi', 2, 5000, 'folhas', '2023-02-01', '2023-12-31');
go
--3
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Salmão', 'Salmão fresco para sushi', 2, 50000, 'gramas', '2023-02-01', '2023-06-15');
go
--4
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Pepino', 'Pepino fresco para sushi', 1, 50000, 'unidade', '2023-02-01', '2023-06-20');
go
--5
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Cenoura', 'Cenoura fresca para sushi', 2, 50000, 'unidade', '2023-02-01', '2023-06-25');
go
--6
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Camarão', 'Camarão fresco para sushi', 1, 50000, 'gramas', '2023-02-01', '2023-06-22');
go
--7
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Macarrão', 'Macarrão para yakisoba', 1, 50000, 'gramas', '2023-02-01', '2023-06-30');
go
--8
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Carne de Porco', 'Carne de porco para yakisoba', 2, 30000, 'gramas', GETDATE(), '2023-06-15');
go
--9 
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Repolho', 'Repolho picado para yakisoba', 2, 20000, 'gramas', '2023-02-01', '2023-06-20');
go
--10
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Brócolis', 'Brócolis para yakisoba', 1, 10000, 'unidade', '2023-02-01', '2023-06-22');
go
--11
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Frango', 'Pedacinhos de frango para robata', 2, 30000, 'gramas', GETDATE(), '2023-06-15');
go
--12
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Carne', 'Pedacinhos de carne bovina para robata', 1, 30000, 'gramas', GETDATE(), '2023-06-15');
go
--13
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Palitos de Bambu', 'Palitos de bambu para espetinhos', 2, 50000, 'unidades', GETDATE(), '2023-12-31');
go
--14
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Cebola', 'Cebola', 1, 50000, 'unidade', GETDATE(), '2023-06-25');
go
--15
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Pimentão', 'Pimentão cortado', 1, 10000, 'unidade', GETDATE(), '2023-06-18');
go
--16
INSERT INTO Insumos (nome_insumo, descricao, id_fornecedor, estoque, unidade_medida, data_entrada, data_validade)
VALUES ('Cream Cheese', 'Cream cheese', 2, 50000, 'gramas', GETDATE(), '2023-12-31');


-- Inserir prato de Sushi
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Sushi Misto', 'Variedade de sushis com salmão, atum e camarão', 1, 29.99, 'Porção', NULL);

-- Associar insumos ao prato de Sushi
-- Arroz
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (8, 1, 300, 'gramas');

-- Alga Nori
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (8, 2, 3, 'folhas');

-- Salmão
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (8, 3, 200, 'gramas');

-- Pepino
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (8, 4, 50, 'unidade');

-- Inserir prato de Yakisoba
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Yakisoba de Frango', 'Macarrão frito com pedaços de frango e legumes', 4, 15.99, 'Porção', NULL);

-- Associar insumos ao prato de Yakisoba
-- Macarrão
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (9, 7, 200, 'gramas');

-- Carne de Porco
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (9, 8, 100, 'gramas');

-- Repolho
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (9, 9, 50, 'gramas');

-- Brócolis
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (9, 10, 20, 'unidade');


-- Inserir prato de Sashimi
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Sashimi de Salmão', 'Salmão fresco cortado em fatias finas', 2, 24.99, 'Porção', NULL);

-- Associar insumos ao prato de Sashimi
-- Salmão
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (10, 3, 150, 'gramas');

-- Inserir prato de Tempurá
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Tempurá de Camarão', 'Camarões empanados e fritos', 3, 18.99, 'Porção', NULL);

-- Associar insumos ao prato de Tempurá
-- Camarão
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (11, 6, 100, 'gramas');

-- Inserir prato de Robata
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Robata de Frango', 'Espetinhos de frango grelhados', 7, 12.99, 'Porção', NULL);

-- Associar insumos ao prato de Robata
-- Frango
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (12, 11, 150, 'gramas');

-- Inserir prato de Teriyaki
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Frango Teriyaki', 'Frango grelhado com molho teriyaki', 4, 14.99, 'Porção', NULL);

-- Associar insumos ao prato de Teriyaki
-- Frango
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (13, 11, 100, 'gramas');

-- Inserir prato de Nigiri Sushi
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Nigiri Sushi de Salmão', 'Salmão fresco sobre arroz temperado', 6, 6.99, 'Unidade', NULL);

-- Associar insumos ao prato de Nigiri Sushi
-- Salmão
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (14, 3, 15, 'gramas');

-- Arroz
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (14, 1, 50, 'gramas');

-- Inserir prato de Temaki
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Temaki de Atum', 'Atum fresco, arroz e outros ingredientes enrolados em alga', 5, 9.99, 'Unidade', NULL);

-- Associar insumos ao prato de Temaki
-- Atum
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (15, 3, 20, 'gramas');

-- Alga Nori
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (15, 2, 1, 'folhas');

-- Arroz
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (15, 1, 50, 'gramas');

-- Inserir prato de Yakisoba
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Yakisoba de Legumes', 'Macarrão frito com legumes e molho especial', 4, 18.99, 'Porção', NULL);

-- Associar insumos ao prato de Yakisoba
-- Macarrão
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (16, 7, 200, 'gramas');

-- Repolho
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (16, 9, 100, 'gramas');

-- Cenoura
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (16, 5, 50, 'gramas');

-- Inserir prato de Gyoza
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Gyoza', 'Pastéis recheados com carne e legumes', 1, 8.99, 'Porção', NULL);

-- Associar insumos ao prato de Gyoza
-- Carne de Porco
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (17, 8, 100, 'gramas');

-- Repolho
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES (17, 9, 50, 'gramas');


-----------------------------------------Insumos Produtos------------------------------------------------------------------
-------FAZER HOT ROLL---------
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES
    -- Arroz para Sushi
    (1, 1, 50, 'gramas'),
    -- Nori (Alga Marinha)
    (1, 2, 1, 'folha'),
    -- Salmão
    (1, 3, 50, 'gramas'),
    -- Cream Cheese
    (1, 16, 20, 'gramas'),
    -- Pepino
    (1, 4, 1, 'unidade')
go
-------FAZER YAKISOBA------------
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES
    -- Insumo: Macarrão para Yakisoba
    (4, 7, 150, 'gramas'),
    -- Insumo: Carne (ex: Carne Bovina)
    (4, 12, 100, 'gramas'),
    -- Insumo: Cebola
    (4, 14, 1, 'unidade'),
    -- Insumo: Pimentão
    (4, 15, 1, 'unidade'),
    -- Insumo: Repolho
    (4, 9, 100, 'gramas'),
    -- Insumo: Cenoura
    (4, 5, 1, 'unidade')
go
------FAZER ROBATA---------------
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES
    -- Insumo: Frango
    (3, 11, 100, 'gramas'),
    -- Insumo: Carne 
    (3, 12, 100, 'gramas'),
    -- Insumo: Legumes (Cebola, Pimentão)
    (3, 15, 1, 'unidade'),
    (3, 14, 1, 'unidade'),
    -- Insumo: Palitos de Bambu
    (3, 13, 1, 'unidades');
go
----FAZER TEMAKI------------
INSERT INTO InsumosProduto (id_produto, id_insumo, quantidade_insumo, unidade_medida)
VALUES
    -- Insumo: Alga Nori
    (2, 2, 1, 'folha'),
    -- Insumo: Arroz para Sushi
    (2, 1, 80, 'gramas'),
    -- Insumo: Peixe (ex: Salmão)
    (2, 3, 80, 'gramas'),
    -- Insumo: Cream Cheese
    (2, 16, 20, 'gramas'),
    -- Insumo: Pepino
    (2, 4, 2, 'unidade')
-----------------------------FAVORITOS-----------------------------------------------------------------------------------------------
INSERT INTO Favorito (cpf, id_produto) VALUES ('12345678900', 1);
INSERT INTO Favorito (cpf, id_produto) VALUES ('12345678900', 2);
INSERT INTO Favorito (cpf, id_produto) VALUES ('12345678900', 3);
---------------------------------------------------------------------------------------------------------------------------
drop procedure usp_loginFunc

CREATE PROCEDURE usp_loginFunc
    @email varchar(100),
    @senha varchar(8)
AS
BEGIN
    IF CHARINDEX('@', @email) > 1 AND CHARINDEX('.', @email) > 1 AND
       @email LIKE '%_@__%.__%' AND (LEN(@senha) = 8)
    BEGIN
        IF (SELECT COUNT(*) FROM Funcionario WHERE email = @email AND senha = @senha) = 1
            SELECT 'Login aceito'
        ELSE
            SELECT 'Login recusado'
    END
    ELSE
    BEGIN
        SELECT 'Email ou senha invalidos'
    END
END

exec usp_loginFunc "joao", 12345678
exec usp_loginFunc "joao.souza@gmail.com", 12345678
--------------------------------------------------------------------------------------------------
drop procedure usp_loginCliente

CREATE PROCEDURE usp_loginCliente
    @email varchar(100),
    @senha varchar(MAX)
AS
BEGIN
    IF CHARINDEX('@', @email) > 1 AND CHARINDEX('.', @email) > 1 AND
       @email LIKE '%_@__%.__%' AND (LEN(@senha) >= 8)
    BEGIN
        IF (SELECT COUNT(*) FROM Cliente WHERE email = @email AND senha = @senha) = 1
            SELECT 'Login aceito'
        ELSE
            SELECT 'Login recusado'
    END
    ELSE
    BEGIN
        SELECT 'Email ou senha inválidos'
    END
END

exec usp_loginCliente 'Fulano@gmail.com', '23456474'

---------------------------------------------------------------------------------------------------
drop procedure usp_cadastrarCliente

CREATE PROCEDURE usp_cadastrarCliente
    @cpf VARCHAR(11),
    @nome VARCHAR(50),
    @telefone VARCHAR(20),
    @email VARCHAR(50),
	@senha VARCHAR(MAX)
AS
BEGIN
    IF CHARINDEX('@', @email) > 1 AND CHARINDEX('.', @email) > 1 AND
       @email LIKE '%_@__%.__%' AND (LEN(@senha) >= 8)
	BEGIN
       IF NOT EXISTS (SELECT * FROM Cliente WHERE cpf = @cpf OR email = @email)
          INSERT INTO Cliente (cpf, nome, telefone, email, senha)
        VALUES (@cpf, @nome, @telefone, @email, @senha)
	 ELSE
	   SELECT 'O CPF ou EMAIL já cadastrado, não é possivel realizar o cadastro'
	  END
	ELSE
	 BEGIN
	  SELECT 'Informe um Email ou uma senha válida'
     END
END

EXEC usp_cadastrarCliente '12345678901', 'Fulano de Tal', '(11) 1234-5678', 'Fulano@gmail.com', '23456474'
EXEC usp_cadastrarCliente '12345678901', 'Fulano de Tal', '(11) 1234-5678', 'maria.silva@gmail.com', '3456'

---------------------------------------------------------------------------------------------------
drop procedure usp_fazer_reserva

CREATE PROCEDURE usp_fazer_reserva
    @cpf VARCHAR(11),
    @numero_mesa INT,
    @data_reserva DATETIME
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Cliente WHERE cpf = @cpf)
    BEGIN
        IF EXISTS (SELECT 1 FROM Mesa WHERE numero_mesa = @numero_mesa AND status_mesa = 'Disponível')
        BEGIN
            -- Verificar se já existe uma reserva para a mesma mesa e data
            DECLARE @reserva_existente INT;
            SELECT @reserva_existente = COUNT(*)
            FROM Reserva
            WHERE numero_mesa = @numero_mesa
            AND data_reserva = @data_reserva;

            IF @reserva_existente = 0
            BEGIN
                -- Verificar se há uma reserva existente com pelo menos 2 horas de diferença
                DECLARE @diferenca_horas INT;
                SELECT TOP 1 @diferenca_horas = DATEDIFF(HOUR, data_reserva, @data_reserva)
                FROM Reserva
                WHERE numero_mesa = @numero_mesa
                ORDER BY data_reserva DESC;

                IF @diferenca_horas IS NULL OR @diferenca_horas >= 2
                BEGIN
                    INSERT INTO Reserva (cpf, numero_mesa, data_reserva)
                    VALUES (@cpf, @numero_mesa, @data_reserva);

                    -- Atualizar o status da mesa para 'Reservado'
                    UPDATE Mesa
                    SET status_mesa = 'Reservado'
                    WHERE numero_mesa = @numero_mesa;

                    SELECT 'Reserva realizada com sucesso!';
                END
                ELSE
                BEGIN
                    SELECT 'Já existe uma reserva para esta mesa com menos de 2 horas de diferença.';
                END
            END
            ELSE
            BEGIN
                SELECT 'Já existe uma reserva para esta mesa na mesma data e hora.';
            END
        END
        ELSE
        BEGIN
            SELECT 'A mesa selecionada não está disponível.';
        END
    END
    ELSE
    BEGIN
        SELECT 'CPF não cadastrado ou incorreto.';
    END
END;

exec usp_fazer_reserva '12345678900', 2, '1900-01-01 10:00'
-------------------------------------------------------------------------------------------------------------
drop procedure usp_cancelar_reserva

CREATE PROCEDURE usp_cancelar_reserva
    @cpf VARCHAR(11),
	@numero_mesa INT,
    @data_reserva DATETIME
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Reserva WHERE cpf = @cpf AND numero_mesa = @numero_mesa AND data_reserva = @data_reserva)
    BEGIN
        DELETE FROM Reserva
        WHERE numero_mesa = @numero_mesa AND data_reserva = @data_reserva;

        UPDATE Mesa
        SET status_mesa = 'Disponível'
        WHERE numero_mesa = @numero_mesa;

        Select 'Reserva cancelada!';

    END
    ELSE
    BEGIN
        Select 'Não foi possível cancelar a reserva. Verifique se os dados informados estão corretos.';
    END
END

exec usp_cancelar_reserva '12345678900', 2, '1900-01-01 10:00:00'
-------------------------------------------------------------------------------------------------------------
	CREATE PROCEDURE usp_InserirPedido
    @cpf VARCHAR(11),
    @data_pedido DATETIME,
    @formapagamento VARCHAR(100),
    @numero_mesa INT,
    @produtos AS dbo.ProdutosType READONLY
AS
BEGIN
    DECLARE @id_pedido INT;
    DECLARE @status_mesa VARCHAR(100);
    DECLARE @ultimo_pedido_cpf VARCHAR(11);

    -- Verificar o status da mesa
    SELECT @status_mesa = status_mesa
    FROM Mesa
    WHERE numero_mesa = @numero_mesa;

    -- Verificar se a mesa está ocupada
    IF @status_mesa = 'Ocupada'
    BEGIN
        -- Obter o CPF do último pedido da mesma mesa
        SELECT TOP 1 @ultimo_pedido_cpf = p.cpf
        FROM Pedido p
        WHERE p.numero_mesa = @numero_mesa
        ORDER BY p.data_pedido DESC;

        -- Verificar se o CPF é diferente do último pedido
        IF @cpf <> @ultimo_pedido_cpf
        BEGIN
            SELECT 'Não é permitido realizar um novo pedido com CPF diferente na mesma mesa.';
            RETURN;
        END
    END

    -- Verificar se a mesa está reservada para a mesma data ou hora do pedido
    IF @status_mesa = 'Reservada'
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM Reserva rm
            WHERE rm.numero_mesa = @numero_mesa
            AND (DATEPART(Day, rm.data_reserva) = DATEPART(DAY, @data_pedido)) AND DATEPART(HOUR, rm.data_reserva) = DATEPART(HOUR, @data_pedido))
        BEGIN
            SELECT 'Não é permitido realizar um pedido em uma mesa reservada para a mesma data ou hora.';
            RETURN;
        END
    END

    -- Iniciar uma transação para garantir a integridade dos dados
    BEGIN TRANSACTION;

    -- Inserir o pedido na tabela Pedido
    INSERT INTO Pedido (cpf, data_pedido, valor_total, formapagamento, numero_mesa)
    VALUES (@cpf, CONVERT(DATETIME, @data_pedido, 120), 1, @formapagamento, @numero_mesa);

    -- Obter o ID do pedido recém-inserido
    SET @id_pedido = SCOPE_IDENTITY();

    -- Inserir os detalhes do pedido na tabela DetalhesPedido
    INSERT INTO DetalhesPedido (id_pedido, id_produto, quantidade_produto, valor_unitario, observacoes)
SELECT @id_pedido, dp.id_produto, dp.quantidade_produto, p.preco, dp.observacoes
FROM @produtos dp
JOIN Produtos p ON dp.id_produto = p.id_produto;

    -- Atualizar o valor total do pedido
    UPDATE Pedido
    SET valor_total = (
        SELECT SUM(d.quantidade_produto * d.valor_unitario)
        FROM DetalhesPedido d
        WHERE d.id_pedido = @id_pedido
    )
    WHERE id_pedido = @id_pedido;

    -- Ocupar a mesa
    UPDATE Mesa
    SET status_mesa = 'Ocupada'
    WHERE numero_mesa = @numero_mesa;

    -- Inserir o status do pedido na tabela StatusPedido
    INSERT INTO StatusPedido (id_pedido)
    VALUES (@id_pedido);

    
    -- Subtrair os insumos do estoque com base nos produtos do pedido
UPDATE Insumos
SET estoque = estoque - (
    SELECT SUM(dp.quantidade_produto * ip.quantidade_insumo)
    FROM @produtos dp
    JOIN InsumosProduto ip ON dp.id_produto = ip.id_produto
    WHERE ip.id_insumo = Insumos.id_insumo
)
WHERE id_insumo IN (
    SELECT ip.id_insumo
    FROM @produtos dp
    JOIN InsumosProduto ip ON dp.id_produto = ip.id_produto
);
    -- Commit da transação, confirmando as mudanças no banco de dados
    COMMIT TRANSACTION;
END;

-----------------------------------------------------------------------

--executar a procedure acima
DECLARE @produtos dbo.ProdutosType;

INSERT INTO @produtos (id_produto, quantidade_produto, observacoes)
VALUES
    (4, 1,'Sem cebola'),
    (2, 1,'Com molho extra'),
    (1, 1,'Com queijo'), 
	(3, 1,'Com queijo'),
	(5, 1,'')
	
EXEC usp_InserirPedido
    @cpf = '12345678900',
    @data_pedido = '2023-05-19T12:34:56',
    @formapagamento = 'Cartão de crédito',
    @numero_mesa = 4,
    @produtos = @produtos

drop procedure usp_InserirPedido
---------------------------------------------------------------------------------------------------------
CREATE PROCEDURE usp_InserirPedidoFunc
   @id_funcionario INT,
    @data_pedido DATETIME,
    @formapagamento VARCHAR(100),
    @numero_mesa INT,
    @produtos AS dbo.ProdutosType READONLY
AS
BEGIN
    DECLARE @id_pedido INT;

    -- Iniciar uma transação para garantir a integridade dos dados
    BEGIN TRANSACTION;

    -- Inserir o pedido na tabela Pedido
    INSERT INTO Pedido (id_funcionario, data_pedido, valor_total, formapagamento, numero_mesa)
    VALUES (@id_funcionario, CONVERT(DATETIME, @data_pedido, 120), 0.0, @formapagamento, @numero_mesa);

    -- Obter o ID do pedido recém-inserido
    SET @id_pedido = SCOPE_IDENTITY();

    -- Inserir os detalhes do pedido na tabela DetalhesPedido
    INSERT INTO DetalhesPedido (id_pedido, id_produto, quantidade_produto, valor_unitario, observacoes)
    SELECT @id_pedido, dp.id_produto, dp.quantidade_produto, p.preco, dp.observacoes
    FROM @produtos dp
    JOIN Produtos p ON dp.id_produto = p.id_produto;

    -- Atualizar o valor total do pedido
    UPDATE Pedido
    SET valor_total = (
        SELECT SUM(d.quantidade_produto * d.valor_unitario)
        FROM DetalhesPedido d
        WHERE d.id_pedido = @id_pedido
    )
    WHERE id_pedido = @id_pedido;

    -- Ocupar a mesa
    UPDATE Mesa
    SET status_mesa = 'Ocupada'
    WHERE numero_mesa = @numero_mesa;

    -- Inserir o status do pedido na tabela StatusPedido
    INSERT INTO StatusPedido (id_pedido)
    VALUES (@id_pedido);

    -- Subtrair os insumos do estoque com base nos produtos do pedido
    UPDATE Insumos
    SET estoque = estoque - (
        SELECT SUM(dp.quantidade_produto * ip.quantidade_insumo)
        FROM @produtos dp
        JOIN InsumosProduto ip ON dp.id_produto = ip.id_produto
        WHERE ip.id_insumo = Insumos.id_insumo
    )
    WHERE id_insumo IN (
        SELECT ip.id_insumo
        FROM @produtos dp
        JOIN InsumosProduto ip ON dp.id_produto = ip.id_produto
    );

    -- Commit da transação, confirmando as mudanças no banco de dados
    COMMIT TRANSACTION;
END;
-----------------------------------------------------------------------

--executar a procedure acima
DECLARE @produtos dbo.ProdutosType;

INSERT INTO @produtos (id_produto, quantidade_produto, observacoes)
VALUES
    (4, 1,'Sem cebola'),
    (2, 1,'Com molho extra'),
    (1, 1,'Com queijo'), 
	(3, 1,'Com queijo'),
	(5, 1,'')
	
EXEC usp_InserirPedidoFunc
    @id_funcionario = 1,
    @data_pedido = '2023-05-19T12:34:56',
    @formapagamento = 'Cartão de crédito',
    @numero_mesa = 4,
    @produtos = @produtos

drop procedure usp_InserirPedido
---------------------------------------------------------------------------------------------------------------	
	DELETE FROM Pedido WHERE id_pedido = 12

/*
select * from Pedido
select * from DetalhesPedido
select * from InsumosProduto
select * from Insumos
select * from Cliente
select * from Funcionario
select * from StatusPedido
select * from Mesa
select * from Fornecedor
select * from Avaliacao
select * from Reserva
select * from CategoriaProduto
select * from Produtos
select * from Favorito
*/

/*
SELECT pe.id_pedido, pe.numero_mesa, p.nome_produto, dp.quantidade_produto 
                       FROM Pedido pe 
                       INNER JOIN DetalhesPedido dp ON pe.id_pedido = dp.id_pedido
                       INNER JOIN Produtos p ON p.id_produto = dp.id_produto
                       INNER JOIN StatusPedido sp ON pe.id_pedido = sp.id_pedido
                       WHERE sp.status_pedido = 'Em Preparo' 
                       ORDER BY pe.id_pedido ASC

					   UPDATE StatusPedido SET status_pedido = 'Pronto' WHERE id_pedido = 1

					   UPDATE Mesa SET status_mesa = 'Disponível' WHERE numero_mesa = 4

					   insert into Produtos (img_prato)

					   UPDATE Produtos SET img_prato = NULL WHERE nome_produto = 'Hot Roll'


SELECT
    p.id_pedido,pr.img_prato,
    pr.nome_produto,
    dp.quantidade_produto,
    CONVERT(VARCHAR(5), p.data_pedido, 108) AS hora_pedido,
    sp.status_pedido
FROM Pedido p
JOIN DetalhesPedido dp ON p.id_pedido = dp.id_pedido
JOIN Produtos pr ON dp.id_produto = pr.id_produto
JOIN StatusPedido sp ON p.id_pedido = sp.id_pedido
WHERE p.id_pedido = (SELECT MAX(id_pedido) FROM Pedido WHERE numero_mesa = 4)
ORDER BY dp.id_pedido, dp.id_produto;

SELECT TOP 1
    c.nome
FROM Pedido p
JOIN DetalhesPedido dp ON p.id_pedido = dp.id_pedido
JOIN Produtos pr ON dp.id_produto = pr.id_produto
JOIN StatusPedido sp ON p.id_pedido = sp.id_pedido
JOIN Cliente c ON p.cpf = c.cpf
WHERE p.id_pedido = (SELECT MAX(id_pedido) FROM Pedido WHERE numero_mesa = 4)
ORDER BY dp.id_pedido, dp.id_produto;


SELECT pe.id_pedido, pe.cpf, pe.valor_total, CONVERT(VARCHAR, pe.data_pedido, 103) as data FROM Pedido pe 
WHERE pe.numero_mesa = (SELECT numero_mesa FROM Mesa Where numero_mesa = 4)


SELECT 
    p.id_pedido,
    c.cpf,
    p.valor_total,
    CONVERT(varchar, p.data_pedido, 103) as data_pedido,
    COUNT(dp.id_produto) as quantidade_produtos
FROM Pedido p
JOIN Cliente c ON p.cpf = c.cpf
LEFT JOIN DetalhesPedido dp ON p.id_pedido = dp.id_pedido
WHERE p.numero_mesa = 4
GROUP BY 
    p.id_pedido,
    c.cpf,
    p.valor_total,
    p.data_pedido;*/
