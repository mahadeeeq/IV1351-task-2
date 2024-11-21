-- SkillLevel Table
CREATE TABLE SkillLevel (
    skillLevelID INT NOT NULL PRIMARY KEY,
    beginner VARCHAR(50) NOT NULL,
    intermediate VARCHAR(50) NOT NULL,
    advanced VARCHAR(50) NOT NULL,
    lessons INT NOT NULL,
    instructorID INT NOT NULL
);

-- LessonStatus Table
CREATE TABLE LessonStatus (
    siblingID INT NOT NULL PRIMARY KEY,
    confirmed VARCHAR(50) NOT NULL,
    canceled VARCHAR(50) NOT NULL
);

-- Classroom Table
CREATE TABLE Classroom (
    roomID INT NOT NULL PRIMARY KEY,
    address VARCHAR(200) NOT NULL,
    roomSize INT NOT NULL,
    siblingID INT
);

-- Schedule Table
CREATE TABLE Schedule (
    scheduleID INT NOT NULL PRIMARY KEY,
    startTime TIME NOT NULL,
	date           NOT NULL
    endTime TIME NOT NULL,
    roomID INT NOT NULL,
    siblingID INT NOT NULL,
    FOREIGN KEY (roomID) REFERENCES Classroom(roomID)
);

-- Instructor Table
CREATE TABLE Instructor (
    instructorID INT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contactNumber VARCHAR(15),
    specialization VARCHAR(100),
    hourlyWage DECIMAL(10, 2)
	listOfInstrumentTaught    TEXT NOT NULL
);

-- Instrument Table
CREATE TABLE Instrument (
    instrumentID INT NOT NULL PRIMARY KEY,
    instrumentType VARCHAR(50) NOT NULL,
    maintenanceDate DATE NOT NULL,
    quantity INT NOT NULL,
	brand     varchar(50)   NOT NULL
    rentalFee DECIMAL(10, 2) NOT NULL,
    instructorID INT NOT NULL,
    FOREIGN KEY (instructorID) REFERENCES Instructor(instructorID)
);

-- Rental Table
CREATE TABLE Rental (
    rentalID INT NOT NULL PRIMARY KEY,
    rentalStartDate DATE NOT NULL,
    rentalEndDate DATE NOT NULL,
    rentalDue DATE NOT NULL,
    instrumentID INT NOT NULL,
    FOREIGN KEY (instrumentID) REFERENCES Instrument(instrumentID)
);

-- Student Table
CREATE TABLE Student (
    studentID INT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    contactNumber VARCHAR(15),
    contactPersonName VARCHAR(100),
    siblingID INT NOT NULL
	emailVARCHAR(100) UNIQUE NOT NULL
	booking INT NOT NULL
	skillLevelID INT NOT NULL
);

-- Lesson Table
CREATE TABLE Lesson (
    lessonID INT NOT NULL PRIMARY KEY,
    scheduleID INT NOT NULL,
    lessonCost DECIMAL(10, 2) NOT NULL,
    lessonDuration INT NOT NULL,
    description TEXT,
	name VARCHAR (100) NOT NULL
	instructorID INT NOT NULL
	skillLevel NOT NULL
    FOREIGN KEY (scheduleID) REFERENCES Schedule(scheduleID),
	
	
	
);

-- Individual Lesson Table
CREATE TABLE IndividualLesson (
    lessonID INT NOT NULL PRIMARY KEY,
    skillLevelID INT NOT NULL,
    ensembleID INT,
    siblingID INT,
    FOREIGN KEY (lessonID) REFERENCES Lesson(lessonID),
    FOREIGN KEY (skillLevelID) REFERENCES SkillLevel(skillLevelID)
);

-- Lesson Enrollment Table
CREATE TABLE LessonEnrollment (
    lessonID INT NOT NULL,
    siblingID INT NOT NULL,
    studentID INT NOT NULL,
    enrollmentDate DATE NOT NULL,
    rentalID INT,
    PRIMARY KEY (lessonID, studentID),
    FOREIGN KEY (lessonID) REFERENCES Lesson(lessonID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (rentalID) REFERENCES Rental(rentalID)
);

-- Booking Table
CREATE TABLE Booking (
    bookingID INT NOT NULL PRIMARY KEY,
    studentID INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

-- Attendance Status Table
CREATE TABLE AttendanceStatus (
    attended BOOLEAN NOT NULL,
    canceled BOOLEAN NOT NULL
);
