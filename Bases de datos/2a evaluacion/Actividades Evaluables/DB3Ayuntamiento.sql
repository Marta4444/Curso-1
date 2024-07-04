-- *******************************************
-- METADATOS DDL
-- *******************************************

CREATE DATABASE DB3Ayuntamiento CHARACTER SET utf8 COLLATE utf8_spanish_ci;

USE DB3Ayuntamiento;

CREATE TABLE marcamodelo (
modelo      VARCHAR(100),
marca       VARCHAR(20),
CONSTRAINT mar_mod_pk PRIMARY KEY (modelo)
);

CREATE TABLE cocheoficial (
matricula   VARCHAR(8),
modelo      VARCHAR(100),
CONSTRAINT coc_mat_pk PRIMARY KEY (matricula),
CONSTRAINT coc_mod_fk FOREIGN KEY (modelo) REFERENCES marcamodelo (modelo)
);

CREATE TABLE provincia (
provincia   VARCHAR(30),
pais        VARCHAR(20) NOT NULL,
CONSTRAINT pro_prov_pk PRIMARY KEY (provincia)
);

CREATE TABLE ciudad (
ciudad      VARCHAR(50),
provincia   VARCHAR(30) NOT NULL,
CONSTRAINT ciu_ciu_pk PRIMARY KEY (ciudad),
CONSTRAINT ciu_prov_fk FOREIGN KEY (provincia) REFERENCES provincia (provincia)
);

CREATE TABLE politico (
dni_pol             VARCHAR(9),
nombre              VARCHAR(20),
apellidos           VARCHAR(60),
direccion_postal    VARCHAR(100),
ciudad              VARCHAR(50),
correoelec          VARCHAR(100),
sueldo              FLOAT NOT NULL,
matricula           VARCHAR(8) NOT NULL,
CONSTRAINT pol_dni_pk PRIMARY KEY (dni_pol),
CONSTRAINT pol_ciu_fk FOREIGN KEY (ciudad) REFERENCES ciudad (ciudad),
CONSTRAINT pol_mat_fk FOREIGN KEY (matricula) REFERENCES cocheoficial (matricula)
);

CREATE TABLE cargo (
dni_pol         VARCHAR(9),
nombre          VARCHAR(20),
complemento     FLOAT,
comision        FLOAT, -- porcentaje de comisión
CONSTRAINT car_dni_pk PRIMARY KEY (dni_pol),
CONSTRAINT car_dni_fk FOREIGN KEY (dni_pol) REFERENCES politico (dni_pol)
);

CREATE TABLE concejal (
dni_pol         VARCHAR(9),
oposicion_sn    VARCHAR(1),
comp_sillon     FLOAT,
CONSTRAINT con_dni_pk PRIMARY KEY (dni_pol),
CONSTRAINT con_dni_fk FOREIGN KEY (dni_pol) REFERENCES politico (dni_pol),
CONSTRAINT con_opo_ck CHECK (oposicion_sn IN ('S', 's', 'N', 'n'))
);

CREATE TABLE asesor (
dni_ase         VARCHAR(9),
nombre          VARCHAR(100),
telefono        VARCHAR(15),
estudios        VARCHAR(11),
dni_pol         VARCHAR(9) NOT NULL,
supervisor      VARCHAR(9),
CONSTRAINT ase_dni_pk PRIMARY KEY (dni_ase),
CONSTRAINT ase_dni_fk FOREIGN KEY (dni_pol) REFERENCES politico (dni_pol),
CONSTRAINT ase_sup_fk FOREIGN KEY (supervisor) REFERENCES asesor (dni_ase),
CONSTRAINT ase_est_ck CHECK (estudios IN ('ninguno', 'básico', 'falsificado'))
);

CREATE TABLE reunion (
codigo          VARCHAR(20),
descripcion     VARCHAR(100),
fcelebracion    DATETIME NOT NULL,
CONSTRAINT reu_cod_pk PRIMARY KEY (codigo)
);

CREATE TABLE dieta (
concepto        VARCHAR(20),
descripcion     VARCHAR(100),
CONSTRAINT die_con_pk PRIMARY KEY (concepto)
);

CREATE TABLE cobrar (
dni_pol         VARCHAR(9),
concepto        VARCHAR(20),
codigo          VARCHAR(20),
importe         FLOAT,
CONSTRAINT cob_dnicc_pk PRIMARY KEY (dni_pol, concepto, codigo),
CONSTRAINT cob_dni_fk FOREIGN KEY (dni_pol) REFERENCES politico (dni_pol),
CONSTRAINT cob_con_fk FOREIGN KEY (concepto) REFERENCES dieta (concepto),
CONSTRAINT cob_cod_fk FOREIGN KEY (codigo) REFERENCES reunion (codigo)
);

-- *******************************************
-- DATOS DML
-- *******************************************

INSERT INTO provincia (provincia, pais) VALUES
('Distrito 1', 'Corrupoly'),
('Distrito 2', 'Corrupoly'),
('Distrito 3', 'Islas Corruptas');

INSERT INTO ciudad (ciudad, provincia) VALUES
('Corrupoly city','Distrito 1'),
('Villa Timadores','Distrito 1'),
('Hay Untamiento', 'Distrito 2'),
('Dinero negro', 'Distrito 3');

INSERT INTO marcamodelo (modelo, marca) VALUES
('C220 CDI', 'Mercedes'),
('320D', 'BMW'),
('ES', 'Lexus');

INSERT INTO cocheoficial (matricula, modelo) VALUES
('1111AAA', 'C220 CDI'),
('2222AAB', '320D'),
('3333AAC', 'ES');

INSERT INTO politico (dni_pol, nombre, apellidos, ciudad, sueldo, matricula) VALUES
('11111111A', 'Paco', 'Butxaca', 'Corrupoly city', 8000, '1111AAA'),
('22222222B', 'Pepe', 'Meloquedo', 'Villa Timadores', 6000, '2222AAB'),
('33333333C', 'Armando', 'Nopuedo', 'Corrupoly city', 3000, '3333AAC'),
('77777777G', 'Wifredo', 'Mango', 'Hay Untamiento', 3500, '2222AAB'),
('88888888H', 'Anastasio', 'Caradura', 'Dinero negro', 7000, '3333AAC');

INSERT INTO cargo (dni_pol, nombre, complemento, comision) VALUES
('11111111A', 'alcalde', 4000, 10),
('22222222B', 'teniente alcalde', 3000, 8),
('88888888H', 'director gabinete', 2000, 5);

INSERT INTO concejal (dni_pol, oposicion_sn, comp_sillon) VALUES
('33333333C', 'S', 1000),
('77777777G', 'N', 1500);

INSERT INTO asesor (dni_ase, nombre, estudios, dni_pol) VALUES
('44444444D', 'Eustaquio', 'ninguno', '11111111A'),
('55555555E', 'Saruman', 'falsificado', '22222222B'),
('66666666F', 'El Dioni', 'básico', '22222222B'),
('99999999I', 'ChatJDT', 'ninguno', '33333333C');

INSERT INTO reunion (codigo, descripcion, fcelebracion) VALUES
('COM001', 'Comisión para subir impuestos', STR_TO_DATE('2024-03-01 10:00','%Y-%m-%d %H:%i')),
('COM002', 'Comisión para asesorar a los asesores', STR_TO_DATE('2024-03-04 13:00','%Y-%m-%d %H:%i')),
('PLE001', 'Pleno del Ayuntamiento', STR_TO_DATE('2024-04-02 9:30','%Y-%m-%d %H:%i'));

INSERT INTO dieta (concepto, descripcion) VALUES
('Desplazamiento', 'Desplazamiento de la planta baja a la primera planta'),
('Productividad', 'Productividad por creación de problemas y burocracia'),
('Plus', 'Plus por cargo adicional'),
('Silla', 'Calentamiento de la silla');

INSERT INTO cobrar (dni_pol, concepto, codigo, importe) VALUES
('11111111A', 'Desplazamiento','PLE001', 500),
('22222222B', 'Desplazamiento','PLE001', 400),
('33333333C', 'Desplazamiento','PLE001', 300),
('77777777G', 'Desplazamiento','PLE001', 300),
('88888888H', 'Desplazamiento','PLE001', 350),
('11111111A', 'Plus','PLE001', 100),
('22222222B', 'Plus','PLE001', 100),
('88888888H', 'Plus','PLE001', 100);

INSERT INTO cobrar (dni_pol, concepto, codigo, importe) VALUES
('11111111A', 'Productividad','COM001', 500),
('22222222B', 'Productividad','COM001', 400),
('33333333C', 'Productividad','COM001', 300),
('77777777G', 'Productividad','COM001', 300),
('88888888H', 'Productividad','COM001', 350),
('11111111A', 'Silla','COM001', 100),
('22222222B', 'Silla','COM001', 100),
('33333333C', 'Silla','COM001', 100),
('77777777G', 'Silla','COM001', 100),
('88888888H', 'Silla','COM001', 100);

INSERT INTO cobrar (dni_pol, concepto, codigo, importe) VALUES
('88888888H', 'Desplazamiento','COM002', 300),
('33333333C', 'Desplazamiento','COM002', 300),
('77777777G', 'Desplazamiento','COM002', 350),
('88888888H', 'Plus','COM002', 300),
('88888888H', 'Silla','COM002', 100),
('33333333C', 'Silla','COM002', 100),
('77777777G', 'Silla','COM002', 100);
