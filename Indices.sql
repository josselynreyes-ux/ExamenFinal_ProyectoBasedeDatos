-- Indíce 
-- IDX_Venta_IdCliente
CREATE INDEX IDX_Venta_IdCliente ON dbo.Venta (id_cliente);
GO

-- IDX_DetalleVenta_IdVenta
CREATE INDEX IDX_DetalleVenta_IdVenta ON dbo.DetalleVenta (id_venta);
GO

-- IDX_Videojuego_IdPlataforma
CREATE INDEX IDX_Videojuego_IdPlataforma ON dbo.Videojuego (id_plataforma);
GO

-- IDX_Videojuego_IdGenero
CREATE INDEX IDX_Videojuego_IdGenero ON dbo.Videojuego (id_genero);
GO
