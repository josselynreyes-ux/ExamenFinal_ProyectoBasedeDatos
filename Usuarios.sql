USE TiendaVideojuegos;
GO
-- ADMINISTRACION Y SEGURIDAD

select * from Usuario;

-- quienes se conectan al servidor

-- LOGIN para el administrador del sistema
-- Este login se usará para tareas administrativas
CREATE LOGIN login_justin_admin
WITH PASSWORD = 'Admin123';
GO


-- LOGIN que usará el cajero en el sistema de ventas
-- acceso que tendrá la aplicación para registrar ventas
CREATE LOGIN login_joss_cajero
WITH PASSWORD = 'Cajero123';
GO

-- Conectamos el Login con los usuarios

-- Usuario de base de datos para el administrador

CREATE USER usuario_justin_admin
FOR LOGIN login_justin_admin;
GO

-- Usuario para el login de cajero
CREATE USER usuario_backend_cajero
FOR LOGIN login_joss_cajero;
GO


-- rol de seguridad para administradores
CREATE ROLE RolAdministrador;
GO

-- rol de seguridad para cajeros
CREATE ROLE RolCajero;
GO


-- Funcion que Cumple cada usuario previamente creado con los roles

-- el usuario administrador pertenece al rol administrador
ALTER ROLE RolAdministrador
ADD MEMBER usuario_justin_admin;
GO

-- el usuario del backend pertenece al rol cajero
ALTER ROLE RolCajero
ADD MEMBER usuario_joss_cajero;
GO


