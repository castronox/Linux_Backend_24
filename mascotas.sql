-- CIFO Vallès, CIFO La Violeta
-- Robert Sallent

-- EJERCICIO 3: MASCOTAS
-- Última revisión 27/01/2023

-- elimina la base de datos mascota si existe
DROP DATABASE IF EXISTS EJERCICIO_03_mascotas;

-- crea la base de datos mascotas
CREATE DATABASE EJERCICIO_03_mascotas 
	DEFAULT CHARACTER SET utf8mb4 
    COLLATE utf8mb4_general_ci;

-- usa la base de datos mascotas
USE EJERCICIO_03_mascotas;

-- crea la tabla tipos
CREATE TABLE IF NOT EXISTS tipos (
  id int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(64) NOT NULL,
  descripcion text NOT NULL
);

-- crea la tabla razas
CREATE TABLE IF NOT EXISTS razas (
  id int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(64) NOT NULL,
  descripcion text NOT NULL,
  idtipo int NOT NULL,
  
  FOREIGN KEY (idtipo) REFERENCES tipos (id) 
	ON UPDATE CASCADE ON DELETE RESTRICT 
);

-- crea la tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id int AUTO_INCREMENT PRIMARY KEY,
  user varchar(16) NOT NULL UNIQUE KEY,
  pass varchar(32) NOT NULL,
  nombre varchar(32) NOT NULL,
  apellidos varchar(128) NOT NULL,
  email varchar(128) NOT NULL UNIQUE KEY,
  direccion varchar(256) NOT NULL,
  poblacion varchar(128) NOT NULL,
  provincia varchar(128) NOT NULL,
  cp char(5) NOT NULL
);

-- crea la tabla mascotas
CREATE TABLE IF NOT EXISTS mascotas (
  id int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(64) NOT NULL,
  sexo char(1) NOT NULL COMMENT 'M macho, H hembra',
  biografia text NOT NULL,
  nacimiento date NOT NULL,
  fallecimiento date DEFAULT NULL,
  idusuario int NOT NULL,
  idraza int NOT NULL,
  
  FOREIGN KEY (idusuario) REFERENCES usuarios (id) 
	ON UPDATE CASCADE ON DELETE CASCADE ,
  
  FOREIGN KEY (idraza) REFERENCES razas (id) 
	ON UPDATE CASCADE ON DELETE RESTRICT 
 );
 
 -- crea la tabla fotos
CREATE TABLE IF NOT EXISTS fotos(
  id int AUTO_INCREMENT PRIMARY KEY,
  fichero varchar(256) NOT NULL,
  ubicacion varchar(128) DEFAULT NULL,
  idmascota int NOT NULL,
  
  FOREIGN KEY (idmascota) REFERENCES mascotas (id) 
	ON UPDATE CASCADE ON DELETE CASCADE 
);
 
-- inserta los registros en la tabla tipos
INSERT INTO tipos(id, nombre, descripcion) VALUES
(1, 'Leon', 'Felino grande que vive en la selva.'),
(2, 'Gato', 'Felino doméstico autónomo.'),
(3, 'Paquidermo', 'Animal muy grande'),
(4, 'Pájaro', 'Animal pequeño y ruidoso'),
(5, 'Reptil', 'Animal de sangre fría que repta'),
(6, 'Gamusino', 'Animal autóctono de España, Portugal y Cuba'),
(7, 'Perro', 'Animal doméstico y para guardar cabras'),
(8, 'Pez', 'Animales acuáticos olvidadizos'),
(9, 'Cobaya', 'Animalillo chillón que siempre tiene hambre'),
(10, 'Oveja', 'Animal que da lana y leche para hacer buenos quesos');

-- inserta las razas
INSERT INTO razas(id, nombre, descripcion, idtipo) VALUES
(1, 'León africano', 'León de la jungla africana', 1),
(2, 'Persa', 'Gato peludo', 2),
(3, 'Siamés', 'Gato blanco de cara negra', 2),
(4, 'Elefante', 'Gran animal con trompa', 3),
(5, 'Gorrión', 'Pájaro urbano', 4),
(6, 'Canario', 'Pájaro doméstico cantarín, de color amarillo', 4),
(7, 'Jilguero', 'Pájaro cantarín de colorines', 4),
(8, 'Cotorra', 'Pájaro hablador, bastante molesto', 4),
(9, 'Camaleón', 'Reptil pequeño que muta de color', 5),
(10, 'Boa', 'Gran serpiente', 5),
(11, 'Dragón', 'Pequeño reptil', 5),
(12, 'Gamusino extremeño', 'Gamusino propio de los campos de Badajoz', 6),
(13, 'Dogo', 'Perro de gran tamaño', 7),
(14, 'Bulldog', 'Perro gordo con problemas en los ojos y en el parto', 7),
(15, 'Yorkshire', 'Perro pequeño color gris', 7),
(16, 'Dálmata', 'Perro blanco con manchas negras', 7),
(17, 'Galgo', 'Perro muy delgado y muy rápido', 7),
(18, 'Bichón Maltés', 'Perro peludo, blanco y pequeño', 7),
(19, 'Carpa', 'Pez muy habitual en jardines japoneses', 8),
(20, 'Ojos de burbuja', 'Pez con ojos muy grandes que te mira raro', 8),
(21, 'Oveja escocesa', 'Oveja con falda a cuadros', 10);

-- inserta en la tabla usuarios
INSERT INTO usuarios(id, user, pass, nombre, apellidos, email, direccion, poblacion, provincia, cp) VALUES
(1, 'albertito', '1234', 'alberto', 'sanchez', 'alberto02@gmail.com', 'C/Provenza', 'Terrassa', 'Barcelona', '08023'),
(2, 'andreu', '1234', 'Andrade', 'Campo Sol', 'andreu@yahoo.com', 'C/Pinar', 'Manresa', 'Barcelona', '08265'),
(3, 'Antoninos', '1234', 'Antonio', 'Manao Cetruera', 'amc@vetetuasaber.com', 'C/Manresa, 75', 'Cornellá Ll', 'Barcelona', '08037'),
(4, 'berto', '1234', 'Berto', 'Matt', 'bertomatt@gmail.com', 'C/Pepairas', 'Sabadell', 'Barcelona', '08204'),
(5, 'carlota95', '1234', 'carlota', 'perez', 'carlota1955@gmail.com', 'pl. Dr. Robert', 'Sabadell', 'Barcelona', '08207'),
(6, 'cinguango', '1234', 'David', 'Smith Wesson', 'smith@gmail.com', 'C/Corral', 'Sabadell', 'Barcelona', '08206'),
(7, 'davidito', '1234', 'david', 'lopez', 'david07@gmail.com', 'C/Manresa', 'Ripollet', 'Barcelona', '02145'),
(8, 'Elemental33', '1234', 'Esteban', 'Martínez Gómez', 'martinezgomez@gmail.com', 'C/Dominó', 'Bellaterra', 'Barcelona', '08318'),
(9, 'felipo', '1234', 'Felipe', 'Sanchez Perez', 'felipesanchez@yahoo.com', 'Pasaje Ribatallada', 'Sabadell', 'Barcelona', '08206'),
(10, 'francisco', '1234', 'fran', 'garcia toledo', 'frangar@yahoo.es', 'C/del Alamo', 'Terrassa', 'Barcelona', '08222'),
(11, 'Hommer', '1234', 'Hommer', 'Simpson', 'hommer@gmail.com', 'C/Avenida siempre viva 742', 'Springfield', 'Massachusetts', '01101'),
(12, 'Juanico', '1234', 'Juan', 'Mariano Garcia', 'jmg@vetetuasaber.com', 'C/Guantánamo, 61', 'Badalona', 'Barcelona', '08114'),
(13, 'jupe', '1234', 'Juan', 'Perez', 'juan@gmail.com', 'C/Tamarit 53', 'Sabadell', 'Barcelona', '08021'),
(14, 'lola', '1234', 'Dolores', 'Pepin ocho', 'lola@yahoo.com', 'C/Sierra', 'Rio Tinto', 'Huelva', '34565'),
(15, 'lolailo', '1234', 'Lolo', 'Cercezo', 'lolailo@hotmail.es', 'C/Quetedije', 'Terrassa', 'Barcelona', '08208'),
(16, 'maica', '1234', 'maica', 'ferrer cas', 'maica@gmail.com', 'pl. Cerca', 'viladecavalls', 'barcelona', '08220'),
(17, 'manu', '1234', 'manuel', 'ferrero caso', 'manu@gmail.com', 'pl. de la vila', 'barcelona', 'barcelona', '08025'),
(18, 'maria', '1234', 'Maria', 'Leon Grados', 'marialg@hotmail.com', 'C/Rambla', 'Sabadell', 'Barcelona', '08201'),
(19, 'mayelakb', '1234', 'Filomeno', 'De los Palotes', 'palotesfilemon@yahoo.com', 'C/Sallares i Plà', 'Sabadell', 'Barcelona', '08201'),
(20, 'manolo', '1234', 'Manolo', 'Rodriguez Sánchez', 'manolico@vetetuasaber.com', 'c/Fondo, 5', 'Hospitalet Ll', 'Barcelona', '08015'),
(21, 'mortadelo', '1234', 'Filemon', 'Carmona Gonzalez', 'Mortadelo@gmail.com', 'C/13 Rue del Percebe', 'Sabadell', 'Barcelona', '08206'),
(22, 'one', '1234', 'oscar', 'nicolas espino', 'one@msn.com', 'C/Constantí', 'Sabadell', 'Barcelona', '08206'),
(23, 'pepe', '1234', 'José', 'López López', 'pepelopezlopez@hotmail.com', 'C/Pinos', 'Sabadell', 'Barcelona', '08205'),
(24, 'programeitor', '1234', 'Friki', 'Frikazo', 'frikifrikazo@gmail.com', 'pl. del Mas Allá', 'Rubí', 'Barcelona', '08218'),
(25, 'tito', '1234', 'Carlos', 'Martinez Luengo', 'titocm@gmail.com', 'C/Lacy', 'Sabadell', 'Barcelona', '08202'),
(26, 'txema', '1234', 'Jesús', 'Arias Pur', 'txema@gmail.com', 'C/Provença 50', 'Barcelona', 'Barcelona', '08029'),
(27, 'yek', '1234', 'Yesika', 'lopez', 'yesika@gmail.com', 'C/Canigo 90', 'Terrassa', 'Barcelona', '08211'),
(28, 'zenvi', '1234', 'Unai', 'guillen', 'unai@gmail.com', 'C/Nord 32', 'Ripollet', 'Barcelona', '08222'),
(29, 'musta', '1234', 'Mustafa', 'Zidane', 'musta@gmail.com', 'C/Albada 3', 'Terrassa', 'Barcelona', '08200'),
(30, 'toysobao', '1234', 'Pablo', 'López', 'palosobao@hotmail.com', 'av. Budapest', 'Sabadell', 'Barcelona', '08206'),
(31, 'tika26', '1234', 'Lorena', 'Tikashinskaia', 'lotika@hotmail.com', 'av. Vallés', 'Cerdanyola', 'Barcelona', '08108');

-- inserta en la tabla mascotas
INSERT INTO mascotas(id, nombre, sexo, biografia, nacimiento, fallecimiento, idusuario, idraza) VALUES
(1, 'Toby', 'M', 'Mascota muy graciosa', '2009-11-16', NULL, 1, 2),
(2, 'Chuli', 'H', 'Mascota de la família desde hace muchos años', '2014-04-14', NULL, 1, 3),
(3, 'Cali', 'M', 'Animal que hace mucha compañía', '2006-09-04', '2014-12-10', 2, 9),
(4, 'Rocky', 'M', 'El alma de la casa', '2009-09-17', NULL, 2, 8),
(5, 'Tin', 'M', 'Bicho bastante molesto que anda por casa', '2009-08-29', NULL, 3, 15),
(6, 'Pancho', 'M', 'La mascota de mi hija', '2015-02-12', '2015-05-03', 3, 15),
(7, 'Comotu', 'M', 'No hace nada más que comer y dormir', '2010-03-27', NULL, 5, 2),
(8, 'Ally', 'H', 'Salta, corre, baila y hace el pino', '2012-05-11', NULL, 5, 12),
(9, 'Perri', 'H', 'Animalillo que encontramos y adoptamos', '2011-07-17', NULL, 5, 17),
(10, 'Rock', 'M', 'Es muy divertido', '2002-12-07', NULL, 6, 9);

INSERT INTO mascotas(id, nombre, sexo, biografia, nacimiento, fallecimiento, idusuario, idraza) VALUES
(11, 'Tali', 'M', 'Lo cogimos en adopción', '2004-09-16', NULL, 6, 9),
(12, 'Molli', 'H', 'Proviene de la protectora de Mataró', '2008-02-26', '2015-05-31', 6, 6),
(13, 'Wilson', 'M', 'Ha pasado mucho tiempo con nosotros', '2015-05-25', NULL, 7, 10),
(14, 'Lucy', 'H', 'Es un animal muy inteligente', '2015-06-11', '2015-07-25', 9, 9),
(15, 'Cas', 'M', 'Es torpe, gordo y se tira pedos', '2005-09-13', '2014-06-18', 10, 6),
(16, 'Peltu', 'M', 'No hace más que girar sobre sí mismo', '2014-07-18', NULL, 10, 3),
(17, 'Peludo', 'M', 'La abuela le tiene mucho cariño', '2006-03-27', NULL, 11, 13),
(18, 'Luna', 'H', 'No sabemos de dónde procede', '2012-04-29', '2015-01-07', 11, 16),
(19, 'Pancho', 'M', 'Nos lo encontramos en una gasolinera', '2013-09-20', NULL, 12, 4),
(20, 'Spider', 'M', 'El anterior dueño no lo podía cuidar', '2002-10-14', '2002-12-16', 13, 16);

INSERT INTO mascotas(id, nombre, sexo, biografia, nacimiento, fallecimiento, idusuario, idraza) VALUES
(21, 'Mack', 'M', 'Va cada verano a un hotel para mascotas', '2013-01-18', '2015-05-31', 14, 1),
(22, 'Rulo', 'M', 'Nos hace dejarnos la pasta en el veterinario', '2010-09-16', NULL, 15, 13),
(23, 'Resti', 'H', 'Duerme en un colchón en el comedor', '2007-10-07', NULL, 15, 14),
(24, 'Festa', 'H', 'Se hace pis por toda la casa', '2014-12-25', '2015-01-09', 16, 8),
(25, 'Black', 'M', 'Sabe contar los números del 1 al 10', '2005-05-16', '2005-09-18', 16, 11),
(26, 'Nico', 'M', 'Es capaz de arrastrar un trineo', '2007-01-22', NULL, 16, 15),
(27, 'Tayo', 'M', 'Muerde el parachoques del coche cuando salimos', '2005-10-18', '2015-01-08', 16, 16),
(28, 'Multto', 'M', 'Corre como un galgo', '2009-04-16', '2014-06-20', 17, 6),
(29, 'Ari', 'H', 'Había vivido en una pensión de mala muerte', '2013-03-14', '2015-03-17', 17, 12),
(30, 'Licky', 'H', 'Vive una vida feliz', '2008-12-04', NULL, 17, 11);

INSERT INTO mascotas(id, nombre, sexo, biografia, nacimiento, fallecimiento, idusuario, idraza) VALUES
(31, 'Uma', 'H', 'Tiene su propio cojín en casa', '2010-12-21', '2014-12-06', 17, 4),
(32, 'Fraile', 'M', 'Suele vomitar en la terraza', '2008-11-13', NULL, 18, 3),
(33, 'Monchi', 'M', 'Juega con la pelota de tenis habitualmente', '2009-10-02', '2014-11-02', 18, 14),
(34, 'Acas', 'M', 'Es super silencioso', '2013-03-08', NULL, 19, 6),
(35, 'Paquete', 'M', 'Sabe saltar a la comba', '2009-07-19', NULL, 20, 4),
(36, 'Bartolo', 'M', 'Algún día huirá de casa', '2007-08-20', '2014-10-05', 20, 14),
(37, 'Julipa', 'H', 'Come chorizo y eructa', '2005-10-28', '2015-03-05', 20, 5),
(38, 'Tenor', 'M', 'Lo atropellaron y se convirtió en mascota-zombi', '2002-02-26', NULL, 21, 7),
(39, 'Tula', 'H', 'Protagonizó un capítulo con Lassie', '2014-04-12', NULL, 22, 7),
(40, 'Milito', 'M', 'Es amigo de Rex el perro policía', '2001-04-30', '2015-01-09', 22, 8);

INSERT INTO mascotas(id, nombre, sexo, biografia, nacimiento, fallecimiento, idusuario, idraza) VALUES
(41, 'Merri', 'H', 'Tiene sabañones', '2003-02-20', '2015-01-01', 23, 13),
(42, 'Chris', 'M', 'No le gustan los petardos', '2001-05-17', '2014-12-06', 23, 1),
(43, 'Uma', 'H', 'Huye de mi hermano pequeño', '2011-12-19', '2015-01-17', 24, 10),
(44, 'Ferri', 'M', 'Tenía una mancha negra', '2015-05-25', '2017-06-01', 24, 10),
(45, 'Tobi', 'M', 'Tiene la lengua exageradamente larga', '2017-11-25', NULL, 26, 14),
(46, 'Lassie', 'L', 'Grande y peluda', '2018-10-07', NULL, 26, 15),
(47, 'Hippie', 'M', 'Peludo y pequeño', '2014-12-25', NULL, 27, 15),
(48, 'Millo', 'M', 'Tiene la lengua exageradamente larga', '2010-10-08', NULL, 28, 14),
(49, 'Albi', 'H', 'Es una gran compañía', '2012-02-15', NULL, 28, 3),
(50, 'Terrano', 'M', 'Sabe jugar y saltar', '2013-02-10', NULL, 29, 14);

INSERT INTO mascotas(id, nombre, sexo, biografia, nacimiento, fallecimiento, idusuario, idraza) VALUES
(51, 'Tini', 'M', 'Perro travieso y poco inteligente', '2019-12-10', NULL, 29, 16),
(52, 'Toby', 'M', 'Perro de compañía para personas ciegas', '2010-12-10', '2019-12-10', 30, 16),
(53, 'Fruski', 'M', 'Perro gracioso, que no hace gran cosa en todo el día', '2013-02-05', NULL, 30, 18),
(54, 'Troncho', 'M', 'No hace nada', '2002-02-26', '2007-05-12', 31, 20),
(55, 'Mustaco', 'M', 'Tiene bigote y corre que se las pela', '2019-12-10', '2020-12-10', 31, 19);

-- inserta en la tabla fotos
INSERT INTO fotos(id, fichero, ubicacion, idmascota) VALUES
(1, 'imagen1361.jpg', 'Barcelona', 18),
(2, 'imagen1346.jpg', 'Barcelona', 31),
(3, 'imagen938.jpg', 'Barcelona', 3),
(4, 'imagen369.jpg', 'Barcelona', 32),
(5, 'imagen46.jpg', 'Barcelona', 7),
(6, 'imagen422.jpg', 'Barcelona', 39),
(7, 'imagen1667.jpg', 'Barcelona', 10),
(8, 'imagen1144.jpg', 'Barcelona', 46),
(9, 'imagen1682.jpg', 'Sabadell', 30),
(10, 'imagen881.jpg', 'Sabadell', 9),
(11, 'imagen1196.jpg', 'Sabadell', 26),
(12, 'imagen1760.jpg', 'Sabadell', 7),
(13, 'imagen754.jpg', 'Sabadell', 30),
(14, 'imagen122.jpg', 'Terrassa', 25),
(15, 'imagen157.jpg', 'Terrassa', 5),
(16, 'imagen1736.jpg', 'Terrassa', 16),
(17, 'imagen746.jpg', 'Terrassa', 6),
(18, 'imagen1050.jpg', 'Terrassa', 38),
(19, 'imagen190.jpg', 'Terrassa', 27),
(20, 'imagen1852.jpg', 'Sant Cugat', 22),
(21, 'imagen121.jpg', 'Sant Cugat', 22),
(22, 'imagen983.jpg', 'Sant Cugat', 32),
(23, 'imagen977.jpg', 'Sant Cugat', 39),
(24, 'imagen1363.jpg', 'Murcia', 28),
(25, 'imagen363.jpg', 'Terrassa', 21),
(26, 'imagen163.jpg', 'Murcia', 48),
(27, 'imagen133.jpg', 'Alicante', 28),
(28, 'imagen689.png', 'Alicante', 12),
(29, 'imagen348.jpg', 'Alicante', 38),
(30, 'imagen63.jpg', 'Valencia', 7),
(31, 'imagen1243.jpg', 'Cartagena', 23),
(32, 'imagen1964.jpg', 'Madrid', 7),
(33, 'imagen1252.jpg', 'Madrid', 12),
(34, 'imagen456.png', 'Madrid', 17),
(35, 'imagen1415.jpg', 'Madrid', 3),
(36, 'imagen1414.jpg', 'Madrid', 15),
(37, 'imagen289.jpg', 'Madrid', 22),
(38, 'imagen312.jpg', 'Madrid', 6),
(39, 'imagen203.jpg', 'Madrid', 16),
(40, 'imagen1263.png', 'Madrid', 10),
(41, 'imagen127.jpg', 'San Sebastián', 28),
(42, 'imagen1187.jpg', 'San Sebastián', 31),
(43, 'imagen563.jpg', 'Sabadell', 13),
(44, 'imagen1981.jpg', 'Bilbao', 26),
(45, 'imagen1604.jpg', 'Bilbao', 1),
(46, 'imagen1377.png', 'Bilbao', 12),
(47, 'imagen283.jpg', 'Bilbao', 9),
(48, 'imagen166.jpg', 'Bilbao', 17),
(49, 'imagen877.jpg', 'Manchester', 3),
(50, 'imagen1107.jpg', 'Manchester', 39),
(51, 'imagen1359.png', 'New York', 32),
(52, 'imagen849.jpg', 'New York', 32),
(53, 'imagen1615.jpg', 'New York', 16),
(54, 'imagen784.jpg', 'Valencia', 28),
(55, 'imagen1244.jpg', 'Valencia', 26),
(56, 'imagen1822.jpg', 'Valencia', 27),
(57, 'imagen1863.jpg', 'Sabadell', 49),
(58, 'imagen1595.gif', 'La Coruña', 8),
(59, 'imagen1108.jpg', 'La Coruña', 21),
(60, 'imagen2363.jpg', 'Sabadell', 10),
(61, 'imagen1373.jpg', 'La Coruña', 15),
(62, 'imagen474.png', 'La Coruña', 27),
(63, 'imagen1477.jpg', 'La Coruña', 12),
(64, 'imagen1847.jpg', 'Lima', 48),
(65, 'imagen641.jpg', 'Manresa', 11),
(66, 'imagen1994.jpg', 'Pamplona', 36),
(67, 'imagen845.gif', 'Pamplona', 30),
(68, 'imagen1161.jpg', 'Pamplona', 38),
(69, 'imagen1386.jpg', 'Manresa', 20),
(70, 'imagen1073.jpg', 'Pamplona', 8),
(71, 'imagen893.jpg', 'Pamplona', 21),
(72, 'imagen1768.jpg', 'Pamplona', 31),
(73, 'imagen1778.gif', 'Pamplona', 28),
(74, 'imagen4363.jpg', 'Sabadell', 40),
(75, 'imagen1302.jpg', 'Pamplona', 36),
(76, 'imagen3.jpg', 'Sabadell', 38),
(77, 'imagen1.jpg', 'Sabadell', 48),
(78, 'imagen1987.gif', 'Sant Quirze', 47),
(79, 'imagen1599.jpg', 'Sant Quirze', 35),
(80, 'imagen433.jpg', 'Sabadell', 42),
(81, 'imagen59.jpg', 'Sant Quirze', 23),
(82, 'imagen1144.jpg', 'Barcelona', 31),
(83, 'imagen1243.jpg', 'Barcelona', 4),
(84, 'imagen497.png', 'Terrassa', 11),
(85, 'imagen685.jpg', 'Barcelona', 6),
(86, 'imagen284.png', 'Pamplona', 3),
(87, 'imagen730.jpg', 'Barcelona', 34),
(88, 'imagen1873.jpg', 'Irún', 18),
(89, 'imagen364.jpg', 'Barcelona', 8),
(90, 'imagen1442.jpg', 'El Bierzo', 2),
(91, 'imagen342.jpg', 'Barcelona', 35),
(92, 'imagen4443.jpg', 'Sant Quirze', 25),
(93, 'imagen2222.jpg', 'Barcelona', 15),
(94, 'imagen1212.jpg', 'Sant Cugat', 25),
(95, 'imagen45.png', 'Sant Celoni', 22),
(96, 'imagen544.jpg', 'Sant Celoni', 5),
(97, 'imagen345.gif', 'Barcelona', 7),
(98, 'imagen234.jpg', 'Manresa', 3),
(99, 'imagen654.jpg', 'Sallent', 4),
(100, 'imagen4142.jpg', 'Barcelona', 1),
(101, 'imagen334.jpg', 'Barcelona', 47),
(102, 'imagen5543.jpg', 'Sant Quirze', 47),
(103, 'imagen522.jpg', 'Terrassa', 47),
(104, 'imagen125.jpg', 'Sant Cugat', 48),
(105, 'imagen4555.png', 'Sabadell', 49),
(106, 'imagen5434.jpg', 'Sant Celoni', 50),
(107, 'imagen3345.gif', 'Barcelona', 51),
(108, 'imagen2344.jpg', 'Manresa', 51),
(109, 'imagen6554.jpg', 'Cali', 52),
(110, 'imagen3442.jpg', 'Murcia', 46),
(111, 'imagen3114.jpg', 'Barcelona', 46),
(112, 'imagen5143.jpg', 'Sant Quirze', 46),
(113, 'imagen5112.jpg', 'Terrassa', 45),
(114, 'imagen1211.jpg', 'Sant Cugat', 44),
(115, 'imagen1155.png', 'Sabadell', 44),
(116, 'imagen1414.jpg', 'Sant Celoni', 51),
(117, 'imagen3141.gif', 'Barcelona', 40),
(118, 'imagen2141.jpg', 'Manresa', 39),
(119, 'imagen1154.jpg', 'Cali', 38),
(120, 'imagen43112.jpg', 'La Coruña', 37),
(121, 'imagen1334.jpg', 'Barcelona', 53),
(122, 'imagen15543.jpg', 'Sant Quirze', 53),
(123, 'imagen1522.jpg', 'La Coruña', 47),
(124, 'imagen1125.jpg', 'Sant Cugat', 48),
(125, 'imagen14555.png', 'Sabadell', 53),
(126, 'imagen24535.png', 'Sant Celoni', 55);
