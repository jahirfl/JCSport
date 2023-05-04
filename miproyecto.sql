-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2023 a las 21:51:05
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `miproyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `nombre`) VALUES
(1, 'Social'),
(2, 'Arte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `comentario_id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentario` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `publicacion_id` int(11) NOT NULL,
  `creacion` datetime NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `publicacion_id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(511) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contenido` text COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `creacion` datetime DEFAULT current_timestamp(),
  `estado` int(11) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `publicacion`
--

INSERT INTO `publicacion` (`publicacion_id`, `titulo`, `descripcion`, `contenido`, `imagen`, `creacion`, `estado`, `categoria_id`, `usuario_id`) VALUES
(4, 'Vestido floral', 'Lindo vestido floral con estampado en ceda', '$30 / S, X, L', 'https://timeforfashion.es/wp-content/uploads/2022/02/look-invitada-vestido-estampado-4-1024x614.jpg', '2022-11-04 09:18:12', 1, 1, 15),
(5, 'Vestido de ceda fruncido', 'Vestido para que te veas espectacular', '$35 / S, X, L', 'https://okdiario.com/look/img/2021/03/18/maquillaje-a-juego-con-un-vestido-floral-que-maquillaje-elegir.jpg', '2022-11-04 11:05:34', 0, 1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `Id_Tipo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`Id_Tipo`, `Nombre`, `Estado`) VALUES
(1, 'Administrador', 1),
(2, 'Estandar', 1),
(3, 'Cliente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id_Usuario` int(11) NOT NULL,
  `Nombres` varchar(200) NOT NULL,
  `Apellidos` varchar(200) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `Email` varchar(80) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Tipo_Usuario` int(11) NOT NULL,
  `Foto_Perfil` varchar(200) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id_Usuario`, `Nombres`, `Apellidos`, `User_Name`, `Email`, `Password`, `Tipo_Usuario`, `Foto_Perfil`, `Estado`) VALUES
(14, 'Jahir Salvador', 'Flores Espinoza', 'Jahir', 'jahir@gmail.com', '12345', 1, '', 1),
(15, 'Jonathan Josue', 'Castillo Cruz', 'JonaCastillo', 'JonathanCastillo@hotmail.com', '12345', 1, 'https://cdn.pixabay.com/photo/2020/07/21/16/24/landscape-5426755_960_720.jpg', 0),
(16, 'Ana Lucia', 'Sosa Mora', 'MonseAl', 'Anita2021@hotmail.com', '12345', 2, 'https://cdn.pixabay.com/photo/2017/08/06/15/13/woman-2593366_960_720.jpg', 0),
(19, 'Juan ', 'Cruz', 'Juan', 'juan@gmail.com', '12345', 1, '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`comentario_id`),
  ADD KEY `comentario_ibfk_1` (`id_usuario`),
  ADD KEY `RelacionTablaPublicacion` (`publicacion_id`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`publicacion_id`),
  ADD KEY `RelacionTablaUsuario` (`usuario_id`),
  ADD KEY `RelacionTablaCategoria` (`categoria_id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`Id_Tipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `Tipo_Usuario` (`Tipo_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `comentario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `publicacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `Id_Tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `RelacionTablaPublicacion` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`publicacion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `RelacionTablaCategoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RelacionTablaUsuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `RelacionTablaTipo` FOREIGN KEY (`Tipo_Usuario`) REFERENCES `tipo_usuario` (`Id_Tipo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
