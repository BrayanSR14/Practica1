create database CursoSemestre;

use CursoSemestre;

create table Profesor (idProfesor int, primary key(idProfesor));
create table Materia (idMateria varchar(20), primary key(idMateria));
create table Estudiante (idEstudiante int, primary key(idEstudiante), 
Nombre varchar(20),Apellido1 varchar(20),Apellido2 varchar(20));
    
    CREATE TABLE  `CursoSemestre`.`Curso` (
  `Semestre` INT NOT NULL,
  `Grupo` varchar(20) NOT NULL,
  `Materia_idmateria` varchar(20) NOT NULL,
  `Profesor_idprofesor` INT NOT NULL,
  `cupo` INT NOT NULL,
  PRIMARY KEY (`Semestre`, `Grupo`, `Materia_idmateria`),
  CONSTRAINT `fk_Curso_Profesor`
    FOREIGN KEY (`Profesor_idprofesor`)
    REFERENCES `CursoSemestre`.`Profesor` (`idprofesor`),
  CONSTRAINT `fk_Curso_Materia1`
    FOREIGN KEY (`Materia_idmateria`)
    REFERENCES `CursoSemestre`.`Materia` (`idMateria`))
ENGINE = InnoDB;

CREATE TABLE  `CursoSemestre`.`Estudiante_has_Curso` (
  `Curso_Semestre` INT NOT NULL,
  `Curso_Grupo` varchar(20) NOT NULL,
  `Curso_Materia_idmateria` varchar(20) NOT NULL,
  `Estudiante_idestudiante` INT NOT NULL,
  `Calificacion` INT,
  PRIMARY KEY (`Estudiante_idestudiante`, `Curso_Semestre`, `Curso_Grupo`, `Curso_Materia_idmateria`),
  CONSTRAINT `fk_Estudiante_has_Curso_Estudiante1`
    FOREIGN KEY (`Estudiante_idestudiante`)
    REFERENCES `CursoSemestre`.`Estudiante` (`idestudiante`),
  CONSTRAINT `fk_Estudiante_has_Curso_Curso1`
    FOREIGN KEY (`Curso_Semestre` , `Curso_Grupo` , `Curso_Materia_idmateria`)
    REFERENCES `CursoSemestre`.`Curso` (`Semestre` , `Grupo` , `Materia_idmateria`))
ENGINE = InnoDB;



