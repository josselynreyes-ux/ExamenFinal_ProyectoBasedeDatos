-- Funciones SQL
USE TiendaVideojuegos;
GO

-- Calcular total de una venta 

CREATE FUNCTION FN_CalcularTotalVenta (@cantidad INT,@precio_unitario DECIMAL(10,2)) RETURNS DECIMAL(12,2) AS
BEGIN
    RETURN @cantidad * @precio_unitario;
END;
GO

-- Visualizamos 
SELECT dbo.FN_CalcularTotalVenta(2, 59.99) AS total;
GO

-- Obtener estado de stock de un videojuego
CREATE FUNCTION FN_EstadoStock (@stock INT) RETURNS VARCHAR(20) AS
BEGIN
    DECLARE @estado VARCHAR(20);

    IF @stock = 0
        SET @estado = 'Agotado';
    ELSE IF @stock < 5
        SET @estado = 'Bajo stock';
    ELSE
        SET @estado = 'Disponible';

    RETURN @estado;
END;
GO

-- Visualizamos 
SELECT nombre,stock,dbo.FN_EstadoStock(stock) AS estado_stock FROM dbo.Videojuego;
GO

-- Calcular total vendido por cliente
CREATE FUNCTION FN_TotalVendidoPorCliente (@id_cliente INT) RETURNS DECIMAL(12,2) AS
BEGIN
    DECLARE @total DECIMAL(12,2);

    SELECT @total = SUM(total)
    FROM dbo.Venta
    WHERE id_cliente = @id_cliente;

    RETURN ISNULL(@total, 0);
END;
GO

-- Visualizamos
SELECT nombres,dbo.FN_TotalVendidoPorCliente(id_cliente) AS total_gastado FROM dbo.Cliente;
