from flask import Flask, render_template, request, g
import sqlite3
import unicodedata
import os

app = Flask(__name__)
DATABASE = 'transporte.db'

# --- Conexión a la Base de Datos ---
def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
        db.row_factory = sqlite3.Row  # Para acceder a las columnas por nombre
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

# --- Funciones de Lógica ---
def normalizar(texto):
    if not texto:
        return ""
    return ''.join(
        c for c in unicodedata.normalize('NFD', texto)
        if unicodedata.category(c) != 'Mn'
    ).lower().strip()

# --- Rutas de la Aplicación Web ---

@app.route('/')
def index():
    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT nombre FROM Distritos ORDER BY nombre ASC")
    distritos = [row['nombre'] for row in cursor.fetchall()]
    return render_template('index.html', distritos=distritos)

@app.route('/buscar', methods=['POST'])
def buscar():
    origen = normalizar(request.form['origen'])
    destino = normalizar(request.form['destino'])
    
    if not origen or not destino or origen == destino:
        # Podríamos agregar un mensaje de error aquí
        return index()

    db = get_db()
    cursor = db.cursor()
    
    cursor.execute("SELECT id, nombre FROM Rutas")
    todas_las_rutas = cursor.fetchall()
    
    rutas_encontradas = []
    
    for ruta in todas_las_rutas:
        cursor.execute("""
            SELECT d.nombre FROM Distritos d
            JOIN Ruta_Distrito rd ON d.id = rd.distrito_id
            WHERE rd.ruta_id = ?
        """, (ruta['id'],))
        
        distritos_de_la_ruta = [normalizar(row['nombre']) for row in cursor.fetchall()]
        
        if origen in distritos_de_la_ruta and destino in distritos_de_la_ruta:
            rutas_encontradas.append(ruta)
            
    return render_template('resultados.html', rutas=rutas_encontradas, origen=request.form['origen'], destino=request.form['destino'])

@app.route('/ruta/<int:ruta_id>')
def detalles_ruta(ruta_id):
    db = get_db()
    cursor = db.cursor()
    
    # Obtener detalles de la ruta y empresa
    cursor.execute("""
        SELECT r.nombre as ruta_nombre, e.nombre as empresa_nombre, e.imagen 
        FROM Rutas r
        JOIN Empresas e ON r.empresa_id = e.id
        WHERE r.id = ?
    """, (ruta_id,))
    ruta_info = cursor.fetchone()
    
    # Obtener paraderos
    cursor.execute("SELECT nombre FROM Paraderos WHERE ruta_id = ? ORDER BY id ASC", (ruta_id,))
    paraderos = [row['nombre'] for row in cursor.fetchall()]
    
    # Obtener distritos
    cursor.execute("""
        SELECT d.nombre FROM Distritos d
        JOIN Ruta_Distrito rd ON d.id = rd.distrito_id
        WHERE rd.ruta_id = ?
        ORDER BY d.nombre ASC
    """, (ruta_id,))
    distritos = [row['nombre'] for row in cursor.fetchall()]
    
    return render_template('detalles_ruta.html', ruta=ruta_info, paraderos=paraderos, distritos=distritos)

@app.route('/todas')
def todas_las_rutas():
    db = get_db()
    cursor = db.cursor()
    cursor.execute("""
        SELECT r.id, r.nombre, e.nombre as empresa_nombre
        FROM Rutas r
        JOIN Empresas e ON r.empresa_id = e.id
        ORDER BY r.id
    """)
    rutas = cursor.fetchall()
    return render_template('todas_rutas.html', rutas=rutas)


if __name__ == '__main__':
    # El host '0.0.0.0' es necesario para que sea visible en Gitpod
    app.run(host='0.0.0.0', port=5000, debug=True)