USE universidad;

-- VISTAS

-- CREACION DE UNA VISTA QUE ME DEVUELVE LA CANTIDAD DE ALUMNOS POR MATERIA
CREATE VIEW alumnosPorMateria AS (
SELECT catedra AS "Materia", COUNT(e.legajo_estudiante) AS "Cantidad de estudiantes"
FROM estudiante AS e JOIN curso_estudiante AS ce
ON e.legajo_estudiante = ce.legajo_estudiante
JOIN curso AS c
ON c.codigo_de_curso = ce.codigo_de_curso
JOIN catedra AS ca
ON ca.codigo_de_catedra = c.codigo_de_catedra
GROUP BY catedra
);

-- CREACION DE UNA VISTA QUE ME DEVUELVE LA CANTIDAD DE ALUMNOS QUE TIENE CADA CARRERA
CREATE VIEW alumnosPorCarrera AS(
SELECT carrera AS "Carrera",COUNT(legajo_estudiante) AS "Cantidad de estudiantes"
FROM estudiante AS e JOIN carrera AS c
ON e.codigo_carrera = c.codigo_carrera
GROUP BY carrera
);

-- CREACION DE UNA VISTA QUE ME DEVUELVE LA CANTIDAD DE ALUMNOS APROBADOS POR MATERIA
CREATE VIEW cantidadDeAprobadosPorMateria AS(
SELECT ca.catedra AS "Materia", COUNT(e.legajo_estudiante) AS "Cantidad de aprobados"
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
GROUP BY ca.catedra
);

-- CREACION DE UNA VISTA QUE ME DEVUELVE LA CANTIDAD DE ALUMNOS DESAPROBADOS POR MATERIA
CREATE VIEW cantidadDeDesaprobadosPorMateria AS(
SELECT ca.catedra AS "Materia", COUNT(e.legajo_estudiante) AS "Cantidad de desaprobados"
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
  (numero_examen = 1 AND nota < 6) 
) 
AND e.legajo_estudiante IN 
( SELECT ex.legajo_estudiante
  FROM examen AS ex 
  WHERE c.codigo_de_curso = ex.codigo_de_curso AND 
  (numero_examen = 2 AND nota < 6) 
) 
GROUP BY ca.catedra
);

-- CREACION DE UNA VISTA QUE ME DEVUELVE LA CANTIDAD DE CURSOS QUE TIENE CADA CATEDRA/MATERIA
CREATE VIEW cantidadDeCursosPorMateria AS(
SELECT catedra AS "Materia",COUNT(codigo_de_curso) AS "Cantidad de cursos"
FROM curso AS c JOIN catedra AS ca
ON c.codigo_de_catedra = ca.codigo_de_catedra
GROUP BY catedra
);