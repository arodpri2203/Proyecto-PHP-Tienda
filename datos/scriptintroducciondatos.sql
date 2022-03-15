CREATE TABLE productos (
	codigo INT AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(200),
	rebaja INT,
	estarebajas ENUM('Si','No'),
	precio DECIMAL (6,9)
	);

CREATE TABLE clientes (
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(45),
	apellidos VARCHAR(80),
	fecha_nac DATE,
	telefono INT
	);

CREATE TABLE proveedores (
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(50),
	direccion VARCHAR(80),
	email VARCHAR(50),
	telefono INT
	);
