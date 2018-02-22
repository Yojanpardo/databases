# Fundamentos de bases sde datos de platzi
Bienvenidos al curso de fundamentos de bases de datos de platzi.
en este curso vamos a ver una introducción a lo que son las bases de datos, por qué las usamos, los motores de bases de datos relacionales, no relacionales, orientado a grafos, etc.

#### Por que necesitamos almacenar la información?
Se hace necesario almacenar la información porque nosotros no nos vamos a acordar de los datos de las personas que nacen en un día o algo asi.
Desde hace millones deuaños el ser humano ha buscado la manera de almacenar la información para que esta no fuese olvidada, por ejemplo los antiguos egipcios que almacenaban información en las paredes en forma de geroglíficos.

#### historia
1950-1960 Maquinas tabuldaoras, tarjetas perforadas, cintas magneticas
1960-1970 Modelos jerárquicos, discos duros, modelo de data relacional, transacciones en tiempo real.
1970-1980: SQL, sistemas sql comerciales, bases de datos paralelas, BD orientada a objetos.
Entre 1980 y 1990 nace Data mining, data warehouse, e-comerce que basicamente son las bases del comercio electronico.

para construir una base de datos necesitamos conocer e identificar muy bien cada una de las partes que lo conforman, es decir, las entidades, las relaciones y sus atributos.

#### tipos de bases de datos
* <3 LA BASE LLENA DE MI AMOR POR LAURA <3
* SQL
mariaDB
* NoSQL
redis
* neo4j
orientada a grafos
#### Donde encontramos bases de datos
En todos lados, la insdustria aeronautica, las escuelas, universidades, bancos, retail y todo esto para recolectar información y tomar decisiones basados en el pasado
#### Entidades
una entidad pueden ser personas, cargos, ciudades, etc. basicamente una cosa que puede tener atributos
#### Atributos
Un atributo es algo que caracteriza a una entidad, es decir, si tenemos la entidad "personas"entonces podemos decir que los atributos de una persona son: sus nombres, apellidos, una identificación, altura, peso, etc.
#### Relaciones
Una relación es una union entre dos entidades y son acciones. por ejemplo: tenemos las entidades personas y cargos, una persona puede tener varios cargos y un cargo solo puede ser ocupado por una persona. en este caso seria una relacion de 1 a muchos.

resumiendo una entidad tiene atributos y éstas se relacionan entre sí.

### Restricciones
una restriccion se puede ejecutar desde la capa de aplicación pero tambien se puede hacer desde el motor de las bases de datos para evitar que se generen anormalidades con la información.

algunas de las restricciones que vemos en las bases de datos son:

~~~
UNIQUE
NOT NULL
PRIMARY KEY
FOREIGN KEY
CHECK == <= >= < >
~~~

Desde la capa de aplicación se puede controlar estas restriciones pero es aconcejable hacerlo tambien en la base de datos

### niveles de abstracción
* Conceptual
tenemos entonces entidades y relaciones entre ellas.
* Logica
normalizaos un poco mas la información y aquí aparecen las entidades debiles que son las que salen a partir de las relaciones de muchos a muchos, aquí ya aparecen los atributos en las tablas
* Física
es la representación de la base de datos y se cambia de diagrama de pata de gallo a flechas que apuntan de las entidades debiles a las fuertes.

## Metodología basica de 9 pasos con Barker
#### Paso 1
identificar las entidades (preferiblemente hacerlo en singular)
#### Paso 2
Identificar las relaciones de las entidades
#### Paso 3
Entidades y relaciones podemos utilizar herrameintas online como por ejemplo draw.io o incluso google docs, todo depende de la forma de en la que lo organicemos, hacer el modelo conceptual
#### Paso 4
