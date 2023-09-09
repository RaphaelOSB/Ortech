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
    DECLARE @valor_total DECIMAL(10, 2);

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
    VALUES (@cpf, CONVERT(DATETIME, @data_pedido, 120), 0.0, @formapagamento, @numero_mesa);

    -- Obter o ID do pedido recém-inserido
    SET @id_pedido = SCOPE_IDENTITY();

    -- Calcular o valor total do pedido com base nos produtos selecionados
    SELECT @valor_total = SUM(p.preco * dp.quantidade_produto)
    FROM @produtos dp
    JOIN Produtos p ON dp.id_produto = p.id_produto;

    -- Atualizar o valor total do pedido
    UPDATE Pedido
    SET valor_total = @valor_total
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
    (4, 2,'Sem cebola'),
    (2, 1,'Com molho extra'),
    (1, 10,'Com queijo'), 
	(3, 10, 'Com queijo'),
	(5, 3, '')
	

EXEC usp_InserirPedido
    @cpf = '12345678900',
    @data_pedido = '2023-05-19T12:34:56',
    @formapagamento = 'Cartão de crédito',
    @numero_mesa = 3,
    @produtos = @produtos

drop procedure usp_InserirPedido
