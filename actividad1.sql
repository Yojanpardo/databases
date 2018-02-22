CREATE DATABASE blanco;

CREATE TABLE clientes(
	cedula VARCHAR(10) PRIMARY KEY,
	primer_nombre VARCHAR(10) NOT NULL,
	segundo_nombre VARCHAR(10) NOT NULL DEFAULT '---',
	primer_apellido VARCHAR(10) NOT NULL,
	segundo_apellido VARCHAR(10) NOT NULL DEFAULT '---',
	direccion VARCHAR(50) NOT NULL,
	empresa VARCHAR(20) NOT NULL,
	ciudad VARCHAR(20) NOT NULL,
	pais VARCHAR(20) NOT NULL,
	fax VARCHAR(10) NOT NULL
);

CREATE TABLE productos(
	id VARCHAR(3) NOT NULL PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL,
	precio DECIMAL NOT NULL,
	impuestos INTEGER NOT NULL,
	imagen BYTEA
);

CREATE TABLE vendedores(
	cedula VARCHAR(10) NOT NULL PRIMARY KEY,
	primer_nombre VARCHAR(10) NOT NULL, 
	segundo_nombre VARCHAR(10) NOT NULL DEFAULT '---',
	primer_apellido VARCHAR(10) NOT NULL,
	segundo_apellido VARCHAR(10) NOT NULL DEFAULT '---',
	direccion VARCHAR(50) NOT NULL,
	iudad VARCHAR(20) NOT NULL,
	pais VARCHAR(20) NOT NULL
);

ALTER TABLE vendedores ADD COLUMN zona_de_atencion VARCHAR(6) NOT NULL;
ALTER TABLE vendedores RENAME COLUMN iudad TO ciudad;

CREATE TABLE formas_de_pago(
	id VARCHAR(3) PRIMARY KEY NOT NULL,
	nombre VARCHAR(10) NOT NULL
);

CREATE TABLE pedidos(
	id VARCHAR(6) PRIMARY KEY NOT NULL,
	fecha_de_pedido DATE NOT NULL,
	fecha_de_entrega DATE NOT NULL,
	id_forma_de_pago VARCHAR(3) REFERENCES formas_de_pago(id) NOT NULL,
	id_cliente VARCHAR(10) REFERENCES clientes(cedula) NOT NULL,
	id_vendedor VARCHAR(10) REFERENCES vendedores(cedula) NOT NULL
);

CREATE TABLE productos_pedidos(
	id_productos VARCHAR(3) REFERENCES productos(id) NOT NULL,
	id_pedidos VARCHAR(3) REFERENCES pedidos(id) NOT NULL,
	PRIMARY KEY (id_productos, id_pedidos)
);

ALTER TABLE productos_pedidos ALTER COLUMN id_pedidos TYPE VARCHAR(6);
ALTER TABLE productos_pedidos ADD COLUMN cantidad INTEGER NOT NULL;

CREATE TABLE clientes_telefonos(
	telefono VARCHAR(10) NOT NULL,
	cliente_id VARCHAR(10) NOT NULL REFERENCES clientes(cedula),
	PRIMARY KEY (telefono,cliente_id)
);

CREATE TABLE vendedores_telefonos(
	telefono VARCHAR(10) NOT NULL,
	vendedor_id VARCHAR(10) NOT NULL REFERENCES vendedores(cedula),
	PRIMARY KEY (telefono,vendedor_id)	
);

CREATE TABLE clientes_celulares(
	celular VARCHAR(10) NOT NULL,
	cliente_id VARCHAR(10) NOT NULL REFERENCES clientes(cedula),
	PRIMARY KEY (celular,cliente_id)
);

CREATE TABLE vendedores_celulares(
	celular VARCHAR(10) NOT NULL,
	vendedor_id VARCHAR(10) NOT NULL REFERENCES vendedores(cedula),
	PRIMARY KEY (celular,vendedor_id)	
);

# insertando los datos

INSERT INTO clientes(cedula, empresa, primer_nombre, primer_apellido, direccion, fax, ciudad, pais)
VALUES
	('91454787','RJB','Daniela','Guzman','Av chile No 200-40','8522552','Bogotá','Colombia'),
	('81251470','Fenix','Nelson','Robles','Transv 188 #187-85','9529641','Cali','Colombia'),
	('44157442','Bakta','Jairo','Morales','Cra 156 #410-85','4859632','Montreal','Canada'),
	('67482520','Trans','Hilda','Forero','Calle 100 #987-75','5963685','Bogotá','Colombia'),
	('78978978','Kathe','Bertha','Castillo','Cra 343 #56-52','7895841','Signey','Australia'),
	('41452560','Orcal','Carlos','Zapata','Calle 200 Av Principal','9858774','Montreal','Canada');

INSERT INTO vendedores(cedula, primer_nombre, primer_apellido, direccion, zona_de_atencion, ciudad, pais)
VALUES
	('2541','Pedro','Benavides','Transv 564 No 145-75','sur','Cali','Colombia'),
	('2542','Alba','Suares','Cra 189 # 789-23','Centro','Cali','Colombia'),
	('2543','Jorge','Reyes','Calle 543 # 876-74','sur','Medellin','Colombia'),
	('2544','Luis','Osorio','Cra 859 #456-23','Norte','Cali','Colombia'),
	('2545','Eduardo','Quesada','Calle 78 # 987-78','Centro','Medellin','Colombia'),
	('2546','Gloria','Arenas','Av 345 #4596','sur','Medellin','Colombia');

INSERT INTO productos(id,nombre,precio,impuestos,imagen)
VALUES
	('120','Teclado',15000,16,''),
	('121','Pantala LCD',35000,16,''),
	('122','Disco duro 250 Gigas',185000,16,''),
	('123','Impresora',120000,16,''),
	('124','Mouse',20000,16,''),
	('125','Unidad R-W',60000,16,'');

INSERT INTO formas_de_pago(id,nombre)
VALUES
	('1','Contado'),
	('2','Credito'),
	('3','Cheque');

INSERT INTO pedidos(id,fecha_de_pedido,fecha_de_entrega,id_cliente,id_vendedor,id_forma_de_pago)
VALUES
	('101010','01/03/2010','08/03/2010','91454787','2541','1'),
	('101011','04/05/2010','12/05/2010','81251470','2542','2'),
	('101012','25/10/2010','30/10/2010','44157442','2543','3'),
	('101013','01/10/2010','08/10/2010','67482520','2544','3'),
	('101014','04/10/2010','12/10/2010','78978978','2544','2'),
	('101015','25/10/2010','29/10/2010','41452560','2546','1');

INSERT INTO productos_pedidos(id_pedidos,id_productos,cantidad)
VALUES
	('101010','120',50),
	('101010','122',25),
	('101011','122',30),
	('101011','123',35),
	('101012','124',20),
	('101012','125',25),
	('101013','124',24),
	('101013','125',20),
	('101014','122',18),
	('101014','120',10),
	('101015','123',20),
	('101015','120',20),
	('101015','122',30),
	('101015','124',50);