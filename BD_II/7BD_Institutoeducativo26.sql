-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2025 a las 19:16:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `abdinstitutoeducativo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `IDALUM` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `EDAD` int(11) DEFAULT NULL,
  `DIREC` varchar(50) NOT NULL,
  `TEL` varchar(50) NOT NULL,
  `CIUD` varchar(50) DEFAULT NULL,
  `FECHING` datetime NOT NULL,
  `IDCAR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`IDALUM`, `NOM`, `EDAD`, `DIREC`, `TEL`, `CIUD`, `FECHING`, `IDCAR`) VALUES
(11, 'REYNOSO CLAUDIA', 19, 'GRAL PAZ 750', '3408557448', 'SANTURCE', '2004-03-25 00:00:00', 4),
(12, 'BIANCO MICAELA', 23, 'COCHABAMBA 2155', '3408574617', 'SAN CRISTOBAL', '2004-04-25 00:00:00', 6),
(13, 'CASTRO MANUEL', 32, 'J M BULLO 1595', '3408423900', 'SAN CRISTOBAL', '2004-04-22 00:00:00', 5),
(16, 'TRAVERSI LIDIA', 21, 'ALVEAR 4567', '3408540821', 'ELISA', '2003-04-20 00:00:00', 4),
(17, 'JUAN PEREZ', 31, 'CASEROS 234', '3408794502', 'SAN CRISTOBAL', '2002-04-20 00:00:00', 5),
(18, 'JUAN PEREZ', 21, 'DERQUI 111', '3408622915', 'HERSILIA', '2001-04-10 00:00:00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `CODASIG` int(11) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `AÑO` int(11) DEFAULT 0,
  `CANTHOR` int(11) DEFAULT 0,
  `IDPROF` int(11) DEFAULT 0,
  `IDCAR` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`CODASIG`, `NOM`, `AÑO`, `CANTHOR`, `IDPROF`, `IDCAR`) VALUES
(5, 'INGLÉS TÉCNICO', 1, 5, 11, 6),
(6, 'MATEMÁTICA', 1, 3, 13, 6),
(7, 'TECNOLOGÍA', 1, 4, 6, 6),
(8, 'TELEINFORMATICA', 2, 4, 10, 6),
(9, 'LITERATURA', 1, 4, 5, 4),
(10, 'LENGUA 1', 1, 6, 5, 4),
(11, 'ANÁLISIS MATEMÁTICO', 2, 3, 13, 5),
(12, 'LENGUA2', 2, 3, 5, 4),
(13, 'LENGUA 3', 3, 3, 5, 4),
(17, 'COMERCIALIZACIÓN', 2, 5, 11, 5),
(18, 'DERECHO', 2, 4, 7, 6),
(19, 'ECONOMÍA', 3, 4, 12, 6),
(20, 'ALGEBRA', 1, 5, 14, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `IDCAR` int(11) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `CANTASIG` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`IDCAR`, `NOM`, `CANTASIG`) VALUES
(4, 'PROFESORADO', 30),
(5, 'PYMES', 25),
(6, 'TECNICATURAS', 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `IDEXA` int(11) NOT NULL,
  `FECH` datetime NOT NULL,
  `NOTA` int(11) NOT NULL,
  `TIPOEXA` varchar(50) DEFAULT NULL,
  `CODASIG` int(11) NOT NULL,
  `IDALUM` int(11) NOT NULL,
  `IDPROF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `examenes`
--

INSERT INTO `examenes` (`IDEXA`, `FECH`, `NOTA`, `TIPOEXA`, `CODASIG`, `IDALUM`, `IDPROF`) VALUES
(1, '2004-12-01 00:00:00', 4, 'F', 8, 11, 5),
(2, '2004-12-02 00:00:00', 5, 'P', 5, 12, 6),
(3, '2004-12-03 00:00:00', 3, 'P', 6, 13, 7),
(6, '2004-12-06 00:00:00', 5, 'P', 9, 16, 10),
(7, '2004-12-07 00:00:00', 4, 'P', 17, 17, 11),
(8, '2004-12-08 00:00:00', 3, 'F', 17, 11, 12),
(9, '2004-12-09 00:00:00', 2, 'F', 17, 12, 13),
(10, '2004-12-10 00:00:00', 5, 'F', 17, 13, 13),
(11, '2004-12-11 00:00:00', 4, 'F', 5, 11, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `IDPROF` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `DIREC` varchar(50) NOT NULL,
  `TEL` varchar(50) NOT NULL,
  `CIUD` varchar(50) DEFAULT NULL,
  `FECHA_ALTA` date NOT NULL,
  `ANTIGUEDAD` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`IDPROF`, `NOM`, `DIREC`, `TEL`, `CIUD`, `FECHA_ALTA`, `ANTIGUEDAD`) VALUES
(5, 'BARBINI LORENA', 'DERQUI 1234', '3408424545', 'SAN CRISTOBAL', '2002-03-30', 0),
(6, 'FUENTES IRENE', 'MITRE 1456', '3425024141', 'SANTA FE', '1998-03-05', 0),
(7, 'RODRIGUEZ MIGUEL', 'PUEYRREDON 700', '3408420405', 'SAN CRISTOBAL', '2000-07-10', 0),
(8, 'JUNCOS ELISA', 'SAN MARTIN 5000', '3425674776', 'SANTA FE', '2003-02-04', 0),
(9, 'POSSI GUSTAVO', 'CHACABUCO 1289', '3408424841', 'SAN CRISTOBAL', '2000-04-02', 0),
(10, 'CAMPOS NÉSTOR', 'SALTA 921', '3408607892', 'SAN CRISTOBAL', '2001-08-05', 0),
(11, 'TORRES ROBERTO', 'SAN JOSE 789', '3408422929', 'SAN CRISTOBAL', '1999-04-15', 0),
(12, 'ROCA AUGUSTO', 'RIVADAVIA 2067', '3427653310', 'SANTA FE', '2000-03-01', 0),
(13, 'BUSTAMANTE JORGE', 'BV PELLEGRINI 3456', '3428612821', 'SANTA FE', '2001-07-10', 0),
(14, 'GOROSITO MARIANA', 'PRINGLES 666', '3408730911', 'SAN CRISTOBAL', '2004-03-21', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`IDALUM`),
  ADD KEY `IDCAR` (`IDCAR`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`CODASIG`),
  ADD KEY `IDPROF` (`IDPROF`),
  ADD KEY `IDCAR` (`IDCAR`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`IDCAR`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`IDEXA`),
  ADD KEY `IDALUM` (`IDALUM`),
  ADD KEY `IDPROF` (`IDPROF`),
  ADD KEY `CODASIG` (`CODASIG`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`IDPROF`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `IDALUM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `CODASIG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `IDCAR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `examenes`
--
ALTER TABLE `examenes`
  MODIFY `IDEXA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `IDPROF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`IDCAR`) REFERENCES `carreras` (`IDCAR`);

--
-- Filtros para la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD CONSTRAINT `asignaturas_ibfk_1` FOREIGN KEY (`IDPROF`) REFERENCES `profesores` (`IDPROF`),
  ADD CONSTRAINT `asignaturas_ibfk_2` FOREIGN KEY (`IDCAR`) REFERENCES `carreras` (`IDCAR`);

--
-- Filtros para la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD CONSTRAINT `examenes_ibfk_1` FOREIGN KEY (`IDALUM`) REFERENCES `alumnos` (`IDALUM`),
  ADD CONSTRAINT `examenes_ibfk_2` FOREIGN KEY (`IDPROF`) REFERENCES `profesores` (`IDPROF`),
  ADD CONSTRAINT `examenes_ibfk_3` FOREIGN KEY (`CODASIG`) REFERENCES `asignaturas` (`CODASIG`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
