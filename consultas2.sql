 -- 1: Listar los alumnos con estatus de regular
 -- (considere que un alumno regular puede tener no aprobada como máximo una materia)
 -- El conjunto A seran todos los alumnos
 -- El conjunto B son los alumnos reprobados
 -- Al realizar un left join A - B nos quedan solo los alumnos aprobados
 select distinct  A.idEstudiante,A.Nombre, A.Apellido1, A.Apellido2 from(
  select distinct  idEstudiante,Nombre, Apellido1, Apellido2 from Estudiante
 inner join Estudiante_has_Curso has 
 on idEstudiante = Estudiante_idestudiante) as A
 left join(
 select  idEstudiante,Nombre, Apellido1, Apellido2 from Estudiante
 inner join Estudiante_has_Curso has 
 on idEstudiante = Estudiante_idestudiante
 where Calificacion <6
 group by  idEstudiante,Nombre, Apellido1, Apellido2
 having count(Nombre)>1
 ) as B
 on A.Nombre =B.Nombre
 where B.Nombre is  NULL;
 
 -- 2: Listar el porcentaje de no aprobados por materia en los semestres 20212 y 20221 
 -- Creamos una vista con el total de alumnos por materia
 create view repT as Select C.Curso_Materia_idmateria,C.al from(
 select  Curso_Materia_idmateria,count(Curso_Materia_idmateria) as al
 from Estudiante_has_Curso
 group by Curso_Materia_idmateria) as C
 inner join(

 select   Curso_Materia_idmateria
 from Estudiante_has_Curso
 where calificacion <6
 group by Curso_Materia_idmateria ) as D
 on C.Curso_Materia_idmateria = D.Curso_Materia_idmateria;
 -- select * from repT;
 -- drop view rep;
 -- Creamos una tabla temporal con la cantidad de repobados por materia
CREATE TEMPORARY TABLE rep (id int auto_increment,materia varchar(20),cal int, primary key (id)); 
insert into rep ( `materia`,`cal`)  select  Curso_Materia_idmateria,count(*) as al
 from Estudiante_has_Curso
 where calificacion <6
 group by Curso_Materia_idmateria;
 -- Mandamos llamar al procedimiento alamcenado que hace el calculo de los porcentajes
 call CursoSemestre.porcentaje();

-- drop table MatPorc;


-- 3: Listar los profesores que aprobaron a todos sus alumnos en todas sus materias
select distinct Profesor_idprofesor
from Curso as cu, Estudiante_has_Curso as Es
where cu.Grupo=Es.Curso_Grupo and calificacion >5;

-- 4: Listar los profesores con el mayor porcentaje de no aprobados en los semestres 20212 y 20221

-- Creamos una vista con la cantidad todal de alumnos por prfesor
create view TotalAl as select c.Profesor_idprofesor , count(*) as "total_alumnos"
from Curso c inner join Estudiante_has_Curso ce
on c.Grupo = ce.Curso_Grupo and c.Materia_idmateria = ce.Curso_Materia_idmateria
group by c.Profesor_idprofesor;

-- Creamos una tabla temporal con la cantidad de alumns reprobados por profesor
CREATE TEMPORARY TABLE al_rep (id int auto_increment,profe int,cant int, primary key (id)); 
insert into al_rep ( `profe`,`cant`) select c.Profesor_idprofesor , count(*) as total_no_aprobados
from Curso c inner join Estudiante_has_Curso ce
on c.Grupo = ce.Curso_Grupo and c.Materia_idmateria = ce.Curso_Materia_idmateria
and ce.Calificacion <= 5
group by c.Profesor_idprofesor;

-- Llamamos al procedimiento almacenado que hace el calculo del porcentaje
call CursoSemestre.porcentaje2();

-- drop table al_rep
-- drop table ProfPorc;

-- 5: Determinar si en la materia T302 existe un porcentaje de no aprobados 
--    entre el 30% y 50% en cada uno de sus grupos.
-- Utilizando el procedimiento almacenado "porcentaje"
 call CursoSemestre.porcentaje();
 -- Podemos observar que la materia "T302" tiene un 42% de reprobados
 -- Dado esto podemos decir que se encuentra dentro del rango indicado
 
 -- 6: Listar los alumnos que han aprobado todas las asignaturas que imparte el profesor  10275287
 -- Realizamos un selecta para ver los alumnos que han aprobado con el rofesor, 
 -- y despues hacemos una union para saber el nombre de los alumnos
 select distinct B.Nombre, B.Apellido1,B.Apellido2 from(select c.Profesor_idprofesor,ce.Estudiante_idestudiante
from Curso c inner join Estudiante_has_Curso ce
on c.Grupo = ce.Curso_Grupo and c.Materia_idmateria = ce.Curso_Materia_idmateria
where c.Profesor_idprofesor = '10275287' and ce.Calificacion >5
group by c.Profesor_idprofesor,ce.Estudiante_idestudiante) as A
inner join(select idEstudiante,Nombre, Apellido1,Apellido2 from Estudiante) as B
on A.Estudiante_idestudiante=B.idEstudiante;


-- Select Estudiante_idestudiante from Estudiante_has_Curso where '2019640208' = Estudiante_idestudiante