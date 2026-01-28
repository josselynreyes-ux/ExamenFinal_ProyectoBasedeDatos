
USE TiendaVideojuegos;
GO

--  Consultas con funciones de agregación (SUM, COUNT, AVG)
-- Total de ventas realizadas 
SELECT COUNT(*) AS total_ventas FROM Venta;
GO

-- Monto total vendido
SELECT SUM(total) AS monto_total_vendido FROM Venta;
GO

-- Promedio de venta 
SELECT AVG(total) AS promedio_venta FROM Venta;
GO

-- Cantidad de juegos por plataforma (verifica cuantos videojuegos DIFERENTES tiene cada plataforma)
SELECT Plataforma.nombre, COUNT(Videojuego.id_videojuego) AS cantidad_videojuegos
FROM Plataforma
INNER JOIN Videojuego ON Plataforma.id_plataforma = Videojuego.id_plataforma
GROUP BY Plataforma.nombre;
GO

-- Stock total por plataforma (el numero total de videojuegos que tiene cada plataforma)
SELECT Plataforma.nombre, SUM(Videojuego.stock) AS stock_total
FROM Plataforma
INNER JOIN Videojuego ON Plataforma.id_plataforma = Videojuego.id_plataforma
GROUP BY Plataforma.nombre;
GO

-- Videojuegos con stock cero (acabados)
SELECT COUNT(*) AS videojuegos_agotados
FROM Videojuego
WHERE stock = 0;

-- Funciones de cadena (STRING FUNCTIONS)
-- convertimos texto a mayusculas 
SELECT UPPER(nombre) AS nombre_mayusculas FROM Videojuego;
GO

-- convertimos texto a minusculas 
SELECT LOWER(email) AS email_minusculas
FROM Cliente;

--Longitud de una cadena 
SELECT nombre,LEN(nombre) AS longitud_nombre
FROM Videojuego;

-- Unir columnas en una 
SELECT CONCAT(nombres, ' - ', email) AS cliente_info
FROM Cliente;

-- Funcion cadena con JOIN 
SELECT CONCAT('Cliente: ', Cliente.nombres, ' | Total: $', Venta.total) AS resumen_venta
FROM Venta
INNER JOIN Cliente ON Venta.id_cliente = Cliente.id_cliente;

-- Ver infromacion detallada de los videojuegos 
SELECT Venta.id_venta, Videojuego.nombre AS videojuego, DetalleVenta.cantidad, DetalleVenta.precio_unitario
FROM DetalleVenta
INNER JOIN Venta ON DetalleVenta.id_venta = Venta.id_venta
INNER JOIN Videojuego ON DetalleVenta.id_videojuego = Videojuego.id_videojuego;