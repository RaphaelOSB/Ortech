INSERT INTO Cliente (cpf, nome, telefone, email, data_nascimento, sexo, senha)
VALUES ('12345678900', 'Maria da Silva', '(11) 99999-9999', 'maria.silva@gmail.com', '1990-01-01', 'F', '12345678');
go
---------------------------FUNCIONARIOS-------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Admin', '(00) 00000-0000', 'admin@gmail.com', 'Administrador', 'Noturno', 2000.00, 'Rua A, 123', '01000-000', '00000000000', '1995-05-10', 'M', '12345678', '2023-01-01');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('João Souza', '(11) 98888-8888', 'joao.souza@gmail.com', 'Atendente', 'Noturno', 2000.00, 'Rua A, 123', '01000-000', '11122233344', '1995-05-10', 'M', '12345678', '2022-01-01');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Raphael', '(11) 98888-8888', 'rapha.rapha@gmail.com', 'Atendente', 'Noturno', 2000.00, 'Rua A, 123', '01000-000', '11122233345', '1995-05-10', 'M', '12345678', '2022-01-01');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Maria Silva', '(11) 97777-7777', 'maria.silva@gmail.com', 'Cozinheiro', 'Noturno', 2500.00, 'Rua B, 456', '02000-000', '22233344455', '1980-08-15', 'F', '87654321', '2022-02-15');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Carlos Oliveira', '(11) 96666-6666', 'carlos.oliveira@gmail.com', 'Administrador', 'Diurno', 4000.00, 'Rua C, 789', '03000-000', '33344455566', '1990-03-20', 'M', '13579246', '2022-03-10');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Ana Santos', '(11) 95555-5555', 'ana.santos@gmail.com', 'Administrador', 'Diurno', 4000.00, 'Rua D, 101', '04000-000', '44455566677', '1988-11-25', 'F', '98765432', '2022-04-05');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Roberto Lima', '(11) 94444-4444', 'roberto.lima@gmail.com', 'Atendente', 'Diurno', 2000.00, 'Rua E, 789', '05000-000', '55566677788', '1982-07-18', 'M', '11223344', '2022-05-20');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Juliana Pereira', '(11) 93333-3333', 'juliana.pereira@gmail.com', 'Atendente', 'Noturno', 2000.00, 'Rua F, 234', '06000-000', '66677788899', '1985-12-08', 'F', '99887766', '2022-06-15');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Ricardo Costa', '(11) 92222-2222', 'ricardo.costa@gmail.com', 'Cozinheiro', 'Noturno', 2500.00, 'Rua G, 567', '07000-000', '77788899900', '1993-04-30', 'M', '55443322', '2022-07-10');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Fernanda Martins', '(11) 91111-1111', 'fernanda.martins@gmail.com', 'Administrador', 'Diurno', 4000.00, 'Rua H, 890', '08000-000', '88899900011', '1998-09-22', 'F', '11223355', '2022-08-05');
go
INSERT INTO Funcionario (nome, telefone, email, cargo, turno, salario, endereco, CEP, cpf, data_nascimento, sexo, senha, data_contratacao)
VALUES ('Gustavo Oliveira', '(11) 90000-0000', 'gustavo.oliveira@gmail.com', 'Atendente', 'Noturno', 2000.00, 'Rua I, 111', '09000-000', '99900011122', '1996-01-12', 'M', '33445566', '2022-09-18');
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
('Bebidas', 'Acompanhamento'),
('Sobremesas', 'Sobremesa')
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
VALUES ('Yakisoba Tradicional', 'Macarrão frito com legumes, carne ou frango e molho especial', 4, 24.99, 'unidade');
-- Inserir bebida 1
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Cerveja', 'Cerveja gelada de marca famosa', 8, 10.99, 'Unidade', NULL);

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


-- Inserir prato de Gyoza
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Gyoza', 'Pastéis recheados com carne e legumes', 1, 8.99, 'Porção', NULL);


-- Inserir prato de Tataki de Salmão
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Tataki de Salmão', 'Salmão fresco levemente grelhado e fatiado, servido com molho ponzu e cebolinha', 2, 21.99, 'Porção', NULL);


-- Inserir novo prato Sunomono
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Sunomono', 'Salada de pepino finamente fatiado com molho agridoce', 1, 8.99, 'Porção', NULL);

INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Saquê', 'Saquê japonês tradicional', 8, 15.99, 'Garrafa', NULL);

-- Inserir bebida 5
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Chá Verde', 'Chá verde japonês', 8, 6.99, 'Xícara', NULL);

-- Inserir bebida 12
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Coquetel de Frutas', 'Coquetel de frutas tropicais com ou sem álcool', 8, 7.99, 'Copo', NULL);

-- Inserir novo prato 20
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Donburi de Salmão', 'Tigela de arroz coberta com salmão fresco', 4, 19.99, 'Unidade', NULL);

-- Inserir novo prato 31
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Gyudon', 'Tigela de arroz com carne de boi, cebola e molho especial', 4, 15.99, 'Porção', NULL);

-- Inserir novo prato 35
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Tofu Frito', 'Tofu crocante servido com molho especial', 3, 8.99, 'Porção', NULL);

-- Sobremesas

INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Dorayaki', 'Bolo recheado com pasta de feijão doce', 9, 5.99, 'unidade', NULL)

INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Mochi', 'Bolinhos de arroz glutinoso com diversos sabores', 9, 3.99, 'unidade', NULL)

INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Taiyaki', 'Waffle em forma de peixe recheado', 9, 4.99, 'unidade', NULL)

-----------sobremesas
INSERT INTO Produtos (nome_produto, descricao, id_categoriaprod, preco, unidade_medida, img_prato)
VALUES ('Dorayaki', 'Bolo recheado com pasta de feijão doce', 9, 5.99, 'unidade', NULL),
('Mochi', 'Bolinhos de arroz glutinoso com diversos sabores', 9, 3.99, 'unidade', NULL),
('Taiyaki', 'Waffle em forma de peixe recheado', 9, 4.99, 'unidade', NULL);
-----------------------------FAVORITOS-----------------------------------------------------------------------------------------------
-----------------------------FAVORITOS-----------------------------------------------------------------------------------------------
INSERT INTO Favorito (cpf, id_produto) VALUES ('12345678900', 1);
INSERT INTO Favorito (cpf, id_produto) VALUES ('12345678900', 2);
INSERT INTO Favorito (cpf, id_produto) VALUES ('12345678900', 3);
---------------------------------------------------------------------------------------------------------------------------
-- Inserir avaliação 1
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 1, 5, 'Produto excelente!', GETDATE());

-- Inserir avaliação 2
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 2, 4, 'Muito bom, mas pode melhorar.', GETDATE());

-- Inserir avaliação 3
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 3, 5, 'Recomendo a todos!', GETDATE());

-- Inserir avaliação 4
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 4, 3, 'Produto ok.', GETDATE());

-- Inserir avaliação 5
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 5, 4, 'Bom custo-benefício.', GETDATE());

-- Inserir avaliação 6
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 6, 2, 'Não gostei muito.', GETDATE());

-- Inserir avaliação 7
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 7, 5, 'Maravilhoso!', GETDATE());

-- Inserir avaliação 8
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 8, 4, 'Recomendo para todos.', GETDATE());

-- Inserir avaliação 9
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 9, 3, 'Poderia ser melhor.', GETDATE());

-- Inserir avaliação 10
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 10, 4, 'Boa qualidade.', GETDATE());

-- Inserir avaliação 11
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 11, 5, 'Excelente escolha!', GETDATE());

-- Inserir avaliação 12
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 12, 3, 'Poderia ser mais barato.', GETDATE());

-- Inserir avaliação 13
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 13, 4, 'Gostei bastante.', GETDATE());

-- Inserir avaliação 14
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 14, 5, 'Top demais!', GETDATE());

-- Inserir avaliação 15
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 15, 2, 'Não atendeu minhas expectativas.', GETDATE());

-- Inserir avaliação 16
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 16, 4, 'Bom produto, recomendo.', GETDATE());

-- Inserir avaliação 17
INSERT INTO Avaliacao (cpf, id_produto, estrelas, comentario_avaliacao, data_avaliacao)
VALUES ('12345678900', 17, 5, 'Fantástico!', GETDATE());
