

CREATE TABLE DAW_asignaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE DAW_alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);


CREATE TABLE DAW_matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT NOT NULL,
    asignatura_id INT NOT NULL,
    CONSTRAINT fk_alumno FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
    CONSTRAINT fk_asignatura FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id),
    UNIQUE (alumno_id, asignatura_id)
);


INSERT INTO asignaturas (nombre) VALUES
('DIW'),
('DAW'),
('EIE'),
('PROG');


INSERT INTO alumnos (nombre) VALUES
('Alfonso'),
('Eugenia'),
('Vicente');


INSERT INTO matriculas (alumno_id, asignatura_id) VALUES
(1, 1), 
(1, 2), 
(2, 3), 
(2, 4), 
(3, 1), 
(3, 4); 
