-- CIFO Vallès, CIFO La Violeta
-- Robert Sallent

-- EJERCICIO 1 (Empresa)
-- Última revisión 16/12/2021

-- Eliminar la BDD anterior (si existe)
DROP DATABASE IF EXISTS EJERCICIO_01_empresa;

-- Crear la BDD 
CREATE DATABASE EJERCICIO_01_empresa 
	DEFAULT CHARACTER SET utf8mb4 
	COLLATE utf8mb4_general_ci;

-- Usar la BDD 
USE EJERCICIO_01_empresa;

-- CREACIÓN DE LAS TABLAS
-- creación de la tabla departaments
CREATE TABLE departamentos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(8) NOT NULL UNIQUE KEY,
	nombre VARCHAR(32) NOT NULL,
	descripcion TEXT NULL,
	presupuesto DOUBLE NOT NULL,
	maxtrabajadores INT(11) NOT NULL
);

-- creación de la tabla treballadors
CREATE TABLE trabajadores(
	id INT AUTO_INCREMENT PRIMARY KEY,
	dni CHAR(9) NOT NULL UNIQUE KEY,
	ss VARCHAR(16) NOT NULL UNIQUE KEY,
	nombre VARCHAR(32) NOT NULL,
	apellido1 VARCHAR(32) NOT NULL,
	apellido2 VARCHAR(32) NOT NULL,
	nacimiento DATE NOT NULL,
	direccion VARCHAR(256) NOT NULL,
	cp CHAR(5) NOT NULL,
	poblacion VARCHAR(32) NOT NULL,
	email VARCHAR(128) NOT NULL UNIQUE KEY,
	iddepartamento INT NOT NULL,

	FOREIGN KEY (iddepartamento) REFERENCES departamentos(id)
		ON UPDATE CASCADE 
		ON DELETE RESTRICT
);


-- inserción de datos en la tabla departamentos
INSERT INTO departamentos (id, codigo, nombre, descripcion, presupuesto, maxtrabajadores) VALUES
(1,'GERE', 'Dirección/Gerencia', 'Dirección de la empresa', 1000000, 10),
(2,'COMP', 'Compras', 'Departamento de compras', 850000, 5),
(3,'RRHH', 'Recursos Humanos', 'Departamento de recursos humanos', 650000, 5),
(4,'PROD', 'Producción', 'Departamento de producción', 1800000, 100),
(5,'CONG', 'Control de gestión', 'Departamento de control de gestión', 25000, 1),
(6,'MARK', 'Marketing', 'Departamento de marketing', 500000, 15),
(7,'VENT', 'Comercial/Ventas', 'Departamentos comercial y de ventas', 700000, 20),
(8,'ADMI', 'Administración', 'Departamento de administración', 320000, 6),
(9,'FINA', 'Finanzas', 'Departamento de finanzas', 300000, 3),
(10,'PRL', 'Riesgos laborales', 'Departamento de riesgos laborales', 50000, 10);


-- inserción de datos en la tabla trabajadores
INSERT INTO trabajadores (id, dni, ss, nombre, apellido1, apellido2, nacimiento, direccion, cp, poblacion, email, iddepartamento) VALUES
(1, '11111111A', '6541111111', 'Pepito', 'Pérez', 'Padilla', '1990-01-01', 'C/Pallars 35', '08206', 'Sabadell', 'pepito@empresa.com', 1),
(2, '22222222B', '6662222222', 'Margarita', 'Lozano', 'Quesada', '2000-11-12', 'C/Tres Creus', '08200', 'Sabadell', 'margaa@empresa.com', 1),
(3, '33333333C', '6854333333', 'Julián', 'Rodrigo', 'Martín', '1965-05-06', 'Pl. Trafalgar', '28025', 'Badalona', 'juli@empresa.com', 2),
(4, '44444444D', '9344444444', 'Fausto', 'Remo', 'Sallarès', '1980-03-10', 'C/Martorell', '08206', 'Sabadell', 'faust@empresa.com', 2),
(5, '55555555E', '9355555555', 'Eva', 'Martín', 'Perea', '2001-03-18', 'C/Baixadors', '08082', 'Barcelona', 'eva@empresa.com', 3),
(6, '66666666F', '6546666666', 'Unai', 'Terrón', 'Lechón', '1990-01-04', 'C/Vallvidrera', '08100', 'Hospitalet de Llobregat', 'unai@empresa.com', 4),
(7, '77777777H', '7777777777', 'Jazmín', 'Ortiz', 'Ortega', '2000-07-12', 'C/Ferran', '08300', 'Sant Cugat del Vallès', 'jazmin@empresa.com', 3),
(8, '88888888Y', '6558888888', 'Julián', 'Mengano', 'Torrecilla', '1959-04-02', 'Pl Terrassa', '08205', 'Sabadell', 'juli@empresa2.com', 4),
(9, '32345678Z', '933456789447', 'Irene', 'Amador', 'Padilla', '2002-01-01', 'C/Aranda', '28081', 'Barcelona', 'irene@empresa2.com', 4),
(10, '28765432S', '9376543214564', 'Tomás', 'Roncano', 'Broncas', '1990-09-12', 'C/Peral', '08125', 'Terrassa', 'broncas@empresa2.com', 4),
(11, '42145687S', '93145685442', 'Jennifer', 'Jones', 'Scrabble', '1982-10-01', 'C/Rocafort', '08100', 'Terrassa', 'scrabble@empresa2.com', 4),
(12, '59988877M', '93744487495', 'Olga', 'Martín', 'Campillo', '1978-11-12', 'C/Faust', '28025', 'Cornellà de Llobregat', 'campimart@empresa.com', 4),
(13, '98745854R', '937654828817', 'Miriam', 'Peñas', 'Uribarri', '1995-12-14', 'C/Requesón', '08204', 'Sabadell', 'miri@empresa.com', 5),
(14, '47474856T', '9336548586', 'Tristán', 'Vall', 'Roca', '1971-10-05', 'Pl. Santa Coloma', '08000', 'Hospitalet de Llobregat', 'trivaro@empresa.com', 6),
(15, '48478745Y', '9318789548', 'Laura', 'Casado', 'Castillejo', '1983-03-25', 'Carretera de Mollet', '08400', 'Granollers', 'lauri@empresa.com', 6),
(16, '98268452G', '9311815145', 'Pol', 'Sanchis', 'Llopis', '1965-02-28', 'Pl. Tarraco', '08205', 'Sabadell', 'pol@empresa2.com', 6),
(17, '12365478G', '9332541251', 'Francina', 'Amat', 'Margalef', '1987-04-07', 'Rambla Pallars', '28065', 'Barcelona', 'fran@empresa.com', 7),
(18, '44455587H', '9374584585', 'Yulianna', 'Vargas', 'Tucalpeca', '1978-12-08', 'C/Barcanova', '08210', 'Terrassa', 'yuli@empresa.com', 7),
(19, '11447747Y', '9354141214', 'Marcos', 'Montoliu', 'Montornés', '1992-04-07', 'C/Miranda', '08600', 'Caldes de Montbui', 'mari@empresa.com', 8),
(20, '98778745P', '9371216585', 'Laura', 'Escola', 'Vilaplana', '1980-07-09', 'C/Guardiola', '08202', 'Sabadell', 'lau@empresa.com', 8),
(21, '98778743P', '9371214343', 'Marta', 'Escola', 'Vilaplana', '1980-07-09', 'C/Guardiola', '08202', 'Sabadell', 'mar@empresa.com', 9),
(22, '98745874B', '9354741213', 'Montserrat', 'Valdelplà', 'Mas', '1986-05-09', 'C/Comerç', '08008', 'Barcelona', 'mon@empresa.com', 9),
(23, '12123423B', '9322332321', 'Gonzalo', 'Pereira', 'Millo', '1976-04-19', 'C/Comerç', '08008', 'Barcelona', 'gonzo@empresa.com', 3),
(24, '98754896D', '9312345658', 'Juan', 'Marcelo', 'Trigo', '1986-12-09', 'C/Silverado', '08018', 'Barcelona', 'marce@empresa.com', 5),
(25, '23154857E', '9374561255', 'Maribel', 'Porta', 'Espejo', '1996-11-01', 'Ctra. Terrassa', '08108', 'Rubí', 'maribel@empresa2.com', 9),
(26, '12348785E', '9335285254', 'Rosa', 'Flores', 'Espinosa', '1990-01-30', 'Ctra. Barcelona', '08200', 'Sant Cugat', 'florida@yahoo.com', 3),
(27, '23452342E', '9301230000', 'Oriol', 'Llac', 'Pi', '1980-12-10', 'C/Calders', '08203', 'Sabadell', 'ollapi@gmail.com', 3),
(28, '12342342E', '9300012345', 'Juan', 'Contreras', 'Galtes', '1990-12-05', 'C/Provença', '08203', 'Sabadell', 'juanco@empresa.com', 6),
(29, '85474845R', '9312345000', 'Pep', 'Margalef', 'Perelló', '1984-10-17', 'C/Entença', '08207', 'Terrassa', 'pepa@empresa3.com', 5),
(30, '23434323T', '9388575847', 'Eloi', 'Roncero', 'Tiberius', '1986-02-19', 'C/Mercurio', '08203', 'Sabadell', 'erito@empresa2.es', 3),
(31, '34233433U', '9381484885', 'Josep', 'Farner', 'Coll', '1966-12-31', 'C/Plà de vall', '08203', 'Sabadell', 'josepi@empresa.com', 4),
(32, 'X1212458R', '9314785142', 'Yulia', 'Pino', 'Salazar', '1986-02-01', 'Ctra. Vallromanes', '08003', 'Masnou', 'yulipi@aol.mx', 4),
(33, 'Y4435413Y', '6524145414', 'Sergei', 'Markof', 'Volgarr', '1989-02-15', 'C/Saturn', '08208', 'Terrassa', 'user1234@empresa3.com', 4),
(34, '72346678Y', '9314747478', 'Kilian', 'Jove', 'Prat', '1996-11-11', 'Av. Meridiana', '08080', 'Barcelona', 'kijo@empresa2.com', 4),
(35, '87474433T', '6541484885', 'Marc', 'Carner', 'Topet', '1998-02-12', 'C/Plà de vall', '08203', 'Sabadell', 'marc@empresa.es', 4),
(36, '12352848F', '9370101011', 'Pilar', 'Raholo', 'Pol', '1999-03-13', 'C/Prim', '08206', 'Sabadell', 'pilar@empresa.es', 4),
(37, '12541748Y', '6001548754', 'Joan', 'Tristán', 'Cabrera', '1993-02-21', 'C/Fuster', '08205', 'Sabadell', 'joantri@empresa2.es', 2),
(38, '87458475T', '9365858587', 'Eva', 'Llonganissa', 'Rodríguez', '1986-12-21', 'C/Forns', '08080', 'Barcelona', 'evallong@empresa2.cat', 1),
(39, 'Y1234568R', '6021414144', 'Yurina', 'Kurshova', '', '1986-06-19', 'C/Plà de vall', '08203', 'Sabadell', 'yurina@empresa.es', 7),
(40, 'X1258585E', '9325252547', 'Wilmer', 'Prado', 'Campos', '1976-05-10', 'Avda. de la Pau', '08206', 'Sabadell', 'wilmerprado@empresa2.es', 9);




