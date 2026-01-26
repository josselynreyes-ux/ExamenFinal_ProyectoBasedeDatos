
--  Consultas con funciones de agregación (SUM, COUNT, AVG)
-- Total de ventas realizadas 
SELECT COUNT(*) AS total_ventas
FROM Venta;

-- Monto total vendido
SELECT SUM(total) AS monto_total_vendido
FROM Venta;

-- Promedio de venta 
SELECT AVG(total) AS promedio_venta
FROM Venta;

-- Cantidad de juegos por plataforma (verifica cuantos videojuegos DIFERENTES tiene cada plataforma)
SELECT Plataforma.nombre, COUNT(Videojuego.id_videojuego) AS cantidad_videojuegos
FROM Plataforma
INNER JOIN Videojuego ON Plataforma.id_plataforma = Videojuego.id_plataforma
GROUP BY Plataforma.nombre;

-- Stock total por plataforma (el numero total de videojuegos que tiene cada plataforma)
SELECT Plataforma.nombre, SUM(Videojuego.stock) AS stock_total
FROM Plataforma
INNER JOIN Videojuego ON Plataforma.id_plataforma = Videojuego.id_plataforma
GROUP BY Plataforma.nombre;

-- Videojuegos con stock cero (acabados)
SELECT COUNT(*) AS videojuegos_agotados
FROM Videojuego
WHERE stock = 0;
