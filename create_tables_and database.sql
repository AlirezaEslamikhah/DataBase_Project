CREATE DATABASE EntekhabVahed;
 USE EntekhabVahed
CREATE TABLE Teacher
(
	TeacherID	int				NOT NULL,
	BirthYear	int,
	FName		nvarchar(30)	NOT NULL,
	LName		nvarchar(30)	NOT NULL,
	Pass		nvarchar(20)	NOT NULL	Default '12345',
	Ssn			nvarchar(11),
	HomePhone	nvarchar(15),	
	MobilePhone	nvarchar(15),
	ChildrenNum	int							Default 0,
	Salary		Real, -- unit=million
	FatherName	nvarchar(30),
	MotherName	nvarchar(30),
	BirthCity	nvarchar(20),
	City		nvarchar(20),
	Street		nvarchar(20),
	Alley		nvarchar(20),
	No			int,
	IsMarried	BIT,
	Education	nvarchar(50),
	Sex			nvarchar(3),
	PRIMARY KEY (TeacherID)
);

CREATE TABLE TakeCourse
(
	ID			int				NOT NULL,
	TakeCourseTime TimeStamp,
	AddDropTime	DateTime,
	AddCondition nvarchar(100),
	PRIMARY KEY	(ID)
);
CREATE TABLE Advisor
(
	ID			int				NOT NULL,
	TeacherID	int,
	PRIMARY KEY (ID),
	FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE Student
(
	StudentNumber nvarchar(10)	NOT NULL,
	FName		nvarchar(30)	NOT NULL,
	LName		nvarchar(30)	NOT NULL,
	Ssn			nvarchar(11),
	EntranceYear int			NOT NULL	Default YEAR(FORMAT(GETDATE(), 'yyyy/MM/dd', 'fa')),
	FatherName	nvarchar(30),
	MotherName	nvarchar(30),
	City		nvarchar(20),
	Street		nvarchar(20),
	Alley		nvarchar(20),
	No			int,
	Education	nvarchar(50),
	GPA			Real, --grade point avg
	Pass		nvarchar(20)	NOT NULL	Default '12345',
	BirthYear	int,
	MobilePhone nvarchar(15),
	HomePhone	nvarchar(15),
	Sex			nvarchar(3),
	Major		nvarchar(15),
	IsMarried	BIT							Default 0,
	TakeCourseID int,
	AdvisorID	int,
	PRIMARY KEY (StudentNumber),
	FOREIGN KEY (AdvisorID) REFERENCES Advisor(ID)
		ON DELETE SET NULL	ON UPDATE CASCADE,
	FOREIGN KEY	(TakeCourseID) REFERENCES TakeCourse(ID)
		ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE College
(
	ID			int				NOT NULL,
	Name		nvarchar(30)	NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE Department
(
	ID			int				NOT NULL,
	Name		nvarchar(30)	NOT NUll,
	CollegeID	int,
	PRIMARY KEY (ID),
	FOREIGN KEY (CollegeID) REFERENCES College(ID)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE Teacher_Department
(
	ID			int				NOT NULL,
	TeacherID	int,
	DepartmentID int,
	PRIMARY KEY (ID),
	FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (DepartmentID) REFERENCES Department(ID)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE Student_College
(
	ID			int				NOT NULL,
	CollegeID	int,
	StudentNumber nvarchar(10),
	PRIMARY KEY (ID),
	FOREIGN KEY (CollegeID) REFERENCES College(ID)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (StudentNumber) REFERENCES Student(StudentNumber)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE Course
(
	ID			int				NOT NULL,
	Name		nvarchar(20)	NOT NULL,
	Capacity	int,
	ClassTime	Time,	
	ClassDays	nvarchar(50),	
	credit		int				NOT NULL,
	prerequisite nvarchar(100),
	place		nvarchar(100),
	IsAvailable BIT				Default 1,				
	Teacherid	int,
	FacultyId int,
	PRIMARY KEY	(ID),
	FOREIGN KEY	(Teacherid) REFERENCES Teacher(TeacherID)
		ON DELETE SET NULL	ON UPDATE CASCADE,
	FOREIGN KEY	(FacultyId) REFERENCES College(ID)
	ON DELETE SET NULL	ON UPDATE CASCADE
);
CREATE TABLE Consist_Of
(
	ID			int				NOT NULL,
	CourseID	int,
	TakeCourseID int,
	PRIMARY KEY (ID),
	FOREIGN KEY (CourseID) REFERENCES Course(ID)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (TakeCourseID) REFERENCES TakeCourse(ID)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
