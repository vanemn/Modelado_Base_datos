# Modelado_Base_datos
# Proyecto: Gestión de Pedidos - Circular Chic

Este repositorio contiene el desarrollo completo del sistema de **Gestión de Pedidos** para la empresa **Circular Chic**, abarcando desde el diseño conceptual hasta la implementación técnica de la base de datos relacional y NoSQL.

---


## 🎯 Objetivos del Proyecto

- Diseñar e implementar una base de datos relacional para la gestión de pedidos de Circular Chic
- Aplicar metodologías de modelado de bases de datos (conceptual, E/R, relacional)
- Implementar consultas SQL complejas y operaciones CRUD
- Integrar una base de datos NoSQL (MongoDB) como complemento
- Documentar todo el proceso de desarrollo

---

## 🛠️ Herramientas Utilizadas

| Herramienta | Uso en el Proyecto |
|-------------|-------------------|
| **Excel** | Organización inicial de datos y requisitos |
| **Draw.io** | Creación de diagramas E/R y conceptuales |
| **DBDesigner** | Diseño del modelo relacional |
| **MySQL 8.0+** | Sistema de gestión de bases de datos |
| **phpMyAdmin** | Administración y consultas SQL |
| **MongoDB** | Base de datos NoSQL complementaria |
| **MongoDB Compass** | Interfaz gráfica para MongoDB |
| **MySQL Workbench** | Diseño y modelado físico |

---

## 📊 Fases del Proyecto

### 1. Modelo Conceptual
Definición de entidades principales y sus relaciones en el dominio de gestión de pedidos.

### 2. Modelo Entidad-Relación (E/R)
Diagrama detallado con:
- 6 entidades principales
- Atributos clave y descriptivos
- Relaciones con cardinalidades específicas
- Identificadores únicos

### 3. Modelo Relacional
Transformación del modelo E/R a tablas normalizadas:
- Definición de claves primarias y foráneas
- Tipos de datos optimizados
- Restricciones de integridad

### 4. Implementación en MySQL
Creación física de la base de datos con ajustes importantes:
- Cambio de `TINYINT` a `INT` para IDs (evitar limitaciones)
- `VARCHAR` para teléfonos (no son datos numéricos para cálculo)
- `DECIMAL(10,2)` para importes (precisión financiera)
- `DECIMAL(6,2)` para pesos (evitar errores de redondeo)

### 5. Poblado de Datos
Inserción de datos de prueba con valores realistas y coherentes.

### 6. Consultas y Operaciones
Implementación de consultas SQL para:
- Consultas de selección (`SELECT`)
- Actualizaciones (`UPDATE`)
- Eliminaciones (`DELETE`)
- Consultas multitabla (`JOIN`)

### 7. Migración a MongoDB
Adaptación del modelo relacional a colecciones NoSQL y ejecución de consultas equivalentes.

---

## 🗂️ Modelo de Base de Datos

### Tablas Principales

#### 1. **Clientes**
```sql
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    direccion VARCHAR(100),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(15),
    email VARCHAR(100) UNIQUE
);
```

#### 2. **Pedidos**
```sql
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    Clientes_id_cliente INT NOT NULL,
    estado ENUM('pendiente', 'en_reparto', 'entregado', 'cancelado'),
    peso DECIMAL(6,2),
    cantidad_producto INT,
    importe_pedido DECIMAL(10,2),
    fecha_pedido DATE,
    FOREIGN KEY (Clientes_id_cliente) REFERENCES Clientes(id_cliente)
);
```

#### 3. **Facturas**
```sql
CREATE TABLE Facturas (
    id_factura INT PRIMARY KEY AUTO_INCREMENT,
    Clientes_id_cliente INT NOT NULL,
    descripcion VARCHAR(200),
    importe_factura DECIMAL(10,2),
    sucursal VARCHAR(50),
    fecha_factura DATE,
    FOREIGN KEY (Clientes_id_cliente) REFERENCES Clientes(id_cliente)
);
```

#### 4. **Productos**
```sql
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nom_producto VARCHAR(100) NOT NULL,
    categoria ENUM('mujer', 'hombre', 'niño', 'accesorios'),
    precio DECIMAL(8,2),
    stok_producto INT DEFAULT 0
);
```

#### 5. **Productos_de_clientes** (Tabla de relación)
```sql
CREATE TABLE Productos_de_clientes (
    Clientes_id_cliente INT,
    Productos_id_producto INT,
    fecha_compra DATE,
    PRIMARY KEY (Clientes_id_cliente, Productos_id_producto),
    FOREIGN KEY (Clientes_id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (Productos_id_producto) REFERENCES Productos(id_producto)
);
```

#### 6. **Productos_de_pedidos** (Tabla de relación)
```sql
CREATE TABLE Productos_de_pedidos (
    Productos_id_producto INT,
    Pedidos_id_pedido INT,
    cantidad INT DEFAULT 1,
    PRIMARY KEY (Productos_id_producto, Pedidos_id_pedido),
    FOREIGN KEY (Productos_id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (Pedidos_id_pedido) REFERENCES Pedidos(id_pedido)
);
```

---

## 🧪 Consultas SQL Ejecutadas

### **Actualizaciones (UPDATE)**

#### UPDATE 1: Actualizar teléfono de un cliente
```sql
UPDATE Clientes 
SET telefono = '123456789' 
WHERE id_cliente = 5;
```

#### UPDATE 2: Cambiar estado de pedido
```sql
UPDATE Pedidos 
SET estado = 'entregado' 
WHERE id_pedido = 7;
```

#### UPDATE 3: Aumentar stock de un producto
```sql
UPDATE Productos 
SET stok_producto = stok_producto + 10 
WHERE id_producto = 1;
```

#### UPDATE 4: Modificar importe de factura
```sql
UPDATE Facturas 
SET importe_factura = 999.00 
WHERE id_factura = 7;
```

#### UPDATE 5: Cambiar sucursal de factura
```sql
UPDATE Facturas 
SET sucursal = 'Santander' 
WHERE id_factura = 3;
```

### **Eliminaciones (DELETE)**

#### DELETE 1: Eliminar cliente por ID
```sql
DELETE FROM Clientes 
WHERE id_cliente = 10;
```

#### DELETE 2: Eliminar pedidos cancelados
```sql
DELETE FROM Pedidos 
WHERE estado = 'cancelado';
```

#### DELETE 3: Eliminar facturas con importe 0
```sql
DELETE FROM Facturas 
WHERE importe_factura = 0;
```

#### DELETE 4: Eliminar relación producto-cliente
```sql
DELETE FROM Productos_de_clientes 
WHERE Clientes_id_cliente = 1 AND Productos_id_producto = 3;
```

#### DELETE 5: Eliminar relación producto-pedido
```sql
DELETE FROM Productos_de_pedidos 
WHERE Productos_id_producto = 6 AND Pedidos_id_pedido = 4;
```

### **Selecciones (SELECT)**

#### SELECT 1: Mostrar todos los clientes
```sql
SELECT * FROM Clientes;
```

#### SELECT 2: Clientes cuyo CP empieza por 3900
```sql
SELECT * FROM Clientes 
WHERE codigo_postal LIKE '3900%';
```

#### SELECT 3: Pedidos pagados
```sql
SELECT * FROM Pedidos 
WHERE estado = 'entregado';
```

#### SELECT 4: Productos con stock mayor a 30
```sql
SELECT * FROM Productos 
WHERE stok_producto > 30;
```

#### SELECT 5: Facturas de la sucursal Santander
```sql
SELECT * FROM Facturas 
WHERE sucursal = 'Santander';
```

#### SELECT 6: Pedidos con importe mayor a 100
```sql
SELECT * FROM Pedidos 
WHERE importe_pedido > 100;
```

#### SELECT 7: Clientes ordenados por apellido
```sql
SELECT * FROM Clientes 
ORDER BY apellido1, apellido2;
```

#### SELECT 8: Productos de categoría mujer
```sql
SELECT * FROM Productos 
WHERE categoria = 'mujer';
```

#### SELECT 9: Facturas entre dos fechas
```sql
SELECT * FROM Facturas 
WHERE fecha_factura BETWEEN '2024-01-01' AND '2024-12-31';
```

#### SELECT 10: Pedidos con cantidad de productos mayor a 3
```sql
SELECT * FROM Pedidos 
WHERE cantidad_producto > 3;
```

---

## 🔗 Consultas Multitabla

### JOIN 1: Facturas con datos del cliente
```sql
SELECT f.id_factura, f.descripcion, f.importe_factura, 
       c.nombre, c.apellido1 
FROM Facturas f
JOIN Clientes c ON f.Clientes_id_cliente = c.id_cliente;
```

### JOIN 2: Pedidos con nombre del cliente
```sql
SELECT p.id_pedido, p.estado, p.importe_pedido, 
       c.nombre, c.apellido1 
FROM Pedidos p
JOIN Clientes c ON p.Clientes_id_cliente = c.id_cliente;
```

### JOIN 3: Productos incluidos en cada pedido
```sql
SELECT pp.Pedidos_id_pedido, pr.nom_producto, pr.categoria 
FROM Productos_de_pedidos pp
JOIN Productos pr ON pp.Productos_id_producto = pr.id_producto;
```

---

## 🔄 Migración a MongoDB

### Estructura de Colecciones en MongoDB

```javascript
// Colección: clientes
{
  _id: ObjectId,
  id_cliente: Number,
  nombre: String,
  apellido1: String,
  apellido2: String,
  direccion: String,
  codigo_postal: String,
  telefono: String,
  email: String
}

// Colección: pedidos
{
  _id: ObjectId,
  id_pedido: Number,
  id_cliente: Number,
  estado: String,
  peso: Number,
  productos: [
    {
      id_producto: Number,
      nombre: String,
      cantidad: Number,
      precio: Number
    }
  ],
  importe_total: Number,
  fecha_pedido: Date
}

// Colección: productos
{
  _id: ObjectId,
  id_producto: Number,
  nom_producto: String,
  categoria: String,
  precio: Number,
  stock: Number
}
```

### Consultas en MongoDB

#### Selección de clientes
```javascript
db.clientes.find(
  {}, 
  {id_cliente: 1, nombre: 1, apellido1: 1, _id: 0}
).sort({apellido1: 1});
```

#### Consulta multitabla equivalente
```javascript
db.pedidos.aggregate([
  {
    $lookup: {
      from: "clientes",
      localField: "id_cliente",
      foreignField: "id_cliente",
      as: "cliente_info"
    }
  },
  {
    $unwind: "$cliente_info"
  },
  {
    $project: {
      id_pedido: 1,
      estado: 1,
      importe_total: 1,
      nombre_cliente: "$cliente_info.nombre",
      apellido_cliente: "$cliente_info.apellido1"
    }
  }
]);
```

---

## 🚀 Cómo Ejecutar el Proyecto

### Prerrequisitos
- MySQL 8.0 o superior
- phpMyAdmin (opcional)
- MongoDB 6.0 o superior
- MongoDB Compass (opcional)


---

## 📌 Conclusión

Este proyecto permitió aplicar de manera integral los conceptos fundamentales del diseño y gestión de bases de datos relacionales. Se realizó un proceso completo que incluyó:

1. **Modelado Conceptual**: Definición de entidades y relaciones del negocio
2. **Modelado Lógico**: Transformación a modelo E/R con cardinalidades
3. **Modelado Físico**: Implementación en MySQL con tipos de datos optimizados
4. **Poblado y Consultas**: Datos de prueba y operaciones CRUD complejas
5. **Integración NoSQL**: Migración parcial a MongoDB para análisis complementario

### Lecciones Aprendidas
- La importancia de elegir tipos de datos adecuados para cada atributo
- Ventajas de la normalización en bases de datos relacionales
- Diferencias prácticas entre SQL y NoSQL
- Herramientas colaborativas para diseño de bases de datos

### Posibles Mejoras Futuras
1. Implementar vistas materializadas para consultas frecuentes
2. Crear procedimientos almacenados para operaciones complejas
3. Diseñar triggers para mantener la integridad referencial
4. Implementar índices para optimizar consultas frecuentes
5. Desarrollar una interfaz web para gestión de pedidos

---

## 👩‍💻 Autor

**Vanessa Morales**  

- 🔗 LinkedIn: [linkedin.com/in/vanessamoralesnorambuena](https://linkedin.com/in/vanessamoralesnorambuena)  

