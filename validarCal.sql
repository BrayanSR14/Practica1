DROP TRIGGER IF EXISTS `CursoSemestre`.`Estudiante_has_Curso_BEFORE_INSERT`;

DELIMITER $$
USE `CursoSemestre`$$

CREATE DEFINER=`root`@`localhost` TRIGGER `Estudiante_has_Curso_BEFORE_INSERT` BEFORE INSERT ON `Estudiante_has_Curso` FOR EACH ROW BEGIN
DECLARE msg VARCHAR(50);

if NEW.Calificacion>10 ||NEW.Calificacion<0 THEN 

SET msg = CONCAT('La calificacion debe estar entre 0 y 10');
SIGNAL SQLSTATE '45000' SET message_text = msg;

end if;
END

$$
DELIMITER ;