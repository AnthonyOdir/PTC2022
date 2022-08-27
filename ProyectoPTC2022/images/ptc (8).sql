-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-08-2022 a las 18:33:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ptc`
--
CREATE DATABASE IF NOT EXISTS `ptc` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `ptc`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `Id` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` double NOT NULL,
  `CartId` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`Id`, `ProductId`, `UserId`, `Quantity`, `UnitPrice`, `CartId`) VALUES
(14, 6, 5, 1, 8.3, '0a6fbd5d-5a7f-4013-bb73-435e6716ac4a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_carro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_carrusel`
--

CREATE TABLE `imagenes_carrusel` (
  `Id` int(11) NOT NULL,
  `Direccion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Texto` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `imagenes_carrusel`
--

INSERT INTO `imagenes_carrusel` (`Id`, `Direccion`, `Texto`) VALUES
(1, '81fhDGdAN6L._SL1500_.jpg', 'Hyundai'),
(2, 'car_on_dyno.jpg', 'rojito'),
(3, 'Kia RIO P 666 791.jpg', 'Carro Prueba'),
(4, 'Chevrolet BEAT P 838 219.jpg', 'Bucciarati');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id` int(11) NOT NULL,
  `numero_tarjeta` int(11) NOT NULL,
  `numero_vencimiento` date NOT NULL,
  `cvv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id` int(11) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `costo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Price` double NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Image` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `Name`, `Price`, `Quantity`, `Image`) VALUES
(7, 'Carro Prueba', 1190, 1, 'car_on_dyno.jpg'),
(9, 'Hyundai', 2000, 1, 'Kia RIO P 666 791.jpg'),
(10, 'Honda', 2000, 1, 'Kia RIO P 666 791.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renta`
--

CREATE TABLE `renta` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_carro` int(11) NOT NULL,
  `tiempo_renta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Total` double NOT NULL,
  `Items` int(11) NOT NULL,
  `QRText` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`Id`, `UserId`, `Total`, `Items`, `QRText`, `Date`) VALUES
(2, 1, 32.85, 3, 'b765350a-573f-46b2-9fb4-b6b85767092a', '2022-07-24'),
(3, 1, 51.7, 2, '61d73cfb-401b-491c-8c64-47b21ddda529', '2022-07-24'),
(4, 1, 3.5, 1, 'e461f78c-95d8-49ae-989b-d84f63f4626f', '2022-07-24'),
(5, 1, 7, 2, 'b9a30b24-7ce3-4d8b-9e53-ac0804a23e45', '2022-07-24'),
(6, 2, 25.85, 1, '665c8cbf-b736-4516-b3c5-151f1f2e7e18', '2022-07-24'),
(7, 3, 7, 2, '97a5d9ca-76f2-46f2-9025-f573cc4be215', '2022-07-24'),
(8, 4, 4.25, 2, '182ecc7f-8d0b-4ec2-9f44-041150af588d', '2022-07-24'),
(9, 1, 37.1, 5, 'ca6bf199-fbd6-4b76-8098-d6fc141438ec', '2022-07-24'),
(10, 1, 29.35, 2, '02dbf7e3-aa90-4fbd-9116-5f4a9f808579', '2022-07-27'),
(11, 1, 7, 2, '797ad96f-189d-4cfa-a85a-6f7203fd7b18', '2022-07-27'),
(12, 1, 25.85, 1, '51f7e58e-e40c-4350-aee5-ed3ad0b20425', '2022-07-27'),
(13, 1, 30.1, 3, 'dc8b556d-91e5-4c1f-8826-5fa4ca093394', '2022-07-27'),
(14, 5, 8.3, 1, '67f6f0b0-0d5b-4198-976c-5bd299f8c964', '2022-07-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_details`
--

CREATE TABLE `sales_details` (
  `Id` int(11) NOT NULL,
  `SalesId` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` double NOT NULL,
  `TotalPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sales_details`
--

INSERT INTO `sales_details` (`Id`, `SalesId`, `ItemId`, `Quantity`, `UnitPrice`, `TotalPrice`) VALUES
(2, 2, 2, 2, 3.5, 7),
(3, 2, 1, 1, 25.85, 25.85),
(4, 3, 1, 2, 25.85, 51.7),
(5, 4, 2, 1, 3.5, 3.5),
(6, 5, 2, 2, 3.5, 7),
(7, 6, 1, 1, 25.85, 25.85),
(8, 7, 2, 2, 3.5, 7),
(9, 8, 3, 1, 0.75, 0.75),
(10, 8, 2, 1, 3.5, 3.5),
(11, 9, 1, 1, 25.85, 25.85),
(12, 9, 2, 3, 3.5, 10.5),
(13, 9, 3, 1, 0.75, 0.75),
(14, 10, 1, 1, 25.85, 25.85),
(15, 10, 2, 1, 3.5, 3.5),
(16, 11, 2, 2, 3.5, 7),
(17, 12, 1, 1, 25.85, 25.85),
(18, 13, 1, 1, 25.85, 25.85),
(19, 13, 2, 1, 3.5, 3.5),
(20, 13, 3, 1, 0.75, 0.75),
(21, 14, 6, 1, 8.3, 8.3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `F_nacimiento` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_usuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `User_Type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `F_nacimiento`, `nombre_usuario`, `password`, `correo`, `User_Type`) VALUES
(1, 'Francisco', 'Jimenez', '2002-12-21 00:00:00', 'Admin', '59Iwqx91sFpOPPHcYrlq9A==', '20220179@santacecilia.edu.sv', 1),
(10, 'Anthony', 'Lopez', '19/11/2003 00:00:00', 'Cliente', '59Iwqx91sFpOPPHcYrlq9A==', 'odirmiranda9@gmail.com', 0),
(11, 'Jefferson', 'Grande', '20/6/2006 00:00:00', 'Jefito', '59Iwqx91sFpOPPHcYrlq9A==', 'jeffersongrande2017@gmail.com', 0),
(12, 'Anthony', 'Lopez', '16/8/2022 00:00:00', 'Prueba2', '59Iwqx91sFpOPPHcYrlq9A==', '20220179@santacecilia.edu.sv', 0),
(13, 'Ale', 'Carranza', '22/8/2022 00:00:00', 'Prueba3', '59Iwqx91sFpOPPHcYrlq9A==', 'jeffersongrande2017@gmail.com', 0),
(14, 'Anthony', 'Lopez', '8/8/2022 00:00:00', 'jefito123', '59Iwqx91sFpOPPHcYrlq9A==', 'jeffersongrande2017@gmail.com', 0),
(15, 'Alan', 'Cortez', '30/8/2022 00:00:00', 'Alan', '59Iwqx91sFpOPPHcYrlq9A==', 'jeffersongrande2017@gmail.com', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `imagenes_carrusel`
--
ALTER TABLE `imagenes_carrusel`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `sales_details`
--
ALTER TABLE `sales_details`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `imagenes_carrusel`
--
ALTER TABLE `imagenes_carrusel`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sales_details`
--
ALTER TABLE `sales_details`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
