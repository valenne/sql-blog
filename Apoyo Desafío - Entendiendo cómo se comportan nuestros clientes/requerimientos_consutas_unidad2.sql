
-- tablas
select * from cliente
select * from compra
select * from detalle_compra
select * from producto

-- transacciones

select producto.id, producto.stock, producto.descripcion as nombre_producto from producto
where descripcion LIKE '%producto9%'

-- pregunta 2
-- mostrar stock producto id = 9 antes de la consulta:
-- consulta por compras del usuario01 con respecto a un producto9
select compra.cliente_id, compra.fecha, detalle_compra.cantidad, producto.descripcion, producto.stock
from compra
left join detalle_compra on compra.id = detalle_compra.compra_id
left join producto on detalle_compra.producto_id = producto.id
where cliente_id = '1' and descripcion LIKE '%producto9%'

-- mediante uso de transacciones efectuo la consulta de compra del producto id =9
begin;
insert into compra
(id,cliente_id, fecha)
values (33,1,'2022-02-14');
insert into detalle_compra
(id,producto_id, compra_id, cantidad)
values(43,9, 33, 5);
-- error stock producto 9 = 4, check >=0
update producto set stock = stock - 5
where id=9;
commit;

rollback;

--consulta por compras del usuario01 con respecto a un producto9
select compra.cliente_id, compra.fecha, detalle_compra.cantidad, producto.descripcion, producto.stock
from compra
left join detalle_compra on compra.id = detalle_compra.compra_id
left join producto on detalle_compra.producto_id = producto.id
where cliente_id = '1' and descripcion LIKE '%producto9%'

--pregunta 3

begin;
insert into compra
(id,cliente_id, fecha)
values (34,2,'2022-02-14');
insert into detalle_compra
(id,producto_id, compra_id, cantidad)
values
(44, 1, 34, 3),
(45, 2, 34, 3),
(46, 8, 34, 3);

update producto set stock = stock - 3
where id=1;
update producto set stock = stock - 3
where id=2;
--error stock base producto9 = 0, check >=0
update producto set stock = stock - 3
where id=8;

commit;

rollback;

select compra.cliente_id, compra.fecha, detalle_compra.cantidad, producto.id,producto.descripcion, producto.stock
from compra
left join detalle_compra on detalle_compra.compra_id=compra.id
left join producto on producto.id=detalle_compra.producto_id
where cliente_id = '2' and producto.id < 10 and descripcion similar to'%(producto1|producto2|producto8)%'

--pregunta 4

--a.
\set AUTOCOMMIT off
--b.
begin;
insert into cliente
(id,nombre,email)
values (11,'usuario011', 'usuario011@gmail.com' )
--c.
select * from cliente
--d.
rollback;
--e.
select * from cliente
--f
\set AUTOCOMMIT on
