import sqlite3
import os

DB_FILE = "transporte.db"

# Eliminar la base de datos si ya existe para empezar de cero
if os.path.exists(DB_FILE):
    os.remove(DB_FILE)

conn = sqlite3.connect(DB_FILE)
cursor = conn.cursor()

print("✅ Base de datos conectada. Creando tablas...")

# 1. Crear Tablas
cursor.execute("""
CREATE TABLE Empresas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    imagen TEXT NOT NULL
)""")

cursor.execute("""
CREATE TABLE Rutas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    empresa_id INTEGER,
    FOREIGN KEY (empresa_id) REFERENCES Empresas (id)
)""")

cursor.execute("""
CREATE TABLE Paraderos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    ruta_id INTEGER,
    FOREIGN KEY (ruta_id) REFERENCES Rutas (id)
)""")

cursor.execute("""
CREATE TABLE Distritos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
)""")

cursor.execute("""
CREATE TABLE Ruta_Distrito (
    ruta_id INTEGER,
    distrito_id INTEGER,
    PRIMARY KEY (ruta_id, distrito_id),
    FOREIGN KEY (ruta_id) REFERENCES Rutas (id),
    FOREIGN KEY (distrito_id) REFERENCES Distritos (id)
)""")

print("✅ Tablas creadas. Insertando datos...")

# 2. Insertar Datos
distritos = [
    ('SJL',), ('Rímac',), ('Lima',), ('Breña',), ('Pueblo Libre',), ('San Miguel',), ('Callao',),
    ('Carabayllo',), ('Comas',), ('Los Olivos',), ('Surco',), ('SJM',), ('SMP',), ('El Agustino',),
    ('Chorrillos',), ('VES',), ('Puente Piedra',), ('San Isidro',), ('Lince',), ('Miraflores',),
    ('Ventanilla',), ('Santa Anita',), ('Ate',), ('VMT',), ('Pachacámac',), ('La Victoria',), ('Magdalena',)
]
cursor.executemany("INSERT INTO Distritos (nombre) VALUES (?)", distritos)
conn.commit()
print(f"✔️ {len(distritos)} distritos insertados.")

# Mapeo de nombres de distrito a IDs para facilitar las inserciones
distritos_map = {row[1]: row[0] for row in cursor.execute("SELECT id, nombre FROM Distritos")}

empresas_rutas = [
    {"empresa": ("Las Flores – 9306 'La 57'", 'las_flores.png'), "ruta": "Ruta 1 - Lima a San Miguel", "paraderos": ['Jicamarca', 'Av. Wiesse', 'San Carlos', 'Los Postes', 'Puente Nuevo', '28 de Julio', 'Av. Brasil', 'Plaza San Miguel', 'San Felipe', 'Minka', 'Av. Colonial', 'Av. Argentina'], "distritos": ['SJL', 'Rímac', 'Lima', 'Breña', 'Pueblo Libre', 'San Miguel', 'Callao']},
    {"empresa": ("Nueva América – 1702", 'nueva_america_1702.png'), "ruta": "Ruta 2 - Norte a Surco", "paraderos": ['Túpac Amaru', 'Av. Izaguirre', 'Panamericana Norte', 'Evitamiento', 'Alfonso Ugarte', 'Brasil', 'Del Ejército', 'Pardo', 'Ricardo Palma', 'Paseo de la República', 'Benavides', 'Camino Real'], "distritos": ['Carabayllo', 'Comas', 'Los Olivos', 'Lima', 'Surco', 'SJM']},
    {"empresa": ("Nueva América – ICR05 'La C'", 'nueva_america_icr05.png'), "ruta": "Ruta 3 - Callao a Carabayllo", "paraderos": ['Minka', 'Santa Rosa', 'La Marina', 'Elmer Faucett', 'Canta Callao', 'Naranjal', 'Tupac Amaru', 'Izaguirre', 'Av. Los Alisos', 'Los Olivos', 'Trapiche', 'Torreblanca'], "distritos": ['Callao', 'SMP', 'Los Olivos', 'Comas', 'Carabayllo']},
    {"empresa": ("EMPTONSA – 1610", 'emptonsa_1610.png'), "ruta": "Ruta EMPTONSA – 1610", "paraderos": ['Carmen de la Legua', 'Av. Las Torres', 'Nicolás Ayllón', 'Aviación', 'México', 'Manco Cápac', 'Abancay', 'Tomás Valle', 'Túpac Amaru', 'Caquetá', 'Trapiche', 'Torreblanca'], "distritos": ['Callao', 'Lima', 'SJL', 'Rímac', 'Los Olivos', 'Carabayllo']},
    {"empresa": ("ETUL4SA – 3705 'La E'", 'etul4sa_3705_la_e.png'), "ruta": "Ruta ETUL4SA – 3705 'La E'", "paraderos": ['Bayóvar', 'San Carlos', 'Evitamiento', 'Atocongo', 'Benavides', 'Tomás Marsano', 'Ricardo Palma', 'Pardo', 'Larco', 'Av. Huaylas', 'Estación Matellini', 'Alameda Sur'], "distritos": ['SJL', 'El Agustino', 'Surco', 'Chorrillos']},
    {"empresa": ("ETUCHISA – 8108 'La C'", 'etuchisa_8108_la_c.png'), "ruta": "Ruta ETUCHISA – 8108 'La C'", "paraderos": ['VES', 'Av. Lima', 'Puente Alipio', 'Evitamiento', 'Mall del Sur', 'Circunvalación', 'Plaza Norte', 'Megaplaza', 'Ovalo Puente Piedra', 'Zapallal', 'Chillón', 'Progreso'], "distritos": ['VES', 'SJM', 'Surco', 'SMP', 'Comas', 'Puente Piedra']},
    {"empresa": ("Palmari – 1611", 'palmari_1611.png'), "ruta": "Ruta Palmari – 1611", "paraderos": ['Puente Piedra', 'Trapiche', 'Megaplaza', 'Av. Carlos Izaguirre', 'Av. Habich', 'Av. La Marina', 'Av. Sucre', 'Av. Brasil', 'Av. Arequipa', 'San Isidro', 'Av. Arenales', 'Lince'], "distritos": ['Puente Piedra', 'Comas', 'SMP', 'San Miguel', 'Pueblo Libre', 'San Isidro', 'Lince']},
    {"empresa": ("Grupo Diez – 1275", 'grupo_diez_1275.png'), "ruta": "Ruta Grupo Diez – 1275", "paraderos": ['Sarita Colonia', 'Megaplaza', 'Av. Tomás Valle', 'Aeropuerto', 'Av. Elmer Faucett', 'Av. La Marina', 'Av. Brasil', 'Angamos', 'Primavera', 'Monte de los Olivos', 'Av. Central', 'Monterrico'], "distritos": ['SMP', 'Callao', 'San Miguel', 'Miraflores', 'Surco']},
    {"empresa": ("Kilmer – 1448 '87C2'", 'kilmer_1448_87c2.png'), "ruta": "Ruta Kilmer – 1448 '87C2'", "paraderos": ['San Miguel', 'Av. Venezuela', 'Bellavista', 'Aeropuerto', 'Plaza Garibaldi', 'Real Plaza Pro', 'Zapallal', 'Av. San Juan', 'Pachacútec', 'Chillón', 'Av. Canta Callao', 'Puente Piedra'], "distritos": ['San Miguel', 'Callao', 'Los Olivos', 'Puente Piedra', 'Ventanilla']},
    {"empresa": ("Expreso Santa Anita – 1267", 'expreso_santa_anita_1267.png'), "ruta": "Ruta Expreso Santa Anita – 1267", "paraderos": ['Ventanilla', 'Av. Canta Callao', 'Pro', 'Evitamiento', 'Av. Javier Prado', 'Av. Nicolás Ayllón', 'Mall Santa Anita', 'Ceres', 'Av. Metropolitana', 'Estación Huaycán', 'Av. Los Ángeles', 'Central de Ate'], "distritos": ['Ventanilla', 'Callao', 'SMP', 'El Agustino', 'Santa Anita', 'Ate']},
    {"empresa": ("ETAMSA – 1502 '87B'", 'etamsa_1502_87b.png'), "ruta": "Ruta ETAMSA – 1502 '87B'", "paraderos": ['Puente Piedra', 'Megaplaza', 'Av. Universitaria', 'Av. Canta Callao', 'Av. Faucett', 'Aeropuerto', 'La Perla', 'Plaza Garibaldi', 'Av. Colonial', 'Breña', 'Av. Tingo María', 'Plaza Dos de Mayo'], "distritos": ['Puente Piedra', 'SMP', 'Callao', 'Lima', 'Breña']},
    {"empresa": ("ETUL4SA – 8404 'La P'", 'etul4sa_8404_la_p.png'), "ruta": "Ruta ETUL4SA – 8404 'La P'", "paraderos": ['Huaycán', 'Puruchuco', 'Evitamiento', 'Benavides', 'Atocongo', 'Angamos', 'Av. Circunvalación', 'Av. Tomás Marsano', 'Estación Ayacucho', 'Monterrico', 'Santa Rosa', 'Las Palmas'], "distritos": ['Ate', 'SJM', 'VMT', 'Surco', 'Pachacámac']},
    {"empresa": ("San José – CR16", 'san_jose_cr16.png'), "ruta": "Ruta San José – CR16", "paraderos": ['Ventanilla', 'Refinería La Pampilla', 'Av. Néstor Gambetta', 'Av. Guardia Chalaca', 'Aeropuerto', 'Av. La Marina', 'Av. Universitaria', 'San Marcos', 'Plaza San Miguel', 'Av. Brasil', 'Plaza Bolognesi'], "distritos": ['Ventanilla', 'Callao', 'San Miguel', 'Lima']},
    {"empresa": ("Etusa – 3511/7501", 'etusa_3511_7501.png'), "ruta": "Ruta Etusa – 3511/7501", "paraderos": ['Villa El Salvador', 'Puente Alipio', 'Circunvalación', 'Óvalo Higuereta', 'Estación Angamos', 'Av. Tomás Marsano', 'Av. Javier Prado', 'Av. Canadá', 'Av. México', 'Manco Cápac', 'Abancay', 'Caquetá'], "distritos": ['VES', 'Surco', 'La Victoria', 'Lima', 'Rímac']},
    {"empresa": ("Etupsa 73 – 8525", 'etupsa_73_8525.png'), "ruta": "Ruta Etupsa 73 – 8525", "paraderos": ['Villa María', 'Av. Pachacútec', 'Óvalo Alipio', 'Av. Los Héroes', 'Plaza Unión', 'Nicolás de Piérola', 'Av. Abancay', 'Grau', 'Hospital 2 de Mayo', 'Plaza Bolognesi', 'Magdalena', 'Av. La Marina'], "distritos": ['VMT', 'SJM', 'Lima', 'Breña', 'Magdalena', 'San Miguel']}
]

for item in empresas_rutas:
    # Insertar Empresa
    cursor.execute("INSERT INTO Empresas (nombre, imagen) VALUES (?, ?)", item["empresa"])
    empresa_id = cursor.lastrowid
    
    # Insertar Ruta
    cursor.execute("INSERT INTO Rutas (nombre, empresa_id) VALUES (?, ?)", (item["ruta"], empresa_id))
    ruta_id = cursor.lastrowid
    
    # Insertar Paraderos
    paraderos_data = [(p, ruta_id) for p in item["paraderos"]]
    cursor.executemany("INSERT INTO Paraderos (nombre, ruta_id) VALUES (?, ?)", paraderos_data)
    
    # Insertar Ruta_Distrito
    ruta_distrito_data = [(ruta_id, distritos_map[d_nombre]) for d_nombre in item["distritos"]]
    cursor.executemany("INSERT INTO Ruta_Distrito (ruta_id, distrito_id) VALUES (?, ?)", ruta_distrito_data)

conn.commit()
print(f"✔️ {len(empresas_rutas)} empresas y sus rutas han sido insertadas.")

conn.close()
print("✅ Proceso completado. La base de datos 'transporte.db' ha sido creada.")