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



-- 1-10
select Patient.patientName
from Drug inner join Prescribed on Drug.drugNo=Prescribed.drugNo
inner join Patient on Patient.patientID=Prescribed.patientID
where Drug.drugName like 'Morphine'


Select P.patientID, patientName, ICUName
From (Patient as P inner join Contain as C on P.PatientID = C.PatientID) inner join ICU on C.ICUNo = ICU.ICUNo 

Select ICUName From ICU
Where noOfBeds < 10

Select ICU.ICUNo, ICU.ICUName
From ICU join Contain as C on ICU.ICUNo = C.ICUNo
Where AdmissionDate like '2022-10-01'

Select ICU.ICUNo, ICUName
From ICU join Contain  on ICU.ICUNo = Contain.ICUNo
Where AdmissionDate like '2022-10-01' OR AdmissionDate like '2021-10-01'




Select ICU.ICUNo, ICUName
From ICU join Contain as C on ICU.ICUNo = C.ICUNo
Where AdmissionDate = '2022-10-01'
Union
Select ICU.ICUNo, ICUName
From ICU join Contain as C on ICU.ICUNo = C.ICUNo
Where AdmissionDate != '2021-10-01'

Select PatientName
From Patient
Except
Select PatientName
From Patient as X join Prescribed as P on X.PatientID = P.PatientID


select Patient.patientID
from Drug inner join Prescribed on Drug.drugNo=Prescribed.drugNo
inner join Patient on Patient.patientID=Prescribed.patientID
where Drug.drugName like 'Morphine' 
Union 
select Patient.patientID
from Drug inner join Prescribed on Drug.drugNo=Prescribed.drugNo
inner join Patient on Patient.patientID=Prescribed.patientID
where Drug.drugName like 'Azomax' 


Select C.patientID
from Contain as C left outer join ICU as I on I.ICUName like 'Covid ICU'
where C.admissionDate>'2021-01-05'
Union
Select C.patientID
from Contain as C inner join Patient as P on C.patientID!=P.patientID


Select Drug.drugName 
from Drug
except
select Drug.drugName
from Drug inner join Prescribed on Drug.drugNo=Prescribed.drugNo


-- 11-15
select count(patientID) as TotalPatients
from Patient
