USE `CursoSemestre`;
DROP procedure IF EXISTS `porcentaje`;

USE `CursoSemestre`;
DROP procedure IF EXISTS `CursoSemestre`.`porcentaje`;
;

DELIMITER $$
USE `CursoSemestre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentaje`()
BEGIN

DECLARE RepT INTEGER;
DECLARE cont INTEGER;
  DECLARE Mat VARCHAR(25);
  DECLARE RepP INTEGER;
  DECLARE Porcen float;
  DECLARE var_final INTEGER DEFAULT 0;

  DECLARE cursor1 CURSOR FOR SELECT al,Curso_Materia_idmateria FROM repT;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

  OPEN cursor1;
	set cont=1;
    
    CREATE TEMPORARY TABLE MatPorc (id int auto_increment,materia varchar(20),Porc float, primary key (id)); 
  bucle: LOOP

    FETCH cursor1 INTO RepT,Mat;

    IF var_final = 1 THEN
      LEAVE bucle;
    END IF;

   set RepP= (select cal from rep where id=cont);
   set RepP=RepP*100;
   
   set Porcen=RepP/RepT;
   insert into MatPorc ( `materia`,`Porc`)  values(Mat,Porcen);
   
   
   
   
   
set cont=cont+1;
  END LOOP bucle;
  CLOSE cursor1;
select * from MatPorc;
drop table MatPorc;
END$$

DELIMITER ;
;
