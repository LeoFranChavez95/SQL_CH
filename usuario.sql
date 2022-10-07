
USE mysql;
-- -----------------------------------------------------------------------------------------------------------------------
--                                             USUARIOS                                                                 --
-- -----------------------------------------------------------------------------------------------------------------------

-- CREACION DE USUARIOS
CREATE USER 'usuario1@localhost' IDENTIFIED BY '1234abcd';
CREATE USER 'usuario2@localhost' IDENTIFIED BY '5678abcd';

-- VERIFICO
SELECT *
FROM user;

-- ASIGNO LOS PERMISOS 
-- USUARIO 1 SOLO PUEDE LEER DATOS
GRANT SELECT ON *.* TO 'usuario1@localhost'; 
-- USUARIO 2 SOLO PUEDE LEER,ACTUALIZAR E INSERTAR DATOS
GRANT SELECT,UPDATE,INSERT ON *.* TO 'usuario1@localhost'; 

-- VERIFICO LOS PERMISOS OTORGADOS
SHOW GRANTS FOR 'usuario1@localhost';
SHOW GRANTS FOR 'usuario2@localhost';

-- REVOCO LOS PERMISOS
REVOKE ALL ON *.* FROM 'usuario1@localhost';
REVOKE ALL ON *.* FROM 'usuario1@localhost';

-- Y FINALMENTE DOY DE BAJA A LOS DOS USUARIOS
DROP USER 'usuario1@localhost';
DROP USER 'usuario2@localhost';
