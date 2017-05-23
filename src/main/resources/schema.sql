--CREATE DATABASE insurances;

DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Insurance;
DROP TABLE IF EXISTS Insurance_Type;
DROP TABLE IF EXISTS Contact;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Privilige;

CREATE TABLE Privilige(
Privilige_ID int,
Privilige varchar(255),
PRIMARY KEY (Privilige_ID)
);

CREATE TABLE Users(
User_ID int,
Username varchar(255),
Password varchar(255),
Privilige_ID int,
PRIMARY KEY (User_ID),
CONSTRAINT PrivilegeFK FOREIGN KEY (Privilige_ID) REFERENCES Privilige(Privilige_ID)
);

CREATE TABLE Contact(
Contact_ID int,
Street varchar(255),
House_Number varchar(10),
Flat_Number varchar(10),
Postcode varchar (255),
City varchar (255),
Phone varchar (255),
Phone2 varchar (255),
Email varchar (255),
PRIMARY KEY (Contact_ID)
);

CREATE TABLE Insurance_Type(
Ins_Type_ID int,
Ins_Type varchar(225),
Insurance_Amount number(13,2),
Cost number(13,2),
Payment_Type varchar(255),
PRIMARY KEY (Ins_Type_ID)
);

CREATE TABLE Insurance(
Insurance_ID int,
DateStart date,
DateEnd date,
Ins_Type_ID int,
PRIMARY KEY (Insurance_ID),
CONSTRAINT InsuranceTypeFK FOREIGN KEY (Ins_Type_ID) REFERENCES Insurance_Type(Ins_Type_ID)
);

CREATE TABLE Client(
Client_ID int,
Name varchar(255),
Name2 varchar(255),
Surname varchar(255),
DOB date,
PESEL int,
Contact_ID int,
Insurance_ID int,
PRIMARY KEY (Client_ID),
CONSTRAINT ContactFK FOREIGN KEY (Contact_ID) REFERENCES Contact(Contact_ID),
CONSTRAINT InsuranceFK FOREIGN KEY (Insurance_ID) REFERENCES Insurance(Insurance_ID)
);


commit;

--exit;