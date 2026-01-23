CREATE DATABASE TiendaVideojuegos;
GO  -- Esto solo separa y ejecuta “este bloque” primero, es decir ejecuta todo lo que está arriba de esta línea y luego sigue con lo de abajo

USE TiendaVideojuegos;
GO  

-- TABLAS

-- Guarda las plataformas
CREATE TABLE Plataforma (
  id_plataforma INT IDENTITY(1,1) PRIMARY KEY,  -- Número automático para identificar la plataforma
  nombre VARCHAR(50) NOT NULL UNIQUE            
);

-- Guarda los géneros
CREATE TABLE Genero (
  id_genero INT IDENTITY(1,1) PRIMARY KEY,      
  nombre VARCHAR(50) NOT NULL UNIQUE            
);

-- Guarda los roles del sistema 
CREATE TABLE Rol (
  id_rol INT IDENTITY(1,1) PRIMARY KEY,         
  nombre_rol VARCHAR(20) NOT NULL UNIQUE
);

-- Guarda datos del cliente
CREATE TABLE Cliente (
  id_cliente INT IDENTITY(1,1) PRIMARY KEY,     
  cedula VARCHAR(13) NOT NULL UNIQUE,          
  nombres VARCHAR(100) NOT NULL,                
  email VARCHAR(100) NOT NULL UNIQUE,          
  telefono VARCHAR(20) NOT NULL UNIQUE         
);

-- Guarda usuarios que usan el sistema (cajero/admin)
CREATE TABLE Usuario (
  id_usuario INT IDENTITY(1,1) PRIMARY KEY,     
  nombre_usuario VARCHAR(50) NOT NULL UNIQUE,  
  password_hash VARCHAR(255) NOT NULL,          -- Contraseña guardada de forma segura 
  nombres VARCHAR(100) NOT NULL,                -- Nombre real de la persona
  id_rol INT FOREIGN KEY REFERENCES Rol(id_rol) 
);

-- Guarda los videojuegos que vende la tienda
CREATE TABLE Videojuego (
  id_videojuego INT IDENTITY(1,1) PRIMARY KEY,  
  nombre VARCHAR(200) NOT NULL,                 
  descripcion VARCHAR(MAX) NOT NULL,                             
  precio DECIMAL(10,2) NOT NULL CHECK (precio > 0), -- Precio obligatorio y debe ser mayor a 0
  stock INT NOT NULL CHECK (stock >= 0),            -- Cantidad en stock, no puede ser negativa
  estado VARCHAR(20) CHECK (estado IN ('en stock', 'agotado')), -- Solo acepta estas 2 opciones
  id_plataforma INT FOREIGN KEY REFERENCES Plataforma(id_plataforma), 
  id_genero INT FOREIGN KEY REFERENCES Genero(id_genero)           
);

-- Guarda la venta
CREATE TABLE Venta (
  id_venta INT IDENTITY(1,1) PRIMARY KEY,       
  fecha_venta DATETIME DEFAULT GETDATE(),       -- Fecha y hora automática cuando se crea la venta
  id_cliente INT FOREIGN KEY REFERENCES Cliente(id_cliente), 
  id_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario), -- Usuario/cajero que atendió
  total DECIMAL(12,2) NOT NULL CHECK (total >= 0) -- Total de la venta, no puede ser negativo
);

-- Guarda el detalle: qué juegos se vendieron en esa venta
CREATE TABLE DetalleVenta (
  id_detalle INT IDENTITY(1,1) PRIMARY KEY,     
  id_venta INT FOREIGN KEY REFERENCES Venta(id_venta) ON DELETE CASCADE, -- A qué venta pertenece
  id_videojuego INT FOREIGN KEY REFERENCES Videojuego(id_videojuego),    -- Qué juego se vendió
  cantidad INT NOT NULL CHECK (cantidad > 0),   -- Cuántas unidades (mínimo 1)
  precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario > 0) -- Precio por unidad
);

-- Guarda un historial de cambios 
CREATE TABLE Auditoria (
  id_auditoria INT IDENTITY(1,1) PRIMARY KEY,   
  tabla_afectada VARCHAR(50) NOT NULL,          
  operacion VARCHAR(10) CHECK (operacion IN ('INSERT','UPDATE','DELETE')), -- Qué se hizo: crear/editar/eliminar
  id_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario), -- Quién de los usuarios lo hizo
  fecha_cambio DATETIME DEFAULT GETDATE(),      -- Fecha y hora automática del cambio/GETDATE() devuelve la fecha y hora del momento (la hora actual de la computadora/servidor donde corre SQL Server)
  descripcion_cambio VARCHAR(MAX) NOT NULL      -- Un texto comentando el porque de la acción 
);


