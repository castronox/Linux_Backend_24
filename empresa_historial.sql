-- CIFO Vallès, CIFO La Violeta
-- Robert Sallent

-- EJERCICIO 2 (Empresa con historial)
-- Última revisión 20/12/2021

-- Eliminar la BDD anterior (si existe)
DROP DATABASE IF EXISTS EJERCICIO_02_empresa_historial;

-- Crear la BDD 
CREATE DATABASE EJERCICIO_02_empresa_historial 
	DEFAULT CHARACTER SET utf8mb4 
	COLLATE utf8mb4_general_ci;

-- Usar la BDD 
USE EJERCICIO_02_empresa_historial;

-- CREACIÓN DE LAS TABLAS
-- creación de la tabla departamentos
CREATE TABLE departamentos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(8) NOT NULL UNIQUE KEY,
	nombre VARCHAR(32) NOT NULL,
	descripcion TEXT NULL,
	presupuesto DOUBLE NOT NULL,
	maxtrabajadores INT NOT NULL
);

-- creación de la tabla trabajadores
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
	email VARCHAR(128) NOT NULL UNIQUE KEY
);

-- creación de la tabla intermedia
CREATE TABLE periodos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	idtrabajador INT NOT NULL,
	iddepartamento INT NOT NULL,
	inicio DATE NOT NULL,
	fin DATE NULL DEFAULT NULL,

	FOREIGN KEY (idtrabajador) REFERENCES trabajadores(id)
		ON UPDATE CASCADE 
		ON DELETE RESTRICT,

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
INSERT INTO trabajadores (id, dni, ss, nombre, apellido1, apellido2, nacimiento, direccion, cp, poblacion, email) VALUES
(1, '11111111A', '6541111111', 'Pepito', 'Pérez', 'Padilla', '1990-01-01', 'C/Pallars 35', '08206', 'Sabadell', 'pepito@empresa.com'),
(2, '22222222B', '6662222222', 'Margarita', 'Lozano', 'Quesada', '2000-11-12', 'C/Tres Creus', '08200', 'Sabadell', 'margaa@empresa.com'),
(3, '33333333C', '6854333333', 'Julián', 'Rodrigo', 'Martín', '1965-05-06', 'Pl. Trafalgar', '28025', 'Badalona', 'juli@empresa.com'),
(4, '44444444D', '9344444444', 'Fausto', 'Remo', 'Sallarès', '1980-03-10', 'C/Martorell', '08206', 'Sabadell', 'faust@empresa.com'),
(5, '55555555E', '9355555555', 'Eva', 'Martín', 'Perea', '2001-03-18', 'C/Baixadors', '08082', 'Barcelona', 'eva@empresa.com'),
(6, '66666666F', '6546666666', 'Unai', 'Terrón', 'Lechón', '1990-01-04', 'C/Vallvidrera', '08100', 'Hospitalet de Llobregat', 'unai@empresa.com'),
(7, '77777777H', '7777777777', 'Jazmín', 'Ortiz', 'Ortega', '2000-07-12', 'C/Ferran', '08300', 'Sant Cugat del Vallès', 'jazmin@empresa.com'),
(8, '88888888Y', '6558888888', 'Julián', 'Mengano', 'Torrecilla', '1959-04-02', 'Pl Terrassa', '08205', 'Sabadell', 'juli@empresa2.com'),
(9, '32345678Z', '933456789447', 'Irene', 'Amador', 'Padilla', '2002-01-01', 'C/Aranda', '28081', 'Barcelona', 'irene@empresa2.com'),
(10, '28765432S', '9376543214564', 'Tomás', 'Roncano', 'Broncas', '1990-09-12', 'C/Peral', '08125', 'Terrassa', 'broncas@empresa2.com'),
(11, '42145687S', '93145685442', 'Jennifer', 'Jones', 'Scrabble', '1982-10-01', 'C/Rocafort', '08100', 'Terrassa', 'scrabble@empresa2.com'),
(12, '59988877M', '93744487495', 'Olga', 'Martín', 'Campillo', '1978-11-12', 'C/Faust', '28025', 'Cornellà de Llobregat', 'campimart@empresa.com'),
(13, '98745854R', '937654828817', 'Miriam', 'Peñas', 'Uribarri', '1995-12-14', 'C/Requesón', '08204', 'Sabadell', 'miri@empresa.com'),
(14, '47474856T', '9336548586', 'Tristán', 'Vall', 'Roca', '1971-10-05', 'Pl. Santa Coloma', '08000', 'Hospitalet de Llobregat', 'trivaro@empresa.com'),
(15, '48478745Y', '9318789548', 'Laura', 'Casado', 'Castillejo', '1983-03-25', 'Carretera de Mollet', '08400', 'Granollers', 'lauri@empresa.com'),
(16, '98268452G', '9311815145', 'Pol', 'Sanchis', 'Llopis', '1965-02-28', 'Pl. Tarraco', '08205', 'Sabadell', 'pol@empresa2.com'),
(17, '12365478G', '9332541251', 'Francina', 'Amat', 'Margalef', '1987-04-07', 'Rambla Pallars', '28065', 'Barcelona', 'fran@empresa.com'),
(18, '44455587H', '9374584585', 'Yulianna', 'Vargas', 'Tucalpeca', '1978-12-08', 'C/Barcanova', '08210', 'Terrassa', 'yuli@empresa.com'),
(19, '11447747Y', '9354141214', 'Marcos', 'Montoliu', 'Montornés', '1992-04-07', 'C/Miranda', '08600', 'Caldes de Montbui', 'mari@empresa.com'),
(20, '98778745P', '9371216585', 'Laura', 'Escola', 'Vilaplana', '1980-07-09', 'C/Guardiola', '08202', 'Sabadell', 'lau@empresa.com'),
(21, '98778743P', '9371214343', 'Marta', 'Escola', 'Vilaplana', '1980-07-09', 'C/Guardiola', '08202', 'Sabadell', 'mar@empresa.com'),
(22, '98745874B', '9354741213', 'Montserrat', 'Valdelplà', 'Mas', '1986-05-09', 'C/Comerç', '08008', 'Barcelona', 'mon@empresa.com'),
(23, '12123423B', '9322332321', 'Gonzalo', 'Pereira', 'Millo', '1976-04-19', 'C/Comerç', '08008', 'Barcelona', 'gonzo@empresa.com'),
(24, '98754896D', '9312345658', 'Juan', 'Marcelo', 'Trigo', '1986-12-09', 'C/Silverado', '08018', 'Barcelona', 'marce@empresa.com'),
(25, '23154857E', '9374561255', 'Maribel', 'Porta', 'Espejo', '1996-11-01', 'Ctra. Terrassa', '08108', 'Rubí', 'maribel@empresa2.com'),
(26, '12348785E', '9335285254', 'Rosa', 'Flores', 'Espinosa', '1990-01-30', 'Ctra. Barcelona', '08200', 'Sant Cugat', 'florida@yahoo.com'),
(27, '23452342E', '9301230000', 'Oriol', 'Llac', 'Pi', '1980-12-10', 'C/Calders', '08203', 'Sabadell', 'ollapi@gmail.com'),
(28, '12342342E', '9300012345', 'Juan', 'Contreras', 'Galtes', '1990-12-05', 'C/Provença', '08203', 'Sabadell', 'juanco@empresa.com'),
(29, '85474845R', '9312345000', 'Pep', 'Margalef', 'Perelló', '1984-10-17', 'C/Entença', '08207', 'Terrassa', 'pepa@empresa3.com'),
(30, '23434323T', '9388575847', 'Eloi', 'Roncero', 'Tiberius', '1986-02-19', 'C/Mercurio', '08203', 'Sabadell', 'erito@empresa2.es'),
(31, '34233433U', '9381484885', 'Josep', 'Farner', 'Coll', '1966-12-31', 'C/Plà de vall', '08203', 'Sabadell', 'josepi@empresa.com'),
(32, 'X1212458R', '9314785142', 'Yulia', 'Pino', 'Salazar', '1986-02-01', 'Ctra. Vallromanes', '08003', 'Masnou', 'yulipi@aol.mx'),
(33, 'Y4435413Y', '6524145414', 'Sergei', 'Markof', 'Volgarr', '1989-02-15', 'C/Saturn', '08208', 'Terrassa', 'user1234@empresa3.com'),
(34, '72346678Y', '9314747478', 'Kilian', 'Jove', 'Prat', '1996-11-11', 'Av. Meridiana', '08080', 'Barcelona', 'kijo@empresa2.com'),
(35, '87474433T', '6541484885', 'Marc', 'Carner', 'Topet', '1996-05-11', 'C/Plà de vall', '08203', 'Sabadell', 'marc@empresa.es'),
(36, '12352848F', '9370101011', 'Pilar', 'Raholo', 'Pol', '1999-03-13', 'C/Prim', '08206', 'Sabadell', 'pilar@empresa.es'),
(37, '12541748Y', '6001548754', 'Joan', 'Tristán', 'Cabrera', '1993-02-21', 'C/Fuster', '08205', 'Sabadell', 'joantri@empresa2.es'),
(38, '87458475T', '9365858587', 'Eva', 'Llonganissa', 'Rodríguez', '1986-12-21', 'C/Forns', '08080', 'Barcelona', 'evallong@empresa2.cat'),
(39, 'Y1234568R', '6021414144', 'Yurina', 'Kurshova', '', '1986-06-19', 'C/Plà de vall', '08203', 'Sabadell', 'yurina@empresa.es'),
(40, 'X1258585E', '9325252547', 'Wilmer', 'Prado', 'Campos', '1976-05-10', 'Avda. de la Pau', '08206', 'Sabadell', 'wilmerprado@empresa2.es');

INSERT INTO periodos(id, idtrabajador, iddepartamento, inicio, fin) VALUES
(1,1,5, '2000-01-01', '2010-05-12'),
(2,1,6, '2010-05-13', '2015-10-01'),
(3,1,8, '2015-10-02', '2016-12-31'),
(4,2,6, '2000-01-10', NULL),
(5,3,1, '2010-01-25', '2015-01-01'),
(6,3,2, '2015-01-02', NULL),
(7,4,3, '2008-03-07', '2015-12-31'),
(8,5,3, '2000-11-05', '2010-01-01'),
(9,5,4, '2012-01-20', '2018-02-11'),
(10,6,7, '2020-01-01', NULL),
(11,7,9, '2007-11-09', '2008-01-01'),
(12,7,10, '2008-01-02', '2009-01-01'),
(13,7,1, '2009-01-02', '2010-01-01'),
(14,7,2, '2010-01-02', '2011-01-01'),
(15,7,3, '2011-01-02', NULL),
(16,8,9, '2002-01-01', '2009-01-01'),
(17,9,8, '2008-01-02', '2009-01-01'),
(18,9,7, '2009-01-02', '2021-01-01'),
(19,10,4, '2007-11-22', '2009-01-01'),
(20,10,6, '2008-01-02', NULL),
(21,11,10, '2006-01-02', '2010-01-01'),
(22,12,5, '2000-08-09', '2020-11-21'),
(23,12,4, '2020-11-22', NULL),
(24,13,2, '2000-01-01', NULL),
(25,14,1, '2021-12-15', NULL),
(26,15,4, '2000-08-09', NULL),
(27,16,6, '2006-07-01', '2010-01-04'),
(28,16,5, '2010-01-05', '2016-03-01'),
(29,17,8, '2006-11-11', '2020-09-14'),
(30,17,3, '2020-09-15', NULL),
(31,18,1, '2004-01-01', '2020-01-01'),
(32,18,2, '2020-01-02', NULL),
(33,19,4, '2004-11-11', '2021-11-20'),
(34,19,6, '2021-11-21', NULL),
(35,20,10, '2010-02-09', NULL),
(36,21,6, '2001-01-11', '2021-12-16'),
(37,22,10, '1999-01-10', NULL),
(38,23,8, '2002-11-06', '2010-12-16'),
(39,23,9, '2010-12-17', '2021-12-16'),
(40,23,6, '2021-12-17', NULL),
(41,24,2, '1995-01-11', NULL),
(42,25,6, '2000-01-01', '2005-12-31'),
(43,25,7, '2006-01-01', '2007-12-31'),
(44,25,8, '2008-01-01', '2009-12-31'),
(45,26,4, '2005-01-01', NULL),
(46,27,6, '2002-01-01', NULL),
(47,28,2, '2013-11-12', '2017-12-31'),
(48,28,6, '2018-01-01', '2019-12-31'),
(49,28,7, '2020-01-01', NULL),
(50,29,5, '2018-01-01', '2019-12-31'),
(51,30,5, '2008-06-08', NULL),
(52,31,3, '2008-01-21', '2019-02-01'),
(53,31,6, '2019-02-02', '2021-02-01'),
(54,32,6, '2000-01-01', NULL),
(55,33,7, '2018-09-19', '2019-12-11'),
(56,34,6, '2008-01-21', '2009-12-31'),
(57,34,5, '2010-01-01', '2010-12-31'),
(58,35,6, '2008-01-21', '2009-01-21'),
(59,35,5, '2009-01-22', '2019-01-21'),
(60,35,6, '2019-01-22', '2021-01-21'),
(61,35,5, '2021-01-22', NULL),
(62,36,6, '2003-01-21', NULL),
(63,37,5, '2004-11-11', '2010-11-12'),
(64,38,6, '2005-01-21', NULL),
(65,39,5, '2003-01-10', '2010-01-10'),
(66,39,6, '2010-01-11', NULL),
(67,40,5, '2000-01-01', '2009-12-31'),
(68,40,6, '2010-01-01', '2019-12-31'),
(69,40,5, '2020-01-01', NULL);

