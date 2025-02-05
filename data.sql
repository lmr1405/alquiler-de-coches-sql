/*
	Insercción de datos para la realización de la prueba
*/
-- tabla vehiculo
insert into vehiculo values(1, 'Seat', 'Leon', '1234ABC',  20, 'FUNCIONAL');
insert into vehiculo values(2, 'Seat', 'Ibiza', '4983FGH', 15, 'FUNCIONAL');
insert into vehiculo values(3, 'Ford', 'Focus', '3578KOI', 18, 'FUNCIONAL');
insert into vehiculo values(4, 'Toyota', 'CHR', '6589POL', 25, 'FUNCIONAL');
insert into vehiculo values(5, 'Hyundai', 'Tucson', '9658LGR', 30, 'FUNCIONAL');

-- tabla cliente
insert into cliente values(1, 'Pepe', 'pepe@gmail.com', '04896548P');
insert into cliente values(2, 'Juan', 'juan@gmail.com', '02785469O');
insert into cliente values(3, 'Sofia', 'sofia@yahoo.com', '03658721I');
insert into cliente values(4, 'Maria', 'maria@outlook.com', '07812646H');
insert into cliente values(5, 'Jose', 'jose@cloud.com', '06284932K');

--tabla pago: id_pago, fecha_pago, metodo_pago, id_cliente
insert into pago values(1, '20/10/2024 15:30', 'Transferencia', 1);
insert into pago values(2, '21/10/2024 10:30', 'Efectivo', 2);
insert into pago values(3, '22/10/2024 16:30', 'Tarjeta', 4);
insert into pago values(4, '23/10/2024 22:30', 'Transferencia', 5);
INSERT INTO pago VALUES (5, '2024-10-24 18:45', 'Tarjeta', 5);

-- tabla reservas: id_reservas, id_cliente, id_vehiculo, fecha_inicio, fecha_fin, id_pago
INSERT INTO reservas VALUES (1, 1, 1, '2024-10-20 10:00', '2024-10-22 10:00', 36, 1);
INSERT INTO reservas VALUES (2, 1, 2, '2024-10-21 09:00', '2024-10-23 09:00', 50, 2);
INSERT INTO reservas VALUES (3, 1, 3, '2024-10-22 08:00', '2024-10-24 08:00', 30, 3);
INSERT INTO reservas VALUES (4, 1, 4, '2024-10-23 12:00', '2024-10-25 12:00', 40, 4);
INSERT INTO reservas VALUES (5, 5, 2, '2024-10-24 14:00', '2024-10-26 14:00', 60, 5);
INSERT INTO reservas VALUES (6, 1, 5, '2024-10-24 13:00', '2024-10-25 13:00' , 36 ,null);
INSERT INTO reservas VALUES (7, 3, 3, '2024-10-25 14:00', '2024-10-26 11:00', 80, 1);
