-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2022 a las 17:34:09
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kiosco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Refrescos'),
(2, 'Aceites'),
(3, 'Detergentes'),
(4, 'Dulces'),
(5, 'Frituras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto_proveedor`
--

CREATE TABLE `detalle_producto_proveedor` (
  `id` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_producto_proveedor`
--

INSERT INTO `detalle_producto_proveedor` (`id`, `idProducto`, `idProveedor`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 1),
(6, 6, 4),
(7, 7, 3),
(8, 8, 5),
(9, 9, 6),
(10, 10, 5),
(11, 11, 5),
(12, 12, 6),
(13, 13, 8),
(14, 14, 7),
(15, 15, 7),
(16, 16, 8),
(17, 17, 10),
(18, 18, 9),
(19, 19, 10),
(20, 20, 10),
(21, 21, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_alta` date DEFAULT '0000-00-00',
  `idCategoria` int(11) NOT NULL,
  `existencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `precio`, `fecha_alta`, `idCategoria`, `existencia`) VALUES
(1, 'Refresco de Cola', '10.00', '2016-01-01', 1, 10),
(2, 'Refesco de limon', '9.00', '2015-02-06', 1, 15),
(3, 'Limonada', '12.00', '2014-05-09', 1, 12),
(4, 'Refresco de toronja', '9.00', '2016-05-07', 1, 20),
(5, 'Agua Mineral', '15.00', '2016-02-15', 1, 8),
(6, 'Aceite Natural 1 Litro', '20.00', '2015-09-20', 2, 25),
(7, 'Aceite de Coco 500 ml', '55.00', '2016-03-24', 2, 20),
(8, 'Jabon lavanda 1 kg', '12.00', '2014-02-21', 3, 6),
(9, 'Detergente en polvo 1 kg', '18.50', '2014-11-17', 3, 9),
(10, 'Jabon para manos 500 ml', '26.50', '2016-01-10', 3, 7),
(11, 'Detergente en polvo 2 kg', '30.00', '2014-11-17', 3, 5),
(12, 'Detergente en polvo para trastes 500 g', '18.50', '2016-02-20', 3, 8),
(13, 'Paleta de caramelo', '5.00', '2013-01-01', 4, 50),
(14, 'Paleta de chocolate', '6.50', '2014-05-20', 4, 34),
(15, 'Gomitas', '12.50', '2016-03-30', 4, 16),
(16, 'Bolsa de dulces variados', '14.50', '2015-12-12', 4, 23),
(17, 'Papas fritas', '9.50', '2013-04-09', 5, 14),
(18, 'Frituras de queso', '8.00', '2014-10-09', 5, 12),
(19, 'Papas fritas con limon', '10.00', '2015-09-08', 5, 8),
(20, 'Bolsa de chicharrones', '15.00', '2016-05-20', 5, 19),
(21, 'Palomitas de mantequilla', '18.00', '2015-11-28', 5, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`) VALUES
(1, 'Refrescante'),
(2, 'Refrescos SA de CV'),
(3, 'Naturalite'),
(4, 'Campullo'),
(5, 'Grupo cambay'),
(6, 'Detergentes de Mexico'),
(7, 'Sonrisas'),
(8, 'Ricodulce'),
(9, 'Bartel'),
(10, 'Frituras de Monterrey');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_producto_proveedor`
--
ALTER TABLE `detalle_producto_proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prov_idx` (`idProveedor`),
  ADD KEY `fk_prod_idx` (`idProducto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_CatPro_idx` (`idCategoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_producto_proveedor`
--
ALTER TABLE `detalle_producto_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_producto_proveedor`
--
ALTER TABLE `detalle_producto_proveedor`
  ADD CONSTRAINT `fk_prod` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prov` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_CatPro` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
