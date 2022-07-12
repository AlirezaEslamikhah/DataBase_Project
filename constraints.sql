USE EntekhabVahed 

-- add constraint number 1  برای چک کردن تاریخ تولد اساتید
 --ALTER TABLE Teacher ADD CONSTRAINT check_birth CHECK (BirthYear >= 1370);


-- add constraint number 2 برای چک کردن صفر نبودن نمره 
 --ALTER TABLE STUDENT ADD CONSTRAINT NOT_NULL CHECK(GPA != 0);

--add constraint number 3 نام های دپارتمان های مختلف خاص باشد 
 --ALTER TABLE Department ADD CONSTRAINT unique_name UNIQUE(Name);

-- delete constraint number 1 
 --ALTER TABLE Teacher DROP CONSTRAINT check_birth;

--delete constraint number 2 
-- ALTER TABLE Course DROP CONSTRAINT course_fk;

-- update constraint number 1 
-- ALTER TABLE Teacher DROP CONSTRAINT check_birth;
-- ALTER TABLE Teacher ADD CONSTRAINT check_birth CHECK (BirthYear >= 1360);

--update constraint number 2 
-- ALTER TABLE Course DROP CONSTRAINT course_fk;
-- ALTER TABLE Course ADD CONSTRAINT course_fk FOREIGN KEY (c_fk) REFERENCES College (ID) ON DELETE CASCADE;
