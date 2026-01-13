CREATE TABLE Productos (
  id_producto INT UNSIGNED NOT NULL,
  categoria ENUM('hombre','mujer') NULL,
  subcategoria ENUM('jean','chaqueta','abrigo','bolso') NULL,
  nom_producto VARCHAR(50) NULL,
  stok_producto TINYINT NULL,
  PRIMARY KEY(id_producto)
)
ENGINE=InnoDB;

CREATE TABLE Clientes (
  id_cliente INT UNSIGNED NOT NULL,
  nombre VARCHAR(50) NULL,
  apellido1 VARCHAR(50) NULL,
  apellido2 VARCHAR(50) NULL,
  telefono TINYINT NULL,
  direccion VARCHAR(50) NULL,
  cp TINYINT UNSIGNED NULL,
  email VARCHAR(50) NULL,
  PRIMARY KEY(id_cliente)
)
ENGINE=InnoDB;

CREATE TABLE Pedidos (
  id_pedido INT UNSIGNED NOT NULL,
  Clientes_id_cliente TINYINT UNSIGNED NOT NULL,
  estado ENUM('entregado','en reparto','pagado','cancelado') NULL,
  peso FLOAT NULL,
  cantidad_producto INT NULL,
  importe_pedido FLOAT NULL,
  fecha_pedido DATE NULL,
  PRIMARY KEY(id_pedido),
  INDEX Pedidos_FKIndex1(Clientes_id_cliente),
  FOREIGN KEY(Clientes_id_cliente)
    REFERENCES Clientes(id_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
ENGINE=InnoDB;

CREATE TABLE Productos_de_pedidos (
  Productos_id_producto INT UNSIGNED NOT NULL,
  Pedidos_id_pedido INT UNSIGNED NOT NULL,
  PRIMARY KEY(Productos_id_producto, Pedidos_id_pedido),
  INDEX Productos_has_Pedidos_FKIndex1(Productos_id_producto),
  INDEX Productos_has_Pedidos_FKIndex2(Pedidos_id_pedido),
  FOREIGN KEY(Productos_id_producto)
    REFERENCES Productos(id_producto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Pedidos_id_pedido)
    REFERENCES Pedidos(id_pedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Productos_de_clientes (
  Clientes_id_cliente INT UNSIGNED NOT NULL,
  Productos_id_producto INT UNSIGNED NOT NULL,
  PRIMARY KEY(Clientes_id_cliente, Productos_id_producto),
  INDEX Clientes_has_Productos_FKIndex1(Clientes_id_cliente),
  INDEX Clientes_has_Productos_FKIndex2(Productos_id_producto),
  FOREIGN KEY(Clientes_id_cliente)
    REFERENCES Clientes(id_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Productos_id_producto)
    REFERENCES Productos(id_producto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Facturas (
  id_factura INT UNSIGNED NOT NULL,
  Pedidos_id_pedido INT UNSIGNED NOT NULL,
  Clientes_id_cliente INT UNSIGNED NOT NULL,
  descripcion VARCHAR(50) NULL,
  sucursal ENUM('Santander','Madrid','Bilbao','Barcelona','Oviedo') NULL,
  importe_factura FLOAT NULL,
  fecha_factura DATE NULL,
  PRIMARY KEY(id_factura),
  INDEX Facturas_FKIndex1(Clientes_id_cliente),
  INDEX Facturas_FKIndex2(Pedidos_id_pedido),
  FOREIGN KEY(Clientes_id_cliente)
    REFERENCES Clientes(id_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Pedidos_id_pedido)
    REFERENCES Pedidos(id_pedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
  FOREIGN KEY(importe_factura)
    REFERENCES Pedidos(importe_pedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
  FOREIGN KEY(fecha_factura)
    REFERENCES Pedidos(fecha_pedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
ENGINE=InnoDB;


