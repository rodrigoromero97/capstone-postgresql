-- =========================================================
-- CREACION DE LA BASE DE DATOS
-- =========================================================

CREATE DATABASE capstone_project;

-- =========================================================
-- 1. CREACION DE TABLAS
-- =========================================================

-- Tabla que almacena la información de los clientes.
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

-- Tabla que contiene el catálogo de productos.
CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio NUMERIC(12,2) NOT NULL
);

-- Tabla que registra las ventas realizadas.
CREATE TABLE pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    fecha_pedido DATE NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_unitario NUMERIC(12,2),

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_pedido_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);

-- =========================================================
-- 2. CARGA DE CLIENTES
-- =========================================================

INSERT INTO clientes (id_cliente, nombre, email, ciudad)
VALUES
    (1, 'Juan Perez', 'juan.perez@email.com', 'Adrogue'),
    (2, 'Maria Lopez', 'maria.lopez@email.com', 'Burzaco'),
    (3, 'Carlos Gomez', 'carlos.gomez@email.com', 'Claypole'),
    (4, 'Laura Fernandez', 'laura.fernandez@email.com', 'Temperley'),
    (5, 'Martin Rodriguez', 'martin.rodriguez@email.com', 'Banfield'),
    (6, 'Sofia Martinez', 'sofia.martinez@email.com', 'Lomas de Zamora'),
    (7, 'Diego Gonzalez', 'diego.gonzalez@email.com', 'Adrogue'),
    (8, 'Ana Torres', 'ana.torres@email.com', 'Burzaco'),
    (9, 'Federico Sanchez', 'federico.sanchez@email.com', 'Longchamps'),
    (10, 'Valentina Romero', 'valentina.romero@email.com', 'Claypole');

-- =========================================================
-- 3. CARGA DE PRODUCTOS
-- =========================================================

INSERT INTO productos (id_producto, nombre_producto, categoria, precio)
VALUES
    (1, 'Auriculares Bluetooth', 'Tecnologia', 45000.00),
    (2, 'Mouse Inalambrico', 'Tecnologia', 18000.00),
    (3, 'Teclado Mecanico', 'Tecnologia', 52000.00),
    (4, 'Webcam HD', 'Tecnologia', 38000.00),

    (5, 'Botella Termica', 'Hogar', 22000.00),
    (6, 'Lampara LED', 'Hogar', 27000.00),
    (7, 'Organizador Multiuso', 'Hogar', 15000.00),

    (8, 'Mochila Urbana', 'Accesorios', 35000.00),
    (9, 'Soporte para Celular', 'Accesorios', 12000.00),
    (10, 'Cable USB-C', 'Accesorios', 9000.00),

    (11, 'Cuaderno Ejecutivo', 'Oficina', 11000.00),
    (12, 'Calculadora Cientifica', 'Oficina', 24000.00);
    
-- =========================================================
-- 4. CARGA DE PEDIDOS
-- =========================================================  
    
INSERT INTO pedidos
    (id_pedido, id_cliente, id_producto, fecha_pedido, cantidad, precio_unitario)
VALUES

    -- Enero
    (1, 1, 1, '2026-01-05', 2, 45000.00),
    (2, 2, 5, '2026-01-08', 1, 22000.00),
    (3, 3, 2, '2026-01-12', 3, 18000.00),
    (4, 4, 8, '2026-01-15', 1, 35000.00),
    (5, 5, 3, '2026-01-20', 1, 52000.00),
    (6, 6, 9, '2026-01-24', 2, 12000.00),
    (7, 7, 4, '2026-01-27', 1, 38000.00),
    (8, 8, 6, '2026-01-30', 2, 27000.00),

    -- Febrero
    (9, 1, 3, '2026-02-03', 1, 52000.00),
    (10, 2, 2, '2026-02-06', 2, 18000.00),
    (11, 3, 1, '2026-02-10', 1, 45000.00),
    (12, 4, 5, '2026-02-13', 3, 22000.00),
    (13, 5, 8, '2026-02-17', 2, 35000.00),
    (14, 6, 7, '2026-02-20', 1, 15000.00),
    (15, 7, 10, '2026-02-23', 4, 9000.00),
    (16, 9, 11, '2026-02-26', 2, 11000.00),

    -- Marzo
    (17, 1, 4, '2026-03-02', 1, 38000.00),
    (18, 2, 6, '2026-03-05', 2, 27000.00),
    (19, 3, 3, '2026-03-09', 2, 52000.00),
    (20, 4, 1, '2026-03-12', 1, 45000.00),
    (21, 5, 5, '2026-03-16', 2, 22000.00),
    (22, 7, 8, '2026-03-19', 1, 35000.00),
    (23, 8, 2, '2026-03-23', 3, 18000.00),
    (24, 10, 9, '2026-03-27', 1, 12000.00),

    -- Abril
    (25, 1, 1, '2026-04-04', 1, 45000.00),
    (26, 2, 3, '2026-04-07', 2, 52000.00),
    (27, 3, 4, '2026-04-11', 2, 38000.00),
    (28, 5, 6, '2026-04-14', 1, 27000.00),
    (29, 6, 8, '2026-04-18', 3, 35000.00),
    (30, 7, 5, '2026-04-21', 2, 22000.00),
    (31, 8, 7, '2026-04-24', 1, 15000.00),
    (32, 9, 10, '2026-04-28', 2, 9000.00),

    -- Mayo
    (33, 1, 3, '2026-05-03', 1, 52000.00),
    (34, 2, 1, '2026-05-06', 2, 45000.00),
    (35, 3, 5, '2026-05-10', 1, 22000.00),
    (36, 4, 8, '2026-05-13', 2, 35000.00),
    (37, 5, 2, '2026-05-17', 4, 18000.00),
    (38, 6, 4, '2026-05-20', 1, 38000.00),
    (39, 7, 6, '2026-05-23', 2, 27000.00),
    (40, 8, 9, '2026-05-26', 3, 12000.00),
    (41, 9, 11, '2026-05-28', 5, 11000.00),
    (42, 10, 12, '2026-05-30', 1, 24000.00),

    -- Junio
    (43, 1, 4, '2026-06-04', 2, 38000.00),
    (44, 3, 1, '2026-06-09', 1, 45000.00),
    (45, 5, 3, '2026-06-14', 1, 52000.00),
    (46, 7, 8, '2026-06-19', 2, 35000.00),
    (47, 8, 6, '2026-06-23', 1, 27000.00),
    (48, 10, 10, '2026-06-28', 2, 9000.00);







