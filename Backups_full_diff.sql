-- BACKUPS

-- backup completo

BACKUP DATABASE TiendaVideojuegos
TO DISK = 'C:\BackupsSQL\TiendaVideojuegos_FULL.bak'
WITH INIT;
GO

-- backup diferenciañ
-- solo se actualiza desde el ultimo cambio

BACKUP DATABASE TiendaVideojuegos
TO DISK = 'C:\BackupsSQL\TiendaVideojuegos_DIFF.bak'
WITH DIFFERENTIAL;
GO




