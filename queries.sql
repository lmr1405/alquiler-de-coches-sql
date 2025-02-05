-- 1. Hacer una consulta que necesite al menos 2 joins externos
/*
SELECT id_vehiculo, marca, modelo, estado, id_reservas, fecha_inicio, fecha_fin, nombre, metodo_pago
FROM  vehiculo
LEFT JOIN reservas using (id_vehiculo) 
LEFT JOIN cliente using (id_cliente) 
LEFT JOIN pago using (id_pago);
*/


-- 2. Hacer un join externo, en el que uno de los extremos del join tenga que tener una selección que no se pueda
--hacer después de hacer el join externo. Explicar por qué es necesario hacer la selección primero en los comentarios 
--del script
/*
SELECT id_vehiculo, marca, modelo, estado, id_reservas, fecha_inicio, fecha_fin
FROM vehiculo
LEFT JOIN ( 
SELECT * 
FROM reservas 
WHERE fecha_inicio BETWEEN '2024-10-22' AND '2024-10-24' ) AS RESERVAS_FECHA
USING (id_vehiculo);
*/

/*
En esta consulta buscamos obtener, para la fecha del 22/10/2024 al 24/10/2024, todos los vehículos tanto los que no 
tienen reservas como los que sí. Para aquellos vehículos que sí tienen reservas, mostraremos los datos de esa reserva.
Para ello:
1)	Seleccionamos únicamente las reservas que cumplen con el rango de fechas que queremos
2)	Hacemos el LEFT JOIN entre vehiculo y RESERVAS_FECHA.
 
Si aplicáramos el filtro de fechas después de hacer el LEFT JOIN, obtendríamos un resultado incorrecto, ya que le 
estaríamos diciendo a SQL que nos muestre solo los registros que tienen una fecha_inicio en el rango deseado, 
lo que excluiría los vehículos que no tienen reserva.
*/


-- 3. Intersección y su equivalente con join interno
-- Consulta usando intersección
/*
SELECT nombre, email
FROM cliente
WHERE id_cliente IN (SELECT id_cliente FROM reservas)
INTERSECT
SELECT nombre, email
FROM cliente
WHERE id_cliente IN (SELECT id_cliente FROM pago);
*/
/* 
  Esta consulta devuelve los nombres de los clientes que tienen reservas y han realizado un pago.
  Se utiliza la intersección para encontrar clientes presentes en ambas tablas.
*/

-- Consulta equivalente usando join interno
/*
SELECT DISTINCT nombre, email
FROM cliente
JOIN reservas using (id_cliente)
JOIN pago using (id_cliente); 
*/

/* 
  Utilizando un JOIN interno, obtenemos el mismo resultado donde hay coincidencias 
  entre ambas tablas.
*/

-- 4. Resta y su equivalente con join externo
-- Consulta usando resta
/*
SELECT nombre
FROM cliente
WHERE id_cliente IS NOT NULL  -- Aseguramos que el cliente existe
EXCEPT
SELECT nombre
FROM cliente
JOIN reservas using (id_cliente);
*/

/* 
  Esta consulta devuelve los nombres de los clientes que no tienen reservas, 
  utilizando la operación EXCEPT para restar los clientes que sí tienen reservas.
*/

-- Consulta equivalente usando join externo
/*
SELECT nombre
FROM cliente
LEFT JOIN reservas using (id_cliente)
WHERE reservas.id_cliente IS NULL;
*/

/* 
  Usamos un LEFT JOIN y filtramos donde no hay coincidencias en la tabla reservas, 
  logrando el mismo resultado que la consulta anterior.
*/

/*	5. Una consulta que tenga un cociente relacional en la 
que se necesite al menos 3 tablas y una seleccion aplicada al dividendo
*/
-- cliente que alquila todos los vehiculos FUNCIONAL
/*
drop table if exists reservasIrreal,clienteNOAlquilaAtodos;

CREATE local temporary TABLE reservasIrreal as
SELECT id_vehiculo, id_cliente
FROM vehiculo, cliente
WHERE vehiculo.estado = 'FUNCIONAL'
except
select id_vehiculo, id_cliente
from reservas;

create local temporary table clienteNOAlquilaAtodos as
select id_cliente
from reservasIrreal;

select id_cliente, nombre from cliente
where id_cliente not in(
select id_cliente from clienteNOAlquilaAtodos);
*/

/*	6. Una consulta que tenga un cociente relacional en la
que se necesite al menos 3 tablas y una seleccion aplicada al divisor
*/
-- vehiculos que han sido alquilado por todos los clientes y su precio total sea igual o mayor a 30
/*
drop table if exists reservasIrreal2,vehiculoNOAlquilaATodos;

CREATE local temporary TABLE reservasIrreal2 as
select id_vehiculo, id_cliente
from vehiculo, cliente
except
select id_vehiculo, id_cliente
from reservas
where precio_total >=30;

CREATE local temporary TABLE vehiculoNOAlquilaATodos as
select id_vehiculo from reservasIrreal2;

Select id_vehiculo, marca from vehiculo
where id_vehiculo not in(
select id_vehiculo from vehiculoNOAlquilaATodos);
*/
