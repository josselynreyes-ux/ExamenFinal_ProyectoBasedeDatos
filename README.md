http://localhost/tienda_videojuegos/public/login.php

# Proyecto Base de Datos  
## Sistema de Gestión de Venta de Videojuegos


## Descripción general
Este proyecto consiste en el diseño e implementación de una base de datos relacional en SQL Server para la gestión de una tienda de videojuegos. El sistema permite administrar información de videojuegos, clientes, usuarios, ventas y detalles de venta, aplicando principios de integridad referencial, normalización, seguridad, auditoría y transacciones.

La base de datos se integra con un frontend desarrollado en PHP y HTML, el cual se conecta directamente a la base de datos para ejecutar consultas y procedimientos almacenados, demostrando el funcionamiento completo del sistema.

<img width="611" height="211" alt="image" src="https://github.com/user-attachments/assets/e0225c71-4cd0-43b6-8b5b-baf5cf91cd23" />


## Objetivo del proyecto
Diseñar, implementar y demostrar el funcionamiento de una base de datos relacional que permita:
- Gestionar ventas de videojuegos de forma segura y consistente.
- Ejecutar consultas, JOIN, procedimientos almacenados y funciones SQL.
- Aplicar transacciones bajo el principio ACID.
- Registrar auditoría de las operaciones realizadas.
- Integrarse con un frontend funcional.

## Modelo de datos
La base de datos TiendaVideojuegos está compuesta por las siguientes tablas principales:
- Plataforma  
- Genero  
- Rol  
- Usuario  
- Cliente  
- Videojuego  
- Venta  
- DetalleVenta  
- Auditoria  

<img width="407" height="359" alt="image" src="https://github.com/user-attachments/assets/60fea2b9-b599-488b-9dd2-a1e876f2da7a" />

El modelo fue normalizado hasta Tercera Forma Normal (3FN), evitando redundancia y asegurando la consistencia de los datos.

## Tecnologías utilizadas
- SQL Server Management Studio (SSMS)
- PHP y HTML
- Apache (XAMPP)
- GitHub

## Funcionalidades implementadas

### Frontend y Backend
- Frontend mínimo desarrollado en PHP y HTML.
- Conexión directa a la base de datos SQL Server.
- Ejecución de consultas y procedimientos almacenados desde el frontend.
- Separación lógica entre la capa de presentación y la base de datos.

### Consultas
- Listado de videojuegos con plataforma y género mediante JOIN.
- Consulta de ventas realizadas por cliente.
- Consultas con JOIN entre Venta, DetalleVenta y Videojuego.
- Uso de funciones de agregación (SUM, COUNT).

<img width="1181" height="596" alt="image" src="https://github.com/user-attachments/assets/67834f64-d093-4f14-bfb3-34b3863a7a84" />

<img width="1251" height="486" alt="image" src="https://github.com/user-attachments/assets/7fee96d6-3153-45e2-9e68-de1d05d8ec6d" />

<img width="1048" height="355" alt="image" src="https://github.com/user-attachments/assets/47cd87e4-503e-4405-a160-3bc83b078c68" />

### Procedimientos almacenados
- Listado de videojuegos.
- Registro de clientes.
- Consulta de ventas por cliente.
- Registro de ventas de forma controlada.

<img width="1015" height="595" alt="image" src="https://github.com/user-attachments/assets/841e5771-ff12-4afe-b3db-270f19218add" />


### Transacciones (ACID)
- Uso de transacciones (BEGIN TRAN, COMMIT y ROLLBACK) para garantizar que las ventas se registren de forma completa y consistente.

<img width="1344" height="363" alt="image" src="https://github.com/user-attachments/assets/6b3e0b6f-420b-4b99-b64b-fbd00a8cb993" />


### Auditoría
- Implementación de triggers para registrar operaciones de INSERT, UPDATE y DELETE en la tabla Auditoria, permitiendo el seguimiento de cambios en la base de datos.

<img width="972" height="243" alt="image" src="https://github.com/user-attachments/assets/3c7616f3-e0ed-49f9-8f72-8e31dcffa06a" />


### Seguridad
- Creación de usuarios y roles en SQL Server.
- Asignación de permisos diferenciados.
- Restricción del acceso directo a las tablas, priorizando el uso de procedimientos almacenados.

<img width="600" height="623" alt="Captura de pantalla 2026-01-28 094939" src="https://github.com/user-attachments/assets/b23adfc5-6d2d-4a10-81b4-e95632ed38bd" />


### Backups
- Backup completo de la base de datos.
- Backup caliente.
- Restauración de la base de datos para verificación de integridad.

<img width="892" height="238" alt="image" src="https://github.com/user-attachments/assets/c57f5385-5b08-4b53-8047-67c08c4c73e0" />


## Ejecución del proyecto
1. Ejecutar los scripts SQL en SQL Server.
2. Iniciar el servidor Apache.
3. Acceder al frontend desde el navegador.
4. Realizar operaciones desde el frontend y verificar los resultados en la base de datos.

## Conclusiones
El proyecto permitió aplicar de manera práctica los conceptos de modelado, implementación y administración de bases de datos relacionales. La integración entre el frontend en PHP y la base de datos en SQL Server demuestra la importancia de una base de datos bien diseñada como núcleo de un sistema de información.

## Archivos incluidos en el repositorio
Incluidos:
- Scripts SQL
- Archivos PHP del frontend
- README.md
