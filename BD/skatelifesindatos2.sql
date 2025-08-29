-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2025 a las 13:30:11
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
-- Base de datos: `skatelifesindatos2`
--
CREATE DATABASE IF NOT EXISTS `skatelifesindatos2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `skatelifesindatos2`;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `envios_pendientes_con_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `envios_pendientes_con_clientes` (
`fecha_envio` date
,`prioridad_envio` varchar(30)
,`direccion_salida` varchar(50)
,`producto` varchar(38)
,`cliente` varchar(101)
,`estado_envio` varchar(11)
,`cantidad` int(11)
,`precio_unitario` int(11)
,`total_pedido` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `pk_idinventario` int(11) NOT NULL,
  `fk_idadministrador` int(11) NOT NULL,
  `fk_idproducto` int(11) NOT NULL,
  `tipoMovimiento` varchar(50) NOT NULL,
  `fechaMovimiento` date NOT NULL,
  `numeroFactura` int(11) NOT NULL,
  `proveedor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `inventario_entradas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `inventario_entradas` (
`nombre_producto` varchar(38)
,`stock_actual` int(11)
,`tipo_movimiento` varchar(50)
,`fecha_movimiento` date
,`proveedor` varchar(50)
,`administrador` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `publicaciones_clientes_aprobadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `publicaciones_clientes_aprobadas` (
`nombrepublicacion` varchar(255)
,`descripcion` text
,`fecha_publicacion` date
,`estado_publicacion` varchar(20)
,`nombre_cliente` varchar(101)
,`correo_cliente` varchar(100)
,`nombre_moderador` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `publicaciones_recientes_de_moderadores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `publicaciones_recientes_de_moderadores` (
`nombrepublicacion` varchar(255)
,`descripcion` text
,`fechaPublicacion` date
,`moderador_publicador` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_administrador`
--

CREATE TABLE `tbl_administrador` (
  `pk_idadministrador` int(11) NOT NULL,
  `fk_idusuario` int(11) NOT NULL,
  `registrarproducto` varchar(30) NOT NULL,
  `control` varchar(25) NOT NULL,
  `coordinador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `pk_idcategoria` int(11) NOT NULL,
  `NombreCategoria` varchar(50) NOT NULL,
  `talla` varchar(4) NOT NULL,
  `colores` varchar(45) NOT NULL,
  `modelo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `pk_idcliente` int(11) NOT NULL,
  `fk_idusuario` int(11) NOT NULL,
  `tipodeusuario` varchar(50) NOT NULL,
  `cli_fecharegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detalle_pedido`
--

CREATE TABLE `tbl_detalle_pedido` (
  `fk_idpedido` int(11) NOT NULL,
  `fk_idproducto` int(11) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `precio_unitario_venta` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_envio`
--

CREATE TABLE `tbl_envio` (
  `pk_idenvios` int(11) NOT NULL,
  `fk_idpedido` int(11) NOT NULL,
  `fk_idinventario` int(11) NOT NULL,
  `fechaenvio` date NOT NULL,
  `prioridadenvio` varchar(30) NOT NULL,
  `direccionsalida` varchar(50) NOT NULL,
  `estadoEnvio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_moderador`
--

CREATE TABLE `tbl_moderador` (
  `pk_idmoderador` int(11) NOT NULL,
  `fk_idusuario` int(11) NOT NULL,
  `registroacciones` varchar(25) NOT NULL,
  `permisosmoderacion` varchar(25) NOT NULL,
  `normas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pago`
--

CREATE TABLE `tbl_pago` (
  `pk_idpago` int(11) NOT NULL,
  `fk_idpedido` int(11) NOT NULL,
  `fechapago` date NOT NULL,
  `estadopago` text NOT NULL,
  `metodopago` text NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedido`
--

CREATE TABLE `tbl_pedido` (
  `pk_idpedido` int(11) NOT NULL,
  `fk_idcliente` int(11) NOT NULL,
  `fk_idproducto` int(11) NOT NULL,
  `fechaentrega` date NOT NULL,
  `estadopedido` text NOT NULL,
  `pagopedido` int(11) NOT NULL,
  `direccionentrega` varchar(50) NOT NULL,
  `cantidad_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `tbl_pedido`
--
DELIMITER $$
CREATE TRIGGER `ajustar_cantidad_producto` AFTER UPDATE ON `tbl_pedido` FOR EACH ROW BEGIN
  UPDATE tbl_producto
  SET cantidad = cantidad + OLD.cantidad_pedido
  WHERE pk_idproducto = OLD.fk_idproducto;

  UPDATE tbl_producto
  SET cantidad = cantidad - NEW.cantidad_pedido
  WHERE pk_idproducto = NEW.fk_idproducto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reponer_cantidad_producto` AFTER DELETE ON `tbl_pedido` FOR EACH ROW BEGIN
  UPDATE tbl_producto
  SET cantidad = cantidad + OLD.cantidad_pedido
  WHERE pk_idproducto = OLD.fk_idproducto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `restar_cantidad_producto` AFTER INSERT ON `tbl_pedido` FOR EACH ROW BEGIN
  UPDATE tbl_producto
  SET cantidad = cantidad - NEW.cantidad_pedido
  WHERE pk_idproducto = NEW.fk_idproducto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validar_ajuste_stock` BEFORE UPDATE ON `tbl_pedido` FOR EACH ROW BEGIN
  DECLARE stock_actual INT;
  DECLARE diferencia INT;

  -- Calcular la diferencia (positiva si se aumenta, negativa si se reduce)
  SET diferencia = NEW.cantidad_pedido - OLD.cantidad_pedido;

  -- Solo hacer algo si hay un cambio
  IF diferencia <> 0 THEN
    -- Obtener la cantidad actual del producto
    SELECT cantidad INTO stock_actual
    FROM tbl_producto
    WHERE pk_idproducto = NEW.fk_idproducto;

    -- Validar si hay suficiente stock para el ajuste
    IF stock_actual < diferencia THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No hay suficiente stock para modificar el pedido.';
    END IF;

    -- Actualizar el stock
    UPDATE tbl_producto
    SET cantidad = cantidad - diferencia
    WHERE pk_idproducto = NEW.fk_idproducto;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validar_y_restar_stock` BEFORE INSERT ON `tbl_pedido` FOR EACH ROW BEGIN
  DECLARE stock_actual INT;
  SELECT cantidad INTO stock_actual
  FROM tbl_producto
  WHERE pk_idproducto = NEW.fk_idproducto;

  IF stock_actual < NEW.cantidad_pedido THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No hay suficiente stock para completar el pedido.';
  END IF;
  UPDATE tbl_producto
  SET cantidad = cantidad - NEW.cantidad_pedido
  WHERE pk_idproducto = NEW.fk_idproducto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto`
--

CREATE TABLE `tbl_producto` (
  `pk_idproducto` int(11) NOT NULL,
  `nombreproducto` varchar(38) NOT NULL,
  `precio` int(11) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `informacion` varchar(45) NOT NULL,
  `fk_idcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_publicaciones`
--

CREATE TABLE `tbl_publicaciones` (
  `fechaPublicacion` date NOT NULL,
  `Estados` varchar(20) NOT NULL,
  `nombrepublicacion` varchar(255) NOT NULL,
  `archivos` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `reacciones` varchar(40) NOT NULL,
  `comentarios` varchar(100) NOT NULL,
  `fk_idcliente` int(11) NOT NULL,
  `fk_idmoderador` int(11) NOT NULL,
  `pk_idpublicaciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `pk_idusuario` int(11) NOT NULL,
  `numIde` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `edad` int(11) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `tbl_usuario`
--
DELIMITER $$
CREATE TRIGGER `tr_actualizar_edad_usuario` BEFORE UPDATE ON `tbl_usuario` FOR EACH ROW BEGIN
    IF NEW.fechaNacimiento != OLD.fechaNacimiento THEN
        SET NEW.edad = TIMESTAMPDIFF(YEAR, NEW.fechaNacimiento, CURDATE());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_calcular_edad_usuario` BEFORE INSERT ON `tbl_usuario` FOR EACH ROW BEGIN
    SET NEW.edad = TIMESTAMPDIFF(YEAR, NEW.fechaNacimiento, CURDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_categoria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_categoria` (
`nombreproducto` varchar(38)
,`precio` int(11)
,`cantidad` int(11)
,`NombreCategoria` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_pagos_con_detalles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_pagos_con_detalles` (
`cliente` varchar(101)
,`producto` varchar(38)
,`cantidad` int(11)
,`precio_unitario` int(11)
,`total_pagado` int(11)
,`estado_pedido` text
,`fecha_pago` date
,`metodo_pago` mediumtext
,`estado_pago` mediumtext
,`direccion_entrega` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `envios_pendientes_con_clientes`
--
DROP TABLE IF EXISTS `envios_pendientes_con_clientes`;

CREATE VIEW `envios_pendientes_con_clientes`  AS SELECT `e`.`fechaenvio` AS `fecha_envio`, `e`.`prioridadenvio` AS `prioridad_envio`, `e`.`direccionsalida` AS `direccion_salida`, `p`.`nombreproducto` AS `producto`, concat(`u`.`nombre`,' ',`u`.`apellidos`) AS `cliente`, CASE WHEN `e`.`estadoEnvio` = 0 THEN 'Pendiente' WHEN `e`.`estadoEnvio` = 1 THEN 'Enviado' WHEN `e`.`estadoEnvio` = 2 THEN 'Entregado' ELSE 'Desconocido' END AS `estado_envio`, `pe`.`cantidad_pedido` AS `cantidad`, `p`.`precio` AS `precio_unitario`, `pe`.`cantidad_pedido`* `p`.`precio` AS `total_pedido` FROM (((((`tbl_envio` `e` join `inventario` `i` on(`e`.`fk_idinventario` = `i`.`pk_idinventario`)) join `tbl_producto` `p` on(`i`.`fk_idproducto` = `p`.`pk_idproducto`)) join `tbl_pedido` `pe` on(`e`.`fk_idpedido` = `pe`.`pk_idpedido`)) join `tbl_cliente` `c` on(`pe`.`fk_idcliente` = `c`.`pk_idcliente`)) join `tbl_usuario` `u` on(`c`.`fk_idusuario` = `u`.`pk_idusuario`)) WHERE `e`.`estadoEnvio` = '0' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `inventario_entradas`
--
DROP TABLE IF EXISTS `inventario_entradas`;

CREATE VIEW `inventario_entradas`  AS SELECT `p`.`nombreproducto` AS `nombre_producto`, `p`.`cantidad` AS `stock_actual`, `i`.`tipoMovimiento` AS `tipo_movimiento`, `i`.`fechaMovimiento` AS `fecha_movimiento`, `i`.`proveedor` AS `proveedor`, concat(`a`.`nombre`,' ',`a`.`apellidos`) AS `administrador` FROM ((`inventario` `i` join `tbl_producto` `p` on(`i`.`fk_idproducto` = `p`.`pk_idproducto`)) join `tbl_usuario` `a` on(`i`.`fk_idadministrador` = `a`.`pk_idusuario`)) WHERE `i`.`tipoMovimiento` = 'Entrada' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `publicaciones_clientes_aprobadas`
--
DROP TABLE IF EXISTS `publicaciones_clientes_aprobadas`;

CREATE VIEW `publicaciones_clientes_aprobadas`  AS SELECT `tp`.`nombrepublicacion` AS `nombrepublicacion`, `tp`.`descripcion` AS `descripcion`, cast(`tp`.`fechaPublicacion` as date) AS `fecha_publicacion`, `tp`.`Estados` AS `estado_publicacion`, concat(`tu_cliente`.`nombre`,' ',`tu_cliente`.`apellidos`) AS `nombre_cliente`, `tu_cliente`.`correo` AS `correo_cliente`, concat(`tu_moderador`.`nombre`,' ',`tu_moderador`.`apellidos`) AS `nombre_moderador` FROM ((((`tbl_publicaciones` `tp` join `tbl_cliente` `tc` on(`tp`.`fk_idcliente` = `tc`.`pk_idcliente`)) join `tbl_usuario` `tu_cliente` on(`tc`.`fk_idusuario` = `tu_cliente`.`pk_idusuario`)) left join `tbl_moderador` `tm` on(`tp`.`fk_idmoderador` = `tm`.`pk_idmoderador`)) left join `tbl_usuario` `tu_moderador` on(`tm`.`fk_idusuario` = `tu_moderador`.`pk_idusuario`)) WHERE `tp`.`Estados` = 'Activo' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `publicaciones_recientes_de_moderadores`
--
DROP TABLE IF EXISTS `publicaciones_recientes_de_moderadores`;

CREATE VIEW `publicaciones_recientes_de_moderadores`  AS SELECT `tp`.`nombrepublicacion` AS `nombrepublicacion`, `tp`.`descripcion` AS `descripcion`, `tp`.`fechaPublicacion` AS `fechaPublicacion`, concat(`tu`.`nombre`,' ',`tu`.`apellidos`) AS `moderador_publicador` FROM ((`tbl_publicaciones` `tp` join `tbl_moderador` `tm` on(`tp`.`fk_idmoderador` = `tm`.`pk_idmoderador`)) join `tbl_usuario` `tu` on(`tm`.`fk_idusuario` = `tu`.`pk_idusuario`)) WHERE `tp`.`fechaPublicacion` >= curdate() - interval 6 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_categoria`
--
DROP TABLE IF EXISTS `vista_productos_categoria`;

CREATE VIEW `vista_productos_categoria`  AS SELECT `p`.`nombreproducto` AS `nombreproducto`, `p`.`precio` AS `precio`, `p`.`cantidad` AS `cantidad`, `c`.`NombreCategoria` AS `NombreCategoria` FROM (`tbl_producto` `p` join `tbl_categoria` `c` on(`p`.`fk_idcategoria` = `c`.`pk_idcategoria`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_pagos_con_detalles`
--
DROP TABLE IF EXISTS `vw_pagos_con_detalles`;

CREATE VIEW `vw_pagos_con_detalles`  AS SELECT concat(`u`.`nombre`,' ',`u`.`apellidos`) AS `cliente`, `p`.`nombreproducto` AS `producto`, `pe`.`cantidad_pedido` AS `cantidad`, `p`.`precio` AS `precio_unitario`, `pa`.`total` AS `total_pagado`, `pe`.`estadopedido` AS `estado_pedido`, `pa`.`fechapago` AS `fecha_pago`, CASE WHEN `pa`.`metodopago` = 'TARJETA' THEN 'Tarjeta de crédito/débito' WHEN `pa`.`metodopago` = 'EFECTIVO' THEN 'Efectivo' WHEN `pa`.`metodopago` = 'TRANSFERENCIA' THEN 'Transferencia bancaria' ELSE `pa`.`metodopago` END AS `metodo_pago`, CASE WHEN `pa`.`estadopago` = 'COMPLETADO' THEN 'Completado' WHEN `pa`.`estadopago` = 'PENDIENTE' THEN 'Pendiente' WHEN `pa`.`estadopago` = 'RECHAZADO' THEN 'Rechazado' ELSE `pa`.`estadopago` END AS `estado_pago`, `pe`.`direccionentrega` AS `direccion_entrega` FROM ((((`tbl_pago` `pa` join `tbl_pedido` `pe` on(`pa`.`fk_idpedido` = `pe`.`pk_idpedido`)) join `tbl_cliente` `c` on(`pe`.`fk_idcliente` = `c`.`pk_idcliente`)) join `tbl_usuario` `u` on(`c`.`fk_idusuario` = `u`.`pk_idusuario`)) join `tbl_producto` `p` on(`pe`.`fk_idproducto` = `p`.`pk_idproducto`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`pk_idinventario`),
  ADD KEY `fk_idadministrador` (`fk_idadministrador`),
  ADD KEY `fk_idproducto` (`fk_idproducto`);

--
-- Indices de la tabla `tbl_administrador`
--
ALTER TABLE `tbl_administrador`
  ADD PRIMARY KEY (`pk_idadministrador`),
  ADD KEY `fk_idusuario` (`fk_idusuario`);

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`pk_idcategoria`);

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`pk_idcliente`),
  ADD KEY `fk_idusuario` (`fk_idusuario`);

--
-- Indices de la tabla `tbl_detalle_pedido`
--
ALTER TABLE `tbl_detalle_pedido`
  ADD PRIMARY KEY (`fk_idpedido`,`fk_idproducto`),
  ADD KEY `fk_idproducto` (`fk_idproducto`);

--
-- Indices de la tabla `tbl_envio`
--
ALTER TABLE `tbl_envio`
  ADD PRIMARY KEY (`pk_idenvios`),
  ADD KEY `fk_idinventario` (`fk_idinventario`),
  ADD KEY `fk_idpedido` (`fk_idpedido`);

--
-- Indices de la tabla `tbl_moderador`
--
ALTER TABLE `tbl_moderador`
  ADD PRIMARY KEY (`pk_idmoderador`),
  ADD KEY `fk_idusuario` (`fk_idusuario`);

--
-- Indices de la tabla `tbl_pago`
--
ALTER TABLE `tbl_pago`
  ADD PRIMARY KEY (`pk_idpago`),
  ADD KEY `fk_idpedido` (`fk_idpedido`);

--
-- Indices de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD PRIMARY KEY (`pk_idpedido`),
  ADD KEY `fk_idcliente` (`fk_idcliente`),
  ADD KEY `fk_idproducto` (`fk_idproducto`);

--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`pk_idproducto`),
  ADD KEY `fk_idcategoria` (`fk_idcategoria`);

--
-- Indices de la tabla `tbl_publicaciones`
--
ALTER TABLE `tbl_publicaciones`
  ADD PRIMARY KEY (`pk_idpublicaciones`),
  ADD KEY `fk_idcliente` (`fk_idcliente`,`fk_idmoderador`),
  ADD KEY `fk_idmoderador` (`fk_idmoderador`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`pk_idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `pk_idinventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_administrador`
--
ALTER TABLE `tbl_administrador`
  MODIFY `pk_idadministrador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `pk_idcategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_envio`
--
ALTER TABLE `tbl_envio`
  MODIFY `pk_idenvios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  MODIFY `pk_idpedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  MODIFY `pk_idproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_publicaciones`
--
ALTER TABLE `tbl_publicaciones`
  MODIFY `pk_idpublicaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `pk_idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`fk_idproducto`) REFERENCES `tbl_producto` (`pk_idproducto`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`fk_idadministrador`) REFERENCES `tbl_administrador` (`pk_idadministrador`);

--
-- Filtros para la tabla `tbl_administrador`
--
ALTER TABLE `tbl_administrador`
  ADD CONSTRAINT `tbl_administrador_ibfk_1` FOREIGN KEY (`fk_idusuario`) REFERENCES `tbl_usuario` (`pk_idusuario`);

--
-- Filtros para la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD CONSTRAINT `tbl_cliente_ibfk_1` FOREIGN KEY (`fk_idusuario`) REFERENCES `tbl_usuario` (`pk_idusuario`);

--
-- Filtros para la tabla `tbl_detalle_pedido`
--
ALTER TABLE `tbl_detalle_pedido`
  ADD CONSTRAINT `tbl_detalle_pedido_ibfk_1` FOREIGN KEY (`fk_idpedido`) REFERENCES `tbl_pedido` (`pk_idpedido`),
  ADD CONSTRAINT `tbl_detalle_pedido_ibfk_2` FOREIGN KEY (`fk_idproducto`) REFERENCES `tbl_producto` (`pk_idproducto`);

--
-- Filtros para la tabla `tbl_envio`
--
ALTER TABLE `tbl_envio`
  ADD CONSTRAINT `tbl_envio_ibfk_1` FOREIGN KEY (`fk_idinventario`) REFERENCES `inventario` (`pk_idinventario`),
  ADD CONSTRAINT `tbl_envio_ibfk_2` FOREIGN KEY (`fk_idpedido`) REFERENCES `tbl_pedido` (`pk_idpedido`);

--
-- Filtros para la tabla `tbl_moderador`
--
ALTER TABLE `tbl_moderador`
  ADD CONSTRAINT `tbl_moderador_ibfk_1` FOREIGN KEY (`fk_idusuario`) REFERENCES `tbl_usuario` (`pk_idusuario`);

--
-- Filtros para la tabla `tbl_pago`
--
ALTER TABLE `tbl_pago`
  ADD CONSTRAINT `tbl_pago_ibfk_1` FOREIGN KEY (`fk_idpedido`) REFERENCES `tbl_pedido` (`pk_idpedido`);

--
-- Filtros para la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD CONSTRAINT `tbl_pedido_ibfk_2` FOREIGN KEY (`fk_idcliente`) REFERENCES `tbl_cliente` (`pk_idcliente`),
  ADD CONSTRAINT `tbl_pedido_ibfk_3` FOREIGN KEY (`fk_idproducto`) REFERENCES `tbl_producto` (`pk_idproducto`);

--
-- Filtros para la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD CONSTRAINT `tbl_producto_ibfk_1` FOREIGN KEY (`fk_idcategoria`) REFERENCES `tbl_categoria` (`pk_idcategoria`);

--
-- Filtros para la tabla `tbl_publicaciones`
--
ALTER TABLE `tbl_publicaciones`
  ADD CONSTRAINT `tbl_publicaciones_ibfk_1` FOREIGN KEY (`fk_idcliente`) REFERENCES `tbl_cliente` (`pk_idcliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
