USE universidad;


-- INSERTO 4 REGISTROS A MI TABLA CARRERA

INSERT INTO carrera VALUES 
-- (codigo carrera , nombre carrera)
(08,"Ingenieria Mecatronica"),
(09,"Ingenieria Aeronautica"),
(10,"Ingenieria Electrica"),
(11,"Ingenieria Naval");

-- COMPRUEBO LA INSERCION
SELECT *
FROM carrera;

-- CREO UNA TRANSACCION PARA LA ELIMINACION DE ESOS REGISTROS
START TRANSACTION ;
DELETE FROM carrera
WHERE codigo_carrera BETWEEN 8 AND 11;
-- ROLLBACK
ROLLBACK;
-- COMMIT
COMMIT;

-- SEGUNDA TRANSACCION 

-- UTILIZO EL STORED PROCEDURE agragarNuevosEstudiantes creado para esa entrega
START TRANSACTION;
call agregarNuevoEstudiante('Pepe','Luchianno','Ingenieria Electronica','pepeLucho@gmail.com');
call agregarNuevoEstudiante('Leonel','Chaves','Ingenieria Electronica',"l");
call agregarNuevoEstudiante("Pepe","Luchiano","Ingenieria Civil","");
call agregarNuevoEstudiante("Big","Michael","Ingenieria Textil","");
call agregarNuevoEstudiante("Little","John","Ingenieria Industrial","");
call agregarNuevoEstudiante("Franklin","Chavez Catacora","Ingenieria Electrica","");
-- PRIMER SAVEPOINT
SAVEPOINT lote1;
call agregarNuevoEstudiante("Melina","Campagnuccci","Ingenieria Textil","");
call agregarNuevoEstudiante("Nicolass","Perotti","Ingenieria Civil","");
call agregarNuevoEstudiante("Kevin Agustin","Ignaciooo","Ingenieria Textil","");
call agregarNuevoEstudiante("Alicia","Ignacioo","Ingenieria Industrial","");
call agregarNuevoEstudiante("Jose Alfredo","Chavezz","Ingenieria Electrica","");
-- SEGUNDO SAVEPOINT
SAVEPOINT lote2;

-- ELIMINACION DE LOS SAVEPOINTS
RELEASE SAVEPOINT lote1;
RELEASE SAVEPOINT lote2;

ROLLBACK TO lote1;
ROLLBACK TO lote2;

