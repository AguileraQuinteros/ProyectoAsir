-- Generado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   en:        2023-10-07 14:25:12 CEST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE acude 
    (
     CLIENTE_id_cliente INTEGER NOT NULL , 
     LOCAL_id_local INTEGER NOT NULL 
    )
GO

ALTER TABLE acude ADD CONSTRAINT acude_PK PRIMARY KEY CLUSTERED (CLIENTE_id_cliente, LOCAL_id_local)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE BIZUN 
    (
     id_forp INTEGER NOT NULL , 
     id_bizum INTEGER NOT NULL , 
     Nombre VARCHAR (50) , 
     Telefono CHAR (9) 
    )
GO

ALTER TABLE BIZUN ADD CONSTRAINT BIZUN_PK PRIMARY KEY CLUSTERED (id_forp)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE BIZUN ADD CONSTRAINT BIZUN_PKv1 UNIQUE NONCLUSTERED (id_bizum)
GO

CREATE TABLE CLIENTE 
    (
     id_cliente INTEGER NOT NULL , 
     Nombre VARCHAR (30) , 
     Apellido VARCHAR (30) , 
     dni CHAR (9) , 
     Telefono CHAR (9) , 
     DIRECCION_POSTAL_id_dir INTEGER NOT NULL 
    )
GO

ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_PK PRIMARY KEY CLUSTERED (id_cliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE DIRECCION_POSTAL 
    (
     id_dir INTEGER NOT NULL , 
     Direccion VARCHAR (30) , 
     Localidad VARCHAR (30) , 
     Ciudad VARCHAR (30) , 
     Codigo_postal CHAR (5) 
    )
GO

ALTER TABLE DIRECCION_POSTAL ADD CONSTRAINT DIRECCION_POSTAL_PK PRIMARY KEY CLUSTERED (id_dir)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE EMPLEADO 
    (
     id_emp INTEGER NOT NULL , 
     Nombre VARCHAR (30) , 
     Apellido VARCHAR (30) , 
     Telefono CHAR (9) , 
     dni CHAR (9) , 
     DIRECCION_POSTAL_id_dir INTEGER NOT NULL , 
     LOCAL_id_local INTEGER NOT NULL 
    )
GO

ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_PK PRIMARY KEY CLUSTERED (id_emp)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE FACTURA 
    (
     id_factura INTEGER NOT NULL , 
     Fecha DATE , 
     Estado VARCHAR (30) , 
     Coste_reparacion MONEY , 
     PAGO_id_pago INTEGER NOT NULL , 
     REPARACION_id_rep INTEGER NOT NULL 
    )
GO

ALTER TABLE FACTURA ADD CONSTRAINT FACTURA_PK PRIMARY KEY CLUSTERED (id_factura)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE FORMA_PAGO 
    (
     id_forp INTEGER NOT NULL , 
     TRANSFERENCIA_BANCARIA_id_traf INTEGER NOT NULL , 
     BIZUN_id_bizum INTEGER NOT NULL , 
     TARJETA_id_tarjeta INTEGER NOT NULL 
    )
GO

ALTER TABLE FORMA_PAGO ADD CONSTRAINT FORMA_PAGO_PK PRIMARY KEY CLUSTERED (id_forp)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE LOCAL 
    (
     id_local INTEGER NOT NULL , 
     Telefono CHAR (9) , 
     Correo VARCHAR (30) , 
     Horario TIME , 
     DIRECCION_POSTAL_id_dir INTEGER NOT NULL 
    )
GO

ALTER TABLE LOCAL ADD CONSTRAINT LOCAL_PK PRIMARY KEY CLUSTERED (id_local)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE NOMINA 
    (
     id_nom INTEGER NOT NULL , 
     empleado VARCHAR (20) , 
     Numero_seguridad_social CHAR (10) , 
     Periodo_liquidacion DATE , 
     Salario MONEY , 
     EMPLEADO_id_emp INTEGER NOT NULL 
    )
GO

ALTER TABLE NOMINA ADD CONSTRAINT NOMINA_PK PRIMARY KEY CLUSTERED (id_nom)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PAGO 
    (
     id_pago INTEGER NOT NULL , 
     Estado_pago VARCHAR (30) , 
     Fecha_pago DATE , 
     CLIENTE_id_cliente INTEGER NOT NULL , 
     FORMA_PAGO_id_forp INTEGER NOT NULL 
    )
GO

ALTER TABLE PAGO ADD CONSTRAINT PAGO_PK PRIMARY KEY CLUSTERED (id_pago)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PROVEEDOR 
    (
     id_pro INTEGER NOT NULL , 
     Nombre VARCHAR (30) , 
     Apellido VARCHAR (30) , 
     Empresa VARCHAR (30) , 
     Correo VARCHAR (30) , 
     Telefono CHAR (9) , 
     DIRECCION_POSTAL_id_dir INTEGER NOT NULL 
    )
GO

ALTER TABLE PROVEEDOR ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY CLUSTERED (id_pro)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE realizav3 
    (
     LOCAL_id_local INTEGER NOT NULL , 
     REPARACION_id_rep INTEGER NOT NULL 
    )
GO

ALTER TABLE realizav3 ADD CONSTRAINT realizav3_PK PRIMARY KEY CLUSTERED (LOCAL_id_local, REPARACION_id_rep)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE realizav4 
    (
     REPARACION_id_rep INTEGER NOT NULL , 
     VEHICULO_id_vehiculo INTEGER NOT NULL 
    )
GO

ALTER TABLE realizav4 ADD CONSTRAINT realizav4_PK PRIMARY KEY CLUSTERED (REPARACION_id_rep, VEHICULO_id_vehiculo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE REPARACION 
    (
     id_rep INTEGER NOT NULL , 
     Tipo VARCHAR (20) , 
     Respuesto VARCHAR (30) , 
     Fecha_comienzo DATE , 
     Fecha_fin DATE , 
     Total_horas VARCHAR (20) 
    )
GO

ALTER TABLE REPARACION ADD CONSTRAINT REPARACION_PK PRIMARY KEY CLUSTERED (id_rep)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE REPUESTO 
    (
     id_res INTEGER NOT NULL , 
     Referencia VARCHAR (20) , 
     Marca VARCHAR (20) , 
     Precio MONEY , 
     PROVEEDOR_id_pro INTEGER NOT NULL 
    )
GO

ALTER TABLE REPUESTO ADD CONSTRAINT REPUESTO_PK PRIMARY KEY CLUSTERED (id_res)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE TARJETA 
    (
     id_forp INTEGER NOT NULL , 
     id_tarjeta INTEGER NOT NULL , 
     Nombre VARCHAR (30) , 
     Numero_tarjeta VARCHAR (15) , 
     Fecha_caducidad DATE , 
     CVV CHAR (3) 
    )
GO

ALTER TABLE TARJETA ADD CONSTRAINT TARJETA_PK PRIMARY KEY CLUSTERED (id_forp)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE TARJETA ADD CONSTRAINT TARJETA_PKv1 UNIQUE NONCLUSTERED (id_tarjeta)
GO

CREATE TABLE tienev8 
    (
     REPUESTO_id_res INTEGER NOT NULL , 
     REPARACION_id_rep INTEGER NOT NULL 
    )
GO

ALTER TABLE tienev8 ADD CONSTRAINT tienev8_PK PRIMARY KEY CLUSTERED (REPUESTO_id_res, REPARACION_id_rep)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE TRANSFERENCIA_BANCARIA 
    (
     id_forp INTEGER NOT NULL , 
     id_traf INTEGER NOT NULL , 
     Nombre_titular VARCHAR (50) , 
     Nombre_sucursal VARCHAR (30) , 
     Numero_cuenta CHAR (15) 
    )
GO

ALTER TABLE TRANSFERENCIA_BANCARIA ADD CONSTRAINT TRANSFERENCIA_BANCARIA_PK PRIMARY KEY CLUSTERED (id_forp)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE TRANSFERENCIA_BANCARIA ADD CONSTRAINT TRANSFERENCIA_BANCARIA_PKv1 UNIQUE NONCLUSTERED (id_traf)
GO

CREATE TABLE VEHICULO 
    (
     id_vehiculo INTEGER NOT NULL , 
     Matricula CHAR (7) , 
     Fecha_entrega DATE , 
     Descripcion TEXT , 
     CLIENTE_id_cliente INTEGER NOT NULL 
    )
GO

ALTER TABLE VEHICULO ADD CONSTRAINT VEHICULO_PK PRIMARY KEY CLUSTERED (id_vehiculo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE acude 
    ADD CONSTRAINT acude_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_id_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     id_cliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE acude 
    ADD CONSTRAINT acude_LOCAL_FK FOREIGN KEY 
    ( 
     LOCAL_id_local
    ) 
    REFERENCES LOCAL 
    ( 
     id_local 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE BIZUN 
    ADD CONSTRAINT BIZUN_FORMA_PAGO_FK FOREIGN KEY 
    ( 
     id_forp
    ) 
    REFERENCES FORMA_PAGO 
    ( 
     id_forp 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_DIRECCION_POSTAL_FK FOREIGN KEY 
    ( 
     DIRECCION_POSTAL_id_dir
    ) 
    REFERENCES DIRECCION_POSTAL 
    ( 
     id_dir 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EMPLEADO 
    ADD CONSTRAINT EMPLEADO_DIRECCION_POSTAL_FK FOREIGN KEY 
    ( 
     DIRECCION_POSTAL_id_dir
    ) 
    REFERENCES DIRECCION_POSTAL 
    ( 
     id_dir 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EMPLEADO 
    ADD CONSTRAINT EMPLEADO_LOCAL_FK FOREIGN KEY 
    ( 
     LOCAL_id_local
    ) 
    REFERENCES LOCAL 
    ( 
     id_local 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE FACTURA 
    ADD CONSTRAINT FACTURA_PAGO_FK FOREIGN KEY 
    ( 
     PAGO_id_pago
    ) 
    REFERENCES PAGO 
    ( 
     id_pago 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE FACTURA 
    ADD CONSTRAINT FACTURA_REPARACION_FK FOREIGN KEY 
    ( 
     REPARACION_id_rep
    ) 
    REFERENCES REPARACION 
    ( 
     id_rep 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE FORMA_PAGO 
    ADD CONSTRAINT FORMA_PAGO_BIZUN_FK FOREIGN KEY 
    ( 
     BIZUN_id_bizum
    ) 
    REFERENCES BIZUN 
    ( 
     id_bizum 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE FORMA_PAGO 
    ADD CONSTRAINT FORMA_PAGO_TARJETA_FK FOREIGN KEY 
    ( 
     TARJETA_id_tarjeta
    ) 
    REFERENCES TARJETA 
    ( 
     id_tarjeta 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE FORMA_PAGO 
    ADD CONSTRAINT FORMA_PAGO_TRANSFERENCIA_BANCARIA_FK FOREIGN KEY 
    ( 
     TRANSFERENCIA_BANCARIA_id_traf
    ) 
    REFERENCES TRANSFERENCIA_BANCARIA 
    ( 
     id_traf 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE LOCAL 
    ADD CONSTRAINT LOCAL_DIRECCION_POSTAL_FK FOREIGN KEY 
    ( 
     DIRECCION_POSTAL_id_dir
    ) 
    REFERENCES DIRECCION_POSTAL 
    ( 
     id_dir 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE NOMINA 
    ADD CONSTRAINT NOMINA_EMPLEADO_FK FOREIGN KEY 
    ( 
     EMPLEADO_id_emp
    ) 
    REFERENCES EMPLEADO 
    ( 
     id_emp 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PAGO 
    ADD CONSTRAINT PAGO_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_id_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     id_cliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PAGO 
    ADD CONSTRAINT PAGO_FORMA_PAGO_FK FOREIGN KEY 
    ( 
     FORMA_PAGO_id_forp
    ) 
    REFERENCES FORMA_PAGO 
    ( 
     id_forp 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_DIRECCION_POSTAL_FK FOREIGN KEY 
    ( 
     DIRECCION_POSTAL_id_dir
    ) 
    REFERENCES DIRECCION_POSTAL 
    ( 
     id_dir 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE realizav3 
    ADD CONSTRAINT realizav3_LOCAL_FK FOREIGN KEY 
    ( 
     LOCAL_id_local
    ) 
    REFERENCES LOCAL 
    ( 
     id_local 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE realizav3 
    ADD CONSTRAINT realizav3_REPARACION_FK FOREIGN KEY 
    ( 
     REPARACION_id_rep
    ) 
    REFERENCES REPARACION 
    ( 
     id_rep 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE realizav4 
    ADD CONSTRAINT realizav4_REPARACION_FK FOREIGN KEY 
    ( 
     REPARACION_id_rep
    ) 
    REFERENCES REPARACION 
    ( 
     id_rep 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE realizav4 
    ADD CONSTRAINT realizav4_VEHICULO_FK FOREIGN KEY 
    ( 
     VEHICULO_id_vehiculo
    ) 
    REFERENCES VEHICULO 
    ( 
     id_vehiculo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE REPUESTO 
    ADD CONSTRAINT REPUESTO_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PROVEEDOR_id_pro
    ) 
    REFERENCES PROVEEDOR 
    ( 
     id_pro 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TARJETA 
    ADD CONSTRAINT TARJETA_FORMA_PAGO_FK FOREIGN KEY 
    ( 
     id_forp
    ) 
    REFERENCES FORMA_PAGO 
    ( 
     id_forp 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE tienev8 
    ADD CONSTRAINT tienev8_REPARACION_FK FOREIGN KEY 
    ( 
     REPARACION_id_rep
    ) 
    REFERENCES REPARACION 
    ( 
     id_rep 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE tienev8 
    ADD CONSTRAINT tienev8_REPUESTO_FK FOREIGN KEY 
    ( 
     REPUESTO_id_res
    ) 
    REFERENCES REPUESTO 
    ( 
     id_res 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TRANSFERENCIA_BANCARIA 
    ADD CONSTRAINT TRANSFERENCIA_BANCARIA_FORMA_PAGO_FK FOREIGN KEY 
    ( 
     id_forp
    ) 
    REFERENCES FORMA_PAGO 
    ( 
     id_forp 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE VEHICULO 
    ADD CONSTRAINT VEHICULO_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_id_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     id_cliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            19
-- CREATE INDEX                             0
-- ALTER TABLE                             48
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
