/* ############# CONSULTAS ################ */

/* Select a categorías */
SELECT * from categorias;

/* Select a subCategorías */
SELECT * FROM subCategorias;

/* Select a categorías y subCategorías */
SELECT cat.nombre AS Categoría, sub.nombre AS SubCategoria 
FROM categorias cat 
JOIN subcategorias sub ON cat.idCategoria = sub.Categoria_idCategoria;

/* Select a tabla Condición de IVA */
SELECT * FROM condIva;

/* Select a tabla Productos */
SELECT * FROM productos;


SELECT prod.nombre AS Producto, 
	descripcion AS Descripción, 
    prov.nombre AS Proveedor, 
    precioUnitario AS Precio, 
    stock AS Stock, iva AS IVA 
FROM productos prod 
JOIN proveedores prov ON prod.idProveedor = prov.idProveedor;

/* Select a tabla Proveedores */
SELECT * FROM proveedores;

/* Select a tabla Clientes */
SELECT * FROM clientes;


/* Select a tabla Mesas */
SELECT * FROM mesas;

/* Select a tabla Pedidos */
SELECT * FROM pedidos;
SELECT idPedido AS Pedido, m.nombre AS Mesa, `fecha` AS Fecha, ped.estado AS Estado
FROM pedidos ped
JOIN mesas m ON ped.idMesa = m.IdMesa; 

/* Select a tabla DetallePedidos */
SELECT * FROM detallePedidos;
/* Prueba detalle del pedido */
SELECT pedidos_idPedido AS Ord, prod.nombre, 
	cantidad AS Cantidad, 
    prod.precioUnitario AS Precio, 
    (cantidad * prod.precioUnitario) AS Importe
FROM detallePedidos det
JOIN productos prod ON det.productos_idProducto = prod.idProducto;  


/* Select a tabla Mesas */
SELECT * FROM mesas;
