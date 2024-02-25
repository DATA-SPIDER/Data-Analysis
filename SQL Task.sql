USE test

-- Create LoanOfficers table
CREATE TABLE LoanOfficers (
    LoanOfficerID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);


-- Insert data for 8 Loan Officers with explicit IDs
INSERT INTO LoanOfficers (LoanOfficerID, firstname, lastname) VALUES
(1, 'Gela', 'Gnolidze'),
(2, 'Suliko', 'Sulikiani'),
(3, 'Jemal', 'Kverenchxiladze'),
(4, 'Bichola', 'Gazdeliani'),
(5, 'Luka', 'Khitaridze'),
(6, 'Levani', 'Bichashvili'),
(7, 'Zaal', 'Jangavadze'),
(8, 'Lela', 'Kozanashvili');


-- Create LoanIssued table
CREATE TABLE LoanIssued (
    LoanIssuedID INT PRIMARY KEY IDENTITY(1,1),
    OfficerID INT,
    AmountOfLoan DECIMAL(10, 2),
    Currency VARCHAR(10),
    FOREIGN KEY (OfficerID) REFERENCES LoanOfficers(LoanOfficerID)
);


-- Insert data for 20 Loan Issued entries
INSERT INTO LoanIssued (OfficerID, AmountOfLoan, Currency) VALUES
(1, 50000.00, 'GEL'),
(2, 75000.00, 'EURO'),
(3, 100000.00, 'USD'),
(4, 60000.00, 'STERLING'),
(5, 80000.00, 'GEL'),
(1, 120000.00, 'EURO'),
(6, 90000.00, 'STERLING'),
(7, 55000.00, 'USD'),
(2, 70000.00, 'EURO'),
(8, 95000.00, 'STERLING'),
(1, 30000.00, 'USD'),
(3, 85000.00, 'EURO'),
(4, 110000.00, 'STERLING'),
(5, 40000.00, 'GEL'),
(6, 60000.00, 'EURO'),
(7, 75000.00, 'STERLING'),
(8, 90000.00, 'USD'),
(1, 100000.00, 'EURO'),
(2, 48000.00, 'GEL'),
(3, 65000.00, 'USD');


-- and selecting loan officer(s) who have exclusively given loans in GEL
SELECT *
FROM LoanOfficers
WHERE NOT EXISTS (
    SELECT 1
    FROM LoanIssued
    WHERE LoanOfficerID = OfficerID AND Currency <> 'GEL'
);