/* Relación tipo 1:1 */
-- PASO 1
CREATE TABLE usuarios (
id_usuarios INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
apellido VARCHAR (100) NOT NULL,
email VARCHAR (100) NOT NULL,
edad INT
);

-- PASO 2
CREATE TABLE roles (
id_rol INT AUTO_INCREMENT PRIMARY KEY,
nombre_rol VARCHAR (50) NOT NULL
);

-- PASO 3
ALTER TABLE usuarios ADD COLUMN id_rol INT;

UPDATE usuarios SET id_rol = 1 WHERE id_usuarios = 1;
UPDATE usuarios SET id_rol = 2 WHERE id_usuarios = 2;
UPDATE usuarios SET id_rol = 3 WHERE id_usuarios = 3;
UPDATE usuarios SET id_rol = 4 WHERE id_usuarios = 4;
UPDATE usuarios SET id_rol = 4 WHERE id_usuarios = 5;
UPDATE usuarios SET id_rol = 3 WHERE id_usuarios = 6;
UPDATE usuarios SET id_rol = 2 WHERE id_usuarios = 7;
UPDATE usuarios SET id_rol = 1 WHERE id_usuarios = 8;
UPDATE usuarios SET id_rol = 1 WHERE id_usuarios = 9;
UPDATE usuarios SET id_rol = 2 WHERE id_usuarios = 10;
UPDATE usuarios SET id_rol = 3 WHERE id_usuarios = 11;
UPDATE usuarios SET id_rol = 4 WHERE id_usuarios = 12;
UPDATE usuarios SET id_rol = 1 WHERE id_usuarios = 13;
UPDATE usuarios SET id_rol = 2 WHERE id_usuarios = 14;
UPDATE usuarios SET id_rol = 3 WHERE id_usuarios = 15;
UPDATE usuarios SET id_rol = 4 WHERE id_usuarios = 16;
UPDATE usuarios SET id_rol = 4 WHERE id_usuarios = 17;
UPDATE usuarios SET id_rol = 2 WHERE id_usuarios = 18;
UPDATE usuarios SET id_rol = 1 WHERE id_usuarios = 19;
UPDATE usuarios SET id_rol = 3 WHERE id_usuarios = 20;

ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);


-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuarios, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias (
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nombre_categoria VARCHAR (100) NOT NULL
);
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');

-- PASO 2
ALTER TABLE usuarios ADD COLUMN id_categoria INT;

-- PASO 3
UPDATE usuarios SET id_categoria = 1 WHERE id_usuarios IN (1, 5, 17)
UPDATE usuarios SET id_categoria = 2 WHERE id_usuarios IN (2, 8, 20)
UPDATE usuarios SET id_categoria = 3 WHERE id_usuarios IN (3, 19)
UPDATE usuarios SET id_categoria = 4 WHERE id_usuarios IN (7, 12, 18)
UPDATE usuarios SET id_categoria = 5 WHERE id_usuarios IN (4, 16)
UPDATE usuarios SET id_categoria = 6 WHERE id_usuarios IN (6)
UPDATE usuarios SET id_categoria = 7 WHERE id_usuarios IN (10, 11)
UPDATE usuarios SET id_categoria = 8 WHERE id_usuarios IN (9, 13)
UPDATE usuarios SET id_categoria = 9 WHERE id_usuarios IN (14)
UPDATE usuarios SET id_categoria = 10 WHERE id_usuarios IN (15)


-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuarios, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias(
id_usuarios_categoria INT AUTO_INCREMENT PRIMARY KEY,
id_usuarios INT,
id_categoria INT                                                          
);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES  --aqui no sera id_rol??
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);
select * from usuarios_categorias;
select * from usuarios;

-- PASO 3
-- Tu código aquí
SELECT usuarios.id_usuarios, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria
JOIN usuarios_categorias ON usuarios.id_usuarios = usuarios_categorias.id_usuarios;
