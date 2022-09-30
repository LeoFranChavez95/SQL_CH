USE universidad;

-- Tabla donde se van a registrar si se da de baja o de alta a un estudiante
CREATE TABLE usuarioAcciones
(
	accion_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(70) NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL,
    PRIMARY KEY(accion_id)
);

-- con este trigger registro la insercion de un alumno nuevo
CREATE TRIGGER insercionEstudiantes
AFTER INSERT ON estudiante
FOR EACH ROW
INSERT INTO usuarioAcciones (descripcion,usuario,fecha) VALUES (CONCAT("Se dio de alta al estudiante con el legajo de : ",new.legajo_estudiante),user(),current_date());

call agregarNuevoEstudiante('Pepe','Lucho','Ingenieria Electronica','pepeLucho@gmail.com');
SELECT *
FROM usuarioAcciones;


-- el trigger elimina los registros de la tabla examen, al eliminarse a un alumno de curso(cuando se elimina un registro de 
-- tabla curso_estudiante)
CREATE TRIGGER darBajaEstudianteDeUnCurso
BEFORE DELETE ON curso_estudiante
FOR EACH ROW
    DELETE FROM examen
    WHERE old.legajo_estudiante = legajo_estudiante AND old.codigo_de_curso = codigo_de_curso;
    
-- el trigger inserta un registro donde consta la baja de un estudiante de un curso
CREATE TRIGGER darBajaEstudianteDeUnCursoRegistro
AFTER DELETE ON curso_estudiante
FOR EACH ROW
	INSERT INTO usuarioAcciones (descripcion,usuario,fecha) VALUES (CONCAT(CONCAT("Se dio de baja el estudiante con el legajo de ",old.legajo_estudiante)," de un curso"),user(),current_date());

-- el trigger se activa cuando se elimina un estudiante de la tabla estudiante
-- elimina los registros asociados de la tabla curso_estudiante 
-- lo que hace que dispare el trigger darBajaEstudianteDeUnCurso 
-- que eliminar los registros de la tabla examen, asociado a ese alumno
CREATE TRIGGER darBajaEstudianteDeUniversidad
BEFORE DELETE ON estudiante
FOR EACH ROW
    DELETE FROM curso_estudiante
    WHERE old.legajo_estudiante = legajo_estudiante;
 
 -- el trigger registra el movimiento al eliminar a un estudiante
CREATE TRIGGER darBajaEstudianteDeUniversidadRegistro
AFTER DELETE ON curso_estudiante
FOR EACH ROW
	INSERT INTO usuarioAcciones (descripcion,usuario,fecha) VALUES (CONCAT("Se dio de baja el estudiante con el legajo de ",old.legajo_estudiante),user(),current_date()); 

-- Hacemos una prueba con el estudiante de legajo 1 
SELECT *
FROM examen
WHERE legajo_estudiante = 1 AND codigo_de_curso = 1; 
-- eliminamos del curso de codigo 1 al estudiante de legajo 1 
DELETE FROM curso_estudiante 
WHERE legajo_estudiante = 1 AND codigo_de_curso = 1;
-- aca podemos ver que queda registrado  
SELECT *
FROM usuarioAcciones;
  
SELECT *
FROM examen
WHERE legajo_estudiante = 1 AND codigo_de_curso = 1;

-- aca borramos al estudiante de legajo = 1
DELETE FROM estudiante
WHERE legajo_estudiante = 1;

-- aca podemos ver que se eliminaron todos los datos relacionados al alumno de legajo 1  
SELECT *
FROM usuarioAcciones;
  