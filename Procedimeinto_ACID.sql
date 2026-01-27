USE TiendaVideojuegos;
GO

CREATE PROCEDURE SP_RegistrarVenta (@id_cliente INT, @id_usuario INT, @id_videojuego INT,@cantidad INT,@precio_unitario DECIMAL(10,2))
AS
BEGIN
    SET NOCOUNT ON; -- no cuenta las filas afectadas al ejecutar

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Insertar la venta
        INSERT INTO dbo.Venta (id_cliente, id_usuario, total)
        VALUES (@id_cliente, @id_usuario, @cantidad * @precio_unitario);

        -- Obtener el ID de la venta recién creada
        DECLARE @id_venta INT;
        SET @id_venta = SCOPE_IDENTITY();

        -- 2. Insertar el detalle de la venta
        INSERT INTO dbo.DetalleVenta
            (id_venta, id_videojuego, cantidad, precio_unitario)
        VALUES
            (@id_venta, @id_videojuego, @cantidad, @precio_unitario);

        -- 3. Actualizar el stock del videojuego
        UPDATE dbo.Videojuego
        SET stock = stock - @cantidad
        WHERE id_videojuego = @id_videojuego;

        -- 4. Confirmar la transacción
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si algo falla, deshacer todo
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


-- Demostracion 
EXEC SP_RegistrarVenta @id_cliente = 1, @id_usuario = 2, @id_videojuego = 1, @cantidad = 1, @precio_unitario = 59.99;

-- Visulaizacion de los talleres 
SELECT * FROM Venta;
SELECT * FROM DetalleVenta;
SELECT nombre, stock FROM Videojuego WHERE id_videojuego = 1;
SELECT * FROM Auditoria;

