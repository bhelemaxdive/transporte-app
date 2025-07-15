CREATE TABLE Empresas (
id INT PRIMARY KEY IDENTITY(1,1),
nombre NVARCHAR(100),
imagen NVARCHAR(100)
);

CREATE TABLE Rutas (
id INT PRIMARY KEY IDENTITY(1,1),
nombre NVARCHAR(100),
empresa_id INT FOREIGN KEY REFERENCES Empresas(id)
);

CREATE TABLE Paraderos (
id INT PRIMARY KEY IDENTITY(1,1),
nombre NVARCHAR(100),
ruta_id INT FOREIGN KEY REFERENCES Rutas(id)
);
CREATE TABLE Distritos (
id INT PRIMARY KEY IDENTITY(1,1),
nombre NVARCHAR(100) UNIQUE
);

CREATE TABLE Ruta_Distrito (
ruta_id INT FOREIGN KEY REFERENCES Rutas(id),
distrito_id INT FOREIGN KEY REFERENCES Distritos(id),
PRIMARY KEY (ruta_id, distrito_id)
);
INSERT INTO Distritos (nombre) VALUES
('SJL'), ('Rímac'), ('Lima'), ('Breña'), ('Pueblo Libre'), ('San Miguel'), ('Callao'),
('Carabayllo'), ('Comas'), ('Los Olivos'), ('Surco'), ('SJM'), ('SMP'), ('El Agustino'),
('Chorrillos'), ('VES'), ('Puente Piedra'), ('San Isidro'), ('Lince'), ('Miraflores'),
('Ventanilla'), ('Santa Anita'), ('Ate'), ('VMT'), ('Pachacámac'), ('La Victoria'),
('Magdalena');

-- EMPRESA 1
INSERT INTO Empresas (nombre, imagen) VALUES (N'Las Flores – 9306 ''La 57''', 'las_flores.png');
DECLARE @empresa1 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta 1 - Lima a San Miguel', @empresa1);
DECLARE @ruta1 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Jicamarca', @ruta1), ('Av. Wiesse', @ruta1), ('San Carlos', @ruta1), ('Los Postes', @ruta1),
('Puente Nuevo', @ruta1), ('28 de Julio', @ruta1), ('Av. Brasil', @ruta1), ('Plaza San Miguel', @ruta1),
('San Felipe', @ruta1), ('Minka', @ruta1), ('Av. Colonial', @ruta1), ('Av. Argentina', @ruta1);

-- EMPRESA 2
INSERT INTO Empresas (nombre, imagen) VALUES (N'Nueva América – 1702', 'nueva_america_1702.png');
DECLARE @empresa2 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta 2 - Norte a Surco', @empresa2);
DECLARE @ruta2 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Túpac Amaru', @ruta2), ('Av. Izaguirre', @ruta2), ('Panamericana Norte', @ruta2),
('Evitamiento', @ruta2), ('Alfonso Ugarte', @ruta2), ('Brasil', @ruta2), ('Del Ejército', @ruta2),
('Pardo', @ruta2), ('Ricardo Palma', @ruta2), ('Paseo de la República', @ruta2),
('Benavides', @ruta2), ('Camino Real', @ruta2);

-- EMPRESA 3
INSERT INTO Empresas (nombre, imagen) VALUES (N'Nueva América – ICR05 ''La C''', 'nueva_america_icr05.png');
DECLARE @empresa3 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta 3 - Callao a Carabayllo', @empresa3);
DECLARE @ruta3 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Minka', @ruta3), ('Santa Rosa', @ruta3), ('La Marina', @ruta3), ('Elmer Faucett', @ruta3),
('Canta Callao', @ruta3), ('Naranjal', @ruta3), ('Tupac Amaru', @ruta3), ('Izaguirre', @ruta3),
('Av. Los Alisos', @ruta3), ('Los Olivos', @ruta3), ('Trapiche', @ruta3), ('Torreblanca', @ruta3);

-- EMPRESA 4
INSERT INTO Empresas (nombre, imagen) VALUES (N'EMPTONSA – 1610', 'emptonsa_1610.png');
DECLARE @empresa4 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta EMPTONSA – 1610', @empresa4);
DECLARE @ruta4 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Carmen de la Legua', @ruta4), ('Av. Las Torres', @ruta4), ('Nicolás Ayllón', @ruta4),
('Aviación', @ruta4), ('México', @ruta4), ('Manco Cápac', @ruta4), ('Abancay', @ruta4),
('Tomás Valle', @ruta4), ('Túpac Amaru', @ruta4), ('Caquetá', @ruta4), ('Trapiche', @ruta4),
('Torreblanca', @ruta4);

-- EMPRESA 5
INSERT INTO Empresas (nombre, imagen) VALUES (N'ETUL4SA – 3705 ''La E''', 'etul4sa_3705_la_e.png');
DECLARE @empresa5 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta ETUL4SA – 3705 ''La E''', @empresa5);
DECLARE @ruta5 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Bayóvar', @ruta5), ('San Carlos', @ruta5), ('Evitamiento', @ruta5), ('Atocongo', @ruta5),
('Benavides', @ruta5), ('Tomás Marsano', @ruta5), ('Ricardo Palma', @ruta5), ('Pardo', @ruta5),
('Larco', @ruta5), ('Av. Huaylas', @ruta5), ('Estación Matellini', @ruta5), ('Alameda Sur', @ruta5);

-- EMPRESA 6
INSERT INTO Empresas (nombre, imagen) VALUES (N'ETUCHISA – 8108 ''La C''', 'etuchisa_8108_la_c.png');
DECLARE @empresa6 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta ETUCHISA – 8108 ''La C''', @empresa6);
DECLARE @ruta6 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('VES', @ruta6), ('Av. Lima', @ruta6), ('Puente Alipio', @ruta6), ('Evitamiento', @ruta6),
('Mall del Sur', @ruta6), ('Circunvalación', @ruta6), ('Plaza Norte', @ruta6), ('Megaplaza', @ruta6),
('Ovalo Puente Piedra', @ruta6), ('Zapallal', @ruta6), ('Chillón', @ruta6), ('Progreso', @ruta6);

-- EMPRESA 7
INSERT INTO Empresas (nombre, imagen) VALUES (N'Palmari – 1611', 'palmari_1611.png');
DECLARE @empresa7 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta Palmari – 1611', @empresa7);
DECLARE @ruta7 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Puente Piedra', @ruta7), ('Trapiche', @ruta7), ('Megaplaza', @ruta7), ('Av. Carlos Izaguirre', @ruta7),
('Av. Habich', @ruta7), ('Av. La Marina', @ruta7), ('Av. Sucre', @ruta7), ('Av. Brasil', @ruta7),
('Av. Arequipa', @ruta7), ('San Isidro', @ruta7), ('Av. Arenales', @ruta7), ('Lince', @ruta7);

-- EMPRESA 8
INSERT INTO Empresas (nombre, imagen) VALUES (N'Grupo Diez – 1275', 'grupo_diez_1275.png');
DECLARE @empresa8 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta Grupo Diez – 1275', @empresa8);
DECLARE @ruta8 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Sarita Colonia', @ruta8), ('Megaplaza', @ruta8), ('Av. Tomás Valle', @ruta8), ('Aeropuerto', @ruta8),
('Av. Elmer Faucett', @ruta8), ('Av. La Marina', @ruta8), ('Av. Brasil', @ruta8), ('Angamos', @ruta8),
('Primavera', @ruta8), ('Monte de los Olivos', @ruta8), ('Av. Central', @ruta8), ('Monterrico', @ruta8);

-- EMPRESA 9
INSERT INTO Empresas (nombre, imagen) VALUES (N'Kilmer – 1448 ''87C2''', 'kilmer_1448_87c2.png');
DECLARE @empresa9 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta Kilmer – 1448 ''87C2''', @empresa9);
DECLARE @ruta9 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('San Miguel', @ruta9), ('Av. Venezuela', @ruta9), ('Bellavista', @ruta9), ('Aeropuerto', @ruta9),
('Plaza Garibaldi', @ruta9), ('Real Plaza Pro', @ruta9), ('Zapallal', @ruta9), ('Av. San Juan', @ruta9),
('Pachacútec', @ruta9), ('Chillón', @ruta9), ('Av. Canta Callao', @ruta9), ('Puente Piedra', @ruta9);

-- EMPRESA 10
INSERT INTO Empresas (nombre, imagen) VALUES (N'Expreso Santa Anita – 1267', 'expreso_santa_anita_1267.png');
DECLARE @empresa10 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta Expreso Santa Anita – 1267', @empresa10);
DECLARE @ruta10 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Ventanilla', @ruta10), ('Av. Canta Callao', @ruta10), ('Pro', @ruta10), ('Evitamiento', @ruta10),
('Av. Javier Prado', @ruta10), ('Av. Nicolás Ayllón', @ruta10), ('Mall Santa Anita', @ruta10),
('Ceres', @ruta10), ('Av. Metropolitana', @ruta10), ('Estación Huaycán', @ruta10),
('Av. Los Ángeles', @ruta10), ('Central de Ate', @ruta10);

-- EMPRESA 11
INSERT INTO Empresas (nombre, imagen) VALUES (N'ETAMSA – 1502 ''87B''', 'etamsa_1502_87b.png');
DECLARE @empresa11 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta ETAMSA – 1502 ''87B''', @empresa11);
DECLARE @ruta11 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Puente Piedra', @ruta11), ('Megaplaza', @ruta11), ('Av. Universitaria', @ruta11),
('Av. Canta Callao', @ruta11), ('Av. Faucett', @ruta11), ('Aeropuerto', @ruta11),
('La Perla', @ruta11), ('Plaza Garibaldi', @ruta11), ('Av. Colonial', @ruta11),
('Breña', @ruta11), ('Av. Tingo María', @ruta11), ('Plaza Dos de Mayo', @ruta11);

-- EMPRESA 12
INSERT INTO Empresas (nombre, imagen) VALUES (N'ETUL4SA – 8404 ''La P''', 'etul4sa_8404_la_p.png');
DECLARE @empresa12 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta ETUL4SA – 8404 ''La P''', @empresa12);
DECLARE @ruta12 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Huaycán', @ruta12), ('Puruchuco', @ruta12), ('Evitamiento', @ruta12), ('Benavides', @ruta12),
('Atocongo', @ruta12), ('Angamos', @ruta12), ('Av. Circunvalación', @ruta12),
('Av. Tomás Marsano', @ruta12), ('Estación Ayacucho', @ruta12), ('Monterrico', @ruta12),
('Santa Rosa', @ruta12), ('Las Palmas', @ruta12);

-- EMPRESA 13
INSERT INTO Empresas (nombre, imagen) VALUES (N'San José – CR16', 'san_jose_cr16.png');
DECLARE @empresa13 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta San José – CR16', @empresa13);
DECLARE @ruta13 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Ventanilla', @ruta13), ('Refinería La Pampilla', @ruta13), ('Av. Néstor Gambetta', @ruta13),
('Av. Guardia Chalaca', @ruta13), ('Aeropuerto', @ruta13), ('Av. La Marina', @ruta13),
('Av. Universitaria', @ruta13), ('San Marcos', @ruta13), ('Plaza San Miguel', @ruta13),
('Av. Brasil', @ruta13), ('Plaza Bolognesi', @ruta13);

-- EMPRESA 14
INSERT INTO Empresas (nombre, imagen) VALUES (N'Etusa – 3511/7501', 'etusa_3511_7501.png');
DECLARE @empresa14 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta Etusa – 3511/7501', @empresa14);
DECLARE @ruta14 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Villa El Salvador', @ruta14), ('Puente Alipio', @ruta14), ('Circunvalación', @ruta14),
('Óvalo Higuereta', @ruta14), ('Estación Angamos', @ruta14), ('Av. Tomás Marsano', @ruta14),
('Av. Javier Prado', @ruta14), ('Av. Canadá', @ruta14), ('Av. México', @ruta14),
('Manco Cápac', @ruta14), ('Abancay', @ruta14), ('Caquetá', @ruta14);

-- EMPRESA 15
INSERT INTO Empresas (nombre, imagen) VALUES (N'Etupsa 73 – 8525', 'etupsa_73_8525.png');
DECLARE @empresa15 INT = SCOPE_IDENTITY();

INSERT INTO Rutas (nombre, empresa_id) VALUES (N'Ruta Etupsa 73 – 8525', @empresa15);
DECLARE @ruta15 INT = SCOPE_IDENTITY();

INSERT INTO Paraderos (nombre, ruta_id) VALUES
('Villa María', @ruta15), ('Av. Pachacútec', @ruta15), ('Óvalo Alipio', @ruta15),
('Av. Los Héroes', @ruta15), ('Plaza Unión', @ruta15), ('Nicolás de Piérola', @ruta15),
('Av. Abancay', @ruta15), ('Grau', @ruta15), ('Hospital 2 de Mayo', @ruta15),
('Plaza Bolognesi', @ruta15), ('Magdalena', @ruta15), ('Av. La Marina', @ruta15);

-- EMPRESA 1: Las Flores – 9306 'La 57' (Ruta 1 - Lima a San Miguel)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta1, id FROM Distritos WHERE nombre IN ('SJL', 'Rímac', 'Lima', 'Breña', 'Pueblo Libre', 'San Miguel', 'Callao');

-- EMPRESA 2: Nueva América – 1702 (Ruta 2 - Norte a Surco)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta2, id FROM Distritos WHERE nombre IN ('Carabayllo', 'Comas', 'Los Olivos', 'Lima', 'Surco', 'SJM');

-- EMPRESA 3: Nueva América – ICR05 'La C' (Ruta 3 - Callao a Carabayllo)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta3, id FROM Distritos WHERE nombre IN ('Callao', 'SMP', 'Los Olivos', 'Comas', 'Carabayllo');

-- EMPRESA 4: EMPTONSA – 1610 (Ruta EMPTONSA – 1610)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta4, id FROM Distritos WHERE nombre IN ('Callao', 'Lima', 'SJL', 'Rímac', 'Los Olivos', 'Carabayllo');

-- EMPRESA 5: ETUL4SA – 3705 'La E' (Ruta ETUL4SA – 3705 'La E')
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta5, id FROM Distritos WHERE nombre IN ('SJL', 'El Agustino', 'Surco', 'Chorrillos');

-- EMPRESA 6: ETUCHISA – 8108 'La C' (Ruta ETUCHISA – 8108 'La C')
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta6, id FROM Distritos WHERE nombre IN ('VES', 'SJM', 'Surco', 'SMP', 'Comas', 'Puente Piedra');

-- EMPRESA 7: Palmari – 1611 (Ruta Palmari – 1611)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta7, id FROM Distritos WHERE nombre IN ('Puente Piedra', 'Comas', 'SMP', 'San Miguel', 'Pueblo Libre', 'San Isidro', 'Lince');

-- EMPRESA 8: Grupo Diez – 1275 (Ruta Grupo Diez – 1275)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta8, id FROM Distritos WHERE nombre IN ('SMP', 'Callao', 'San Miguel', 'Miraflores', 'Surco');

-- EMPRESA 9: Kilmer – 1448 '87C2' (Ruta Kilmer – 1448 '87C2')
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta9, id FROM Distritos WHERE nombre IN ('San Miguel', 'Callao', 'Los Olivos', 'Puente Piedra', 'Ventanilla');

-- EMPRESA 10: Expreso Santa Anita – 1267 (Ruta Expreso Santa Anita – 1267)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta10, id FROM Distritos WHERE nombre IN ('Ventanilla', 'Callao', 'SMP', 'El Agustino', 'Santa Anita', 'Ate');

-- EMPRESA 11: ETAMSA – 1502 '87B' (Ruta ETAMSA – 1502 '87B')
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta11, id FROM Distritos WHERE nombre IN ('Puente Piedra', 'SMP', 'Callao', 'Lima', 'Breña');

-- EMPRESA 12: ETUL4SA – 8404 'La P' (Ruta ETUL4SA – 8404 'La P')
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta12, id FROM Distritos WHERE nombre IN ('Ate', 'SJM', 'VMT', 'Surco', 'Pachacámac');

-- EMPRESA 13: San José – CR16 (Ruta San José – CR16)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta13, id FROM Distritos WHERE nombre IN ('Ventanilla', 'Callao', 'San Miguel', 'Lima');

-- EMPRESA 14: Etusa – 3511/7501 (Ruta Etusa – 3511/7501)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta14, id FROM Distritos WHERE nombre IN ('VES', 'Surco', 'La Victoria', 'Lima', 'Rímac');

-- EMPRESA 15: Etupsa 73 – 8525 (Ruta Etupsa 73 – 8525)
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta15, id FROM Distritos WHERE nombre IN ('VMT', 'SJM', 'Lima', 'Breña', 'Magdalena', 'San Miguel');

DECLARE @ruta1 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Ruta 1%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta1, id FROM Distritos WHERE nombre IN ('SJL', 'Rímac', 'Lima', 'Breña', 'Pueblo Libre', 'San Miguel', 'Callao');

DECLARE @ruta2 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Ruta 2%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta2, id FROM Distritos WHERE nombre IN ('Carabayllo', 'Comas', 'Los Olivos', 'Lima', 'Surco', 'SJM');

DECLARE @ruta3 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Ruta 3%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta3, id FROM Distritos WHERE nombre IN ('Callao', 'SMP', 'Los Olivos', 'Comas', 'Carabayllo');

DECLARE @ruta4 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%EMPTONSA%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta4, id FROM Distritos WHERE nombre IN ('Callao', 'Lima', 'SJL', 'Rímac', 'Los Olivos', 'Carabayllo');

DECLARE @ruta5 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%3705%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta5, id FROM Distritos WHERE nombre IN ('SJL', 'El Agustino', 'Surco', 'Chorrillos');

DECLARE @ruta6 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%ETUCHISA%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta6, id FROM Distritos WHERE nombre IN ('VES', 'SJM', 'Surco', 'SMP', 'Comas', 'Puente Piedra');

DECLARE @ruta7 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Palmari%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta7, id FROM Distritos WHERE nombre IN ('Puente Piedra', 'Comas', 'SMP', 'San Miguel', 'Pueblo Libre', 'San Isidro', 'Lince');

DECLARE @ruta8 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Grupo Diez%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta8, id FROM Distritos WHERE nombre IN ('SMP', 'Callao', 'San Miguel', 'Miraflores', 'Surco');

DECLARE @ruta9 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Kilmer%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta9, id FROM Distritos WHERE nombre IN ('San Miguel', 'Callao', 'Los Olivos', 'Puente Piedra', 'Ventanilla');

DECLARE @ruta10 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Santa Anita%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta10, id FROM Distritos WHERE nombre IN ('Ventanilla', 'Callao', 'SMP', 'El Agustino', 'Santa Anita', 'Ate');

DECLARE @ruta11 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%ETAMSA%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta11, id FROM Distritos WHERE nombre IN ('Puente Piedra', 'SMP', 'Callao', 'Lima', 'Breña');

DECLARE @ruta12 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%8404%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta12, id FROM Distritos WHERE nombre IN ('Ate', 'SJM', 'VMT', 'Surco', 'Pachacámac');

DECLARE @ruta13 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%San José%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta13, id FROM Distritos WHERE nombre IN ('Ventanilla', 'Callao', 'San Miguel', 'Lima');

DECLARE @ruta14 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Etusa%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta14, id FROM Distritos WHERE nombre IN ('VES', 'Surco', 'La Victoria', 'Lima', 'Rímac');

DECLARE @ruta15 INT = (SELECT id FROM Rutas WHERE nombre LIKE '%Etupsa%');
INSERT INTO Ruta_Distrito (ruta_id, distrito_id)
SELECT @ruta15, id FROM Distritos WHERE nombre IN ('VMT', 'SJM', 'Lima', 'Breña', 'Magdalena', 'San Miguel');
