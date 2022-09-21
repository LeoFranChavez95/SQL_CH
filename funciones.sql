-- FUNCIONES 

USE `universidad`;

-- PRIMERA FUNCION

DROP function IF EXISTS `notaDeExamen`;

DELIMITER $$
-- la funcion notaDeExamen devuelve la nota de un alumno en un curso
-- recibe como parametros , el legajo del estudiante ,el codigo de curso y por ultimo un numero que indica el nro de examen
-- si nro de examen es igual a 1 es la nota del primer parcial
-- si nro de examen es igual a 2 es la nota del segundo parcial
CREATE DEFINER=`root`@`localhost` FUNCTION `notaDeExamen`(legajo_estudiante INT,codigo_de_curso INT,nro_de_examen INT) RETURNS int
DETERMINISTIC
BEGIN
	RETURN (SELECT nota
			FROM examen AS e
			WHERE e.legajo_estudiante = legajo_estudiante 
			AND e.codigo_de_curso = codigo_de_curso
			AND e.numero_examen = nro_de_examen );
END$$
DELIMITER ;
;


-- SEGUNDA FUNCION


DROP function IF EXISTS `promedio_nota`;

DELIMITER $$
-- La funcion promedio_nota me devuelve el promedio de notas de un alumno en un curso
-- recibe el legajo del alumno y y el codigo de curso, y con esos datos busca las notas de los examenes en ese curso
CREATE FUNCTION `promedio_nota`(legajo_estudiante INT,codigo_de_curso INT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE nota1 INT;
    DECLARE nota2 INT;
    -- uso la funcion notaDeExamen para que me devuelva la nota del primer parcial y del segundo parcial del alumno 
    -- en un determinado curso
    SET nota1 = notaDeExamen(legajo_estudiante,codigo_de_curso,1);
    SET nota2 = notaDeExamen(legajo_estudiante,codigo_de_curso,2);
RETURN (nota1+nota2)/2;
END$$

DELIMITER ;

-- ACA DEJO DOS CONSULTAS
-- UNA USANDO SUBCONSULTAS Y LA OTRA USANDO LAS FUNCIONES QUE ARME
-- LO QUE ME TIENEN QUE DEVOLVER ES LA CANTIDAD DE ALUMNOS QUE PROMOCIONARON POR CURSO
-- SE PROMOCIONA CUANDO LOS DOS PARCIALES ESTAN APROBADOS Y EL PROMEDIO DE LOS DOS PARCIALES ES MAYOR O IGUAL A 8

SELECT ca.catedra AS "Materia", COUNT(e.legajo_estudiante) AS "Cantidad de Promocionados"
FROM estudiante AS e JOIN curso_estudiante AS ce
ON e.legajo_estudiante = ce.legajo_estudiante
JOIN curso AS c
ON c.codigo_de_curso = ce.codigo_de_curso
JOIN catedra AS ca
ON ca.codigo_de_catedra = c.codigo_de_catedra
WHERE e.legajo_estudiante IN 
( SELECT ex.legajo_estudiante
  FROM examen AS ex 
  WHERE c.codigo_de_curso = ex.codigo_de_curso AND 
  (numero_examen = 1 AND nota >= 6) 
) 
AND e.legajo_estudiante IN 
( SELECT ex.legajo_estudiante
  FROM examen AS ex 
  WHERE c.codigo_de_curso = ex.codigo_de_curso AND 
  (numero_examen = 2 AND nota >= 6) 
) 
AND promedio_nota(e.legajo_estudiante,c.codigo_de_curso) >= 8
GROUP BY ca.catedra;


-- USANDO LAS DOS FUNCIONES CREADAS

SELECT ca.catedra AS "Materia", COUNT(e.legajo_estudiante) AS "Cantidad de Promocionados"
FROM estudiante AS e JOIN curso_estudiante AS ce
ON e.legajo_estudiante = ce.legajo_estudiante
JOIN curso AS c
ON c.codigo_de_curso = ce.codigo_de_curso
JOIN catedra AS ca
ON ca.codigo_de_catedra = c.codigo_de_catedra
WHERE notaDeExamen(e.legajo_estudiante,c.codigo_de_curso,1) >= 6 
AND notaDeExamen(e.legajo_estudiante,c.codigo_de_curso,2) >= 6
AND promedio_nota(e.legajo_estudiante,c.codigo_de_curso) >= 8
GROUP BY ca.catedra
