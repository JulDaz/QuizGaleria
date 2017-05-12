CREATE TABLE IF NOT EXISTS Usuario(
usuario varchar(15) primary key not null,
nombre varchar(25) not null
);

CREATE TABLE IF NOT EXISTS Artista(
id_artist int primary key not null,
curriculum varchar(300) not null,
distinciones varchar(100) not null,
usuario varchar REFERENCES Usuario(usuario) not null
);

CREATE TABLE IF NOT EXISTS Obra_de_Arte(
id_obra int primary key not null,
nombre varchar(50) not null,
descripcion varchar(100) not null,
estilo varchar(50) not null,
valor real not null,
id_artist int REFERENCES Artista(id_artist) not null
);

INSERT INTO Usuario (usuario, nombre) VALUES ('Fernando', 'Fernando Botero');

INSERT INTO Artista (id_artist, curriculum, distinciones, usuario) VALUES (1, 'pintor, escultor y dibujante de origen colombiano, domiciliado en Pietrasanta (Italia), París (Francia), Ciudad de Mónaco y Nueva York (Estados Unidos de América)', 'Congreso de Colombia', 'Fernando');

INSERT INTO Obra_de_Arte(id_obra, nombre, descripcion, estilo, valor, id_artist) VALUES (1, 'Paisaje', 'Dibujo en lienzo', 'Pincel', 20000, 1);
INSERT INTO Obra_de_Arte(id_obra, nombre, descripcion, estilo, valor, id_artist) VALUES (2, 'Horizonte', 'Dibujo del horizonte', 'Oleo', 5000, 1);
INSERT INTO Obra_de_Arte(id_obra, nombre, descripcion, estilo, valor, id_artist) VALUES (3, 'Familia', 'Familia tipica', 'Acuarela', 50000, 1);

select * from Usuario;
select * from Artista;
select * from Obra_de_Arte;

select nombre, valor, sum(valor) as val from Usuario natural join Obra_de_Arte group by nombre having sum(valor)>10000;
