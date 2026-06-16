-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2026 a las 15:41:02
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
-- Base de datos: `sistema_beneficios`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PoblarDatosPrueba` ()   BEGIN
    -- Configura aquí la cantidad de registros que deseas para cada tabla
    DECLARE max_usuarios INT DEFAULT 50;
    DECLARE max_productos INT DEFAULT 30;
    DECLARE max_beneficios INT DEFAULT 10;
    DECLARE max_ventas INT DEFAULT 100;
    DECLARE max_detalles INT DEFAULT 200;
    DECLARE max_historial INT DEFAULT 40;
    
    DECLARE i INT DEFAULT 1;

    -- Desactivar restricciones de claves foráneas temporalmente
    SET FOREIGN_KEY_CHECKS = 0;
    
    -- 1. POBLAR TABLA: producto (Independiente)
    SET i = 1;
    WHILE i <= max_productos DO
        INSERT INTO producto (nombre, precio, stock_inicial, stock_actual)
        VALUES (
            CONCAT('Producto ', i),
            ROUND(10 + (RAND() * 990), 2),              
            FLOOR(50 + (RAND() * 150)),                
            FLOOR(10 + (RAND() * 40))                  
        );
        SET i = i + 1;
    END WHILE;

    -- 2. POBLAR TABLA: usuario (Independiente) -> ¡Roles: vendedor y admin!
    SET i = 1;
    WHILE i <= max_usuarios DO
        INSERT INTO usuario (nombre, apellido, dni, telefono, email, direccion, password_hash, rol)
        VALUES (
            ELT(FLOOR(1 + RAND()*5), 'Juan', 'María', 'Carlos', 'Ana', 'Luis'),
            ELT(FLOOR(1 + RAND()*5), 'Gómez', 'Rodríguez', 'López', 'Fernández', 'Pérez'),
            CONCAT(FLOOR(30 + RAND()*15), FLOOR(100000 + RAND()*899999)), 
            CONCAT('+54 9 11 ', FLOOR(10000000 + RAND()*89999999)),
            CONCAT('usuario', i, '@mail.com'),
            CONCAT('Calle Falsa ', FLOOR(100 + RAND()*899)),
            SHA2(CONCAT('password_seguro_', i), 256),   
            ELT(FLOOR(1 + RAND()*2), 'vendedor', 'admin') -- Selecciona aleatoriamente entre vendedor y admin
        );
        SET i = i + 1;
    END WHILE;

    -- 3. POBLAR TABLA: beneficio (Independiente)
    SET i = 1;
    WHILE i <= max_beneficios DO
        INSERT INTO beneficio (nombre, fecha_inicio, fecha_fin, estado, descripcion)
        VALUES (
            CONCAT('Descuento Especial ', i, '%'),
            CURDATE() - INTERVAL FLOOR(RAND()*30) DAY,   
            CURDATE() + INTERVAL FLOOR(30 + RAND()*60) DAY, 
            FLOOR(RAND()*2),                            
            CONCAT('Descripción detallada para el beneficio corporativo número ', i)
        );
        SET i = i + 1;
    END WHILE;

    -- 4. POBLAR TABLA: venta (Depende de usuario)
    SET i = 1;
    WHILE i <= max_ventas DO
        INSERT INTO venta (monto, entregado, pagado, fecha_venta, id_usuario)
        VALUES (
            ROUND(100 + (RAND() * 5000), 2),            
            FLOOR(RAND()*2),                            
            FLOOR(RAND()*2),                            
            CURDATE() - INTERVAL FLOOR(RAND()*90) DAY,   
            FLOOR(1 + (RAND() * max_usuarios))          
        );
        SET i = i + 1;
    END WHILE;

    -- 5. POBLAR TABLA: detalle_venta (Depende de venta y producto)
    SET i = 1;
    WHILE i <= max_detalles DO
        INSERT INTO detalle_venta (id_venta, id_producto, cant_prod, fecha_entrega)
        VALUES (
            FLOOR(1 + (RAND() * max_ventas)),           
            FLOOR(1 + (RAND() * max_productos)),        
            FLOOR(1 + (RAND() * 5)),                    
            CURDATE() - INTERVAL FLOOR(RAND()*10) DAY    
        );
        SET i = i + 1;
    END WHILE;

    -- 6. POBLAR TABLA: historial (Depende de usuario y beneficio)
    SET i = 1;
    WHILE i <= max_historial DO
        INSERT INTO historial (id_usuario, id_beneficio, fecha_inscripto)
        VALUES (
            FLOOR(1 + (RAND() * max_usuarios)),         
            FLOOR(1 + (RAND() * max_beneficios)),       
            CURDATE() - INTERVAL FLOOR(RAND()*30) DAY    
        );
        SET i = i + 1;
    END WHILE;

    -- Reactivar restricciones de claves foráneas
    SET FOREIGN_KEY_CHECKS = 1;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficio`
--

CREATE TABLE `beneficio` (
  `id_beneficio` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `beneficio`
--

INSERT INTO `beneficio` (`id_beneficio`, `nombre`, `fecha_inicio`, `fecha_fin`, `estado`, `descripcion`) VALUES
(1, 'Descuento Especial 1%', '2026-05-29', '2026-09-02', 1, 'Descripción detallada para el beneficio corporativo número 1'),
(2, 'Descuento Especial 2%', '2026-06-13', '2026-08-21', 0, 'Descripción detallada para el beneficio corporativo número 2'),
(3, 'Descuento Especial 3%', '2026-05-24', '2026-07-21', 1, 'Descripción detallada para el beneficio corporativo número 3'),
(4, 'Descuento Especial 4%', '2026-06-07', '2026-08-23', 1, 'Descripción detallada para el beneficio corporativo número 4'),
(5, 'Descuento Especial 5%', '2026-06-12', '2026-08-19', 1, 'Descripción detallada para el beneficio corporativo número 5'),
(6, 'Descuento Especial 6%', '2026-06-13', '2026-09-10', 1, 'Descripción detallada para el beneficio corporativo número 6'),
(7, 'Descuento Especial 7%', '2026-05-29', '2026-08-22', 1, 'Descripción detallada para el beneficio corporativo número 7'),
(8, 'Descuento Especial 8%', '2026-06-10', '2026-09-04', 1, 'Descripción detallada para el beneficio corporativo número 8'),
(9, 'Descuento Especial 9%', '2026-05-18', '2026-08-31', 0, 'Descripción detallada para el beneficio corporativo número 9'),
(10, 'Descuento Especial 10%', '2026-06-04', '2026-08-22', 0, 'Descripción detallada para el beneficio corporativo número 10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cant_prod` int(11) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle_venta`, `id_venta`, `id_producto`, `cant_prod`, `fecha_entrega`) VALUES
(1, 35, 29, 4, '2026-06-06'),
(2, 88, 29, 1, '2026-06-10'),
(3, 2, 23, 4, '2026-06-08'),
(4, 80, 4, 1, '2026-06-11'),
(5, 21, 3, 4, '2026-06-09'),
(6, 43, 16, 2, '2026-06-07'),
(7, 21, 19, 3, '2026-06-10'),
(8, 73, 12, 4, '2026-06-07'),
(9, 49, 3, 1, '2026-06-07'),
(10, 96, 12, 1, '2026-06-05'),
(11, 56, 1, 3, '2026-06-13'),
(12, 36, 11, 4, '2026-06-08'),
(13, 4, 7, 5, '2026-06-14'),
(14, 29, 12, 1, '2026-06-13'),
(15, 48, 30, 3, '2026-06-10'),
(16, 74, 12, 4, '2026-06-09'),
(17, 68, 19, 1, '2026-06-09'),
(18, 48, 23, 2, '2026-06-11'),
(19, 91, 13, 2, '2026-06-12'),
(20, 43, 10, 2, '2026-06-06'),
(21, 95, 10, 4, '2026-06-09'),
(22, 70, 25, 1, '2026-06-09'),
(23, 75, 3, 1, '2026-06-09'),
(24, 48, 18, 3, '2026-06-05'),
(25, 29, 15, 3, '2026-06-14'),
(26, 77, 21, 1, '2026-06-11'),
(27, 53, 17, 2, '2026-06-10'),
(28, 50, 5, 2, '2026-06-12'),
(29, 28, 17, 5, '2026-06-13'),
(30, 6, 22, 2, '2026-06-07'),
(31, 63, 27, 3, '2026-06-07'),
(32, 30, 9, 3, '2026-06-10'),
(33, 3, 21, 3, '2026-06-05'),
(34, 36, 2, 1, '2026-06-07'),
(35, 32, 8, 2, '2026-06-09'),
(36, 96, 4, 4, '2026-06-08'),
(37, 63, 10, 4, '2026-06-08'),
(38, 9, 15, 1, '2026-06-14'),
(39, 96, 20, 2, '2026-06-07'),
(40, 86, 29, 2, '2026-06-12'),
(41, 36, 6, 5, '2026-06-05'),
(42, 8, 15, 2, '2026-06-07'),
(43, 99, 21, 3, '2026-06-10'),
(44, 56, 17, 1, '2026-06-10'),
(45, 40, 16, 2, '2026-06-13'),
(46, 62, 23, 5, '2026-06-05'),
(47, 22, 8, 4, '2026-06-12'),
(48, 60, 4, 5, '2026-06-06'),
(49, 89, 23, 1, '2026-06-11'),
(50, 31, 16, 4, '2026-06-06'),
(51, 14, 6, 3, '2026-06-13'),
(52, 18, 12, 3, '2026-06-14'),
(53, 78, 25, 4, '2026-06-12'),
(54, 22, 6, 2, '2026-06-14'),
(55, 48, 3, 5, '2026-06-09'),
(56, 91, 26, 3, '2026-06-11'),
(57, 5, 5, 3, '2026-06-11'),
(58, 93, 22, 4, '2026-06-07'),
(59, 29, 9, 3, '2026-06-08'),
(60, 61, 6, 1, '2026-06-05'),
(61, 55, 24, 2, '2026-06-10'),
(62, 94, 15, 3, '2026-06-11'),
(63, 91, 19, 2, '2026-06-14'),
(64, 2, 29, 4, '2026-06-14'),
(65, 99, 22, 4, '2026-06-14'),
(66, 21, 30, 2, '2026-06-12'),
(67, 36, 5, 4, '2026-06-12'),
(68, 11, 22, 1, '2026-06-06'),
(69, 76, 6, 3, '2026-06-11'),
(70, 25, 2, 3, '2026-06-11'),
(71, 5, 11, 3, '2026-06-08'),
(72, 70, 15, 2, '2026-06-10'),
(73, 97, 18, 5, '2026-06-13'),
(74, 92, 3, 4, '2026-06-05'),
(75, 82, 8, 4, '2026-06-13'),
(76, 42, 19, 5, '2026-06-08'),
(77, 40, 3, 2, '2026-06-12'),
(78, 24, 15, 4, '2026-06-12'),
(79, 1, 9, 2, '2026-06-06'),
(80, 33, 2, 2, '2026-06-14'),
(81, 38, 26, 1, '2026-06-06'),
(82, 17, 5, 2, '2026-06-13'),
(83, 61, 21, 4, '2026-06-14'),
(84, 58, 18, 1, '2026-06-12'),
(85, 51, 27, 5, '2026-06-06'),
(86, 45, 22, 2, '2026-06-10'),
(87, 39, 15, 2, '2026-06-06'),
(88, 36, 9, 3, '2026-06-12'),
(89, 96, 1, 2, '2026-06-13'),
(90, 95, 11, 5, '2026-06-11'),
(91, 6, 8, 1, '2026-06-07'),
(92, 55, 13, 2, '2026-06-07'),
(93, 44, 1, 4, '2026-06-08'),
(94, 98, 30, 1, '2026-06-12'),
(95, 3, 13, 1, '2026-06-07'),
(96, 84, 26, 4, '2026-06-11'),
(97, 23, 6, 2, '2026-06-05'),
(98, 93, 22, 4, '2026-06-07'),
(99, 47, 2, 4, '2026-06-06'),
(100, 95, 4, 4, '2026-06-10'),
(101, 10, 2, 5, '2026-06-10'),
(102, 62, 20, 3, '2026-06-11'),
(103, 14, 24, 3, '2026-06-13'),
(104, 32, 3, 3, '2026-06-11'),
(105, 30, 10, 4, '2026-06-07'),
(106, 59, 19, 2, '2026-06-14'),
(107, 90, 14, 4, '2026-06-07'),
(108, 2, 23, 4, '2026-06-14'),
(109, 17, 23, 2, '2026-06-11'),
(110, 64, 6, 1, '2026-06-07'),
(111, 72, 7, 5, '2026-06-06'),
(112, 76, 3, 1, '2026-06-11'),
(113, 52, 14, 4, '2026-06-14'),
(114, 11, 14, 5, '2026-06-09'),
(115, 72, 29, 4, '2026-06-09'),
(116, 57, 8, 3, '2026-06-13'),
(117, 18, 9, 5, '2026-06-07'),
(118, 93, 14, 2, '2026-06-08'),
(119, 89, 19, 3, '2026-06-10'),
(120, 92, 6, 2, '2026-06-10'),
(121, 84, 21, 5, '2026-06-12'),
(122, 85, 12, 2, '2026-06-08'),
(123, 2, 8, 2, '2026-06-11'),
(124, 1, 1, 1, '2026-06-11'),
(125, 47, 10, 1, '2026-06-07'),
(126, 31, 10, 3, '2026-06-14'),
(127, 52, 12, 3, '2026-06-05'),
(128, 48, 16, 1, '2026-06-13'),
(129, 46, 23, 2, '2026-06-11'),
(130, 86, 7, 3, '2026-06-08'),
(131, 88, 14, 4, '2026-06-06'),
(132, 34, 4, 4, '2026-06-07'),
(133, 100, 19, 1, '2026-06-06'),
(134, 89, 26, 3, '2026-06-13'),
(135, 14, 7, 4, '2026-06-14'),
(136, 88, 10, 5, '2026-06-09'),
(137, 28, 19, 2, '2026-06-13'),
(138, 32, 1, 1, '2026-06-08'),
(139, 87, 11, 1, '2026-06-10'),
(140, 89, 4, 5, '2026-06-10'),
(141, 52, 4, 1, '2026-06-05'),
(142, 38, 5, 3, '2026-06-10'),
(143, 74, 6, 4, '2026-06-05'),
(144, 51, 23, 2, '2026-06-11'),
(145, 56, 27, 4, '2026-06-05'),
(146, 54, 27, 4, '2026-06-12'),
(147, 74, 2, 1, '2026-06-13'),
(148, 70, 28, 3, '2026-06-06'),
(149, 54, 8, 4, '2026-06-11'),
(150, 4, 1, 1, '2026-06-13'),
(151, 52, 6, 3, '2026-06-09'),
(152, 37, 7, 1, '2026-06-09'),
(153, 70, 24, 5, '2026-06-06'),
(154, 65, 23, 4, '2026-06-09'),
(155, 50, 26, 4, '2026-06-14'),
(156, 96, 23, 5, '2026-06-06'),
(157, 62, 20, 3, '2026-06-12'),
(158, 91, 25, 2, '2026-06-14'),
(159, 41, 26, 1, '2026-06-08'),
(160, 3, 7, 1, '2026-06-07'),
(161, 48, 5, 2, '2026-06-14'),
(162, 57, 16, 5, '2026-06-07'),
(163, 41, 19, 5, '2026-06-11'),
(164, 28, 9, 4, '2026-06-12'),
(165, 35, 30, 5, '2026-06-09'),
(166, 99, 10, 4, '2026-06-11'),
(167, 66, 9, 3, '2026-06-11'),
(168, 32, 18, 1, '2026-06-11'),
(169, 86, 3, 5, '2026-06-12'),
(170, 45, 17, 3, '2026-06-10'),
(171, 96, 14, 3, '2026-06-06'),
(172, 72, 5, 4, '2026-06-08'),
(173, 39, 29, 4, '2026-06-12'),
(174, 51, 21, 5, '2026-06-07'),
(175, 69, 9, 2, '2026-06-06'),
(176, 34, 3, 2, '2026-06-09'),
(177, 75, 2, 5, '2026-06-08'),
(178, 41, 2, 1, '2026-06-13'),
(179, 51, 4, 1, '2026-06-13'),
(180, 64, 18, 5, '2026-06-13'),
(181, 3, 16, 3, '2026-06-13'),
(182, 4, 24, 5, '2026-06-08'),
(183, 92, 19, 2, '2026-06-09'),
(184, 78, 10, 2, '2026-06-09'),
(185, 96, 2, 2, '2026-06-07'),
(186, 41, 28, 2, '2026-06-06'),
(187, 38, 9, 2, '2026-06-09'),
(188, 91, 28, 4, '2026-06-13'),
(189, 57, 9, 4, '2026-06-07'),
(190, 73, 9, 2, '2026-06-08'),
(191, 32, 19, 1, '2026-06-14'),
(192, 79, 22, 2, '2026-06-12'),
(193, 47, 16, 2, '2026-06-08'),
(194, 62, 2, 3, '2026-06-14'),
(195, 91, 12, 2, '2026-06-14'),
(196, 56, 18, 2, '2026-06-11'),
(197, 26, 4, 5, '2026-06-05'),
(198, 36, 24, 5, '2026-06-13'),
(199, 18, 10, 5, '2026-06-14'),
(200, 44, 28, 2, '2026-06-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_beneficio` int(11) NOT NULL,
  `fecha_inscripto` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id_historial`, `id_usuario`, `id_beneficio`, `fecha_inscripto`) VALUES
(1, 27, 7, '2026-05-31'),
(2, 27, 3, '2026-05-29'),
(3, 5, 8, '2026-05-31'),
(4, 11, 6, '2026-06-06'),
(5, 35, 6, '2026-05-24'),
(6, 46, 5, '2026-06-02'),
(7, 43, 10, '2026-06-04'),
(8, 37, 7, '2026-06-10'),
(9, 34, 10, '2026-05-23'),
(10, 47, 4, '2026-06-09'),
(11, 36, 1, '2026-05-16'),
(12, 40, 1, '2026-05-24'),
(13, 29, 7, '2026-05-30'),
(14, 33, 8, '2026-05-23'),
(15, 30, 7, '2026-06-04'),
(16, 42, 2, '2026-06-09'),
(17, 23, 8, '2026-05-29'),
(18, 22, 5, '2026-06-12'),
(19, 47, 5, '2026-05-29'),
(20, 19, 3, '2026-05-19'),
(21, 41, 4, '2026-05-31'),
(22, 14, 10, '2026-05-21'),
(23, 19, 4, '2026-05-31'),
(24, 27, 2, '2026-06-10'),
(25, 16, 2, '2026-05-28'),
(26, 30, 3, '2026-06-04'),
(27, 4, 4, '2026-06-05'),
(28, 32, 3, '2026-06-06'),
(29, 39, 10, '2026-06-06'),
(30, 36, 7, '2026-06-09'),
(31, 47, 2, '2026-05-21'),
(32, 39, 4, '2026-06-02'),
(33, 6, 3, '2026-05-22'),
(34, 16, 3, '2026-06-12'),
(35, 42, 9, '2026-05-24'),
(36, 5, 3, '2026-06-12'),
(37, 30, 8, '2026-05-19'),
(38, 14, 7, '2026-05-31'),
(39, 22, 7, '2026-06-11'),
(40, 31, 7, '2026-05-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock_inicial` int(11) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `precio`, `stock_inicial`, `stock_actual`) VALUES
(1, 'Producto 1', 404.52, 105, 36),
(2, 'Producto 2', 221.57, 60, 38),
(3, 'Producto 3', 343.25, 133, 40),
(4, 'Producto 4', 167.61, 125, 11),
(5, 'Producto 5', 651.06, 71, 41),
(6, 'Producto 6', 508.97, 73, 20),
(7, 'Producto 7', 839.47, 111, 31),
(8, 'Producto 8', 424.90, 126, 21),
(9, 'Producto 9', 906.75, 150, 35),
(10, 'Producto 10', 157.40, 177, 42),
(11, 'Producto 11', 460.19, 180, 49),
(12, 'Producto 12', 365.49, 171, 49),
(13, 'Producto 13', 453.70, 96, 18),
(14, 'Producto 14', 168.16, 70, 18),
(15, 'Producto 15', 682.62, 160, 36),
(16, 'Producto 16', 49.44, 87, 14),
(17, 'Producto 17', 844.37, 179, 41),
(18, 'Producto 18', 355.12, 107, 44),
(19, 'Producto 19', 141.72, 65, 14),
(20, 'Producto 20', 239.45, 175, 29),
(21, 'Producto 21', 949.44, 90, 29),
(22, 'Producto 22', 660.17, 171, 12),
(23, 'Producto 23', 918.64, 107, 16),
(24, 'Producto 24', 696.39, 193, 38),
(25, 'Producto 25', 688.40, 93, 25),
(26, 'Producto 26', 109.13, 97, 21),
(27, 'Producto 27', 513.76, 149, 42),
(28, 'Producto 28', 14.08, 143, 13),
(29, 'Producto 29', 595.28, 152, 35),
(30, 'Producto 30', 192.02, 196, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `rol` enum('admin','vendedor') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `email`, `direccion`, `password_hash`, `rol`) VALUES
(1, 'Ana', 'Fernández', '35759357', '+54 9 11 56846289', 'usuario1@mail.com', 'Calle Falsa 463', 'bc76b867ea6b62859fb0eaade89d72d3c663a3d10035ae06abe86ac898e544d1', 'vendedor'),
(2, 'Juan', 'Gómez', '32657101', '+54 9 11 59973126', 'usuario2@mail.com', 'Calle Falsa 926', '5d643248e1acd826c40f2fd87581d7e7a9625afeade83898208186c04ada53ac', 'admin'),
(3, 'Luis', 'Fernández', '41664375', '+54 9 11 93461197', 'usuario3@mail.com', 'Calle Falsa 779', 'd88dae60990b81597205892cab417829cc0e9af424bfc2e99728206f9d47d217', 'admin'),
(4, 'Ana', 'López', '40810216', '+54 9 11 86860287', 'usuario4@mail.com', 'Calle Falsa 911', 'ca3210ef29e41a19d0ab42a6e277c793975db3ee8d0e5fd308a2cd16ebf0afdb', 'admin'),
(5, 'Juan', 'Rodríguez', '41784149', '+54 9 11 50611387', 'usuario5@mail.com', 'Calle Falsa 977', '916da653f7936f8e563cea18e688350e9b125ccc51f25b6cd794bba37ceb274a', 'admin'),
(6, 'Ana', 'Pérez', '36585823', '+54 9 11 40579010', 'usuario6@mail.com', 'Calle Falsa 171', '469b5a612e5e655f5eea895a92f1d1f7c88736ea5eeed36b7c57b52e5e7dd009', 'vendedor'),
(7, 'Ana', 'Gómez', '39896245', '+54 9 11 52866823', 'usuario7@mail.com', 'Calle Falsa 753', '8ecd568a4afe1d35c26223539af03b4be7dbc469d637b18bc92e42fd8ee87184', 'vendedor'),
(8, 'Luis', 'Fernández', '41721602', '+54 9 11 32408992', 'usuario8@mail.com', 'Calle Falsa 255', '1edbacc03cca7a091b4a59da7e2e90717c0a3af7130fea998d9a0cd3fff49755', 'vendedor'),
(9, 'Juan', 'Pérez', '41870820', '+54 9 11 97878731', 'usuario9@mail.com', 'Calle Falsa 381', 'd83ee40c49e7d929ddba4d7f90c04fc57b35e20424d717b48c00125c013ff8d2', 'admin'),
(10, 'María', 'Rodríguez', '39421815', '+54 9 11 90390461', 'usuario10@mail.com', 'Calle Falsa 453', 'f549edaef06ea8a39902c053e6a7ecee9fbc0633fa6539a32c93d90585ae042a', 'vendedor'),
(11, 'María', 'López', '35484484', '+54 9 11 20844049', 'usuario11@mail.com', 'Calle Falsa 388', '34d0bc85d0646718a404d5a55694657b422dbdbd452646829d22cc363443ab80', 'vendedor'),
(12, 'María', 'López', '43841459', '+54 9 11 52910573', 'usuario12@mail.com', 'Calle Falsa 920', '02d324874c6e08e5babd739afdab6888aea375dccd85d1ab9ac4a472c0b58499', 'vendedor'),
(13, 'Luis', 'Rodríguez', '34807277', '+54 9 11 17352390', 'usuario13@mail.com', 'Calle Falsa 145', 'd63cb96bbb541a1fc767aa435ae4b60af1b6fcd92a83ff944537ca09710a46cd', 'vendedor'),
(14, 'Luis', 'López', '37366148', '+54 9 11 91661676', 'usuario14@mail.com', 'Calle Falsa 683', '3cd6303e3839e7d8dd0a1ac058acf9faee66cfa7603e4e209bf959526262455b', 'admin'),
(15, 'Ana', 'Pérez', '31973596', '+54 9 11 62485127', 'usuario15@mail.com', 'Calle Falsa 103', '2706ce3e92d24ac1318467a1df92f503e2e391ca963f80d089a86da7d6165f15', 'vendedor'),
(16, 'María', 'Pérez', '35305465', '+54 9 11 12390527', 'usuario16@mail.com', 'Calle Falsa 502', '59589b116533bfb87a889615f7557ae1ce55e9c2cbd6c8c1ec16bb7271930333', 'vendedor'),
(17, 'Carlos', 'Fernández', '39777214', '+54 9 11 88444349', 'usuario17@mail.com', 'Calle Falsa 190', 'bac4100d1d0fd353809cc4c45237e3eedf0485551bceb94933f529d9d22a27a7', 'admin'),
(18, 'Juan', 'Gómez', '41696772', '+54 9 11 14966168', 'usuario18@mail.com', 'Calle Falsa 357', '5f6ebe34b8e6cc1bbef856cc53ffb4f4b50efd790b2a9bcab21faa7674866068', 'vendedor'),
(19, 'Carlos', 'López', '37825281', '+54 9 11 53497540', 'usuario19@mail.com', 'Calle Falsa 998', '432b41629e9cad9a77a143a822438881e94755eb3ee8285f50f024c18d469b75', 'admin'),
(20, 'Ana', 'Pérez', '42180347', '+54 9 11 99424852', 'usuario20@mail.com', 'Calle Falsa 729', '4274b7b6c600cc0685fd017b5cf8103fe432bf770bba47277af09b83c6cfd88e', 'admin'),
(21, 'Carlos', 'Pérez', '33307535', '+54 9 11 56582950', 'usuario21@mail.com', 'Calle Falsa 905', '3ae134e6ce220319fca43a0a4392dd01935e8e3f3664758a8b0eb2555eec7dae', 'admin'),
(22, 'Luis', 'Pérez', '30239042', '+54 9 11 75385220', 'usuario22@mail.com', 'Calle Falsa 251', '5bee0a640b607cda416b1d7fe964fbd51524afe294c4843239ae4b03ccfbc563', 'admin'),
(23, 'Luis', 'Gómez', '31178036', '+54 9 11 26619986', 'usuario23@mail.com', 'Calle Falsa 696', 'b28ce449c8e706c2b233777deb5dcc4f8e7345df948298692061301623178729', 'admin'),
(24, 'Luis', 'Pérez', '39699283', '+54 9 11 51319303', 'usuario24@mail.com', 'Calle Falsa 367', '33b9464bd6096ed39d53ab4e89d3166c531e214796f1b6fa0e7bc39f18bd93b1', 'vendedor'),
(25, 'Ana', 'Pérez', '44990324', '+54 9 11 95750826', 'usuario25@mail.com', 'Calle Falsa 815', 'b6b61254a38c2357cdc6116efde985200f70938b62651b6d83f3da9a3ea5c2ce', 'vendedor'),
(26, 'María', 'Fernández', '31293588', '+54 9 11 81098022', 'usuario26@mail.com', 'Calle Falsa 373', '76c511b31e2e84ca91bf92b5f0a6740df181c46cc5c0497e680fe4d60d7ff7a1', 'vendedor'),
(27, 'Luis', 'Fernández', '36804091', '+54 9 11 64544493', 'usuario27@mail.com', 'Calle Falsa 714', '58db4c868b19f89d03ca5d118366bd3edc3d985bb1d10d627a4702faf8c115f8', 'admin'),
(28, 'Luis', 'Pérez', '41949652', '+54 9 11 56102218', 'usuario28@mail.com', 'Calle Falsa 755', 'c7b1436d2110242546c29ff5301d7e421e8f63a5a6ea46c77ce1a80e355fef07', 'vendedor'),
(29, 'María', 'López', '32649024', '+54 9 11 52356769', 'usuario29@mail.com', 'Calle Falsa 570', 'caaf7b7b43c1042de56798fe069d75da985cc27bbf969b641f9701644c5fcebe', 'vendedor'),
(30, 'Carlos', 'Fernández', '42227726', '+54 9 11 36113357', 'usuario30@mail.com', 'Calle Falsa 122', '20b6b1e584321053096a8c1717ea8d50c3fb9d80c04db15a7763d880e847e3b9', 'vendedor'),
(31, 'Juan', 'Rodríguez', '37966591', '+54 9 11 31036385', 'usuario31@mail.com', 'Calle Falsa 351', 'ceb75af38f511f5de1a8c85b509332aaf6f7d0984a09d45595daa52da221fcbd', 'admin'),
(32, 'Ana', 'Gómez', '43176038', '+54 9 11 68675343', 'usuario32@mail.com', 'Calle Falsa 105', 'ef077b111f469f800fc07ed083d47fd5fdee6bca04d5ecb3e50884ea0b8ffa03', 'vendedor'),
(33, 'María', 'López', '41199483', '+54 9 11 33769668', 'usuario33@mail.com', 'Calle Falsa 989', 'f2469dfc4ac51ce32babf66b42e9660d9a3fa9e7bed824101bb410bbb383938e', 'vendedor'),
(34, 'Ana', 'López', '32503663', '+54 9 11 67889938', 'usuario34@mail.com', 'Calle Falsa 882', 'f91101ce2839bb2bf2d2fdfcea8ef28c0297164cbd3224bcf79e44f9839ac550', 'vendedor'),
(35, 'Carlos', 'Rodríguez', '41961870', '+54 9 11 60587195', 'usuario35@mail.com', 'Calle Falsa 942', 'ee68471d513b2f130ce60b65feb8bf299949cc6064ca93e7f362f82a596055b1', 'vendedor'),
(36, 'Juan', 'Pérez', '33387376', '+54 9 11 88154872', 'usuario36@mail.com', 'Calle Falsa 445', 'aa98c6b037888e61a2934fbb113e9d75dcc1c2b94cefc44f5b7eda5dcf3ff7aa', 'vendedor'),
(37, 'Carlos', 'Gómez', '38417888', '+54 9 11 14694450', 'usuario37@mail.com', 'Calle Falsa 280', 'b596be29a988408754da65980f9a03f4791d7421649a1a700a0731863be6586b', 'admin'),
(38, 'Ana', 'Fernández', '36158405', '+54 9 11 17334270', 'usuario38@mail.com', 'Calle Falsa 291', '8d7b8016910ecd929f22b02ad8215c54de8ee91bed30b91d2043bb0a4a30662e', 'admin'),
(39, 'Carlos', 'Pérez', '41542807', '+54 9 11 15552203', 'usuario39@mail.com', 'Calle Falsa 848', 'd221cf560e9ef4b54657820c1e60b2a1830fdd8c535a4c867f48a2fd25bced5b', 'admin'),
(40, 'María', 'Gómez', '43441834', '+54 9 11 32928403', 'usuario40@mail.com', 'Calle Falsa 220', '8c97d40372d81d4b2530f9a3687ff334f49d07656d2e149b5add0f764063c469', 'admin'),
(41, 'Juan', 'Pérez', '35880035', '+54 9 11 37452781', 'usuario41@mail.com', 'Calle Falsa 931', 'dd1b8ee663dc01fe04b5d7f7f44ded893710675165a78f5526a8dfbe3bb31b98', 'admin'),
(42, 'Ana', 'Fernández', '36806162', '+54 9 11 73848971', 'usuario42@mail.com', 'Calle Falsa 273', 'a80f0c8afdeabcba65b20f0c46192d220a196a3a8fa223ab80eada38ded7ac08', 'admin'),
(43, 'Ana', 'López', '42741968', '+54 9 11 97015582', 'usuario43@mail.com', 'Calle Falsa 724', '578dbfdc781c53ba80cafb55b4183272801dbadc4fc07d06f5ebc377dff3ee90', 'admin'),
(44, 'Ana', 'Gómez', '36692530', '+54 9 11 12863161', 'usuario44@mail.com', 'Calle Falsa 265', 'f8165e99fb5f2e8e6dc27b7cc76f869155d81d772c5de7d3c234389069e3310c', 'admin'),
(45, 'Carlos', 'Rodríguez', '32765097', '+54 9 11 25609038', 'usuario45@mail.com', 'Calle Falsa 684', 'bd2cc2c05af20d3735c9eee5ab816cbd2f662ea8efc20c2b75699379e28c3ae3', 'admin'),
(46, 'Ana', 'Rodríguez', '37552198', '+54 9 11 13148341', 'usuario46@mail.com', 'Calle Falsa 700', '25f4480c31da5251c80001712b9b8b583923b847ccf8bbf6084edd25d27c284e', 'vendedor'),
(47, 'Juan', 'Gómez', '31114966', '+54 9 11 88567608', 'usuario47@mail.com', 'Calle Falsa 383', '1d06ea462cb8c7734f364016db714487b3e72ae62b35cab8c0cdde59caa7a1ee', 'admin'),
(48, 'Luis', 'Rodríguez', '30302108', '+54 9 11 13233685', 'usuario48@mail.com', 'Calle Falsa 554', 'dd0e0bb4500b678d2530af016c890ca3eb8a41e28483a60f2cc3fcd31694156b', 'vendedor'),
(49, 'Carlos', 'Fernández', '40452166', '+54 9 11 88499108', 'usuario49@mail.com', 'Calle Falsa 268', '7c55a1985fcc89635db0f7400ff85393b9513f47234f4ad96cc13d1fcd4e6e1d', 'vendedor'),
(50, 'Juan', 'Rodríguez', '44297891', '+54 9 11 26174536', 'usuario50@mail.com', 'Calle Falsa 314', '6cd8f63e3c203f2f799a30d72b913755c71d150433f67cc3fee839461f3899df', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `entregado` tinyint(4) DEFAULT NULL,
  `pagado` tinyint(4) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `monto`, `entregado`, `pagado`, `fecha_venta`, `id_usuario`) VALUES
(1, 1881.09, 1, 1, '2026-06-03', 11),
(2, 3434.79, 1, 1, '2026-05-05', 36),
(3, 1108.98, 1, 1, '2026-05-15', 17),
(4, 2993.37, 1, 1, '2026-04-05', 9),
(5, 2643.89, 0, 1, '2026-06-14', 9),
(6, 4244.74, 1, 1, '2026-04-20', 50),
(7, 425.42, 0, 1, '2026-06-06', 29),
(8, 2920.02, 0, 1, '2026-03-31', 37),
(9, 558.40, 0, 0, '2026-03-27', 49),
(10, 975.54, 1, 0, '2026-06-10', 2),
(11, 128.28, 1, 1, '2026-04-17', 8),
(12, 4054.11, 1, 0, '2026-04-29', 47),
(13, 544.06, 1, 0, '2026-05-13', 30),
(14, 4235.68, 0, 0, '2026-05-27', 31),
(15, 2323.20, 0, 1, '2026-04-13', 40),
(16, 4351.04, 1, 1, '2026-04-14', 41),
(17, 143.29, 1, 0, '2026-05-19', 21),
(18, 945.96, 1, 1, '2026-03-31', 30),
(19, 2369.19, 0, 0, '2026-03-23', 21),
(20, 1589.32, 0, 0, '2026-04-13', 32),
(21, 427.93, 0, 0, '2026-04-12', 25),
(22, 1898.51, 0, 1, '2026-04-16', 36),
(23, 3211.29, 1, 1, '2026-04-19', 24),
(24, 2220.89, 1, 0, '2026-04-14', 16),
(25, 2368.14, 0, 0, '2026-05-30', 26),
(26, 224.38, 1, 1, '2026-04-05', 9),
(27, 2398.04, 1, 1, '2026-06-09', 11),
(28, 4486.97, 1, 0, '2026-05-26', 42),
(29, 2453.24, 1, 1, '2026-05-27', 7),
(30, 5093.56, 1, 0, '2026-04-03', 32),
(31, 3771.25, 1, 1, '2026-06-13', 4),
(32, 1755.20, 0, 0, '2026-05-04', 43),
(33, 4409.32, 1, 0, '2026-03-23', 47),
(34, 4130.23, 0, 1, '2026-03-31', 20),
(35, 2519.09, 0, 1, '2026-04-20', 7),
(36, 3915.14, 0, 1, '2026-05-18', 39),
(37, 4586.30, 0, 0, '2026-04-10', 43),
(38, 308.50, 1, 0, '2026-05-14', 46),
(39, 2464.87, 1, 1, '2026-05-15', 6),
(40, 2616.90, 0, 1, '2026-06-12', 27),
(41, 2862.68, 0, 0, '2026-03-24', 35),
(42, 3442.10, 0, 0, '2026-05-06', 40),
(43, 3362.90, 1, 0, '2026-04-13', 2),
(44, 748.84, 1, 0, '2026-04-11', 40),
(45, 4250.28, 1, 0, '2026-05-14', 39),
(46, 4088.47, 1, 1, '2026-03-21', 38),
(47, 4579.88, 0, 0, '2026-04-05', 21),
(48, 3727.22, 0, 1, '2026-04-25', 31),
(49, 1642.03, 1, 1, '2026-04-22', 34),
(50, 3180.03, 0, 0, '2026-04-09', 29),
(51, 3427.26, 1, 1, '2026-06-04', 33),
(52, 4364.77, 0, 0, '2026-04-07', 17),
(53, 2114.48, 1, 1, '2026-03-21', 19),
(54, 118.64, 1, 1, '2026-03-17', 16),
(55, 3078.47, 0, 0, '2026-03-21', 27),
(56, 3815.23, 0, 1, '2026-05-24', 30),
(57, 1298.13, 0, 0, '2026-04-25', 36),
(58, 4536.24, 0, 1, '2026-05-26', 32),
(59, 2414.20, 0, 1, '2026-03-30', 37),
(60, 540.02, 0, 0, '2026-05-04', 8),
(61, 1781.61, 0, 0, '2026-04-23', 5),
(62, 3556.72, 0, 1, '2026-06-11', 22),
(63, 124.18, 1, 1, '2026-05-18', 21),
(64, 790.40, 0, 1, '2026-03-23', 3),
(65, 2564.79, 0, 0, '2026-05-20', 14),
(66, 2903.95, 1, 0, '2026-03-30', 40),
(67, 1981.75, 1, 1, '2026-06-07', 42),
(68, 4322.01, 1, 0, '2026-06-10', 22),
(69, 303.36, 1, 0, '2026-06-06', 21),
(70, 4112.63, 1, 0, '2026-04-25', 36),
(71, 4316.51, 0, 1, '2026-04-20', 8),
(72, 4383.17, 1, 1, '2026-03-25', 24),
(73, 3167.83, 1, 0, '2026-05-13', 20),
(74, 4333.81, 0, 1, '2026-06-07', 42),
(75, 4490.91, 1, 1, '2026-03-27', 33),
(76, 2871.80, 1, 1, '2026-05-08', 16),
(77, 1517.81, 0, 1, '2026-04-19', 15),
(78, 2820.01, 1, 1, '2026-04-13', 26),
(79, 2583.34, 1, 0, '2026-06-06', 47),
(80, 2067.97, 0, 1, '2026-04-17', 19),
(81, 4397.45, 0, 0, '2026-03-31', 37),
(82, 626.52, 0, 0, '2026-03-19', 34),
(83, 2431.96, 0, 0, '2026-05-03', 8),
(84, 1795.04, 0, 0, '2026-05-27', 24),
(85, 3622.86, 0, 1, '2026-05-12', 10),
(86, 4426.11, 1, 0, '2026-05-24', 48),
(87, 5053.83, 0, 1, '2026-04-03', 6),
(88, 750.75, 0, 0, '2026-05-16', 42),
(89, 1177.81, 1, 0, '2026-06-03', 8),
(90, 1738.59, 0, 0, '2026-03-31', 46),
(91, 114.89, 0, 1, '2026-04-21', 26),
(92, 3888.20, 0, 1, '2026-06-10', 20),
(93, 4082.88, 1, 1, '2026-03-30', 14),
(94, 4308.59, 0, 0, '2026-04-17', 10),
(95, 4928.82, 0, 0, '2026-04-16', 40),
(96, 4919.39, 0, 0, '2026-04-18', 50),
(97, 304.89, 0, 0, '2026-05-11', 44),
(98, 1195.33, 0, 1, '2026-05-29', 38),
(99, 926.38, 1, 1, '2026-04-09', 8),
(100, 2844.10, 0, 1, '2026-05-27', 30);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `beneficio`
--
ALTER TABLE `beneficio`
  ADD PRIMARY KEY (`id_beneficio`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle_venta`,`id_venta`,`id_producto`),
  ADD KEY `fk_beneficio_has_productos_productos1_idx` (`id_producto`),
  ADD KEY `fk_beneficio_has_productos_beneficio1_idx` (`id_venta`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`,`id_usuario`,`id_beneficio`),
  ADD KEY `fk_usuario_has_beneficio_beneficio1_idx` (`id_beneficio`),
  ADD KEY `fk_usuario_has_beneficio_usuario1_idx` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_venta_usuarios_idx` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `beneficio`
--
ALTER TABLE `beneficio`
  MODIFY `id_beneficio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_beneficio_has_productos_beneficio1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_beneficio_has_productos_productos1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_usuario_has_beneficio_beneficio1` FOREIGN KEY (`id_beneficio`) REFERENCES `beneficio` (`id_beneficio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_beneficio_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
