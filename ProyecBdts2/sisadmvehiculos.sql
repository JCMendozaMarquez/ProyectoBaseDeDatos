-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2022 a las 11:57:28
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sisadmvehiculos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CodRegistro` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Domicilio` varchar(50) NOT NULL,
  `E-mail` varchar(50) NOT NULL,
  `Telf` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerencia`
--

CREATE TABLE `gerencia` (
  `Id-Gerencia` int(11) NOT NULL,
  `Direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gerencia`
--

INSERT INTO `gerencia` (`Id-Gerencia`, `Direccion`) VALUES
(1, 'Calle Urtado Loza1231 Mercado Stronger'),
(2, 'Avenida Javier Del Granado 3121'),
(3, 'Calle 1 -Walter Hugo Lizón Arévalo 1223'),
(4, 'Calle Santiago Pol Barrenechea, La Paz 2532');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `Nombre` varchar(100) NOT NULL,
  `Reportes` text NOT NULL,
  `Observaciones` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparacion`
--

CREATE TABLE `reparacion` (
  `FechaIngreso` int(11) NOT NULL,
  `HoraIngreso` int(11) NOT NULL,
  `MotivoRecojo` varchar(50) NOT NULL,
  `Patente` int(11) NOT NULL,
  `HoraSalida` int(11) NOT NULL,
  `FechaSalida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `Cliente` varchar(50) NOT NULL,
  `Vehiculo` varchar(50) NOT NULL,
  `Reparacion` varchar(50) NOT NULL,
  `Mecanicos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `Patente` int(11) NOT NULL,
  `Cliente` varchar(50) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Modelo` int(11) NOT NULL,
  `Año-Color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CodRegistro`,`Nombre`),
  ADD KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `gerencia`
--
ALTER TABLE `gerencia`
  ADD PRIMARY KEY (`Direccion`),
  ADD UNIQUE KEY `Id-Gerencia` (`Id-Gerencia`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`Nombre`,`Observaciones`),
  ADD UNIQUE KEY `Nombre` (`Nombre`,`Observaciones`),
  ADD KEY `Observaciones` (`Observaciones`);

--
-- Indices de la tabla `reparacion`
--
ALTER TABLE `reparacion`
  ADD PRIMARY KEY (`Patente`),
  ADD UNIQUE KEY `MotivoRecojo` (`MotivoRecojo`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`Cliente`,`Mecanicos`),
  ADD UNIQUE KEY `Cliente` (`Cliente`),
  ADD KEY `Mecanicos` (`Mecanicos`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`Cliente`),
  ADD UNIQUE KEY `Patente` (`Patente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`Nombre`) REFERENCES `vehiculo` (`Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD CONSTRAINT `mecanico_ibfk_1` FOREIGN KEY (`Observaciones`) REFERENCES `reparacion` (`MotivoRecojo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reparacion`
--
ALTER TABLE `reparacion`
  ADD CONSTRAINT `reparacion_ibfk_1` FOREIGN KEY (`Patente`) REFERENCES `vehiculo` (`Patente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`Cliente`) REFERENCES `gerencia` (`Direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`Mecanicos`) REFERENCES `mecanico` (`Nombre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
