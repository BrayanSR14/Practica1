
-- tabla profesor
insert into Profesor values ('98074241');
insert into Profesor values ('98074281');
insert into Profesor values ('10074288');
insert into Profesor values ('10177310');
insert into Profesor values ('10275287');
-- select * from Profesor;

-- tabla estudiante
insert into Estudiante values ('2019640011', 'Carlos Eduardo', 'Gómez', 'García');
insert into Estudiante values ('2019640125', 'Eduardo', 'García', 'López');
insert into Estudiante values ('2018641025', 'Andrea', 'Hernández', NULL);
insert into Estudiante values ('2019641134', 'Juan','Iturbide', NULL);
insert into Estudiante values ('2019640231', 'Beatriz', 'Torres', 'Parra');

-- tabla materia
insert into Materia values ('T105');
insert into Materia values ('T203');
insert into Materia values ('T302');
insert into Materia values ('T410');
insert into Materia values ('T211');
-- select * from materia;

-- tabla curso
insert into Curso values ('20211', '3TM1','T302','98074241',30);
insert into Curso values ('20212', '2TM5','T203','98074241',30);
insert into Curso values ('20212', '2TV3','T203','10074288',30);
insert into Curso values ('20221', '4TM5','T410','10275287',30);
insert into Curso values ('20221', '3TM2','T302','10275287',30);
insert into Curso values ('20221', '3TV5','T302','10275287',30);
insert into Curso values ('20222', '4TM3','T410','10275287',25);
-- select * from curso;

-- tabla curso_has_estudiante
insert into Estudiante_has_Curso values ('20211', '3TM1','T302','2019640011', 7);
insert into Estudiante_has_Curso values ('20211', '3TM1','T302','2018641025', 11);
insert into Estudiante_has_Curso values ('20221', '4TM5','T410','2019640231',10);
insert into Estudiante_has_Curso values ('20221', '3TM2','T302','2019640231',9);
insert into Estudiante_has_Curso values ('20212', '2TM5','T203','2019641134',5);
insert into Estudiante_has_Curso values ('20221', '3TV5','T302','2019641134',5);
insert into Estudiante_has_Curso values ('20211', '3TM1','T302','2019640125',7);
insert into Estudiante_has_Curso values ('20211', '3TM1','T302','2019640231',5);
insert into Estudiante_has_Curso values ('20221', '3TM2','T302','2019640011',9);
-- insert into Estudiante_has_Curso values ('20221', '3TM2','T302','2019640011',6);

update Estudiante_has_Curso 
set Calificacion = 5
where Curso_Semestre = "20221" and Curso_Grupo = "3TM2" and Estudiante_idestudiante = "2019640011"
-- select * from Estudiante_has_Curso