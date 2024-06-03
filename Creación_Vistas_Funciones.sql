--Vistas
--1. Obtener detalles de los jugadores junto con su información personal:
CREATE OR REPLACE VIEW detalles_jugadores AS
SELECT j.id_persona,
	p.primer_nombre,
	p.primer_apellido,
	j.altura,
	j.peso,
	j.mano_dominante,
	j."año_inicio_carrera"
FROM jugadores j
JOIN personas p ON j.id_persona = p.id_persona;

--2. Listar todos los partidos con sus árbitros y etapas:
CREATE OR REPLACE VIEW detalles_partidos AS
SELECT p.id_partido,
    e.nombre_etapa,
    concat(pe.primer_nombre, ' ', pe.primer_apellido) AS arbitro,
    ed.fecha_de_inicio,
    ed.fecha_de_finalizacion
FROM partidos p
JOIN etapas e ON p.id_etapa = e.id_etapa
JOIN arbitros a ON p.id_arbitro = a.id_persona
JOIN personas pe ON a.id_persona = pe.id_persona
JOIN ediciones ed ON p.id_edicion = ed.id_edicion;

--3. Obtener todas las boletas compradas con los detalles del usuario:
CREATE OR REPLACE VIEW detalles_boletas AS
SELECT bc.id_usuario,
    concat(pe.primer_nombre, ' ', pe.primer_apellido) AS nombre_usuario,
    b.nombre AS nombre_boleta,
    tp.tarifa,
    bc.cantidad,
    bc.fecha_de_compra
FROM boletas_compradas bc
JOIN boletas b ON bc.id_boleta = b.id_boleta
JOIN usuarios u ON bc.id_usuario = u.id_persona
JOIN personas pe ON u.id_persona = pe.id_persona
JOIN tipos_de_asientos tp ON tp.id_tipo_de_asiento = b.id_tipo_de_asiento;

--4. Listar todos los patrocinadores y las ediciones que patrocinan:
CREATE OR REPLACE VIEW patrocinadores_ediciones AS
SELECT pa.nombre AS nombre_patrocinador,
    ed.id_edicion,
    ed.fecha_de_inicio,
    ed.fecha_de_finalizacion,
    ep.monto_del_patrocinio
FROM ediciones_patrocinadas ep
JOIN patrocinadores pa ON ep.id_patrocinador = pa.id_patrocinador
JOIN ediciones ed ON ep.id_edicion = ed.id_edicion;

--5. Obtener los detalles de las noticias y sus autores:
CREATE OR REPLACE VIEW public.detalles_noticias AS
SELECT n.id_noticia,
    n.titulo,
    n.fecha_subida,
    concat(pe.primer_nombre, ' ', pe.primer_apellido) AS nombre_autor
FROM noticias n
JOIN autores a ON n.id_autor = a.id_persona
JOIN personas pe ON a.id_persona = pe.id_persona;

--6. Listar todos los productos y sus patrocinadores (si los tienen):
CREATE OR REPLACE VIEW productos_patrocinados AS
SELECT p.id_producto,
    p.nombre AS nombre_producto,
    p.precio,
    c.nombre AS nombre_categoria,
    pa.nombre AS nombre_patrocinador
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN patrocinadores pa ON p.id_patrocinador = pa.id_patrocinador;

--Funciones:
--1. Obtener el historial de partidos de un jugador:
CREATE OR REPLACE FUNCTION obtener_historial_partidos_jugador(
	p_id_jugador integer)
    RETURNS TABLE(id_partido integer, fecha date, id_oponente integer, tipo_partido text) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT p.id_partido, ps.fecha_de_realizacion, ps.id_jugador2 AS id_oponente, 'Sencillo' AS tipo_partido
    FROM Participan_En_Sencillos ps
    JOIN Partidos p ON ps.id_partido = p.id_partido
    WHERE ps.id_jugador1 = p_id_jugador

    UNION ALL

    SELECT p.id_partido, ps.fecha_de_realizacion, ps.id_jugador1 AS id_oponente, 'Sencillo' AS tipo_partido
    FROM Participan_En_Sencillos ps
    JOIN Partidos p ON ps.id_partido = p.id_partido
    WHERE ps.id_jugador2 = p_id_jugador;
END;
$BODY$;

--2. Obtener las boletas compradas por un usuario:
CREATE OR REPLACE FUNCTION obtener_boletas_compradas(
	p_id_usuario integer)
    RETURNS TABLE(id_boleta integer, nombre_boleta character varying, precio integer, fecha_compra date) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT bc.id_boleta, b.nombre, tp.tarifa, bc.fecha_de_compra
    FROM Boletas_Compradas bc
    JOIN Boletas b ON bc.id_boleta = b.id_boleta
	JOIN Tipos_de_asientos tp on b.id_tipo_de_asiento = tp.id_tipo_de_asiento
    WHERE bc.id_usuario = p_id_usuario;
END;
$BODY$;

--3. Bbtener detalles de un partido específico:
CREATE OR REPLACE FUNCTION obtener_detalles_partido(
	p_id_partido integer)
    RETURNS TABLE(id_partido integer, etapa character varying, arbitro text, edicion text) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT p.id_partido, e.nombre_etapa, CONCAT(pe.primer_nombre, ' ', pe.primer_apellido) AS arbitro, CONCAT(ed.fecha_de_inicio, ' - ', ed.fecha_de_finalizacion) AS edicion
    FROM Partidos p
    JOIN Etapas e ON p.id_etapa = e.id_etapa
    JOIN Arbitros a ON p.id_arbitro = a.id_persona
    JOIN Personas pe ON a.id_persona = pe.id_persona
    JOIN Ediciones ed ON p.id_edicion = ed.id_edicion
    WHERE p.id_partido = p_id_partido;
END;
$BODY$;

--4. Obtener el listado de patrocinadores de una edición específica:
CREATE OR REPLACE FUNCTION obtener_patrocinadores_edicion(
	p_id_edicion integer)
    RETURNS TABLE(nombre_patrocinador character varying, monto integer) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT pa.nombre, ep.monto_del_patrocinio
    FROM Ediciones_Patrocinadas ep
    JOIN Patrocinadores pa ON ep.id_patrocinador = pa.id_patrocinador
    WHERE ep.id_edicion = p_id_edicion;
END;
$BODY$;

--5. Obtener el listado de noticias de un autor específico:
CREATE OR REPLACE FUNCTION obtener_noticias_autor(
	p_id_autor integer)
    RETURNS TABLE(titulo character varying, fecha_subida date) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT n.titulo, n.fecha_subida
    FROM Noticias n
    JOIN Autores a ON n.id_autor = a.id_persona
    WHERE a.id_persona = p_id_autor;
END;
$BODY$;

--6. Obtener los detalles de una aplicación específica:
CREATE OR REPLACE FUNCTION obtener_detalles_aplicacion(
	p_id_aplicacion integer)
    RETURNS TABLE(nombre character varying, premios character varying[]) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT a.nombre, array_agg(p.nombre)
    FROM Aplicaciones a
    JOIN Premios_De_Las_Aplicaciones pa ON a.id_aplicacion = pa.id_aplicacion
    JOIN Premios p ON pa.id_premio = p.id_premio
    WHERE a.id_aplicacion = p_id_aplicacion
    GROUP BY a.nombre;
END;
$BODY$;