

DBCC CHECKIDENT ('Rol', RESEED, 0); -- Le dice a SQL, que el proximo dato se reinicia y empieza desde 1
GO


INSERT INTO Rol (nombre_rol) VALUES
('Administrador'),
('Cajero');
GO


INSERT INTO Plataforma (nombre) VALUES
('PC'),
('PlayStation'),
('Xbox'),
('Nintendo Switch'),
('Mobile');


INSERT INTO Genero (nombre) VALUES
('Accion'),
('Aventura'),
('RPG'),
('Deportes'),
('Estrategia');


INSERT INTO Cliente (cedula, nombres, email, telefono) VALUES
('0102030405', 'Juan Pérez', 'juan@gmail.com', '0992983923'),
('0202020202', 'Justin Paladines', 'justin.uni@gmail.com', '0998132811'),
('0303030303', 'Josselyn Reyes', 'josselyn.uni@gmail.com', '0998120912'),
('0404040404', 'Yadira Franco', 'yadira.uni@gmail.com', '0999812718'),
('0505050505', 'Carlitos Chillagana', 'carlitos.uni@gmail.com', '0987657984');


INSERT INTO Usuario (nombre_usuario, password_hash, nombres, id_rol)
VALUES
('joss.admin', 'hash1', 'Administrador Principal', 1),
('just.admin', 'hash2', 'Administrador Secundario', 1),
('cajero01', 'hash3', 'Cajero Uno', 2),
('cajero02', 'hash4', 'Cajero Dos', 2),
('cajero03', 'hash5', 'Cajero Tres', 2);


INSERT INTO Videojuego
(nombre, descripcion, precio, stock, estado, id_plataforma, id_genero)
VALUES
('Cyber Arena', 'Acción futurista', 59.99, 10, 'en stock', 1, 1),
('Dragon Quest', 'RPG épico', 49.99, 5, 'en stock', 2, 3),
('Speed Racer', 'Carreras extremas', 39.99, 8, 'en stock', 3, 4),
('Kingdom Builder', 'Estrategia medieval', 44.99, 0, 'agotado', 1, 5),
('Adventure Land', 'Aventura fantástica', 29.99, 12, 'en stock', 4, 2);


INSERT INTO Venta (id_cliente, id_usuario, total) VALUES
(1, 2, 59.99),
(2, 2, 89.98),
(3, 3, 49.99),
(4, 1, 44.99),
(5, 4, 29.99);


INSERT INTO DetalleVenta
(id_venta, id_videojuego, cantidad, precio_unitario)
VALUES
(1, 1, 1, 59.99),
(2, 2, 2, 44.99),
(3, 2, 1, 49.99),
(4, 4, 1, 44.99),
(5, 5, 1, 29.99);


-- CONSULTAS

-- JOIN (Juegos con su plataforma y genero)

SELECT Videojuego.nombre,Plataforma.nombre AS plataforma,Genero.nombre AS genero,Videojuego.precio,Videojuego.stock,Videojuego.estado
FROM Videojuego
INNER JOIN Plataforma ON Videojuego.id_plataforma = Plataforma.id_plataforma
INNER JOIN Genero ON Videojuego.id_genero = Genero.id_genero;

-- JOIN ( Ventas con cliente y usuario)
SELECT Venta.id_venta, Venta.fecha_venta, Cliente.nombres AS cliente, Usuario.nombres AS usuario, Venta.total
FROM Venta
INNER JOIN Cliente ON Venta.id_cliente = Cliente.id_cliente
INNER JOIN Usuario ON Venta.id_usuario = Usuario.id_usuario;

-- JOIN (Detalle de una venta COMPLETA)
SELECT Venta.id_venta, Videojuego.nombre AS videojuego, DetalleVenta.cantidad, DetalleVenta.precio_unitario
FROM DetalleVenta
INNER JOIN Venta ON DetalleVenta.id_venta = Venta.id_venta
INNER JOIN Videojuego ON DetalleVenta.id_videojuego = Videojuego.id_videojuego;
