-- Subconsultas 
-- Videojuegos con precio mayor al promedio
SELECT nombre, precio FROM Videojuego
WHERE precio >
( SELECT AVG(precio)
  FROM Videojuego );

-- Clientes que han realizado al menos una venta
SELECT nombres, email FROM Cliente
WHERE id_cliente IN
(SELECT id_cliente
  FROM Venta);

-- Videojuegos que nunca se han vendido
SELECT nombre FROM Videojuego
WHERE id_videojuego NOT IN -- NOT IN  filtran resultados que no aparecen en una subconsulta, en este caso filtra los videojuegos 
                           -- que no estan en detalleventa es decir, no se han vendido
(SELECT id_videojuego
  FROM DetalleVenta);


-- Vistas 
-- Catálogo completo de videojuegos
CREATE VIEW VistaCatalogoVideojuegos AS
SELECT Videojuego.nombre AS videojuego, Plataforma.nombre AS plataforma, Genero.nombre AS genero, Videojuego.precio, Videojuego.stock, Videojuego.estado
FROM Videojuego
INNER JOIN Plataforma ON Videojuego.id_plataforma = Plataforma.id_plataforma
INNER JOIN Genero ON Videojuego.id_genero = Genero.id_genero;
GO

SELECT * FROM VistaCatalogoVideojuegos;

-- Resumen de ventas
CREATE VIEW VistaVentas AS
SELECT Venta.id_venta,Venta.fecha_venta,Cliente.nombres AS cliente,Usuario.nombres AS usuario,Venta.total
FROM Venta
INNER JOIN Cliente ON Venta.id_cliente = Cliente.id_cliente
INNER JOIN Usuario ON Venta.id_usuario = Usuario.id_usuario;
GO

SELECT * FROM VistaVentas;

-- Detalle de ventas 
CREATE VIEW VistaDetalleVentas AS
SELECT Venta.id_venta,Videojuego.nombre AS videojuego,DetalleVenta.cantidad,DetalleVenta.precio_unitario
FROM DetalleVenta
INNER JOIN Venta ON DetalleVenta.id_venta = Venta.id_venta
INNER JOIN Videojuego ON DetalleVenta.id_videojuego = Videojuego.id_videojuego;
GO

SELECT * FROM VistaDetalleVentas;