/* ############ INSERTS ##################### */

/* ----- Inserción de Datos de Prueba --------- */
/* Insert en tabla Categorías */
INSERT INTO categorias (idCategoria, nombre, descripcion) VALUES (1, 'Platos', 'Elaboración propia');
INSERT INTO categorias (idCategoria, nombre, descripcion) VALUES (2, 'Bebidas sin alcohol', '');
INSERT INTO categorias (idCategoria, nombre, descripcion) VALUES (3, 'Bebidas con alcohol', '');

/* Insert en tabla SubCategorías */
INSERT INTO subCategorias (idSubCategoria,nombre, descripcion, Categoria_idCategoria) VALUES (1,'Minutas', 'Porción', 1);
INSERT INTO subCategorias (idSubCategoria,nombre, descripcion, Categoria_idCategoria) VALUES (2,'Gaseosas', 'Unidad', 2);
INSERT INTO subCategorias (idSubCategoria,nombre, descripcion, Categoria_idCategoria) VALUES (3,'Aguas', 'Unidad', 2);
INSERT INTO subCategorias (idSubCategoria,nombre, descripcion, Categoria_idCategoria) VALUES (4,'Cervezas', 'Unidad', 3);
INSERT INTO subCategorias (idSubCategoria,nombre, descripcion, Categoria_idCategoria) VALUES (5,'Guarniciones', 'Porción', 1);
INSERT INTO subCategorias (idSubCategoria,nombre, descripcion, Categoria_idCategoria) VALUES (6,'Ensaladas', 'Porción', 1);

/* Insert en tabla Condición de Iva */
INSERT INTO condIva (idcondIva, tipoFac, concepto) VALUES (1, 'A', 'Responsable Inscripto');
INSERT INTO condIva (idcondIva, tipoFac, concepto) VALUES (2, 'B', 'Excento');
INSERT INTO condIva (idcondIva, tipoFac, concepto) VALUES (3, 'C', 'Monotributista');

/* Insert en tabla Proveedores */
INSERT INTO proveedores (idProveedor, nombre, razonSocial, cuit, condIva_idCondIva) VALUES (1,'La Ruta', 'La Ruta S.R.L.','30-27134456-0',1);
INSERT INTO proveedores (idProveedor, nombre, razonSocial, cuit, condIva_idCondIva) VALUES (2,'Corrientes Refrescos', 'Corrientes Refrescon S.A.','30-21985698-5',1);
INSERT INTO proveedores (idProveedor, nombre, razonSocial, cuit, condIva_idCondIva) VALUES (3,'Cervecería del Nordeste', 'Bebidas Correntinas S.R.L.','30-27985742-3',1);

/* Insert en tabla Productos */
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (1,2,2,'Gaseosa Coca-Cola x 500 ml', 'Descartable',650.00,24,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (2,2,2,'Gaseosa Sprite x 500 ml', 'Descartable',650.00,24,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (3,3,2,'Agua Mineral x 500 ml', 'Descartable',350.00,24,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (4,1,1,'Milanesa de Carne', '',2560.00,5,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (5,1,1,'Milanesa de Pollo', '',2300.00,8,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (6,5,1,'Papas Fritas', 'Porción',1550.00,20,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (7,1,1,'Empanada de Carne al Horno', '',600.00,96,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (8,1,1,'Empanada de Pollo al Horno', '',450.00,48,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (9,3,3,'Cerveza Miller 473 ml', 'Lata',1200.00,24,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (10,3,3,'Cerveza Heineken 473 ml', 'Lata',1650.00,24,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (11,5,1,'Puré de Papas', 'Porción',850.00,10,21);
INSERT INTO productos (idProducto, idSubCategoria, idProveedor, nombre, descripcion, precioUnitario, stock, iva) VALUES (12,6,1,'Ensalda de Sanahoria y Tomate', 'Porción',900.00,5,21);
-- SELECT * FROM productos;

/* Insert en tabla Clientes */
INSERT INTO clientes (idCliente, nombres, apellidos, email, cuit, condIva_idCondIva) VALUES (1,'Fernando', 'Alonso','fernando@astonmartin.com','20-27134456-1',1);
INSERT INTO clientes (idCliente, nombres, apellidos, email, cuit, condIva_idCondIva) VALUES (2,'Carlos', 'Sainz','carlos@ferrarif1.com','20-35699456-1',1);
INSERT INTO clientes (idCliente, nombres, apellidos, email, cuit, condIva_idCondIva) VALUES (3,'Lewis', 'Hamilton','lewis44@mercedes.com','20-31134555-1',2);


/* Insert en tabla Mesa */
INSERT INTO mesas (idMesa, nombre) VALUES (1,'Mesa 1');
INSERT INTO mesas (idMesa, nombre) VALUES (2,'Mesa 2');
INSERT INTO mesas (idMesa, nombre, tipo) VALUES (4,'Pedidos','Delivery');

/* Insert de Pedidos y su detalle */
/* Insert en tabla pedidos */
INSERT INTO pedidos (idPedido, idMesa, clientes_idCliente) VALUES (1,1,1);
/* Insert en tabla detalle */
INSERT INTO detallePedidos (idDetallePedido, pedidos_idPedido, productos_idProducto, cantidad) VALUES (1,1,1,2);
INSERT INTO detallePedidos (idDetallePedido, pedidos_idPedido, productos_idProducto, cantidad) VALUES (2,1,3,1);
INSERT INTO detallePedidos (idDetallePedido, pedidos_idPedido, productos_idProducto, cantidad) VALUES (3,1,4,1);

