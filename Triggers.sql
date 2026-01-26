-- TRIGGERS 

-- INSERT ( tabla VideoJuego)

CREATE TRIGGER TR_Auditoria_Insert_Videojuego ON Videojuego
AFTER INSERT
AS
BEGIN
    INSERT INTO Auditoria (tabla_afectada, operacion, id_usuario, descripcion_cambio)
    SELECT 'Videojuego', 'INSERT',1, 'Se insertó un nuevo videojuego: ' + nombre
    FROM inserted;
END;
GO


-- Insert para verificar auditoria

INSERT INTO Videojuego (nombre, descripcion, precio, stock, estado, id_plataforma, id_genero)
VALUES ('Test Game', 'Juego de prueba', 10.00, 1, 'en stock', 1, 1);
GO

SELECT * FROM Auditoria;
GO


-- UPDATE (Tabla VideoJuego)

CREATE TRIGGER TR_Auditoria_Update_Videojuego ON Videojuego
AFTER UPDATE
AS
BEGIN
    INSERT INTO Auditoria (tabla_afectada, operacion, id_usuario, descripcion_cambio)
    SELECT 'Videojuego', 'UPDATE', 1, 'Se actualizó el videojuego: ' + nombre
    FROM inserted;
END;
GO


-- Update para verificar auditoria

UPDATE Videojuego
SET stock = stock - 1
WHERE nombre = 'Test Game';

SELECT * FROM Auditoria;
GO

-- DELETE (Tabla VideoJuego)

CREATE TRIGGER TR_Auditoria_Delete_Videojuego ON Videojuego
AFTER DELETE
AS
BEGIN
    INSERT INTO Auditoria (tabla_afectada, operacion, id_usuario, descripcion_cambio)
    SELECT 'Videojuego', 'DELETE', 1, 'Se eliminó el videojuego: ' + nombre
    FROM deleted;
END;
GO

-- Delete para verificar auditoria

DELETE FROM Videojuego
WHERE nombre = 'Test Game';

SELECT * FROM Auditoria;

