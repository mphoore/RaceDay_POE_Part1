CREATE DATABASE RaceDay;

USE RaceDay;


--Creating tables for the database RACE DAY--

CREATE TABLE USERS( 
    userID INT PRIMARY KEY IDENTITY(1,1),
    Email VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL);


CREATE TABLE PARTICIPANTS(
    participantID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Gender CHAR(10) NOT NULL,
    DateOfBirth CHAR(10) NOT NULL,
    userID int NOT NULL UNIQUE,
    FOREIGN KEY(userID) REFERENCES USERS(userID));



CREATE TABLE ORGANISERS(
    organiserID INT PRIMARY KEY IDENTITY(1,1),
    OrganiserName VARCHAR(50) NOT NULL,
    userID int NOT NULL UNIQUE,
    FOREIGN KEY(userID) REFERENCES USERS(userID));



CREATE TABLE EVENTS(
    eventID INT PRIMARY KEY IDENTITY(1,1),
    EventName VARCHAR(50) NOT NULL,
    EventType VARCHAR(50) NOT NULL,
    Date VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    organiserID int NOT NULL,
    FOREIGN KEY(organiserID) REFERENCES ORGANISERS(organiserID));




CREATE TABLE CATEGORIES(
    categoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL,
    Distance CHAR(10) NOT NULL,
    Fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    eventID INT NOT NULL,
    FOREIGN KEY(eventID) REFERENCES EVENTS(eventID));


CREATE TABLE ENROLLMENTS(
     enrollmentID INT PRIMARY KEY IDENTITY(1,1),
     RaceNumber INT NOT NULL,
     DateEnrolled DATE NOT NULL DEFAULT GETDATE(),
     PaymentStatus VARCHAR(20) NOT NULL DEFAULT 'Pending',
     participantID int NOT NULL,
     categoryID int NOT NULL,
     FOREIGN KEY(participantID) REFERENCES PARTICIPANTS(participantID),
     FOREIGN KEY(categoryID) REFERENCES CATEGORIES(categoryID));


CREATE TABLE RESULTS(
    resultsID INT PRIMARY KEY IDENTITY(1,1),
    FinishTime TIME NOT NULL,
    Position INT NOT NULL,
    enrollmentID INT NOT NULL UNIQUE,
    FOREIGN KEY(enrollmentID) REFERENCES ENROLLMENTS(enrollmentID)); 



    --Inserting values into columns
    INSERT INTO USERS (Email, Password, Role) VALUES
    ('org1@raceday.co.za', 'hash_pass1', 'Organiser'),
    ('sipho@gmail.com', 'hash_pass2', 'Participant');



    INSERT INTO PARTICIPANTS (FullName, Gender, DateOfBirth,userID) VALUES
    ('Sipho Mbule', 'Male', '1995-05-10', 2);


    INSERT INTO ORGANISERS (OrganiserName, userID) VALUES
    ('Gauteng Athletics', 1);


    INSERT INTO EVENTS (EventName, EventType, Date, Location, organiserID) VALUES
    ('Soweto Marathon', 'Running', '2026-11-02', 'Soweto, JHB', 1);


    INSERT INTO CATEGORIES (CategoryName, Distance, Fee, eventID) VALUES
    ('Half Marathon', '21km', 250.00, 1);


    INSERT INTO ENROLLMENTS (RaceNumber, PaymentStatus, participantID, categoryID) VALUES
    (1001, 'Paid', 1, 1);


    INSERT INTO RESULTS (FinishTime, Position, enrollmentID) VALUES
    ('01:32:15', 14, 1);


   



   


