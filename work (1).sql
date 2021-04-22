-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2020 a las 23:03:15
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `work`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `dureza` varchar(50) NOT NULL,
  `aforo_predeter` int(20) DEFAULT NULL,
  `duracion` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id`, `nombre`, `dureza`, `aforo_predeter`, `duracion`) VALUES
(9, 'body combat', 'Normal', 30, 40),
(42, 'body balance', 'Normal', 30, 35),
(48, 'Spinning', 'Normal', 40, 40),
(49, 'Yoga', 'Alta', 30, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `celebracion_actividad`
--

CREATE TABLE `celebracion_actividad` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_actividad` int(10) UNSIGNED DEFAULT NULL,
  `id_monitor` int(10) UNSIGNED DEFAULT NULL,
  `id_ubic` int(10) UNSIGNED DEFAULT NULL,
  `aforo` int(20) NOT NULL,
  `reservas` int(10) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `hora` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `celebracion_actividad`
--

INSERT INTO `celebracion_actividad` (`id`, `id_actividad`, `id_monitor`, `id_ubic`, `aforo`, `reservas`, `fecha`, `hora`) VALUES
(33, 42, 10, 3, 30, 0, '2020-06-13', '12:15'),
(34, 9, 9, 2, 30, 0, '2020-06-15', '12:15'),
(35, 42, 11, 3, 30, 0, '2020-06-16', '16:20'),
(36, 49, 11, 2, 30, 0, '2020-06-16', '19:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `telefono` int(9) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellidos`, `sexo`, `dni`, `telefono`, `email`, `password`) VALUES
(31, 'Paco', 'Ocelote', 'Hombre', '55782789S', 685472139, 'paquito@gmail.com', 'Paco1234'),
(53, 'prueba', 'prueba', 'Hombre', '90035036h', 666333222, 'angelclash97@gmail.com', 'Angel1234@'),
(71, 'angel', 'velasco arjona', 'Hombre', '50616180b', 667050444, 'angelva96@gmail.com', 'Hola1234@');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitor`
--

CREATE TABLE `monitor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `monitor`
--

INSERT INTO `monitor` (`id`, `nombre`, `apellidos`, `email`, `password`) VALUES
(9, 'Maria', 'Garcia', 'mgarcia@workhard.es', 'Maria@12'),
(10, 'Isabel', 'Casas', 'icasas@workhard.es', 'Isabel@12'),
(11, 'Mateo', 'Alonso', 'malonso@workhard.es', 'Mateo@12'),
(12, 'Sara', 'Martinez', 'smartinez@workhard.es', 'Sara@12'),
(14, 'angel', 'lopez', 'alopez@workhard.com', 'Angel@12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cliente` int(10) UNSIGNED DEFAULT NULL,
  `id_celebracion` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `aforo_maximo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `nombre`, `aforo_maximo`) VALUES
(1, 'Spinning', 50),
(2, 'Estudio 2', 30),
(3, 'Estudio 3', 40);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `celebracion_actividad`
--
ALTER TABLE `celebracion_actividad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_actividad` (`id_actividad`),
  ADD KEY `id_ubic` (`id_ubic`),
  ADD KEY `id_monitor` (`id_monitor`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_celebracion` (`id_celebracion`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `celebracion_actividad`
--
ALTER TABLE `celebracion_actividad`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `monitor`
--
ALTER TABLE `monitor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `celebracion_actividad`
--
ALTER TABLE `celebracion_actividad`
  ADD CONSTRAINT `celebracion_actividad_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `celebracion_actividad_ibfk_3` FOREIGN KEY (`id_ubic`) REFERENCES `ubicacion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `celebracion_actividad_ibfk_4` FOREIGN KEY (`id_monitor`) REFERENCES `monitor` (`id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_celebracion`) REFERENCES `celebracion_actividad` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
