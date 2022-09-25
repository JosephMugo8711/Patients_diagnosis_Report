-- The data analyst of a hospital wants to store the patient diagnosis reports with the details of the doctors and 
-- The patients for good medical practice and continuity of care.

-- Objective:

-- The database design helps to retrieve, update, and modify the patient’s details to keep track of the patient's health care routine.
create database patient_diagnosis;
use patient_diagnosis;

-- Write a query to create a patients table with the fields such as 
-- date, patient id, patient name, age, weight, gender, location, phone number, disease, doctor name, and doctor id.
CREATE TABLE patients(  
date date default '0000-00-00',
patient_id varchar(20) NOT NULL,
patient_name VARCHAR(100) NOT NULL, 
age INT NOT NULL, 
weight INT NOT NULL, 
gender CHAR(20) NOT NULL, 
location VARCHAR(50) NOT NULL, 
phone_number INT NOT NULL ,
disease CHAR(20) NOT NULL , 
doctor_name VARCHAR(20) NOT NULL,  
doctor_id INT NOT NULL
 );
 
DROP TABLE patients;


-- Write a query to insert values into the patients table.
INSERT INTO patients  VALUES 
('2019-06-15','AP2021','Sarath','67','76','Male','chennai','5462829','Cardiac','Mohan','21'),	
('2019-02-13','AP2022','John','62','80','Male','banglore','1234731','Cancer','Suraj','22'),
('2018-01-08','AP2023','Henry','43','65','Male','Kerala','9028320','Liver','Mehta','23'),
('2020-02-04','AP2024','Carl','56','72','Female','Mumbai','9293829','Asthma','Karthik','24'),
('2017-09-15','AP2025','Shikar','55','71','Male','Delhi','7821281','Cardiac','Mohan','21'),
('2017-03-25','AP2027','Stephen','69','55','Male','Gujarat','8888211','Liver','Mehta','23'),
('2019-04-22','AP2028','Aaron','75','53','Male','Banglore','9012192','Asthma','Karthik','24');

-- Write a query to display the total number of patients in the table.
-- SELECT count( * ) as total_patients FROM patients;
select count(patient_id) from patients;

-- Write a query to display the patient id, patient name, gender, and disease of the patient whose age is maximum.
-- select patient_id, patient_name ,gender,disease from patients where age = (select max(age) as max_age from patients);
SELECT  patient_id, patient_name, gender, disease FROM patients WHERE age = (SELECT max(age) as max_age FROM patients); 
-- Write a query to display patient id and patient name with the current date.

SELECT curdate() TODAY, patient_id, patient_name FROM patients;

-- Write a query to display the old patient’s name and new patient's name in uppercase.
SELECT max(ucase(patient_name)) as new_patient, min(Ucase(patient_name)) as old_patient from patients;

-- Write a query to display the patient’s name along with the length of their name.

SELECT patient_name, length(patient_name) as patient_name_length FROM patients;

-- Write a query to display the patient’s name, and the gender of the patient must be mentioned as M or F.

SELECT patient_name,
    SUBSTRING(Gender, 1,1)
FROM patients;

select patient_name
    , case when gender = 'Male' then 'M' when gender = 'Female' then 'F' else 'Unknown' end 
from patients;

-- Write a query to combine the names of the patient and the doctor in a new column.

SELECT CONCAT(patient_name,' ',doctor_name) AS combined_cactegory  FROM patients;
-- Write a query to display the patients’ age along with the logarithmic value (base 10) of their age.
 -- LOG10 () function is a mathematical function that returns the base-10 logarithm of the specified float expression. 
 -- You specify the float expression as an argument.
 
 SELECT log10(age) logarithm FROM patients;

-- Write a query to extract the year from the given date in a separate column.
 SELECT year(date) AS year_column FROM patients;

-- Write a query to return NULL if the patient’s name and doctor’s name are similar else return the patient’s name.
SELECT if (patient_name=doctor_name, 'yes','no') FROM patients;

select  patient_name, doctor_name , case when patient_name =doctor_name THEN 'NULL' WHEN patient_name<>doctor_name THEN patient_name  end FROM  patients;
-- Write a query to return Yes if the patient’s age is greater than 40 else return No.
SELECT age, case when age>40 THEN 'Yes' when age<40 THEN 'No' end as comparison FROM patients;
-- Write a query to display the doctor’s duplicate name from the table.
SELECT doctor_name as doctor_duplicate FROM patients;
-- Defining the Criteria: Here we define criteria for only the doctor_name column is selected from the patients table.
-- using the GROUP BY clause to group the identical rows in the doctor_name column
-- Then we are finding the number of duplicates in that column using the COUNT() function and show that data in a new column named Occurrence.
-- Having a clause only keeps the groups that have more than one occurrence.
SELECT doctor_name,COUNT(*) AS Occurrence FROM patients  GROUP BY doctor_name HAVING COUNT(*)>1; 





