-- 1. Database Design & Table Creation (DDL)
 
 CREATE DATABASE HEALTH;
 USE HEALTH;
 
 -- Create Table Patients
 CREATE TABLE PATIENTS (
    PATIENTID INT PRIMARY KEY,
    NAME VARCHAR(150) NOT NULL,
    DATEOFBIRTH DATE,
    CONTACTNUMBER VARCHAR(15) UNIQUE,
    EMAIL VARCHAR(100) UNIQUE
);

-- Create Table InsurancePlan
 CREATE TABLE INSURANCEPLANS (
    PLANID INT PRIMARY KEY,
    PLANNAME VARCHAR(100) NOT NULL,
    COVERAGEAMOUNT DECIMAL(12, 2) NOT NULL,
    PREMIUMAMOUNT DECIMAL(10, 2) NOT NULL
);

-- Create Table Claims
CREATE TABLE CLAIMS (
    CLAIMID INT PRIMARY KEY,
    PATIENTID INT,
    CLAIMDATE DATETIME NOT NULL,
    CLAIMAMOUNT DECIMAL(10, 2) NOT NULL,
    STATUS VARCHAR(50) CHECK (STATUS IN ('Pending', 'Approved', 'Rejected')),
    FOREIGN KEY (PATIENTID) REFERENCES PATIENTS(PATIENTID)
);
 
 -- Create Table ClaimsDetails
CREATE TABLE CLAIMSDETAILS (
    CLAIMDETAILID INT PRIMARY KEY,
    CLAIMID INT,
    DESCRIPTION TEXT,
    AMOUNTCOVERED DECIMAL(10, 2),
    FOREIGN KEY (CLAIMID) REFERENCES CLAIMS(CLAIMID)
);

-- Create Table InsuranceCompanies
CREATE TABLE INSURANCECOMAPNIES (
    COMPANYID INT PRIMARY KEY,
    COMPANYNAME VARCHAR(200) NOT NULL,
    CONTACTINFO VARCHAR(100)
);

-- Create Table PolicyHolder
CREATE TABLE POLICYHOLDERS (
    POLICYHOLDERID INT PRIMARY KEY,
    PATIENTID INT,
    PLANID INT,
    STARTDATE DATE NOT NULL,
    ENDDATE DATE,
    FOREIGN KEY (PATIENTID) REFERENCES PATIENTS(PATIENTID),
    FOREIGN KEY (PLANID) REFERENCES INSURANCEPLANS(PLANID)
);


-- I(4) Modify a column (e.g., increase size or change type).
ALTER TABLE PATIENTS MODIFY NAME VARCHAR(255);

-- I(5) -- Rename a table (e.g., rename ClaimsDetails to ClaimItems)
RENAME TABLE CLAIMSDETAILS TO CLAIMITEMS;


--  2. Data Insertion & Manipulation (DML)
-- II(6) Insert at least 20–30 rows of sample data into each table.
-- -- Insert data into Patients
INSERT INTO PATIENTS (PATIENTID, NAME, DATEOFBIRTH, CONTACTNUMBER, EMAIL)
VALUES
(1, 'John Walker','1990-05-15','123-456-7890','john.doe1@.com'),
(2, 'Jack Smith','1985-10-20','987-654-3210','jane.smith2@.com'),
(3, 'Nick Jones','1978-03-01','555-123-4567','robert.jones3@.com'),
(4, 'Alia bhatt','1979-04-05','128-963-7587','alia.bhatt4@.com'),
(5, 'Alice Brown','1992-08-10','111-222-3333','alice.brown@.com'),
(6, 'Sunil Grover','1991-04-23','178-265-8547','sunil.g@.com'),
(7, 'Rinku Singh','1990-02-08','456-79-1234','rinku.s@.com'),
(8, 'Anjali Mehta','1990-03-15','988-654-3210','anjali.mehta@.com'),
(9, 'Rajiv Kumar','1985-07-20','998-877-6655','rajiv.kumar@.com'),
(10, 'Priya Sharma','1993-11-12','975-310-6428','priya.sharma@.com'),
(11, 'Kavita Joshi','1989-06-25','789-654-1230','kavita.joshi@.com'),
(12, 'Arjun Patel','1991-08-05','988-765-4321','arjun.patel@.com'),
(13, 'Meera Rao','1997-02-11','148-963-7597','meera@.com'),
(14, 'Seema Rao','1996-02-23','123-963-1598','seema@.com'),
(15, 'Weemley Singh','1989-02-21','896-123-4587','weemley@.com'),
(16, 'Ankush Singh','1997-05-21','452-963-1254','ankush.s@.com'),
(17, 'Bhairav Nath','1993-02-16','425-963-1256','bhairav.n@.com'),
(18, 'Devansh Dhim','1996-04-18','120-789-1254','dev@.com'),
(19, 'Ruhi Dev','1999-06-01','982-241-2356','rhui.d@.com'),
(20, 'Shambhu','1972-11-07','785-365-4296','shambhu@.com');

-- Insert data into InsurancePlans
INSERT INTO INSURANCEPLANS (PLANID, PLANNAME, COVERAGEAMOUNT, PREMIUMAMOUNT)
VALUES
(101, 'Basic Health', 100000.00, 1500.00),
(102, 'Silver Health', 200000.00, 2500.00),
(103, 'Gold Health', 500000.00, 4500),
(104, 'Platinum Health', 1000000.00, 7500.00),
(105, 'Family Care', 300000.00, 3500.00),
(106, 'Senior Secure', 200000.00, 3000.00),
(107, 'Premium Family', 700000.00, 6000.00),
(108, 'Travel Care', 150000.00, 2000.00),
(109, 'Student Health', 100000.00, 1200.00),
(110, 'Corporate Secure', 500000.00, 4800.00),
(111, 'Critical Illness Cover', 10000.00, 8000.00),
(112, 'Accident Protector', 250000.00, 2200.00),
(113, 'Maternity Cover', 150000.00, 1800.00),
(114, 'Child Secure', 100000.00, 1500.00),
(115, 'Elite Care', 20000.00, 12000.00),
(116, 'Wellness Plus', 300000.00, 2700.00),
(117, 'Cancer Care', 1000000.00, 8500.00),
(118, 'Diabetes Secure', 500000.00, 5000.00),
(119, 'Heart Care', 750000.00, 6200.00),
(120, 'Fitness Shield', 250000.00, 2400.00);

-- Insert data into claims
INSERT INTO CLAIMS (CLAIMID, PATIENTID, CLAIMDATE, CLAIMAMOUNT, STATUS)
VALUES
(231, 1, '2023-11-01 10:00:00', 1500.00, 'Pending'),
(232, 2, '2023-11-05 14:30:00', 2000.00, 'Approved'),
(233, 3, '2023-11-10 09:15:00', 750.00, 'Rejected'),
(234, 4, '2023-12-15 12:00:00', 1000.00, 'Pending'),
(235, 5, '2023-12-16 09:30:00', 1200.00, 'Approved'),
(206, 6, '2023-12-17 14:45:00', 1800.00, 'Rejected'),
(207, 7, '2023-12-18 10:15:00', 900.00, 'Pending'),
(208, 8, '2023-12-19 16:00:00', 2100.00, 'Approved'),
(209, 9, '2023-12-20 11:30:00', 750.00, 'Rejected'),
(210, 10, '2023-12-21 12:00:00', 1500.00, 'Pending'),
(211, 11, '2023-12-22 15:20:00', 2700.00, 'Approved'),
(212, 12, '2023-12-23 09:45:00', 1000.00, 'Pending'),
(213, 13, '2023-12-24 13:10:00', 2000.00, 'Rejected'),
(214, 14, '2023-12-25 17:50:00', 3200.00, 'Approved'),
(215, 15, '2023-12-26 10:25:00', 850.00, 'Pending'),
(216, 16, '2023-12-27 11:40:00', 1400.00, 'Approved'),
(217, 17, '2023-12-28 08:50:00', 2400.00, 'Pending'),
(218, 18, '2023-12-29 14:00:00', 1100.00, 'Rejected'),
(219, 19, '2023-12-30 16:30:00', 1900.00, 'Approved'),
(220, 20, '2023-11-07 15:10:00', 2200.00, 'Rejected');

-- Insert data into ClaimItems
INSERT INTO CLAIMITEMS (CLAIMDETAILID, CLAIMID, DESCRIPTION, AMOUNTCOVERED)
VALUES
(301, 231, 'Medical consultation', 500.00),
(302, 232, 'Medication', 1000.00),
(303, 233, 'Hospital stay', 1800.00),
(304, 234, 'Follow-up visit', 200.00),
(305, 235, 'Surgery', 3000.00),
(306, 206, 'Emergency room visit', 800.00),
(307, 207, 'Ambulance service', 1500.00),
(308, 208, 'Dental procedure', 750.00),
(309, 209, 'Diagnostic tests', 1200.00),
(310, 210, 'Physiotherapy', 900.00),
(311, 211, 'Rehabilitation program', 1800.00),
(312, 212, 'Vision care', 600.00),
(313, 213, 'Hearing aids', 1100.00),
(314, 214, 'Specialist consultation', 1000.00),
(315, 215, 'Mental health therapy', 1500.00),
(316, 216, 'Preventive health checkup', 500.00),
(317, 217, 'Vaccination', 300.00),
(318, 218, 'Post-surgery follow-up', 400.00),
(319, 219, 'Occupational therapy', 800.00),
(320, 220, 'Home healthcare', 2000.00);

-- -- Insert data into InsuranceCompanies
INSERT INTO INSURANCECOMAPNIES (COMPANYID, COMPANYNAME, CONTACTINFO)
VALUES
(401, 'Bajaj Insurance Co.', 'info@abcinsurance.com'),
(402, 'Siya Health Plan', 'contact@xyzhealth.com'),
(403, 'PQR Medical Group', 'support@pqrmedical.com'),
(404, 'MNO Health Services', 'help@mnohealth.com'),
(405, 'Delta Wellness Inc.', 'wellness@delta.com'),
(406, 'Omega Healthcare', 'contact@omegahealthcare.com'),
(407, 'Prime Insurance Solutions', 'info@primeinsurance.com'),
(408, 'Beacon Life Insurance', 'support@beaconlife.com'),
(409, 'NextCare Health Plan', 'nextcare@healthplan.com'),
(410, 'SecureShield Insurance', 'secure@shieldinsurance.com'),
(411, 'United Coverage Group', 'united@coveragegroup.com'),
(412, 'Blue Horizon Insurance', 'bluehorizon@insurance.com'),
(413, 'SafePoint Medical', 'contact@safepoint.com'),
(414, 'CareFirst Health', 'carefirst@healthservices.com'),
(415, 'EliteCare Insurance Co.', 'elitecare@insurance.com'),
(416, 'HealthChoice Partners', 'partners@healthchoice.com'),
(417, 'TrueValue Insurance', 'contact@truevalue.com'),
(418, 'Excel Medical Group', 'excel@medicalgroup.com'),
(419, 'LifeLine Health Corp.', 'info@lifelinehealth.com'),
(420, 'GlobalCare Services', 'global@careservices.com');

-- Insert data into Policyholders
INSERT INTO POLICYHOLDERS (POLICYHOLDERID, PATIENTID, PLANID, STARTDATE, ENDDATE)
VALUES
(501, 1, 101, '2023-01-01', '2023-12-31'),
(502, 2, 102, '2023-02-15', '2024-02-14'),
(503, 3, 103, '2023-03-01', '2024-03-01'),
(504, 4, 104, '2023-05-20', '2024-05-19'),
(505, 5, 105, '2023-06-01', '2024-05-31'),
(506, 6, 106, '2023-07-10', '2024-07-09'),
(507, 7, 107, '2023-08-15', '2024-08-14'),
(508, 8, 108, '2023-09-05', '2024-09-04'),
(509, 9, 109, '2023-10-01', '2024-09-30'),
(510, 10, 110, '2023-11-11', '2024-11-10'),
(511, 11, 111, '2023-12-20', '2024-12-19'),
(512, 12, 112, '2024-01-25', '2025-01-24'),
(513, 13, 113, '2024-02-14', '2025-02-13'),
(514, 14, 114, '2024-03-01', '2025-02-28'),
(515, 15, 115, '2024-04-01', '2025-03-31'),
(516, 16, 116, '2024-05-10', '2025-05-09'),
(517, 17, 117, '2024-06-12', '2025-06-11'),
(518, 18, 118, '2024-07-08', '2025-07-07'),
(519, 19, 119, '2024-08-20', '2025-08-19'),
(520, 20, 120, '2024-09-01', '2025-08-31');

-- II(7) Update specific rows based on conditions.
UPDATE CLAIMS SET STATUS = 'Approved' WHERE CLAIMID = 201;

-- II(8) Delete one or more records using conditions.
DELETE FROM CLAIMITEMS WHERE CLAIMID = 203;

-- II(9) Insert multiple rows using a single statement.
INSERT INTO CLAIMS (CLAIMID, PATIENTID, CLAIMDATE, CLAIMAMOUNT, STATUS) 
VALUES
(251, 1, '2024-01-01 10:00:00', 1600.00, 'Pending'),
(252, 2, '2024-01-05 14:30:00', 2100.00, 'Approved'),
(253, 3, '2024-01-10 09:15:00', 850.00, 'Rejected'),
(244, 4, '2024-02-07 10:10:00', 1200.00, 'Approved');

-- II(10) Use LOCK to control concurrent updates (optional for advanced users).


-- 3. SELECT Queries & Filtering
-- III(11) Retrieve all data from a table.
SELECT * FROM PATIENTS;

-- III(12) Select specific columns with WHERE conditions.
SELECT NAME, EMAIL FROM PATIENTS WHERE PATIENTID = 2;

-- III(13) Use BETWEEN, IN, IS NULL, LIKE for filtering.
SELECT * FROM CLAIMS WHERE CLAIMAMOUNT BETWEEN 1000 AND 2000;
SELECT * FROM PATIENTS WHERE PATIENTID IN (1, 3);
SELECT * FROM POLICYHOLDERS WHERE ENDDATE IS NULL;
SELECT * FROM PATIENTS WHERE NAME LIKE 'J%';

-- III(14) Show top 5 records using LIMIT or sorted by a column.
SELECT * FROM CLAIMS ORDER BY CLAIMAMOUNT DESC LIMIT 5;
SELECT NAME FROM PATIENTS ORDER BY DATEOFBIRTH ASC;

-- III(15) Combine filters using AND, OR, and NOT.
SELECT * FROM CLAIMS WHERE STATUS = 'Pending' AND CLAIMAMOUNT > 1000;
SELECT * FROM PATIENTS WHERE PATIENTID = 1 OR PATIENTID = 2;
SELECT * FROM CLAIMS WHERE NOT STATUS = 'Rejected';

--  4. Sorting, Distinct, and Pagination
-- IV(16) Display unique values from a column using DISTINCT.
SELECT DISTINCT STATUS FROM CLAIMS;

-- IV(17) Sort records in ascending/descending order using ORDER BY.
SELECT * FROM PATIENTS ORDER BY NAME ASC;
SELECT * FROM CLAIMS ORDER BY CLAIMDATE DESC;

-- IV(18) Implement pagination using LIMIT and OFFSET.
SELECT * FROM PATIENTS ORDER BY PATIENTID LIMIT 2 OFFSET 1;


--  5. Aggregate Functions & Grouping
-- V(19) Use COUNT, SUM, AVG, MIN, MAX on relevant numeric columns.
SELECT COUNT(*) FROM PATIENTS;
SELECT SUM(CLAIMAMOUNT) FROM CLAIMS;
SELECT AVG(CLAIMAMOUNT) FROM CLAIMS;
SELECT MIN(CLAIMAMOUNT) FROM CLAIMS;
SELECT MAX(CLAIMAMOUNT) FROM CLAIMS;

-- V(20) Group records by a specific column and apply aggregation.
SELECT PATIENTID, COUNT(*) AS NUMBEROFCLAIMS FROM CLAIMS GROUP BY PATIENTID;

-- V(21) Filter groups using HAVING (e.g., show groups with more than 3 items).
SELECT PATIENTID, AVG(CLAIMAMOUNT) AS AVERAGECLAIMAMOUNT
FROM CLAIMS
GROUP BY PATIENTID
HAVING COUNT(*) > 3;

--  6. Joins
-- VI(22) Use INNER JOIN to combine data from at least two related tables.
SELECT PATIENTS.NAME, CLAIMS.CLAIMAMOUNT
FROM PATIENTS
INNER JOIN CLAIMS ON PATIENTS.PATIENTID = CLAIMS.PATIENTID;

-- VI(23) Use LEFT JOIN or RIGHT JOIN to display unmatched data as well.
SELECT PATIENTS.Name, POLICYHOLDERS.PLANID
FROM PATIENTS
LEFT JOIN POLICYHOLDERS ON PATIENTS.PATIENTID = POLICYHOLDERS.PATIENTID;

-- VI(24)Join three or more tables to produce a meaningful report.
SELECT PATIENTS.Name, CLAIMS.CLAIMAMOUNT, INSURANCEPLANS.PLANNAME
FROM PATIENTS
INNER JOIN CLAIMS ON PATIENTS.PATIENTID = CLAIMS.PATIENTID
INNER JOIN POLICYHOLDERS ON PATIENTS.PATIENTID = POLICYHOLDERS.PATIENTID
INNER JOIN INSURANCEPLANS ON POLICYHOLDERS.PLANID = INSURANCEPLANS.PLANID;

--  7. Subqueries
-- VII(25)Write a subquery in WHERE to compare against aggregated data.
SELECT * FROM CLAIMS
WHERE CLAIMAMOUNT > (SELECT AVG(CLAIMAMOUNT) FROM CLAIMS);

-- VII(26)Use a subquery in FROM as a derived table.
SELECT PATIENTID, AVG(CLAIMAMOUNT) AS AVGCLAIMAMOUNT
FROM (SELECT PATIENTID, CLAIMAMOUNT FROM CLAIMS) AS CLAIMSUBQUERY
GROUP BY PATIENTID;

-- VII(27)Implement a correlated subquery for row-wise comparison.
SELECT *
FROM PATIENTS P
WHERE EXISTS (
    SELECT 1
    FROM CLAIMS C
    WHERE C.PATIENTID = P.PATIENTID
      AND C.CLAIMAMOUNT > 1000
);

-- 8. String Functions
-- VIII(28)Concatenate two or more columns into one.
SELECT CONCAT(NAME, ' - ', EMAIL) AS PATIENTINFO FROM PATIENTS;

-- VIII(29)Change the case of text using UPPER or LOWER.
SELECT UPPER(NAME) FROM PATIENTS;
SELECT LOWER(EMAIL) FROM PATIENTS;

-- VIII(30) Use SUBSTRING, REPLACE, or REVERSE on text fields.
SELECT SUBSTRING(NAME, 1, 4) FROM PATIENTS;
SELECT REPLACE(EMAIL, 'example', 'sample') FROM PATIENTS;
SELECT REVERSE(NAME) FROM PATIENTS;

-- VIII(31)Extract left/right parts of a string, Use Other Strings.
SELECT LEFT(NAME, 5) AS LeftPart FROM PATIENTS;
SELECT RIGHT(EMAIL, 10) AS RightPart FROM PATIENTS;
SELECT LEFT(NAME, 3) AS Initials, RIGHT(EMAIL, 5) AS DomainHint FROM PATIENTS;

--  9. Date & Time Functions
-- IX(32) Extract parts of a date (year, month, day) using YEAR(), MONTH(), etc.
SELECT YEAR(DATEOFBIRTH) FROM PATIENTS;
SELECT MONTH(CLAIMDATE) FROM CLAIMS;
SELECT DAY(STARTDATE) FROM POLICYHOLDERS;

-- IX(33)Get current date/time using NOW(), CURDATE(), CURTIME().
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();

-- IX(34) Find the difference between two dates using DATEDIFF() or TIMESTAMPDIFF().
SELECT DATEDIFF(ENDDATE, STARTDATE) FROM POLICYHOLDERS WHERE ENDDATE IS NOT NULL;
SELECT TIMESTAMPDIFF(YEAR, STARTDATE, ENDDATE) FROM POLICYHOLDERS WHERE ENDDATE IS NOT NULL;

-- IX(35) Add or subtract time from a date using DATE_ADD() or DATE_SUB()
SELECT DATE_ADD(CLAIMDATE, INTERVAL 7 DAY) FROM CLAIMS;
SELECT DATE_SUB(DATEOFBIRTH, INTERVAL 20 YEAR) FROM PATIENTS;

-- 10. Conditional Logic & CASE
-- X(36)-- Use CASE to assign labels (e.g., rating, status, grade) based on column values
SELECT
    Name,
    CASE
        WHEN YEAR(DateOfBirth) < 1990 THEN 'Older'
        WHEN YEAR(DateOfBirth) >= 1990 THEN 'Younger'
        ELSE 'Unknown'
    END AS AgeCategory
FROM Patients;

-- X(37)Use CASE in ORDER BY or UPDATE to apply dynamic logic.
SELECT CLAIMAMOUNT, STATUS
FROM CLAIMS
ORDER BY
    CASE
        WHEN STATUS = 'Pending' THEN 1
        WHEN STATUS = 'Approved' THEN 2
        WHEN STATUS = 'Rejected' THEN 3
        ELSE 4
    END;
    
-- 11. Views
-- XI(38) Create a view that summarizes key data (e.g., top customers, popular products).
CREATE VIEW PATIENTSCLAIMSUMMARY AS
SELECT
    P.PATIENTID,
    P.NAME,
    COUNT(C.CLAIMID) AS TOTALCLAIMS,
    SUM(C.CLAIMAMOUNT) AS TOTALCLAIMAMOUNT
FROM PATIENTS P
LEFT JOIN CLAIMS C ON P.PATIENTID = C.PATIENTID
GROUP BY P.PATIENTID, P.NAME;

-- XI(39)Create a view for public reporting (e.g., showing only non-sensitive data).
CREATE VIEW PUBLICPATIENTDETAILS AS
SELECT
    PATIENTID,
    NAME
FROM PATIENTS;

-- XI(40) Query the view using filters and joins.
SELECT * FROM PATIENTSCLAIMSUMMARY WHERE TOTALCLAIMS > 1;
SELECT P.Name, PCS.TOTALCLAIMS FROM PUBLICPATIENTDETAILS P JOIN PATIENTSCLAIMSUMMARY PCS ON P.PATIENTID = PCS.PATIENTID;

-- 12. ER Diagram 
-- XII(41)






