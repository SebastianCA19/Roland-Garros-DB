-- Tables
-- Table: Acciones
CREATE TABLE Acciones (
    id_accion serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    CONSTRAINT Acciones_pk PRIMARY KEY (id_accion)
);

-- Table: Aplicaciones
CREATE TABLE Aplicaciones (
    id_aplicacion serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    CONSTRAINT Aplicaciones_pk PRIMARY KEY (id_aplicacion)
);

-- Table: Arbitros
CREATE TABLE Arbitros (
    id_persona int  NOT NULL,
    CONSTRAINT Arbitros_pk PRIMARY KEY (id_persona)
);

-- Table: Areas_Geograficas
CREATE TABLE Areas_Geograficas (
    id_area_geografica serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    CONSTRAINT Areas_Geograficas_pk PRIMARY KEY (id_area_geografica)
);

-- Table: Autores
CREATE TABLE Autores (
    id_persona int  NOT NULL,
    CONSTRAINT Autores_pk PRIMARY KEY (id_persona)
);

-- Table: Boletas
CREATE TABLE Boletas (
    id_boleta serial  NOT NULL,
    precio int  NOT NULL,
    nombre varchar(255)  NOT NULL,
    id_tipo_de_asiento int  NOT NULL,
    id_partido int  NOT NULL,
    CONSTRAINT Boletas_pk PRIMARY KEY (id_boleta)
);

-- Table: Boletas_Compradas
CREATE TABLE Boletas_Compradas (
    id_usuario int  NOT NULL,
    id_boleta int  NOT NULL,
    cantidad int  NOT NULL,
    fecha_de_compra date  NOT NULL,
    CONSTRAINT Boletas_Compradas_pk PRIMARY KEY (id_usuario,id_boleta)
);

-- Table: Categorias
CREATE TABLE Categorias (
    id_categoria serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    CONSTRAINT Categorias_pk PRIMARY KEY (id_categoria)
);

-- Table: Ciudades
CREATE TABLE Ciudades (
    id_ciudad serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    id_pais int  NOT NULL,
    CONSTRAINT Ciudades_pk PRIMARY KEY (id_ciudad)
);

-- Table: Duos
CREATE TABLE Duos (
    id_duo int  NOT NULL,
    año_de_creacion int  NOT NULL,
    CONSTRAINT Duos_pk PRIMARY KEY (id_duo)
);

-- Table: Duos_Participantes
CREATE TABLE Duos_Participantes (
    id_partido int  NOT NULL,
    id_duo1 int  NOT NULL,
    id_duo2 int  NOT NULL,
    fecha_de_realizacion int  NOT NULL,
    duo_ganador int  NOT NULL,
    CONSTRAINT Duos_Participantes_pk PRIMARY KEY (id_duo1,id_duo2,id_partido)
);

-- Table: Ediciones
CREATE TABLE Ediciones (
    id_edicion serial  NOT NULL,
    fecha_de_inicio date  NOT NULL,
    fecha_de_finalizacion date  NOT NULL,
    premio_sencillo int  NOT NULL,
    premio_doble int  NOT NULL,
    duo_masculino_ganador int  NOT NULL,
    jugador_ganador int  NOT NULL,
    duo_femenino_ganador int  NOT NULL,
    jugadora_ganadora int  NOT NULL,
    CONSTRAINT Ediciones_pk PRIMARY KEY (id_edicion)
);

-- Table: Ediciones_Patrocinadas
CREATE TABLE Ediciones_Patrocinadas (
    id_patrocinador int  NOT NULL,
    id_edicion int  NOT NULL,
    monto_del_patrocinio int  NOT NULL,
    CONSTRAINT Ediciones_Patrocinadas_pk PRIMARY KEY (id_patrocinador,id_edicion)
);

-- Table: Entidades_De_Trasmision
CREATE TABLE Entidades_De_Trasmision (
    id_entidad_de_transmision serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    id_area_geografica int  NOT NULL,
    CONSTRAINT Entidades_De_Trasmision_pk PRIMARY KEY (id_entidad_de_transmision)
);

-- Table: Entrenadores
CREATE TABLE Entrenadores (
    id_persona int  NOT NULL,
    id_jugador int  NOT NULL,
    CONSTRAINT Entrenadores_pk PRIMARY KEY (id_persona)
);

-- Table: Etapas
CREATE TABLE Etapas (
    id_etapa serial  NOT NULL,
    nombre_etapa varchar(255)  NOT NULL,
    CONSTRAINT Etapas_pk PRIMARY KEY (id_etapa)
);

-- Table: Eventos
CREATE TABLE Eventos (
    id_evento serial  NOT NULL,
    nombre_evento varchar(255)  NOT NULL,
    id_accion int  NULL,
    CONSTRAINT Eventos_pk PRIMARY KEY (id_evento)
);

-- Table: Eventos_En_Un_Partido
CREATE TABLE Eventos_En_Un_Partido (
    id_evento_partido serial  NOT NULL,
    id_evento int  NOT NULL,
    id_partido int  NOT NULL,
    servidor int  NULL,
    receptor int  NULL,
    hora time  NOT NULL,
    duo_servidor int  NULL,
    duo_receptor int  NULL,
    CONSTRAINT Eventos_En_Un_Partido_pk PRIMARY KEY (id_evento_partido)
);

-- Table: Jueces
CREATE TABLE Jueces (
    id_persona int  NOT NULL,
    id_tipo int  NOT NULL,
    CONSTRAINT Jueces_pk PRIMARY KEY (id_persona)
);

-- Table: Jueces_De_los_Partidos
CREATE TABLE Jueces_De_los_Partidos (
    id_persona int  NOT NULL,
    id_partido int  NOT NULL,
    CONSTRAINT Jueces_De_los_Partidos_pk PRIMARY KEY (id_persona,id_partido)
);

-- Table: Jugadores
CREATE TABLE Jugadores (
    id_persona int  NOT NULL,
    altura int  NOT NULL,
    peso int  NOT NULL,
    mano_dominante varchar(255)  NOT NULL,
    año_inicio_carrera int  NOT NULL,
    CONSTRAINT Jugadores_pk PRIMARY KEY (id_persona)
);

-- Table: Jugadores_Por_Duo
CREATE TABLE Jugadores_Por_Duo (
    id_duo int  NOT NULL,
    id_jugador int  NOT NULL,
    CONSTRAINT Jugadores_Por_Duo_pk PRIMARY KEY (id_jugador,id_duo)
);

-- Table: Noticias
CREATE TABLE Noticias (
    id_noticia serial  NOT NULL,
    titulo varchar(255)  NOT NULL,
    fecha_subida date  NOT NULL,
    id_autor int  NOT NULL,
    CONSTRAINT Noticias_pk PRIMARY KEY (id_noticia)
);

-- Table: Paises
CREATE TABLE Paises (
    id_pais serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    CONSTRAINT Paises_pk PRIMARY KEY (id_pais)
);

-- Table: Participan_En_Sencillos
CREATE TABLE Participan_En_Sencillos (
    id_partido int  NOT NULL,
    id_jugador1 int  NOT NULL,
    id_jugador2 int  NOT NULL,
    fecha_de_realizacion date  NOT NULL,
    jugador_ganador int  NOT NULL,
    CONSTRAINT Participan_En_Sencillos_pk PRIMARY KEY (id_jugador1,id_jugador2,id_partido)
);

-- Table: Partidos
CREATE TABLE Partidos (
    id_partido serial  NOT NULL,
    id_etapa int  NOT NULL,
    id_arbitro int  NOT NULL,
    id_edicion int  NOT NULL,
    id_tipo_de_partido int  NOT NULL,
    CONSTRAINT Partidos_pk PRIMARY KEY (id_partido)
);

-- Table: Partidos_Transmitidos_Por_Entidad
CREATE TABLE Partidos_Transmitidos_Por_Entidad (
    id_partido int  NOT NULL,
    id_entidad_de_transmision int  NOT NULL,
    CONSTRAINT Partidos_Transmitidos_Por_Entidad_pk PRIMARY KEY (id_partido,id_entidad_de_transmision)
);

-- Table: Patrocinadores
CREATE TABLE Patrocinadores (
    id_patrocinador serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    id_tipo_patrocinador int  NOT NULL,
    CONSTRAINT Patrocinadores_pk PRIMARY KEY (id_patrocinador)
);

-- Table: Personas
CREATE TABLE Personas (
    id_persona serial  NOT NULL,
    primer_nombre varchar(255)  NOT NULL CHECK (primer_nombre <> ' '),
    segundo_nombre varchar(255)  NULL CHECK (segundo_nombre <> ' '),
    primer_apellido varchar(255)  NOT NULL CHECK (primer_apellido <> ' '),
    segundo_apellido varchar(255)  NULL CHECK (segundo_apellido <> ' '),
    fecha_nacimiento date  NOT NULL CHECK (fecha_nacimiento < current_date),
    ciudad_nacimiento int  NOT NULL,
    sexo char(1)  NOT NULL CHECK (sexo in ('M', 'F')),
    CONSTRAINT Personas_pk PRIMARY KEY (id_persona)
);

-- Table: Premios
CREATE TABLE Premios (
    id_premio serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    descripcion varchar(255)  NOT NULL,
    CONSTRAINT Premios_pk PRIMARY KEY (id_premio)
);

-- Table: Premios_De_Las_Aplicaciones
CREATE TABLE Premios_De_Las_Aplicaciones (
    id_aplicacion int  NOT NULL,
    id_premio int  NOT NULL,
    CONSTRAINT Premios_De_Las_Aplicaciones_pk PRIMARY KEY (id_aplicacion,id_premio)
);

-- Table: Productos
CREATE TABLE Productos (
    id_producto serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    precio int  NOT NULL,
    id_categoria int  NOT NULL,
    id_patrocinador int  NULL,
    CONSTRAINT Productos_pk PRIMARY KEY (id_producto)
);

-- Table: Productos_Comprados
CREATE TABLE Productos_Comprados (
    id_usuario int  NOT NULL,
    id_producto int  NOT NULL,
    cantidad int  NOT NULL,
    CONSTRAINT Productos_Comprados_pk PRIMARY KEY (id_usuario,id_producto)
);

-- Table: Tipo_Juez
CREATE TABLE Tipo_Juez (
    id_tipo serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    CONSTRAINT Tipo_Juez_pk PRIMARY KEY (id_tipo)
);

-- Table: Tipos_De_Asientos
CREATE TABLE Tipos_De_Asientos (
    id_tipo_de_asiento serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    tarifa int  NOT NULL,
    cantidad int  NOT NULL,
    CONSTRAINT Tipos_De_Asientos_pk PRIMARY KEY (id_tipo_de_asiento)
);

-- Table: Tipos_De_Partido
CREATE TABLE Tipos_De_Partido (
    id_tipo serial  NOT NULL,
    nombre varchar(255)  NOT NULL,
    CONSTRAINT Tipos_De_Partido_pk PRIMARY KEY (id_tipo)
);

-- Table: Tipos_De_Patrocinadores
CREATE TABLE Tipos_De_Patrocinadores (
    id_tipo_patrocinador serial  NOT NULL,
    nombre_del_tipo varchar(255)  NOT NULL,
    CONSTRAINT Tipos_De_Patrocinadores_pk PRIMARY KEY (id_tipo_patrocinador)
);

-- Table: Usuarios
CREATE TABLE Usuarios (
    id_persona int  NOT NULL,
    NIT int  NOT NULL CHECK (NIT > 0),
    telefono int  NOT NULL CHECK (telefono > 0),
    correo varchar(255)  NOT NULL,
    CONSTRAINT Usuarios_pk PRIMARY KEY (id_persona)
);

-- Table: Usuarios_Aplicaciones
CREATE TABLE Usuarios_Aplicaciones (
    id_usuario int  NOT NULL,
    id_aplicacion int  NOT NULL,
    CONSTRAINT Usuarios_Aplicaciones_pk PRIMARY KEY (id_usuario,id_aplicacion)
);

-- Table: Usuarios_Ganadores
CREATE TABLE Usuarios_Ganadores (
    id_usuario int  NOT NULL,
    id_aplicacion int  NOT NULL,
    id_premio int  NOT NULL,
    CONSTRAINT Usuarios_Ganadores_pk PRIMARY KEY (id_usuario,id_aplicacion,id_premio)
);

-- foreign keys
-- Reference: Arbitro_Personas (table: Arbitros)
ALTER TABLE Arbitros ADD CONSTRAINT Arbitro_Personas
    FOREIGN KEY (id_persona)
    REFERENCES Personas (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Autor_Personas (table: Autores)
ALTER TABLE Autores ADD CONSTRAINT Autor_Personas
    FOREIGN KEY (id_persona)
    REFERENCES Personas (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Boletas_Compradas_Boletas (table: Boletas_Compradas)
ALTER TABLE Boletas_Compradas ADD CONSTRAINT Boletas_Compradas_Boletas
    FOREIGN KEY (id_boleta)
    REFERENCES Boletas (id_boleta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Boletas_Compradas_Usuarios (table: Boletas_Compradas)
ALTER TABLE Boletas_Compradas ADD CONSTRAINT Boletas_Compradas_Usuarios
    FOREIGN KEY (id_usuario)
    REFERENCES Usuarios (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Boletas_Partidos (table: Boletas)
ALTER TABLE Boletas ADD CONSTRAINT Boletas_Partidos
    FOREIGN KEY (id_partido)
    REFERENCES Partidos (id_partido)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Boletas_Tipos_De_Asientos (table: Boletas)
ALTER TABLE Boletas ADD CONSTRAINT Boletas_Tipos_De_Asientos
    FOREIGN KEY (id_tipo_de_asiento)
    REFERENCES Tipos_De_Asientos (id_tipo_de_asiento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Ciudades_Paises (table: Ciudades)
ALTER TABLE Ciudades ADD CONSTRAINT Ciudades_Paises
    FOREIGN KEY (id_pais)
    REFERENCES Paises (id_pais)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Duo_femenino_ganador (table: Ediciones)
ALTER TABLE Ediciones ADD CONSTRAINT Duo_femenino_ganador
    FOREIGN KEY (duo_femenino_ganador)
    REFERENCES Duos (id_duo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Duo_ganador_partido (table: Duos_Participantes)
ALTER TABLE Duos_Participantes ADD CONSTRAINT Duo_ganador_partido
    FOREIGN KEY (duo_ganador)
    REFERENCES Duos (id_duo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Duo_masuclino_ganador (table: Ediciones)
ALTER TABLE Ediciones ADD CONSTRAINT Duo_masuclino_ganador
    FOREIGN KEY (duo_masculino_ganador)
    REFERENCES Duos (id_duo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Duos_Participantes_Partidos (table: Duos_Participantes)
ALTER TABLE Duos_Participantes ADD CONSTRAINT Duos_Participantes_Partidos
    FOREIGN KEY (id_partido)
    REFERENCES Partidos (id_partido)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Ediciones_Patrocinadas_Ediciones (table: Ediciones_Patrocinadas)
ALTER TABLE Ediciones_Patrocinadas ADD CONSTRAINT Ediciones_Patrocinadas_Ediciones
    FOREIGN KEY (id_edicion)
    REFERENCES Ediciones (id_edicion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Ediciones_Patrocinadas_Patrocinadores (table: Ediciones_Patrocinadas)
ALTER TABLE Ediciones_Patrocinadas ADD CONSTRAINT Ediciones_Patrocinadas_Patrocinadores
    FOREIGN KEY (id_patrocinador)
    REFERENCES Patrocinadores (id_patrocinador)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Entrenador_Personas (table: Entrenadores)
ALTER TABLE Entrenadores ADD CONSTRAINT Entrenador_Personas
    FOREIGN KEY (id_persona)
    REFERENCES Personas (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Entrenadores_Jugadores (table: Entrenadores)
ALTER TABLE Entrenadores ADD CONSTRAINT Entrenadores_Jugadores
    FOREIGN KEY (id_jugador)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Eventos_Acciones (table: Eventos)
ALTER TABLE Eventos ADD CONSTRAINT Eventos_Acciones
    FOREIGN KEY (id_accion)
    REFERENCES Acciones (id_accion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Eventos_En_Un_Partido_Eventos (table: Eventos_En_Un_Partido)
ALTER TABLE Eventos_En_Un_Partido ADD CONSTRAINT Eventos_En_Un_Partido_Eventos
    FOREIGN KEY (id_evento)
    REFERENCES Eventos (id_evento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Eventos_En_Un_Partido_Partidos (table: Eventos_En_Un_Partido)
ALTER TABLE Eventos_En_Un_Partido ADD CONSTRAINT Eventos_En_Un_Partido_Partidos
    FOREIGN KEY (id_partido)
    REFERENCES Partidos (id_partido)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jueces_Personas (table: Jueces)
ALTER TABLE Jueces ADD CONSTRAINT Jueces_Personas
    FOREIGN KEY (id_persona)
    REFERENCES Personas (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jueces_Tipo_Juez (table: Jueces)
ALTER TABLE Jueces ADD CONSTRAINT Jueces_Tipo_Juez
    FOREIGN KEY (id_tipo)
    REFERENCES Tipo_Juez (id_tipo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jugador_1 (table: Participan_En_Sencillos)
ALTER TABLE Participan_En_Sencillos ADD CONSTRAINT Jugador_1
    FOREIGN KEY (id_jugador1)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jugador_ganador (table: Ediciones)
ALTER TABLE Ediciones ADD CONSTRAINT Jugador_ganador
    FOREIGN KEY (jugador_ganador)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jugador_ganador_partido (table: Participan_En_Sencillos)
ALTER TABLE Participan_En_Sencillos ADD CONSTRAINT Jugador_ganador_partido
    FOREIGN KEY (jugador_ganador)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jugadora_ganadora (table: Ediciones)
ALTER TABLE Ediciones ADD CONSTRAINT Jugadora_ganadora
    FOREIGN KEY (jugadora_ganadora)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jugadores_Personas (table: Jugadores)
ALTER TABLE Jugadores ADD CONSTRAINT Jugadores_Personas
    FOREIGN KEY (id_persona)
    REFERENCES Personas (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jugadores_Por_Duo_Duos (table: Jugadores_Por_Duo)
ALTER TABLE Jugadores_Por_Duo ADD CONSTRAINT Jugadores_Por_Duo_Duos
    FOREIGN KEY (id_duo)
    REFERENCES Duos (id_duo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Jugadores_Por_Duo_Jugadores (table: Jugadores_Por_Duo)
ALTER TABLE Jugadores_Por_Duo ADD CONSTRAINT Jugadores_Por_Duo_Jugadores
    FOREIGN KEY (id_jugador)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Noticias_Autores (table: Noticias)
ALTER TABLE Noticias ADD CONSTRAINT Noticias_Autores
    FOREIGN KEY (id_autor)
    REFERENCES Autores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Participan_En_Sencillos_Jugadores (table: Participan_En_Sencillos)
ALTER TABLE Participan_En_Sencillos ADD CONSTRAINT Participan_En_Sencillos_Jugadores
    FOREIGN KEY (id_jugador2)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Participan_En_Sencillos_Partidos (table: Participan_En_Sencillos)
ALTER TABLE Participan_En_Sencillos ADD CONSTRAINT Participan_En_Sencillos_Partidos
    FOREIGN KEY (id_partido)
    REFERENCES Partidos (id_partido)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Partidos_Arbitros (table: Partidos)
ALTER TABLE Partidos ADD CONSTRAINT Partidos_Arbitros
    FOREIGN KEY (id_arbitro)
    REFERENCES Arbitros (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Partidos_Ediciones (table: Partidos)
ALTER TABLE Partidos ADD CONSTRAINT Partidos_Ediciones
    FOREIGN KEY (id_edicion)
    REFERENCES Ediciones (id_edicion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Partidos_Etapas (table: Partidos)
ALTER TABLE Partidos ADD CONSTRAINT Partidos_Etapas
    FOREIGN KEY (id_etapa)
    REFERENCES Etapas (id_etapa)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Partidos_Tipo_De_Partido (table: Partidos)
ALTER TABLE Partidos ADD CONSTRAINT Partidos_Tipo_De_Partido
    FOREIGN KEY (id_tipo_de_partido)
    REFERENCES Tipos_De_Partido (id_tipo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Partidos_Transmitidos_Por_Entidad_Entidades_De_Trasmision (table: Partidos_Transmitidos_Por_Entidad)
ALTER TABLE Partidos_Transmitidos_Por_Entidad ADD CONSTRAINT Partidos_Transmitidos_Por_Entidad_Entidades_De_Trasmision
    FOREIGN KEY (id_entidad_de_transmision)
    REFERENCES Entidades_De_Trasmision (id_entidad_de_transmision)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Partidos_Transmitidos_Por_Entidad_Partidos (table: Partidos_Transmitidos_Por_Entidad)
ALTER TABLE Partidos_Transmitidos_Por_Entidad ADD CONSTRAINT Partidos_Transmitidos_Por_Entidad_Partidos
    FOREIGN KEY (id_partido)
    REFERENCES Partidos (id_partido)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Patrocinadores_Tipos_De_Patrocinadores (table: Patrocinadores)
ALTER TABLE Patrocinadores ADD CONSTRAINT Patrocinadores_Tipos_De_Patrocinadores
    FOREIGN KEY (id_tipo_patrocinador)
    REFERENCES Tipos_De_Patrocinadores (id_tipo_patrocinador)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Personas_Ciudades (table: Personas)
ALTER TABLE Personas ADD CONSTRAINT Personas_Ciudades
    FOREIGN KEY (ciudad_nacimiento)
    REFERENCES Ciudades (id_ciudad)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Premios_De_Las_Aplicaciones_Aplicaciones (table: Premios_De_Las_Aplicaciones)
ALTER TABLE Premios_De_Las_Aplicaciones ADD CONSTRAINT Premios_De_Las_Aplicaciones_Aplicaciones
    FOREIGN KEY (id_aplicacion)
    REFERENCES Aplicaciones (id_aplicacion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Premios_De_Las_Aplicaciones_Premios (table: Premios_De_Las_Aplicaciones)
ALTER TABLE Premios_De_Las_Aplicaciones ADD CONSTRAINT Premios_De_Las_Aplicaciones_Premios
    FOREIGN KEY (id_premio)
    REFERENCES Premios (id_premio)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Producto_Comprados_Productos (table: Productos_Comprados)
ALTER TABLE Productos_Comprados ADD CONSTRAINT Producto_Comprados_Productos
    FOREIGN KEY (id_producto)
    REFERENCES Productos (id_producto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Producto_Comprados_Usuarios (table: Productos_Comprados)
ALTER TABLE Productos_Comprados ADD CONSTRAINT Producto_Comprados_Usuarios
    FOREIGN KEY (id_usuario)
    REFERENCES Usuarios (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Productos_Patrocinadores (table: Productos)
ALTER TABLE Productos ADD CONSTRAINT Productos_Patrocinadores
    FOREIGN KEY (id_patrocinador)
    REFERENCES Patrocinadores (id_patrocinador)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Table_51_Jueces (table: Jueces_De_los_Partidos)
ALTER TABLE Jueces_De_los_Partidos ADD CONSTRAINT Table_51_Jueces
    FOREIGN KEY (id_persona)
    REFERENCES Jueces (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Table_51_Partidos (table: Jueces_De_los_Partidos)
ALTER TABLE Jueces_De_los_Partidos ADD CONSTRAINT Table_51_Partidos
    FOREIGN KEY (id_partido)
    REFERENCES Partidos (id_partido)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Usuario_Personas (table: Usuarios)
ALTER TABLE Usuarios ADD CONSTRAINT Usuario_Personas
    FOREIGN KEY (id_persona)
    REFERENCES Personas (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Usuarios_Aplicaciones_Aplicaciones (table: Usuarios_Aplicaciones)
ALTER TABLE Usuarios_Aplicaciones ADD CONSTRAINT Usuarios_Aplicaciones_Aplicaciones
    FOREIGN KEY (id_aplicacion)
    REFERENCES Aplicaciones (id_aplicacion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Usuarios_Aplicaciones_Usuarios (table: Usuarios_Aplicaciones)
ALTER TABLE Usuarios_Aplicaciones ADD CONSTRAINT Usuarios_Aplicaciones_Usuarios
    FOREIGN KEY (id_usuario)
    REFERENCES Usuarios (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Usuarios_Ganadores_Aplicaciones (table: Usuarios_Ganadores)
ALTER TABLE Usuarios_Ganadores ADD CONSTRAINT Usuarios_Ganadores_Aplicaciones
    FOREIGN KEY (id_aplicacion)
    REFERENCES Aplicaciones (id_aplicacion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Usuarios_Ganadores_Premios (table: Usuarios_Ganadores)
ALTER TABLE Usuarios_Ganadores ADD CONSTRAINT Usuarios_Ganadores_Premios
    FOREIGN KEY (id_premio)
    REFERENCES Premios (id_premio)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Usuarios_Ganadores_Usuarios (table: Usuarios_Ganadores)
ALTER TABLE Usuarios_Ganadores ADD CONSTRAINT Usuarios_Ganadores_Usuarios
    FOREIGN KEY (id_usuario)
    REFERENCES Usuarios (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dous_participantes_Dous (table: Duos_Participantes)
ALTER TABLE Duos_Participantes ADD CONSTRAINT dous_participantes_Dous
    FOREIGN KEY (id_duo1)
    REFERENCES Duos (id_duo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: duo_receptor (table: Eventos_En_Un_Partido)
ALTER TABLE Eventos_En_Un_Partido ADD CONSTRAINT duo_receptor
    FOREIGN KEY (duo_receptor)
    REFERENCES Duos (id_duo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: duo_servidor (table: Eventos_En_Un_Partido)
ALTER TABLE Eventos_En_Un_Partido ADD CONSTRAINT duo_servidor
    FOREIGN KEY (duo_servidor)
    REFERENCES Duos (id_duo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: duos_participantes_Duos (table: Duos_Participantes)
ALTER TABLE Duos_Participantes ADD CONSTRAINT duos_participantes_Duos
    FOREIGN KEY (id_duo2)
    REFERENCES Duos (id_duo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: id_area_geografica (table: Entidades_De_Trasmision)
ALTER TABLE Entidades_De_Trasmision ADD CONSTRAINT id_area_geografica
    FOREIGN KEY (id_area_geografica)
    REFERENCES Areas_Geograficas (id_area_geografica)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: id_categoria (table: Productos)
ALTER TABLE Productos ADD CONSTRAINT id_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES Categorias (id_categoria)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: receptor (table: Eventos_En_Un_Partido)
ALTER TABLE Eventos_En_Un_Partido ADD CONSTRAINT receptor
    FOREIGN KEY (receptor)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: servidor (table: Eventos_En_Un_Partido)
ALTER TABLE Eventos_En_Un_Partido ADD CONSTRAINT servidor
    FOREIGN KEY (servidor)
    REFERENCES Jugadores (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

