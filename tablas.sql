/* ############ CREATES ##################### */

/* ----- Creación de Base de Datos --------- */
CREATE DATABASE `larutadb`;
-- DROP DATABASE `larutadb`;
/* ----- Selección de Base de Datos --------- */
USE `larutadb`;


/* Tablas */
/* ----- Creación de Tabla Categorías --------- */
CREATE TABLE IF NOT EXISTS `larutadb`.`Categorias` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;
 
/* ----- Creación de Tabla SubCategorías --------- */
CREATE TABLE IF NOT EXISTS `larutadb`.`subCategorias` (
  `idSubCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idSubCategoria`),
  INDEX `fk_subCategorias_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_subCategorias_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `larutadb`.`Categorias` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/* ----- Creación de Tabla Condición de IVA --------- */ 
CREATE TABLE IF NOT EXISTS `larutadb`.`condIva` (
  `idcondIva` INT NOT NULL,
  `tipoFac` VARCHAR(1) NOT NULL,
  `concepto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcondIva`))
ENGINE = InnoDB;
    
/* ----- Creación de Tabla Proveedores --------- */   
CREATE TABLE IF NOT EXISTS `larutadb`.`proveedores` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `razonSocial` VARCHAR(45) NOT NULL,
  `cuit` VARCHAR(45) NOT NULL,
  `condIva_idcondIva` INT NOT NULL,
  PRIMARY KEY (`idProveedor`),
  INDEX `fk_proveedores_condIva1_idx` (`condIva_idcondIva` ASC) VISIBLE,
  CONSTRAINT `fk_proveedores_condIva1`
    FOREIGN KEY (`condIva_idcondIva`)
    REFERENCES `larutadb`.`condIva` (`idcondIva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/* ----- Creación de Tabla Productos --------- */
CREATE TABLE IF NOT EXISTS `larutadb`.`productos` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `idSubCategoria` INT NOT NULL,
  `idProveedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `precioUnitario` DECIMAL(10,2) NULL DEFAULT 0.00,
  `stock` INT NULL DEFAULT 0.00,
  `IVA` FLOAT NULL DEFAULT 21,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_productos_categorias_idx` (`idSubCategoria` ASC) VISIBLE,
  INDEX `fk_productos_proveedores_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_productos_categorias`
    FOREIGN KEY (`idSubCategoria`)
    REFERENCES `larutadb`.`subCategorias` (`idSubCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_proveedores`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `larutadb`.`proveedores` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/* ----- Creación de Tabla Clientes --------- */
CREATE TABLE IF NOT EXISTS `larutadb`.`clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cuit` VARCHAR(45) NOT NULL,
  `condIva_idcondIva` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_clientes_condIva1_idx` (`condIva_idcondIva` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_condIva1`
    FOREIGN KEY (`condIva_idcondIva`)
    REFERENCES `larutadb`.`condIva` (`idcondIva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/* ----- Creación de tabla Mesas --------- */
CREATE TABLE IF NOT EXISTS `larutadb`.`mesas` (
  `idMesa` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo` ENUM('Interna', 'Delivery') NOT NULL DEFAULT 'Interna',
  `estado` ENUM('Abierta', 'Cerrada', 'Limpia') NOT NULL DEFAULT 'Limpia',
  PRIMARY KEY (`idMesa`))
ENGINE = InnoDB;

/* ----- Creación de Tabla Pedidos --------- */
CREATE TABLE IF NOT EXISTS `larutadb`.`pedidos` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `idMesa` INT NOT NULL,
  `fecha` DATETIME NOT NULL DEFAULT NOW(),
  `estado` ENUM("Iniciado", "Finalizado", "Pagado", "Anulado") NOT NULL DEFAULT 'Iniciado',
  `clientes_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_pedidos_mesa1_idx` (`idMesa` ASC) VISIBLE,
  INDEX `fk_pedidos_clientes1_idx` (`clientes_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_mesa1`
    FOREIGN KEY (`idMesa`)
    REFERENCES `larutadb`.`mesa` (`idMesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`clientes_idCliente`)
    REFERENCES `larutadb`.`clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/* ----- Creación de Tabla DetallePedidos --------- */
CREATE TABLE IF NOT EXISTS `larutadb`.`detallePedidos` (
  `idDetallePedido` INT NOT NULL,
  `pedidos_idPedido` INT NOT NULL,
  `productos_idProducto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idDetallePedido`),
  INDEX `fk_detallePedidos_pedidos1_idx` (`pedidos_idPedido` ASC) VISIBLE,
  INDEX `fk_detallePedidos_productos1_idx` (`productos_idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_detallePedidos_pedidos1`
    FOREIGN KEY (`pedidos_idPedido`)
    REFERENCES `larutadb`.`pedidos` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallePedidos_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `larutadb`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

