/*CREATE SCHEMA universidad;*/
USE universidad;


CREATE TABLE catedra(
	codigo_de_catedra INT UNSIGNED NOT NULL AUTO_INCREMENT,
    legajo_docente INT UNSIGNED NOT NULL,
    catedra VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigo_de_catedra),
    CONSTRAINT catedra_docente FOREIGN KEY (legajo_docente) REFERENCES docente (legajo_docente)
)

CREATE TABLE curso (
	codigo_de_curso INT UNSIGNED NOT NULL AUTO_INCREMENT,
    legajo_docente INT UNSIGNED NOT NULL,
    codigo_de_catedra INT UNSIGNED NOT NULL,
    fecha_de_inicio DATE DEFAULT NULL,
    PRIMARY KEY (codigo_de_curso),
	CONSTRAINT curso_docente FOREIGN KEY (legajo_docente) REFERENCES docente (legajo_docente),
	CONSTRAINT curso_catedra FOREIGN KEY (codigo_de_catedra) REFERENCES catedra (codigo_de_catedra)	
)

CREATE TABLE docente (
	legajo_docente INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    email VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (legajo_docente)
)

CREATE TABLE estudiante (
	legajo_estudiante INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    email VARCHAR(30) DEFAULT NULL,
    codigo_carrera INT UNSIGNED NOT NULL,
	PRIMARY KEY (legajo_estudiante),
    CONSTRAINT estudiante_carerra FOREIGN KEY (codigo_carrera) REFERENCES carrera (codigo_carrera)
)

CREATE TABLE examen (
	numero_examen INT UNSIGNED NOT NULL AUTO_INCREMENT,
    legajo_estudiante INT UNSIGNED NOT NULL,
    codigo_de_curso INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    descripcion VARCHAR(50) DEFAULT NULL,
    nota INT UNSIGNED NOT NULL, 
    PRIMARY KEY (numero_examen),
    CONSTRAINT examen_estudiante FOREIGN KEY (legajo_estudiante) REFERENCES estudiante (legajo_estudiante),
    CONSTRAINT examen_curso FOREIGN KEY (codigo_de_curso) REFERENCES curso (codigo_de_curso)
)


CREATE TABLE carrera (
	codigo_carrera INT UNSIGNED NOT NULL,
    carrera VARCHAR(30) NOT NULL,
    plan_de_estudio VARCHAR(10) NOT NULL,
    PRIMARY KEY (codigo_carrera)
)
 