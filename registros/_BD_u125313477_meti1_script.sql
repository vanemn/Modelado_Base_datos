-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2026 a las 00:23:00
-- Versión del servidor: 11.8.3-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u125313477_meti1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `id_cliente` int(10) UNSIGNED NOT NULL,s
  `nombre` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`id_cliente`, `nombre`, `apellido1`, `apellido2`, `telefono`, `direccion`, `cp`, `email`) VALUES
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Facturas`
--

CREATE TABLE `Facturas` (
  `id_factura` int(10) UNSIGNED NOT NULL,
  `Pedidos_id_pedido` int(10) UNSIGNED NOT NULL,
  `Clientes_id_cliente` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `sucursal` enum('Santander','Madrid','Bilbao','Barcelona','Oviedo') DEFAULT NULL,
  `importe_factura` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Facturas`
--

INSERT INTO `Facturas` (`id_factura`, `Pedidos_id_pedido`, `Clientes_id_cliente`, `descripcion`, `fecha_factura`, `sucursal`, `importe_factura`) VALUES
(1, 1, 1, 'Compra ropa', '2024-01-11', 'Santander', 120.50),
(2, 2, 2, 'Compra chaqueta', '2024-01-13', 'Madrid', 45.00),
(3, 3, 3, 'Compra varios productos', '2024-01-16', 'Santander', 210.00),
(4, 4, 4, 'Pedido cancelado', '2024-01-19', 'Barcelona', 0.00),
(5, 5, 5, 'Compra jeans', '2024-01-21', 'Oviedo', 90.00),
(6, 6, 6, 'Compra abrigo', '2024-01-23', 'Santander', 75.00),
(7, 7, 7, 'Compra múltiple', '2024-01-26', 'Madrid', 999.00),
(8, 8, 8, 'Compra bolso', '2024-01-29', 'Bilbao', 110.00),
(9, 9, 9, 'Compra jean', '2024-01-31', 'Barcelona', 40.00),
(10, 10, 10, 'Compra chaqueta', '2024-02-02', 'Oviedo', 180.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `id_pedido` int(10) UNSIGNED NOT NULL,
  `Clientes_id_cliente` int(10) UNSIGNED NOT NULL,
  `estado` enum('entregado','en reparto','pagado','cancelado') DEFAULT NULL,
  `peso` decimal(6,2) DEFAULT NULL,
  `cantidad_producto` int(10) UNSIGNED DEFAULT NULL,
  `importe_pedido` decimal(10,2) DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Pedidos`
--

INSERT INTO `Pedidos` (`id_pedido`, `Clientes_id_cliente`, `estado`, `peso`, `cantidad_producto`, `importe_pedido`, `fecha_pedido`) VALUES
(1, 1, 'pagado', 2.50, 3, 120.50, '2024-01-10'),
(2, 2, 'entregado', 1.20, 1, 45.00, '2024-01-12'),
(3, 3, 'en reparto', 3.10, 4, 210.00, '2024-01-15'),
(4, 4, 'cancelado', 0.80, 1, 30.00, '2024-01-18'),
(5, 5, 'pagado', 2.00, 2, 90.00, '2024-01-20'),
(6, 6, 'entregado', 1.50, 2, 75.00, '2024-01-22'),
(7, 7, 'entregado', 4.00, 5, 260.00, '2024-01-25'),
(8, 8, 'pagado', 2.30, 3, 110.00, '2024-01-28'),
(9, 9, 'entregado', 1.10, 1, 40.00, '2024-01-30'),
(10, 10, 'pagado', 3.50, 4, 180.00, '2024-02-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `id_producto` int(10) UNSIGNED NOT NULL,
  `categoria` enum('hombre','mujer') DEFAULT NULL,
  `subcategoria` enum('jean','chaqueta','abrigo','bolso') DEFAULT NULL,
  `nom_producto` varchar(50) DEFAULT NULL,
  `stok_producto` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`id_producto`, `categoria`, `subcategoria`, `nom_producto`, `stok_producto`) VALUES
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos_de_clientes`
--

CREATE TABLE `Productos_de_clientes` (
  `Clientes_id_cliente` int(10) UNSIGNED NOT NULL,
  `Productos_id_producto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Productos_de_clientes`
--

INSERT INTO `Productos_de_clientes` (`Clientes_id_cliente`, `Productos_id_producto`) VALUES
(1, 1),
(4, 2),
(2, 3),
(3, 4),
(5, 5),
(8, 6),
(6, 7),
(7, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos_de_pedidos`
--

CREATE TABLE `Productos_de_pedidos` (
  `Productos_id_producto` int(10) UNSIGNED NOT NULL,
  `Pedidos_id_pedido` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Productos_de_pedidos`
--

INSERT INTO `Productos_de_pedidos` (`Productos_id_producto`, `Pedidos_id_pedido`) VALUES
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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `Facturas`
--
ALTER TABLE `Facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `Clientes_id_cliente` (`Clientes_id_cliente`),
  ADD KEY `Pedidos_id_pedido` (`Pedidos_id_pedido`);

--
-- Indices de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `Clientes_id_cliente` (`Clientes_id_cliente`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `Productos_de_clientes`
--
ALTER TABLE `Productos_de_clientes`
  ADD PRIMARY KEY (`Clientes_id_cliente`,`Productos_id_producto`),
  ADD KEY `Productos_id_producto` (`Productos_id_producto`);

--
-- Indices de la tabla `Productos_de_pedidos`
--
ALTER TABLE `Productos_de_pedidos`
  ADD PRIMARY KEY (`Productos_id_producto`,`Pedidos_id_pedido`),
  ADD KEY `Pedidos_id_pedido` (`Pedidos_id_pedido`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Facturas`
--
ALTER TABLE `Facturas`
  MODIFY `id_factura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  MODIFY `id_pedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `id_producto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Facturas`
--
ALTER TABLE `Facturas`
  ADD CONSTRAINT `Facturas_ibfk_1` FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `Clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Facturas_ibfk_2` FOREIGN KEY (`Pedidos_id_pedido`) REFERENCES `Pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `Clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Productos_de_clientes`
--
ALTER TABLE `Productos_de_clientes`
  ADD CONSTRAINT `Productos_de_clientes_ibfk_1` FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `Clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Productos_de_clientes_ibfk_2` FOREIGN KEY (`Productos_id_producto`) REFERENCES `Productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Productos_de_pedidos`
--
ALTER TABLE `Productos_de_pedidos`
  ADD CONSTRAINT `Productos_de_pedidos_ibfk_1` FOREIGN KEY (`Productos_id_producto`) REFERENCES `Productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Productos_de_pedidos_ibfk_2` FOREIGN KEY (`Pedidos_id_pedido`) REFERENCES `Pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
