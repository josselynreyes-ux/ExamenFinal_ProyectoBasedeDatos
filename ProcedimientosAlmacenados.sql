USE TiendaVideojuegos;
GO

-- Mostrar lista completa de los videojuegos
-- con su nombre, precio, stock, plataforma y genero
CREATE PROCEDURE SP_ListarVideojuegos
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Videojuego.id_videojuego, Videojuego.nombre, Videojuego.precio, Videojuego.stock, Plataforma.nombre AS plataforma, Genero.nombre AS genero
    FROM dbo.Videojuego
    INNER JOIN dbo.Plataforma ON Videojuego.id_plataforma = Plataforma.id_plataforma
    INNER JOIN dbo.Genero ON Videojuego.id_genero = Genero.id_genero;
END;
GO

EXEC SP_ListarVideojuegos;
GO


-- muestra todas las ventas realizadas por un cliente

CREATE PROCEDURE SP_VentasPorCliente (@id_cliente INT)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Venta.id_venta, Venta.fecha_venta, Venta.total FROM dbo.Venta
    WHERE Venta.id_cliente = @id_cliente;
END;
GO

EXEC SP_VentasPorCliente @id_cliente = 1;
GO


-- Inserta un nuevo cliente
-- evita que en el frontend se hagan insert y asi se mantiene reglas de seguridad

CREATE PROCEDURE SP_InsertarCliente (@cedula VARCHAR(13), @nombres VARCHAR(100), @email VARCHAR(100), @telefono VARCHAR(20))
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.Cliente (cedula, nombres, email, telefono)
    VALUES (@cedula, @nombres, @email, @telefono);
END;
GO

-- como se ejecuta:

EXEC SP_InsertarCliente
    @cedula = '0102030405',
    @nombres = 'Cliente Prueba',
    @email = 'prueba@gmail.com',
    @telefono = '0999999999';


-- 