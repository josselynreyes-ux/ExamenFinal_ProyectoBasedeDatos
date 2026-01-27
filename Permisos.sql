USE TiendaVideojuegos;
GO

-- Asignamos los permisos para los usuarios 
-- Permisos usuario administrador : tiene poder sobre todas las tablas principales 

GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Videojuego TO RolAdministrador;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Venta TO RolAdministrador;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.DetalleVenta TO RolAdministrador;
GO

GRANT SELECT ON dbo.Auditoria TO RolAdministrador;
GO

-- Permisos usuario cajero : como cajero solo tiene poder en temas relacionados con las ventas de videojuegos
GRANT SELECT ON dbo.Videojuego TO RolCajero;
GO

GRANT SELECT, INSERT ON dbo.Venta TO RolCajero;
GO

GRANT SELECT, INSERT ON dbo.DetalleVenta TO RolCajero;
GO

-- Verificación de los permisos asignados 
SELECT * FROM sys.database_permissions;
GO