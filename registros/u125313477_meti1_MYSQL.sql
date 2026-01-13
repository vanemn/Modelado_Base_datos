-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2026 at 08:27 AM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: "u125313477_meti1"
--
CREATE DATABASE IF NOT EXISTS "u125313477_meti1" DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE u125313477_meti1;

-- --------------------------------------------------------

--
-- Table structure for table "Clientes"
--

DROP TABLE IF EXISTS `Clientes`;
CREATE TABLE "Clientes" ;

--
-- Dumping data for table "Clientes"
--

SET IDENTITY_INSERT "Clientes" ON ;
INSERT INTO "Clientes" ("id_cliente", "nombre", "apellido1", "apellido2", "telefono", "direccion", "cp", "email") VALUES
(1, 'Laura', 'García', 'Pérez', '612345678', 'Calle Sol 12', '39001', 'laura.garcia@example.com'),
(2, 'Carlos', 'López', 'Santos', '699112233', 'Avenida Castilla 45', '39002', 'carlos.lopez@example.com'),
(3, 'María', 'Ruiz', 'Gómez', '688998877', 'Calle Alta 8', '39003', 'maria.ruiz@example.com'),
(4, 'Javier', 'Martín', 'Díaz', '677554433', 'Calle Ronda 22', '39004', 'javier.martin@example.com'),
(5, 'Ana', 'Sánchez', 'Torres', '123456789', 'Calle Mar 5', '39005', 'ana.sanchez@example.com'),
(6, 'Lucía', 'Fernández', 'Vega', '699887766', 'Calle Norte 10', '39006', 'lucia.fernandez@example.com'),
(7, 'Pedro', 'Gómez', 'Lara', '644556677', 'Avenida Libertad 33', '39007', 'pedro.gomez@example.com'),
(8, 'Sofía', 'Iglesias', 'Mora', '655443322', 'Calle Sur 14', '39008', 'sofia.iglesias@example.com'),
(9, 'Diego', 'Navarro', 'Cano', '622334455', 'Calle Peña 3', '39009', 'diego.navarro@example.com'),
(10, 'Elena', 'Romero', 'León', '633221144', 'Calle Río 18', '39010', 'elena.romero@example.com');

SET IDENTITY_INSERT "Clientes" OFF;

-- --------------------------------------------------------

--
-- Table structure for table "Facturas"
--

DROP TABLE IF EXISTS `Facturas`;
CREATE TABLE "Facturas" ;

--
-- Dumping data for table "Facturas"
--

SET IDENTITY_INSERT "Facturas" ON ;
INSERT INTO "Facturas" ("id_factura", "Pedidos_id_pedido", "Clientes_id_cliente", "descripcion", "fecha_factura", "sucursal", "importe_factura") VALUES
(1, 1, 1, 'Compra ropa', '2024-01-11', 'Santander', 120.50),
(2, 2, 2, 'Compra chaqueta', '2024-01-13', 'Madrid', 45.00),
(3, 3, 3, 'Compra varios productos', '2024-01-16', 'Santander', 210.00),
(5, 5, 5, 'Compra jeans', '2024-01-21', 'Oviedo', 90.00),
(6, 6, 6, 'Compra abrigo', '2024-01-23', 'Santander', 75.00),
(7, 7, 7, 'Compra múltiple', '2024-01-26', 'Madrid', 999.00),
(8, 8, 8, 'Compra bolso', '2024-01-29', 'Bilbao', 110.00),
(9, 9, 9, 'Compra jean', '2024-01-31', 'Barcelona', 40.00);

SET IDENTITY_INSERT "Facturas" OFF;

-- --------------------------------------------------------

--
-- Stand-in structure for view "Facturas con datos del cliente"
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `Facturas con datos del cliente`;
CREATE TABLE `Facturas con datos del cliente` (
`id_factura` int(10) unsigned
,`descripcion` varchar(50)
,`importe_factura` decimal(10,2)
,`nombre` varchar(50)
,`apellido1` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table "Pedidos"
--

DROP TABLE IF EXISTS `Pedidos`;
CREATE TABLE "Pedidos" ;

--
-- Dumping data for table "Pedidos"
--

SET IDENTITY_INSERT "Pedidos" ON ;
INSERT INTO "Pedidos" ("id_pedido", "Clientes_id_cliente", "estado", "peso", "cantidad_producto", "importe_pedido", "fecha_pedido") VALUES
(1, 1, 'pagado', 2.50, 3, 120.50, '2024-01-10'),
(2, 2, 'entregado', 1.20, 1, 45.00, '2024-01-12'),
(3, 3, 'en reparto', 3.10, 4, 210.00, '2024-01-15'),
(4, 4, 'cancelado', 0.80, 1, 30.00, '2024-01-18'),
(5, 5, 'pagado', 2.00, 2, 90.00, '2024-01-20'),
(6, 6, 'entregado', 1.50, 2, 75.00, '2024-01-22'),
(7, 7, 'entregado', 4.00, 5, 260.00, '2024-01-25'),
(8, 8, 'pagado', 2.30, 3, 110.00, '2024-01-28'),
(9, 9, 'entregado', 1.10, 1, 40.00, '2024-01-30');

SET IDENTITY_INSERT "Pedidos" OFF;

-- --------------------------------------------------------

--
-- Stand-in structure for view "Pedidos con nombre del cliente"
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `Pedidos con nombre del cliente`;
CREATE TABLE `Pedidos con nombre del cliente` (
`id_pedido` int(10) unsigned
,`estado` enum('entregado','en reparto','pagado','cancelado')
,`importe_pedido` decimal(10,2)
,`nombre` varchar(50)
,`apellido1` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table "Productos"
--

DROP TABLE IF EXISTS `Productos`;
CREATE TABLE "Productos" ;

--
-- Dumping data for table "Productos"
--

SET IDENTITY_INSERT "Productos" ON ;
INSERT INTO "Productos" ("id_producto", "categoria", "subcategoria", "nom_producto", "stok_producto") VALUES
(1, 'hombre', 'jean', 'Jean Slim Azul', 23),
(2, 'mujer', 'chaqueta', 'Chaqueta Cuero Negra', 20),
(3, 'hombre', 'abrigo', 'Abrigo Invierno Gris', 15),
(4, 'mujer', 'bolso', 'Bolso Marrón Piel', 40),
(5, 'hombre', 'jean', 'Jean Regular Negro', 60),
(6, 'mujer', 'abrigo', 'Abrigo Largo Beige', 25),
(7, 'hombre', 'chaqueta', 'Chaqueta Vaquera Azul', 30),
(8, 'mujer', 'jean', 'Jean Skinny Azul', 55),
(9, 'hombre', 'bolso', 'Bolso Deportivo Negro', 35),
(10, 'mujer', 'chaqueta', 'Chaqueta Roja Casual', 22);

SET IDENTITY_INSERT "Productos" OFF;

-- --------------------------------------------------------

--
-- Stand-in structure for view " Productos incluidos en cada pedido"
-- (See below for the actual view)
--
DROP VIEW IF EXISTS ` Productos incluidos en cada pedido`;
CREATE TABLE ` Productos incluidos en cada pedido` (
`Pedidos_id_pedido` int(10) unsigned
,`nom_producto` varchar(50)
,`categoria` enum('hombre','mujer')
);

-- --------------------------------------------------------

--
-- Table structure for table "Productos_de_clientes"
--

DROP TABLE IF EXISTS `Productos_de_clientes`;
CREATE TABLE "Productos_de_clientes" ;

--
-- Dumping data for table "Productos_de_clientes"
--

SET IDENTITY_INSERT "Productos_de_clientes" ON ;
INSERT INTO "Productos_de_clientes" ("Clientes_id_cliente", "Productos_id_producto") VALUES
(1, 1),
(4, 2),
(2, 3),
(3, 4),
(5, 5),
(8, 6),
(6, 7),
(7, 8),
(9, 9);

SET IDENTITY_INSERT "Productos_de_clientes" OFF;

-- --------------------------------------------------------

--
-- Table structure for table "Productos_de_pedidos"
--

DROP TABLE IF EXISTS `Productos_de_pedidos`;
CREATE TABLE "Productos_de_pedidos" ;

--
-- Dumping data for table "Productos_de_pedidos"
--

SET IDENTITY_INSERT "Productos_de_pedidos" ON ;
INSERT INTO "Productos_de_pedidos" ("Productos_id_producto", "Pedidos_id_pedido") VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8);

SET IDENTITY_INSERT "Productos_de_pedidos" OFF;

-- --------------------------------------------------------

--
-- Structure for view "Facturas con datos del cliente"
--
DROP TABLE IF EXISTS `Facturas con datos del cliente`;

DROP VIEW IF EXISTS `Facturas con datos del cliente`;
CREATE VIEW "Facturas con datos del cliente"  AS SELECT "f"."id_factura" AS `id_factura`, "f"."descripcion" AS `descripcion`, "f"."importe_factura" AS `importe_factura`, "c"."nombre" AS `nombre`, "c"."apellido1" AS `apellido1` FROM ("Facturas" "f" join "Clientes" "c" on("f"."Clientes_id_cliente" = "c"."id_cliente")) ;

-- --------------------------------------------------------

--
-- Structure for view "Pedidos con nombre del cliente"
--
DROP TABLE IF EXISTS `Pedidos con nombre del cliente`;

DROP VIEW IF EXISTS `Pedidos con nombre del cliente`;
CREATE VIEW "Pedidos con nombre del cliente"  AS SELECT "p"."id_pedido" AS `id_pedido`, "p"."estado" AS `estado`, "p"."importe_pedido" AS `importe_pedido`, "c"."nombre" AS `nombre`, "c"."apellido1" AS `apellido1` FROM ("Pedidos" "p" join "Clientes" "c" on("p"."Clientes_id_cliente" = "c"."id_cliente")) ;

-- --------------------------------------------------------

--
-- Structure for view " Productos incluidos en cada pedido"
--
DROP TABLE IF EXISTS ` Productos incluidos en cada pedido`;

DROP VIEW IF EXISTS ` Productos incluidos en cada pedido`;
CREATE VIEW " Productos incluidos en cada pedido"  AS SELECT "pp"."Pedidos_id_pedido" AS `Pedidos_id_pedido`, "pr"."nom_producto" AS `nom_producto`, "pr"."categoria" AS `categoria` FROM ("Productos_de_pedidos" "pp" join "Productos" "pr" on("pp"."Productos_id_producto" = "pr"."id_producto")) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
