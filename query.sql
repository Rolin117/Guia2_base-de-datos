use coffeeshop;

SELECT clientes_pedidos.*, pedidos.*
FROM cliente AS clientes_pedidos
JOIN pedido AS pedidos ON clientes_pedidos.id_cliente = pedidos.id_cliente;

select * from pedido
where fecha_registro between '2024-01-01' and '2024-02-20';

select * from cliente order by nacimiento_cliente desc;

SELECT p.id_producto, p.nombre_producto, p.descripcion_producto, p.precio_producto, dp.id_pedido, dp.cantidad_producto, dp.precio_producto AS precio_venta
FROM producto p
INNER JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
INNER JOIN pedido ped ON dp.id_pedido = ped.id_pedido;

select * from producto where precio_producto =(select max(precio_producto) from producto);

select avg(precio_producto) as promedio_precios from producto;

select cliente.nombre_cliente, count(pedido.id_pedido) as cantidad_ordenes from cliente join pedido on cliente.id_cliente = pedido.id_cliente
where pedido.fecha_registro >= '2024-01-01' and  pedido.fecha_registro <= '2024-02-29' group by cliente.id_cliente order by cantidad_ordenes desc;

SELECT estado_pedido, COUNT(*) AS cantidad
FROM pedido
GROUP BY estado_pedido;

SELECT * FROM cliente WHERE nombre_cliente LIKE 'D%';

SELECT 
    cliente.id AS ClienteID, 
    cliente.nombre AS ClienteNombre, 
    COUNT(pedido.id) AS NumeroPedidos
FROM 
    cliente
INNER JOIN pedido ON cliente.id = pedido.cliente_id
GROUP BY cliente.id
ORDER BY NumeroPedidos DESC
LIMIT 1;

SELECT pedido.id_pedido, cliente.id_cliente, cliente.nombre_cliente, cliente.direccion_cliente,
pedido.estado_pedido, pedido.fecha_registro, detalle_pedido.id_detalle, producto.nombre_producto,
detalle_pedido.cantidad_producto, producto.precio_producto
FROM cliente
INNER JOIN pedido ON cliente.id_cliente = pedido.id_cliente
INNER JOIN detalle_pedido ON pedido.id_pedido = detalle_pedido.id_pedido
INNER JOIN producto ON detalle_pedido.id_producto = producto.id_producto;




