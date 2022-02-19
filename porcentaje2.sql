USE `CursoSemestre`;
DROP procedure IF EXISTS `porcentaje2`;

USE `CursoSemestre`;
DROP procedure IF EXISTS `CursoSemestre`.`porcentaje2`;
;

DELIMITER $$
USE `CursoSemestre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentaje2`()
BEGIN
DECLARE RepT INTEGER;
DECLARE cont INTEGER;
  DECLARE Profe INT;
  DECLARE RepP INTEGER;
  DECLARE Porcen float;
  DECLARE var_final INTEGER DEFAULT 0;

  DECLARE cursor1 CURSOR FOR SELECT Profesor_idprofesor,total_alumnos FROM TotalAl;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

  OPEN cursor1;
	set cont=1;
    
    CREATE TEMPORARY TABLE ProfPorc (id int auto_increment,profe int,Porc float, primary key (id)); 
  bucle: LOOP

    FETCH cursor1 INTO Profe,RepT;

    IF var_final = 1 THEN
      LEAVE bucle;
    END IF;

   set RepP= (select cant from al_rep where id=cont);
   set RepP=RepP*100;
   
   set Porcen=RepP/RepT;
   insert into ProfPorc ( `profe`,`Porc`)  values(profe,Porcen);
   
   
   
   
   
set cont=cont+1;
  END LOOP bucle;
  CLOSE cursor1;
select * from ProfPorc;
drop table ProfPorc;
END$$

DELIMITER ;
;