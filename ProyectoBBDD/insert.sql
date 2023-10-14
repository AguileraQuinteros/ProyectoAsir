--/////		PROYECTO: CeKart_Taller

-- //  INSERCION DE DATOS A LAS TABLAS
 --Activamos la BBDD
USE CeKart_Taller;
GO

-- TABLA: DIRECCION_POSTAL
INSERT INTO DIRECCION_POSTAL
	VALUES ('1','Rua Alta 1','Culleredo','La Coruña','15171'),
			('2','Rua Nova 2','Oleiros','La Coruña','15172'),
			('3','Rua Baja 3','Cambre','La Coruña','15003'),
			('4','Rua Alta 3','A Coruña','La Coruña','15004');
GO

-- TABLA: Cliente
INSERT INTO Cliente (id_cliente,nombre,apellido,DIRECCION_POSTAL_id_dir)
	VALUES ('1','Adrian','Velo','1'),
			('2','Marcos','Crespo','2'),
			('3','Liliana','Figueroa','3');
GO

-- TABLA: Local
INSERT INTO Local (id_local,Telefono,Correo,DIRECCION_POSTAL_id_dir)
	VALUES (1,'981000001','local_1@correo',1),
			(2,'981000002','local_2@correo',2),
			(3,'981000003','local_3@correo',3);
GO

-- TABLA: Empleado
INSERT INTO Empleado(id_emp,Nombre,Apellido,DIRECCION_POSTAL_id_dir,LOCAL_id_local)
	VALUES (1,'Cesar','Carro',1,1),
			(2,'Monica','Aguirre',2,2),
			(3,'Patricia','Blanco',3,2),
			(4,'Diego','Caamano',4,1),
			(5,'Eva','Vasquez',3,3);
GO

-- TABLA: Nomina
INSERT INTO Nomina (id_nom,empleado,Numero_seguridad_social,EMPLEADO_id_emp)
	VALUES (1,'Cesar','1111111111',1),
			(2,'Monica','22222222',2),
			(3,'Patricia','333333333',3);
GO


-- CONSULTA
Select * 
	From cliente
	WHERE apellido = 'Velo'
GO

