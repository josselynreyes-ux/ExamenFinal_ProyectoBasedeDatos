use TiendaVideojuegos;

-- Insertamos datos de prueba 
INSERT INTO Rol (nombre_rol)
VALUES ('Administrador');

INSERT INTO Plataforma (nombre)
VALUES ('PC');

INSERT INTO Genero (nombre)
VALUES ('Acción');

INSERT INTO Cliente (cedula, nombres, email, telefono)
VALUES ('0102030405', 'Juan Pérez', 'juan@mail.com', '0999999999');

INSERT INTO Usuario (nombre_usuario, password_hash, nombres, id_rol)
VALUES ('admin01', '123', 'Administrador General', 1);

INSERT INTO Videojuego
(nombre, descripcion, precio, stock, estado, id_plataforma, id_genero)
VALUES
('Cyber Arena', 'Juego futurista de acción', 59.99, 5, 'en stock', 1, 1);

INSERT INTO Venta (id_cliente, id_usuario, total)
VALUES (1, 1, 59.99);

INSERT INTO DetalleVenta
(id_venta, id_videojuego, cantidad, precio_unitario)
VALUES
(1, 1, 1, 59.99);

-- visualizaciones con select para confirmar la insercionde los datos 
SELECT * FROM Rol;
GO

SELECT * FROM Plataforma;
GO

SELECT * FROM Genero;
GO

SELECT * FROM Cliente;
GO

SELECT * FROM Usuario;
GO

SELECT * FROM Videojuego;
GO

SELECT * FROM Venta;
GO

SELECT * FROM DetalleVenta;
GO

SELECT * FROM Auditoria;
GO


-- Probamos validaciones 
UPDATE Videojuego
SET stock = 0
WHERE id_videojuego = 1;

DELETE FROM Venta
WHERE id_venta = 1;

