                               /* Parte 3: SQL */

DROP TABLE IF EXISTS vehiculo, cliente, reservas, pago CASCADE;

CREATE TABLE vehiculo (
	id_vehiculo	    INTEGER PRIMARY KEY,
	marca		    VARCHAR(20) NOT NULL,
	modelo		    VARCHAR(20) NOT NULL,
	matricula	    VARCHAR(8) UNIQUE NOT NULL,
	precio_diario	NUMERIC(8,2) NOT NULL,
	estado		    VARCHAR(20) NOT NULL CHECK (estado IN ('FUNCIONAL', 'NO FUNCIONAL'))
);

CREATE TABLE  cliente (
	id_cliente	    INTEGER PRIMARY KEY,
	nombre		    VARCHAR(40) NOT NULL,
	email           VARCHAR(60),
	carne_conducir  VARCHAR(9) UNIQUE NOT NULL
);

CREATE TABLE pago (
	id_pago         INTEGER PRIMARY KEY,
	fecha_pago      TIMESTAMP NOT NULL,
	metodo_pago     VARCHAR(20) NOT NULL,
	id_cliente      INTEGER NOT NULL REFERENCES cliente
);

CREATE TABLE reservas (
	id_reservas     INTEGER PRIMARY KEY,
	id_cliente      INTEGER REFERENCES cliente,
	id_vehiculo     INTEGER REFERENCES vehiculo,
	fecha_inicio    TIMESTAMP NOT NULL,
	fecha_fin       TIMESTAMP NOT NULL,
	precio_total    NUMERIC(8,2) NOT NULL,
	id_pago	        INTEGER REFERENCES pago,
	UNIQUE (id_vehiculo, fecha_inicio),
	UNIQUE (id_vehiculo, fecha_fin)
);
