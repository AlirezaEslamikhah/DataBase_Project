USE EntekhabVahed
--q1 --- فیلتر کردن اساتید بر اساس تعداد فرزاندان 
 --SELECT t.ChildrenNum , count(t.TeacherID) TeacherCount
 --FROM Teacher t 
 --GROUP BY t.ChildrenNum

--q2 ---- تمام دانشجوهایی که استاد مشخص شده استاد راهنمای انها است
-- SELECT s.*
-- FROM Student s , Teacher t , Advisor a
-- WHERE (a.ID = s.AdvisorID) AND (a.TeacherID = t.TeacherID) AND (t.TeacherID = 1);

--q3 ---- فیلتر کردن دانشجویان بر اساس رشته تحصیلی 
-- SELECT count(s.StudentNumber) num_of_student_in_same_major , s.Major
-- FROM Student s 
-- GROUP BY s.Major

--q4 ---- فیلتر کردن دانشجویان یک رشته خاص بر اساس نمره از بیشترین به کمترین و انهایی که نمرشان از میانگین بیشتر شده
-- SELECT * 
-- FROM Student s 
-- WHERE s.Major = '????????' AND 
-- s.GPA > (SELECT AVG(ss.GPA) FROM Student ss)
-- ORDER BY s.GPA DESC 

--q5 --- فیلتر کردن تعداد دانشجویان بر اساس سال تولد 
-- SELECT COUNT(s.StudentNumber) tedad_daneshjoyan_hamsal , s.BirthYear
-- FROM Student s 
-- GROUP BY s.BirthYear

--q6 ---- نام دپارتمان های استاد راهنما یک دانشجو خاص 
 --SELECT d.Name , d.ID , t.TeacherID
 --FROM Department d , Student s , Teacher t ,Advisor a , Teacher_Department td
 --WHERE s.StudentNumber = 01000001 AND s.AdvisorID = a.ID AND 
 --a.TeacherID = t.TeacherID AND td.TeacherID = t.TeacherID AND 
 --d.ID = td.DepartmentID

--q7 ----- نام دروسی که یک دانشجو خاص در انتخاب واحد اخذ میکند
-- SELECT co.Name 
-- FROM Student s , TakeCourse t , Consist_Of c , Course co 
-- WHERE s.TakeCourseID = t.ID AND s.StudentNumber =01000001 AND 
-- c.TakeCourseID = t.ID AND c.CourseID = co.ID  

--q8 ---- نام دروسی که اساتیدشان متعلق به یک دپارتمان خاص هستند 
-- SELECT c.Name
-- FROM Course c , Teacher t , Teacher_Department td , Department d 
-- WHERE c.Teacherid = t.TeacherID AND td.TeacherID = t.TeacherID AND 
-- td.DepartmentID = d.ID AND d.Name = 'Department1'

--q9 ---- نام تمام دانشجوهایی که یک استاد راهنما خاص استاد راهنمای اوست 
-- SELECT s.FName +' ' +  s.LName student_name, s.StudentNumber 
-- FROM Student s , Advisor a , Teacher t
-- WHERE s.AdvisorID = a.ID AND a.TeacherID = t.TeacherID AND t.LName = 'family1'

--q10 ----- فیلتر کردن انتخاب واحد هایی که زمان حذف و اضافه شان از یک تاریخ به بعد است 
-- SELECT * 
-- FROM TakeCourse t 
-- WHERE year(t.AddDropTime) > 2020 

-- q11 ----- نام تمام اساتید یک دپارتمان خاص  
-- SELECT t.*
-- FROM Teacher t , Teacher_Department td , Department d 
-- WHERE t.TeacherID = td.TeacherID AND d.ID = td.DepartmentID AND d.Name = 'Department1'

--q12 ----- نام تمامی دانشجوهایی که همشهری استاد راهنما هستند
 --SELECT s.FName+'  ' + s.LName student_NAMES , t.FName + ' ' +t.LName
 --FROM Student s , Advisor a , Teacher t 
 --WHERE s.AdvisorID = a.ID AND a.TeacherID = t.TeacherID AND s.City = t.City

--q13 ------ اقابلیت فیلتر دروس براساس قابلیت اخذشان
-- SELECT * 
-- FROM Course c 
-- WHERE c.IsAvailable = 1

--q14  این کوئری بعد از اضافه شدن ستون جدید به درس انجام میشود--- قابلیت فیلتر دروس بر اساس دانشکده 
  --SELECT c.Name
  --FROM Course c , College cc
  --WHERE c.FacultyId = cc.ID AND cc.Name = 'college1'

--q15 --- قابلیت فیلتر دروس بر اساس ظرفیت 
 --SELECT *
 --FROM Course c 
 --WHERE c.Capacity > 0 AND c.Capacity < 50


--q16 --- قابلیت فیلتر دانشجویان بر اساس سال ورودی 
-- SELECT COUNT(ss.EntranceYear) , ss.EntranceYear
-- FROM Student ss GROUP BY ss.EntranceYear 

--q17 ---- قابلیت فیلتر دانشجویان بر اساس معدل 
 --SELECT s.GPA gpa , COUNT(s.StudentNumber) number_of_students
 --FROM Student s 
 --GROUP BY s.GPA

--q18 --- قابلیت فیلتر اساتید بر اساس حقوق 
-- SELECT t.TeacherID  info
-- FROM Teacher t 
-- WHERE t.Salary > 10

--q19 ----نام اساتیدی که بیشترین دپارتمان رو عضو هستند 

 --CREATE VIEW [first_sample] AS
 --SELECT  td.TeacherID ,count (td.DepartmentID) c
 --FROM  Teacher_Department td
 --GROUP BY td.TeacherID

 --SELECT * 
 --FROM Teacher t 
 --JOIN [EntekhabVahed].[dbo].[first_sample] ON t.TeacherID =[EntekhabVahed].[dbo].[first_sample].[TeacherID]
 --WHERE [EntekhabVahed].[dbo].[first_sample].[c] >= (SELECT MAX([EntekhabVahed].[dbo].[first_sample].[c]) FROM [EntekhabVahed].[dbo].[first_sample])


--q20 ---- گزارش دروس دو واحدی که پیش نیاز آنها دی اس میباشد 
-- SELECT * 
-- FROM Course c 
-- WHERE c.credit = 2 AND c.prerequisite = 'ds'

--مرتب کردن براساس استاد راهنما
--select s.AdvisorID, COUNT(s.AdvisorID) NumberOfStudents
--from Student s
--Group By s.AdvisorID

--لیست اساتید
--select * 
--from Teacher
