-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2021 a las 12:10:09
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ws_banguat`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spNewNumero` (IN `numeroNew` INT)  BEGIN
INSERT INTO ws_banguat.utlima_peticion_correlativo values(numeroNew);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spNewTipoCambioRango` (IN `monedaReq` INT, IN `fechaReq` TEXT, IN `ventaReq` FLOAT, IN `compraReq` FLOAT)  BEGIN

SET @valor = (SELECT ultima_peticion FROM ws_banguat.utlima_peticion_correlativo ORDER BY ultima_peticion DESC LIMIT 1);
/*INSERTANDO NUEVOS REGISTROS EN LA TABLA RANGO FECHA*/
INSERT INTO `ws_banguat`.`tipo_cambio_rango` (`moneda`, `fecha`, `venta`, `compra`, `peticion`)
VALUES (monedaReq, STR_TO_DATE(fechaReq, '%d/%m/%Y'), ventaReq, compraReq
, ifnull(@valor,0)+1
);

CALL spNewNumero (ifnull(@valor,0)+1);

SELECT ifnull(@valor,0)+1 as peticion;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cambio_rango`
--

CREATE TABLE `tipo_cambio_rango` (
  `id` int(11) NOT NULL,
  `moneda` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `venta` float NOT NULL,
  `compra` float NOT NULL,
  `peticion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_cambio_rango`
--

INSERT INTO `tipo_cambio_rango` (`id`, `moneda`, `fecha`, `venta`, `compra`, `peticion`) VALUES
(1, 2, '2021-06-01', 7.72935, 7.72935, 1),
(2, 2, '2021-06-02', 7.72179, 7.72179, 2),
(3, 2, '2021-06-03', 7.72533, 7.72533, 3),
(4, 2, '2021-06-04', 7.72994, 7.72994, 4),
(5, 2, '2021-06-05', 7.72994, 7.72994, 5),
(6, 2, '2021-06-06', 7.72994, 7.72994, 6),
(7, 2, '2021-06-07', 7.72393, 7.72393, 7),
(8, 2, '2021-06-08', 7.72481, 7.72481, 8),
(9, 2, '2021-06-09', 7.73186, 7.73186, 9),
(10, 2, '2021-06-10', 7.73802, 7.73802, 10),
(11, 2, '2021-06-11', 7.74072, 7.74072, 11),
(12, 2, '2021-06-12', 7.74072, 7.74072, 12),
(13, 2, '2021-06-13', 7.74072, 7.74072, 13),
(14, 2, '2021-06-14', 7.737, 7.737, 14),
(15, 2, '2021-06-15', 7.73582, 7.73582, 15),
(16, 2, '2021-06-16', 7.74111, 7.74111, 16),
(17, 2, '2021-06-17', 7.74153, 7.74153, 17),
(18, 2, '2021-06-18', 7.74443, 7.74443, 18),
(19, 2, '2021-06-19', 7.74443, 7.74443, 19),
(20, 2, '2021-06-20', 7.74443, 7.74443, 20),
(21, 2, '2021-06-21', 7.73757, 7.73757, 21),
(22, 2, '2021-06-22', 7.738, 7.738, 22),
(23, 2, '2021-06-23', 7.74412, 7.74412, 23),
(24, 2, '2021-06-24', 7.74428, 7.74428, 24),
(25, 2, '2021-06-25', 7.75033, 7.75033, 25),
(26, 2, '2021-06-26', 7.75033, 7.75033, 26),
(27, 2, '2021-06-27', 7.75033, 7.75033, 27),
(28, 2, '2021-06-28', 7.75033, 7.75033, 28),
(29, 2, '2021-06-29', 7.75033, 7.75033, 29),
(30, 2, '2021-06-30', 7.74404, 7.74404, 30),
(31, 2, '2021-07-01', 7.744, 7.744, 31),
(32, 2, '2021-07-02', 7.74502, 7.74502, 32),
(33, 2, '2021-07-03', 7.74502, 7.74502, 33),
(34, 2, '2021-07-04', 7.74502, 7.74502, 34),
(35, 2, '2021-07-05', 7.74235, 7.74235, 35),
(36, 2, '2021-07-06', 7.74274, 7.74274, 36),
(37, 2, '2021-07-07', 7.74339, 7.74339, 37),
(38, 2, '2021-07-08', 7.74471, 7.74471, 38),
(39, 2, '2021-07-09', 7.74768, 7.74768, 39),
(40, 2, '2021-07-10', 7.74768, 7.74768, 40),
(41, 2, '2021-07-11', 7.74768, 7.74768, 41),
(42, 2, '2021-07-12', 7.74799, 7.74799, 42),
(43, 2, '2021-07-01', 7.744, 7.744, 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utlima_peticion_correlativo`
--

CREATE TABLE `utlima_peticion_correlativo` (
  `ultima_peticion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `utlima_peticion_correlativo`
--

INSERT INTO `utlima_peticion_correlativo` (`ultima_peticion`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipo_cambio_rango`
--
ALTER TABLE `tipo_cambio_rango`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `utlima_peticion_correlativo`
--
ALTER TABLE `utlima_peticion_correlativo`
  ADD PRIMARY KEY (`ultima_peticion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipo_cambio_rango`
--
ALTER TABLE `tipo_cambio_rango`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
