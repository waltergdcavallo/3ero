-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2024 a las 20:50:22
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
-- Base de datos: `bdprocedalmacenados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE `prueba` (
  `id` int(11) NOT NULL,
  `ciudad` varchar(45) NOT NULL DEFAULT 'San Cristóbal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla`
--

CREATE TABLE `tabla` (
  `id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `mensaje` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tabla`
--

INSERT INTO `tabla` (`id`, `tipo`, `mensaje`) VALUES
(1, 3, NULL),
(2, 5, NULL),
(3, 5, NULL),
(4, 3, NULL),
(5, 4, NULL),
(6, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbejemplo`
--

CREATE TABLE `tbejemplo` (
  `id` int(11) NOT NULL,
  `nombre_articulo` varchar(45) NOT NULL,
  `valstock` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbejemplo`
--

INSERT INTO `tbejemplo` (`id`, `nombre_articulo`, `valstock`, `estado`) VALUES
(1, 'lapicera', 50, NULL),
(2, 'cuaderno', 15, NULL),
(3, 'carpeta', 20, NULL),
(4, 'Plasticola', 0, NULL),
(5, 'Tijera', 10, NULL),
(6, 'Lápiz', 30, NULL),
(7, 'Fibrón Pizarra', 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tabla`
--
ALTER TABLE `tabla`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbejemplo`
--
ALTER TABLE `tbejemplo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tabla`
--
ALTER TABLE `tabla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbejemplo`
--
ALTER TABLE `tbejemplo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
