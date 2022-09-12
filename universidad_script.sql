-- AUTOR : LEONEL FRANKLIN CHAVEZ OLIVARES
-- CREACION DE BASE
CREATE SCHEMA universidad;
USE universidad;


-- CREACION DE TABLAS

-- TABLA CARRERA
-- Esta tabla es la que contiene el numero de plan de estudio y en el atributo de carrera describe el nombre de la carrera
CREATE TABLE carrera (
    codigo_carrera INT UNSIGNED NOT NULL,
    carrera VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigo_carrera)
);

-- TABLA DOCENTE
CREATE TABLE docente (
    legajo_docente INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    email VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (legajo_docente)
);

-- TABLA CATEDRA
CREATE TABLE catedra(
    codigo_de_catedra INT UNSIGNED NOT NULL AUTO_INCREMENT,
    legajo_docente INT UNSIGNED NOT NULL,
    catedra VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigo_de_catedra),
    CONSTRAINT catedra_docente FOREIGN KEY (legajo_docente) REFERENCES docente (legajo_docente)
);

-- TABLA ESTUDIANTE
CREATE TABLE estudiante (
    legajo_estudiante INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    email VARCHAR(30) DEFAULT NULL,
    codigo_carrera INT UNSIGNED NOT NULL,
    PRIMARY KEY (legajo_estudiante),
    CONSTRAINT estudiante_carerra FOREIGN KEY (codigo_carrera) REFERENCES carrera (codigo_carrera)
);

-- TABLA CURSO
CREATE TABLE curso (
    codigo_de_curso INT UNSIGNED NOT NULL AUTO_INCREMENT ,
    legajo_docente INT UNSIGNED NOT NULL,
    codigo_de_catedra INT UNSIGNED NOT NULL,
    fecha_de_inicio DATE DEFAULT NULL,
    PRIMARY KEY (codigo_de_curso),
    CONSTRAINT curso_docente FOREIGN KEY (legajo_docente) REFERENCES docente (legajo_docente),
    CONSTRAINT curso_catedra FOREIGN KEY (codigo_de_catedra) REFERENCES catedra (codigo_de_catedra)	
);

-- Esta tabla es la que va a relacionar los N alumnos con los M estudiantes (Relacion muchos a muchos)
-- tiene una clave compuesta , las claves primarias de las tablas de estudiante y curso

CREATE TABLE curso_estudiante(
	codigo_de_curso INT UNSIGNED NOT NULL,
    legajo_estudiante INT UNSIGNED NOT NULL,
    CONSTRAINT codigo_de_curso FOREIGN KEY (codigo_de_curso) REFERENCES curso (codigo_de_curso),
	CONSTRAINT legajo_de_estudiante FOREIGN KEY (legajo_estudiante) REFERENCES estudiante (legajo_estudiante),
	PRIMARY KEY (codigo_de_curso,legajo_estudiante)
);

-- TABLA EXAMEN
CREATE TABLE examen (
    numero_examen INT UNSIGNED NOT NULL,
    legajo_estudiante INT UNSIGNED NOT NULL,
    codigo_de_curso INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    descripcion VARCHAR(50) DEFAULT NULL,
    nota INT UNSIGNED NOT NULL, 
    CONSTRAINT examen_estudiante FOREIGN KEY (legajo_estudiante) REFERENCES estudiante (legajo_estudiante),
    CONSTRAINT examen_curso FOREIGN KEY (codigo_de_curso) REFERENCES curso (codigo_de_curso),
	PRIMARY KEY (legajo_estudiante,codigo_de_curso,numero_examen)
);

 -- CREACION DE INDICES

 -- INDICE ESTUDIANTE 
CREATE UNIQUE INDEX apellido_estudiante
ON estudiante (apellido);

-- INDICE DOCENTE
CREATE UNIQUE INDEX apellido_docente
ON docente (apellido) ;
