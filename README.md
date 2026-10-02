# Proyecto Capstone - Análisis de E-commerce con PostgreSQL

## 1. Descripción del proyecto

Este proyecto consiste en realizar un análisis exploratorio de datos (EDA)
utilizando PostgreSQL sobre un conjunto de datos simulado de un negocio
de comercio electrónico.

El proyecto busca aplicar conceptos de SQL aprendidos durante el curso,
incluyendo creación de tablas, relaciones entre datos, limpieza,
agregaciones, funciones de fecha y funciones de ventana.

---

## 2. Problema de negocio

El objetivo del análisis es obtener información que permita comprender
el comportamiento de las ventas durante el período analizado.

Para esto se plantearon las siguientes preguntas:

- ¿Cuáles son los clientes que realizaron un mayor gasto?
- ¿Cómo evolucionaron las ventas mes a mes?
- ¿Qué productos tuvieron menor cantidad de unidades vendidas?
- ¿Qué productos generan mayor facturación dentro de cada categoría?

---

## 3. Estructura de la base de datos

La base de datos se denomina `capstone_project` y está compuesta por
tres tablas principales:

### Clientes

Contiene información de los clientes, incluyendo nombre, email y ciudad.

### Productos

Contiene el catálogo de productos, sus categorías y precios.

### Pedidos

Registra las ventas realizadas, incluyendo cliente, producto, fecha,
cantidad y precio unitario.

La tabla `pedidos` funciona como vínculo entre `clientes` y `productos`
mediante claves foráneas.

---

## 4. Limpieza y preparación de datos

Antes de realizar el análisis se realizó una revisión de la calidad
de los datos.

Se identificaron valores NULL en la columna `precio_unitario` de algunos
pedidos.

Para resolver estos casos se utilizó la función `COALESCE()`, tomando
como valor alternativo el precio registrado en la tabla `productos`.

También se verificó que los tipos de datos utilizados fueran adecuados,
principalmente:

- `DATE` para las fechas.
- `NUMERIC` para los valores monetarios.
- `INTEGER` para identificadores y cantidades.

---

## 5. Análisis y resultados

### 5.1 Top 5 clientes por gasto total

Los cinco clientes con mayor gasto durante el período analizado fueron:

1. Juan Perez - $353.000
2. Carlos Gomez - $346.000
3. Martin Rodriguez - $317.000
4. Maria Lopez - $306.000
5. Diego Gonzalez - $277.000

Juan Perez presentó el mayor gasto acumulado, seguido por Carlos Gomez.
Estos clientes representan el grupo de mayor gasto dentro de la base
analizada y pueden ser considerados un segmento relevante para el
seguimiento de las ventas.

---

### 5.2 Ventas totales por mes

| Mes | Ventas totales |
|---|---:|
| Enero 2026 | $369.000 |
| Febrero 2026 | $342.000 |
| Marzo 2026 | $386.000 |
| Abril 2026 | $434.000 |
| Mayo 2026 | $513.000 |
| Junio 2026 | $288.000 |

Las ventas presentaron una evolución creciente entre febrero y mayo de
2026, alcanzando su máximo en mayo con $513.000.

En junio se observa una disminución significativa, con ventas por
$288.000, el valor más bajo del período analizado. Esto muestra que la
facturación no se mantuvo estable durante todo el período y que sería
conveniente analizar los factores asociados a la caída registrada en
junio.

---

### 5.3 Tres productos menos vendidos

| Producto | Categoría | Unidades vendidas |
|---|---|---:|
| Calculadora Científica | Oficina | 1 |
| Organizador Multiuso | Hogar | 2 |
| Soporte para Celular | Accesorios | 6 |

Los productos con menor cantidad de unidades vendidas fueron la
Calculadora Científica, el Organizador Multiuso y el Soporte para
Celular.

Estos productos presentan los niveles más bajos de demanda dentro del
catálogo analizado, por lo que podrían requerir un seguimiento para
evaluar su desempeño comercial.

---

### 5.4 Ranking de productos por categoría

El análisis mediante `RANK()` permitió comparar los productos dentro
de cada categoría según la facturación generada.

Los productos que ocuparon el primer lugar en cada categoría fueron:

| Categoría | Producto líder | Ventas |
|---|---|---:|
| Accesorios | Mochila Urbana | $385.000 |
| Hogar | Lampara LED | $216.000 |
| Oficina | Cuaderno Ejecutivo | $77.000 |
| Tecnologia | Teclado Mecanico | $416.000 |

El ranking muestra que los productos con mayor facturación varían según
la categoría. La Mochila Urbana lideró en Accesorios, la Lampara LED en
Hogar, el Cuaderno Ejecutivo en Oficina y el Teclado Mecanico en
Tecnologia.

También se observó un empate entre Cable USB-C y Soporte para Celular
en la categoría Accesorios, ambos con $72.000 en ventas.

---

## 6. Conclusiones

El análisis permitió identificar diferencias importantes entre clientes,
meses y productos.

Juan Perez fue el cliente con mayor gasto acumulado, mientras que mayo
fue el mes con mayor nivel de ventas. Por otro lado, la Calculadora
Científica y el Organizador Multiuso fueron algunos de los productos
con menor volumen de unidades vendidas.

El análisis por categoría permitió identificar los productos con mayor
facturación dentro de cada grupo.

En conjunto, las consultas permiten obtener una visión general del
comportamiento de las ventas y detectar productos, clientes y períodos
que podrían ser analizados con mayor profundidad.

---

## 7. Archivos del proyecto

El repositorio contiene los siguientes archivos:

- `estructura.sql`: creación de las tablas, relaciones y carga de datos.
- `analisis.sql`: limpieza de datos y consultas de análisis.
- `README.md`: documentación del proyecto, resultados y conclusiones.

---

## 8. Cómo ejecutar el proyecto

1. Crear una base de datos llamada `capstone_project` en PostgreSQL.
2. Ejecutar el archivo `estructura.sql` para crear las tablas y cargar
   los datos.
3. Ejecutar el archivo `analisis.sql` para realizar la limpieza y los
   análisis.
4. Revisar los resultados obtenidos por cada consulta.

El proyecto fue desarrollado utilizando PostgreSQL y DBeaver.
