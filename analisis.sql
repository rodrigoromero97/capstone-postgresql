-- =========================================================
-- PROYECTO CAPSTONE - ANALISIS DE E-COMMERCE
-- Archivo: analisis.sql
-- =========================================================

-- =========================================================
-- 1. LIMPIEZA DE DATOS
-- =========================================================

-- Simulamos algunos valores faltantes en el precio histórico
-- para demostrar el tratamiento de datos NULL.

UPDATE pedidos
SET precio_unitario = NULL
WHERE id_pedido IN (19, 32, 44);

-- ---------------------------------------------------------
-- 1.1 Identificación de valores NULL
-- ---------------------------------------------------------

-- Identificamos los pedidos que tienen un precio unitario
-- faltante antes de realizar los cálculos de ventas.

SELECT
    id_pedido,
    id_producto,
    fecha_pedido,
    cantidad,
    precio_unitario
FROM pedidos
WHERE precio_unitario IS NULL;

-- ---------------------------------------------------------
-- 1.2 Tratamiento de valores NULL con COALESCE
-- ---------------------------------------------------------

-- Cuando el precio histórico del pedido es NULL,
-- utilizamos como respaldo el precio registrado
-- actualmente para el producto.

SELECT
    p.id_pedido,
    pr.nombre_producto,
    p.precio_unitario,
    pr.precio AS precio_producto,
    COALESCE(p.precio_unitario, pr.precio) AS precio_utilizado
FROM pedidos p
INNER JOIN productos pr
    ON p.id_producto = pr.id_producto
WHERE p.precio_unitario IS NULL;

-- =========================================================
-- ANALISIS 1: TOP 5 CLIENTES POR GASTO TOTAL
-- =========================================================

-- Identificamos los clientes que acumulan el mayor gasto
-- durante el período analizado para conocer cuáles
-- representan una mayor facturación.

SELECT
    c.id_cliente,
    c.nombre,
    SUM(
        p.cantidad * COALESCE(p.precio_unitario, pr.precio)
    ) AS gasto_total
FROM pedidos p
INNER JOIN clientes c
    ON p.id_cliente = c.id_cliente
INNER JOIN productos pr
    ON p.id_producto = pr.id_producto
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY gasto_total DESC
LIMIT 5;

-- =========================================================
-- ANALISIS 2: VENTAS TOTALES POR MES
-- =========================================================

-- Analizamos la evolución de las ventas a lo largo del tiempo
-- agrupando los pedidos por mes 

SELECT
    DATE_TRUNC('month', p.fecha_pedido) AS mes,
    SUM(
        p.cantidad * COALESCE(p.precio_unitario, pr.precio)
    ) AS ventas_totales
FROM pedidos p
INNER JOIN productos pr
    ON p.id_producto = pr.id_producto
GROUP BY
    DATE_TRUNC('month', p.fecha_pedido)
ORDER BY
    mes;

-- =========================================================
-- ANALISIS 3: 3 PRODUCTOS MENOS VENDIDOS
-- =========================================================

-- Identificamos los productos con menor cantidad de unidades
-- vendidas durante el período para detectar aquellos que
-- presentan una menor demanda dentro del catálogo.

SELECT
    pr.id_producto,
    pr.nombre_producto,
    pr.categoria,
    SUM(p.cantidad) AS unidades_vendidas
FROM pedidos p
INNER JOIN productos pr
    ON p.id_producto = pr.id_producto
GROUP BY
    pr.id_producto,
    pr.nombre_producto,
    pr.categoria
ORDER BY
    unidades_vendidas ASC
LIMIT 3;

-- =========================================================
-- ANALISIS 4: RANKING DE PRODUCTOS POR CATEGORIA
-- =========================================================

-- Ordenamos los productos dentro de cada categoría
-- según la facturación generada.

SELECT
    pr.categoria,
    pr.id_producto,
    pr.nombre_producto,
    SUM(
        p.cantidad * COALESCE(p.precio_unitario, pr.precio)
    ) AS ventas_totales,
    RANK() OVER (
        PARTITION BY pr.categoria
        ORDER BY
            SUM(
                p.cantidad * COALESCE(p.precio_unitario, pr.precio)
            ) DESC
    ) AS ranking_categoria
FROM pedidos p
INNER JOIN productos pr
    ON p.id_producto = pr.id_producto
GROUP BY
    pr.categoria,
    pr.id_producto,
    pr.nombre_producto
ORDER BY
    pr.categoria,
    ranking_categoria;








