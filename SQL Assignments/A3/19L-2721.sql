CREATE DATABASE Assignment19L2721
use Assignment19L2721

-- drop table patient
-- drop table ICU
-- drop table Contain
-- drop table Drug
-- drop table Prescribed

CREATE TABLE Patient (
  patientID integer NOT NULL primary key,
  patientName varchar(50) NOT NULL,
  patientAddress varchar(50) NOT NULL,
  patientDOB date NOT NULL
);

CREATE TABLE ICU (
  ICUNo integer NOT NULL primary key,
  ICUName varchar(50) NOT NULL,
  ICUType varchar(50) NOT NULL,
  noOfBeds integer NOT NULL
);

CREATE TABLE Contain (
  patientID integer NOT NULL,
  ICUNo integer NOT NULL,
  admissionDate date NOT NULL,
  primary key(patientID, ICUNo),
  FOREIGN KEY (patientID) REFERENCES Patient(patientID),
  FOREIGN KEY (ICUNo) REFERENCES ICU(ICUNo)
);

CREATE TABLE Drug (
  drugNo integer NOT NULL primary key,
  drugName varchar(50) NOT NULL,
  costPerUnit float NOT NULL
);
CREATE TABLE Prescribed (
  patientID integer NOT NULL,
  drugNo integer NOT NULL,
  startDate date NOT NULL,
  unitsPerDay integer NOT NULL,
  finishDate date NOT NULL,
  primary key(patientID, drugNo,startDate),
  FOREIGN KEY (patientID) REFERENCES Patient(patientID),
  FOREIGN KEY (drugNo) REFERENCES Drug(drugNo)
);
go

INSERT INTO Patient VALUES (1,'John Snow','218-Edinburg,Ireland','2000-01-31');
INSERT INTO Patient VALUES (2,'The Undertaker','999-Death Valley, US','1850-07-14');
INSERT INTO Patient VALUES (3,'Kane Williamson','307-Wellington NewZealand','1985-05-03');
INSERT INTO Patient VALUES (4,'Virat Kohli','414-New Delhi, India','1982-12-29');
INSERT INTO Patient VALUES (5,'James Falukner','882-Sydney, Australia','1979-02-12');

INSERT INTO ICU VALUES (6,'Surgical','New',6);
INSERT INTO ICU VALUES (8,'Non Surgical','New',20);
INSERT INTO ICU VALUES (1,'Male','New',16);
INSERT INTO ICU VALUES (3,'Female','Old',3);
INSERT INTO ICU VALUES (5,'Operative','Old',7);


INSERT INTO Contain VALUES (5,1,'2022-10-23');
INSERT INTO Contain VALUES (3,1,'2021-09-24');
INSERT INTO Contain VALUES (4,3,'2019-02-12');
INSERT INTO Contain VALUES (2,1,'2015-01-01');
INSERT INTO Contain VALUES (1,1,'2009-11-09');


INSERT INTO DRUG VALUES (7,'Morphine',20);
INSERT INTO DRUG VALUES (9,'Ciprofloacin',15);
INSERT INTO DRUG VALUES (1,'Glucophage',10);
INSERT INTO DRUG VALUES (4,'Losartan',5);
INSERT INTO DRUG VALUES (3,'Ibrufen',30);
INSERT INTO DRUG VALUES (2,'Azomax',70);


INSERT INTO Prescribed VALUES (1,7,'2012-02-21',2,'2012-02-22');
INSERT INTO Prescribed VALUES (1,1,'2012-02-21',1,'2012-02-23');
INSERT INTO Prescribed VALUES (4,7,'2022-02-21',3,'2022-02-24');
INSERT INTO Prescribed VALUES (5,7,'2012-02-21',5,'2012-02-22');
INSERT INTO Prescribed VALUES (3,3,'2021-02-21',4,'2021-02-24');
INSERT INTO Prescribed VALUES (3,2,'2021-02-20',4,'2021-02-22');



-- (1)
select patientName,
CAST(DATEDIFF(DD,patientDOB,GETDATE())/365.25 AS INT)as Age
from Patient 
where patientID NOT IN
(
select patientID from Prescribed
)

-- (2)
(Select ICUName from ICU where ICUNo in 
(Select ICUNo from ICU where noOfBeds>10 AND ICUNo in
(Select ICUNo from Contain group by ICUNo)))

-- (3)
select patientName from Patient
where PatientID IN
(
select patientID from prescribed
where drugNo IN
(
select drugNo
from drug
where drugName='Azomax'
)
)
INTERSECT
select patientName from Patient
where PatientID IN
(
select patientID from prescribed
where drugNo IN
(
select drugNo
from drug
where drugName='Morphine'
)
)

-- (4)
select Patient.patientName as Patient,Drug.drugName as Drug_Administered
from (Patient join Prescribed on Patient.patientID=Prescribed.patientID) join Drug on (Drug.drugNo=Prescribed.drugNo)

-- (5)
Select PatientName from Patient where patientID IN 
                                      (
                                       Select Patientid from Prescribed where drugNo IN
                                      (
                                       Select DrugNo from Prescribed where patientID=
                                      (Select Patientid from Patient where patientName='Ali')
                                      ))
                                      AND
                                      PatientName <>'Ali'


-- (6)
Select PatientName from Patient as Patients_with_same_drugs where patientID IN
(Select distinct P.Patientid from Prescribed P, Prescribed Q where P.drugNo=Q.drugNo AND P.patientID<>Q.patientID)

-- (7)
Select DrugName from Drug
where drugNo NOT IN
(
Select DrugNo from Prescribed
)

-- (8)
select patientName,
CAST(DATEDIFF(DD,patientDOB,GETDATE())/365.25 AS INT)as Age
from Patient
where CAST(DATEDIFF(DD,patientDOB,GETDATE())/365.25 AS INT)>
(
select AVG(CAST(DATEDIFF(DD,patientDOB,GETDATE())/365.25 AS INT))
from Patient
)

-- (9)

CREATE VIEW temp
AS
Select ICUNo,COUNT(patientID) as No_of_Patients from [Contain] group by ICUNo
go
Select ICUname from ICU where ICUNo=
(Select ICUNo from temp where No_of_Patients=
(Select min(No_of_Patients) from temp)
)
go
drop view temp
go



-- (10)
(
select patientName
from Patient
where CAST(DATEDIFF(DD,patientDOB,GETDATE())/365.25 AS INT)<25
)
INTERSECT
(
select patientName from Patient
where PatientID IN
(
select patientID from prescribed
where drugNo =
(
select drugNo
from drug
where drugName='Panadol'
)
)
)

-- (A)
Create view V1 
as
Select PatientName,Drug.drugName,DATEDIFF(DD,Prescribed.startDate,Prescribed.finishDate) as days from Patient join Prescribed on Patient.patientID=Prescribed.patientID 
join Drug on Drug.drugNo=Prescribed.drugNo
go
select * from V1
go

-- (B)
Create view temp
as
Select Prescribed.patientID,count(Prescribed.drugNo) as No_of_drugs,sum(Drug.costPerUnit) as COST from Patient join Prescribed on Patient.patientID=Prescribed.patientID 
join Drug on Drug.drugNo=Prescribed.drugNo group by Prescribed.patientID
go
Create view V2
as
Select Patient.patientName,No_of_drugs,COST from temp join Patient on Patient.patientID=temp.patientID
where 
No_of_drugs>5 AND CAST(DATEDIFF(DD,patientDOB,GETDATE())/365.25 AS INT)>=18
go
Select * from V2
go
drop view temp

-- (C)
CREATE TRIGGER T1 ON Prescribed
FOR INSERT, UPDATE
AS
IF EXISTS (Select * from Prescribed P JOIN Patient Q on P.patientID=Q.patientID join Drug D on P.DrugNo=D.DrugNo
where CAST(DATEDIFF(DD,Q.patientDOB,GETDATE())/365.25 AS INT) <18 AND D.costPerUnit >2500)
BEGIN
PRINT 'Patient aged less than 18 is administered drug costing more than 2500'
END

-- (D)
CREATE TRIGGER T2 ON Contain
FOR INSERT, Delete
as
if exists (select (select count(PatientId)from [Contain])/( select count(ICUNo)from[ICU]))
BEGIN
PRINT 'Average patients in ICU less than 5'
END