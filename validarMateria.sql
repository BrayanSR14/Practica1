DROP TRIGGER IF EXISTS `CursoSemestre`.`Estudiante_has_Curso_BEFORE_INSERT_1`;

DELIMITER $$
USE `CursoSemestre`$$
CREATE DEFINER = CURRENT_USER TRIGGER `CursoSemestre`.`Estudiante_has_Curso_BEFORE_INSERT_1` BEFORE INSERT ON `Estudiante_has_Curso` FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(50);

if (select Estudiante_idestudiante from Estudiante_has_Curso where New.Estudiante_idestudiante=Estudiante_idestudiante) != null
AND (select Curso_Semestre from Estudiante_has_Curso where New.Curso_Semestre=Curso_Semestre)!= null
AND(select Curso_Materia_idmateria from Estudiante_has_Curso where New.Curso_Materia_idmateria=Curso_Materia_idmateria) then


SET msg = CONCAT('No puedes inscribir dos veces la misma materia en el mismo semestre');
SIGNAL SQLSTATE '45000' SET message_text = msg;

END IF;
END
$$
DELIMITER ;

