 USE EntekhabVahed 

-- view number 1 
-- CREATE VIEW [top_students] AS
-- SELECT s.*
-- FROM Student s
-- WHERE s.GPA > 19;

-- SELECT * FROM [top_students]

--VIEW number 2 
-- CREATE VIEW [teachers_from_kish] AS
-- SELECT * FROM Teacher t WHERE t.City = 'kish'

-- SELECT * FROM [teachers_from_kish]


--procedure number 1 
-- GO 
-- CREATE PROCEDURE saample 
-- AS 
--     SELECT s.FName+'  ' + s.LName student_NAMES , t.FName + ' ' +t.LName
--     FROM Student s , Advisor a , Teacher t 
--     WHERE s.AdvisorID = a.ID AND a.TeacherID = t.TeacherID AND s.City = t.City

 --GO 
 --EXEC saample 


--PROCEDURE number 2 
-- GO 
-- CREATE PROCEDURE saample2 @name1 nvarchar(30)
-- AS 
-- SELECT s.FName +' ' +  s.LName student_name, s.StudentNumber 
-- FROM Student s , Advisor a , Teacher t
-- WHERE s.AdvisorID = a.ID AND a.TeacherID = t.TeacherID AND t.LName = @name1

-- GO 
-- EXEC saample2 @name1 = 'family1'

--function number 1 
 --GO 
 --CREATE FUNCTION mesal(@id INT)
 --RETURNS TABLE 
 --AS 
 --RETURN 
 --    SELECT * 
 --    FROM TakeCourse t 
 --    WHERE year(t.AddDropTime) > @id 

 --GO 
 --SELECT* from  mesal(2020);


--function number2 
-- GO 
-- CREATE FUNCTION mesal2(@name nvarchar(30))
-- RETURNS TABLE 
-- AS 
-- RETURN 
-- SELECT t.*
-- FROM Teacher t , Teacher_Department td , Department d 
-- WHERE t.TeacherID = td.TeacherID AND d.ID = td.DepartmentID AND d.Name = @name

-- GO 
-- SELECT * FROM mesal2('Department1')




----trigger1
----trigger to avoid inserting Teachers with pass shorter than 3 letters!
--use University
--GO
--Create trigger CheckPassword on Teacher
--Instead of Insert as 
--    Declare @TeacherID int;
--    Declare @FName nvarchar(30);
--    Declare @LName nvarchar(30);
--	Declare @Pass nvarchar(20);

--    select @TeacherID = i.TeacherID from inserted i
--    select @FName = i.FName from inserted i
--    select @LName = i.LName from inserted i
--	select @Pass = i.Pass from inserted i
--begin
--    if (LEN(@Pass) < 3)
--        begin
--        RAISERROR('Cannot Insert user with Pass shorter than 3 letters!',16,1); ROLLBACK;
--        end
--    else
--        begin
--        insert into Teacher(TeacherID, FName, LName, Pass) values (@TeacherID, @FName, @LName, @Pass);
--        Print 'Instead After Trigger Executed';
--        end
--End
--INSERT INTO [dbo].[Teacher] ([TeacherID],[FName],[LName],[Pass]) VALUES (1902,'user4','family4',1);


----trigger2
----trigger to avoid inserting student with StudentNumber shorter than 5 digit!
--use University
--GO
--Create trigger CheckAVGScore on Student
--Instead of Insert as 
--    Declare @StudentNumber nvarchar(10);
--    Declare @FName nvarchar(30);
--    Declare @LName nvarchar(30);
--	Declare @EntranceYear int;
--	Declare @Pass nvarchar(20);

--    select @StudentNumber = i.StudentNumber from inserted i
--    select @FName = i.FName from inserted i
--    select @LName = i.LName from inserted i
--	select @Pass = i.Pass from inserted i
--	select @EntranceYear = i.EntranceYear from inserted i
--begin
--    if (LEN(@StudentNumber) < 5)
--        begin
--        RAISERROR('Cannot Insert Student with StudentNumber shorter than 5 digit!',16,1); ROLLBACK;
--        end
--    else
--        begin
--        insert into Student(StudentNumber, FName, LName, EntranceYear, Pass) values (@StudentNumber, @FName, @LName, @EntranceYear, @Pass);
--        Print 'Instead After Trigger Executed';
--        end
--End
----test: INSERT INTO [dbo].[Student] ([StudentNumber],[FName],[LName],[EntranceYear],[Pass]) VALUES ('091','student10','family11',1398,'311');