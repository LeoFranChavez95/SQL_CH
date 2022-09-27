USE universidad;

-- STORED PROCEDURES
-- El primer procedimiento almacenado lo que hace es ordenar la tabla alumnos segun un campo que ingresa el usuario 
-- el segundo dato que debe ingresar el usuario es si quiere que se muestre los registros en orden descendente(DESC) o ascendente (ASC)
-- Si por alguna razon, el dato ingreso en CAMPO es vacio , entonces la tabla no se mostrara ordenada

DROP procedure IF EXISTS `alumnosSegunCriterio`;
DELIMITER $$
USE `universidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnosSegunCriterio`(IN campo VARCHAR(20),IN orden VARCHAR(4))
BEGIN
	IF campo <> ''
    THEN
		SET @criterio = CONCAT(' ORDER BY ',campo);
		SET @criterio = CONCAT(@criterio,' ');
        SET @criterio = CONCAT(@criterio,orden);
    ELSE
		SET @criterio = '';
    END IF;
    SET @clausula = CONCAT('SELECT * FROM estudiante ',@criterio);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END$$
DELIMITER ;

-- En estas dos sentencias, hago uso del procedimiento almacenado
-- en este pido que me muestre los registros de estudiante ordenado segun su legajo en orden ascendente 
call alumnosSegunCriterio('legajo_estudiante','DESC');
-- en este pido que me muestre los registros de estudiante ordenado segun el codigo de carrera en orden descendente 
call alumnosSegunCriterio('codigo_carrera','ASC');


-- En este segundo procedimiento, lo que hacemos es añadir un nuevo estudiante a la tabla de estudiantes
-- En el primer y segundo parametro, ingresamos los nombres y apellidos del alumno
-- En el tercer parametro ingreso la carrera , ej: puedo poner INGENIERIA ELECTRICA
-- En el cuarto parametro espera el mail del alumno, es opcional, si no lo quiere ingresar debe poner ' '

DROP procedure IF EXISTS `agregarNuevoEstudiante`;
DELIMITER $$
CREATE PROCEDURE `agregarNuevoEstudiante` (IN nombreIngresado VARCHAR(30),IN apellidoIngresado VARCHAR(30),IN carrera VARCHAR(30),IN emailIngresado VARCHAR(30))
BEGIN
	-- es necesario que se ingrese el nombre de la carrera del estudiante, caso contrario no se registra a la persona
	IF carrera <> ' '
    THEN
		-- en caso de que la persona ingrese el nombre de la carrera , yo le asigno a la variable @codigo_carrera 
        -- el numero de carrera que es la PK de la tabla carrera y a su vez la FK en la tabla estudiante
		SET @codigo_carrera = (
			SELECT codigo_carrera
			FROM carrera AS c
			WHERE c.carrera LIKE carrera
		);
        -- Y finalmente inserto los datos del nuevo alumno
        -- El numero de legajo no lo ingreso, porque es autoincrementable
		INSERT INTO estudiante (nombre,apellido,email,codigo_carrera) VALUES
        (nombreIngresado,apellidoIngresado,emailIngresado,@codigo_carrera);
	END IF;	
END$$

DELIMITER ;


-- hago uso del procemiento
call agregarNuevoEstudiante('Pepe','Lucho','Ingenieria Electronica','pepeLucho@gmail.com');

SELECT *
FROM estudiante 
WHERE nombre = 'Pepe' AND apellido = 'Lucho';

DELETE FROM estudiante
WHERE nombre = 'Pepe' AND apellido = 'Lucho';