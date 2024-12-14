-- Create the library database
CREATE DATABASE library;

-- Use the library database
USE library;

-- Create the Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(250),
    Contact_no VARCHAR(15)
);

-- Create the Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create the Books table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),  -- 'yes' or 'no'
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    ISBN_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)
);

-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    ISBN_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN)
);
-- Insert data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
(1, 101, '123 Main St, City A', '9876543210'),
(2, 102, '456 Oak Rd, City B', '9876549876'),
(3, 103, '789 Pine Ave, City C', '9881234567'),
(4, 104, '101 Maple Dr, City D', '9992345678'),
(5, 105, '202 Elm St, City E', '9973456789'),
(6, 106, '303 Cedar Ln, City F', '9964567890'),
(7, 107, '404 Birch Blvd, City G', '9955678901'),
(8, 108, '505 Cherry Ln, City H', '9946789012'),
(9, 109, '606 Willow St, City I', '9937890123'),
(10, 110, '707 Palm Ave, City J', '9928901234');
-- Insert data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
(1, 'Alice', 'Manager', 60000, 1),
(2, 'Bob', 'Librarian', 30000, 1),
(3, 'Charlie', 'Manager', 70000, 2),
(4, 'David', 'Assistant Librarian', 25000, 3),
(5, 'Eve', 'Librarian', 35000, 4),
(6, 'Frank', 'Manager', 75000, 5),
(7, 'Grace', 'Assistant Librarian', 28000, 6),
(8, 'Hannah', 'Manager', 80000, 7),
(9, 'Ivy', 'Librarian', 32000, 8),
(10, 'Jack', 'Manager', 85000, 9);

-- Insert data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
(101, 'The History of Time', 'History', 30, 'yes', 'Stephen Hawking', 'Penguin'),
(102, 'Harry Potter', 'Fantasy', 20, 'no', 'J.K. Rowling', 'Bloomsbury'),
(103, 'The Catcher in the Rye', 'Fiction', 25, 'yes', 'J.D. Salinger', 'Little, Brown'),
(104, '1984', 'Dystopian', 22, 'yes', 'George Orwell', 'Secker & Warburg'),
(105, 'To Kill a Mockingbird', 'Fiction', 28, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(106, 'The Great Gatsby', 'Fiction', 18, 'no', 'F. Scott Fitzgerald', 'Charles Scribner’s Sons'),
(107, 'Pride and Prejudice', 'Romance', 23, 'yes', 'Jane Austen', 'T. Egerton'),
(108, 'Moby-Dick', 'Adventure', 35, 'yes', 'Herman Melville', 'Richard Bentley'),
(109, 'War and Peace', 'Historical', 40, 'no', 'Leo Tolstoy', 'The Russian Messenger'),
(110, 'The Odyssey', 'Epic', 30, 'yes', 'Homer', 'Various');


-- Insert data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(301, 'John Doe', '789 Pine Ave, City A', '2021-06-01'),
(302, 'Jane Smith', '321 Birch Blvd, City B', '2020-08-15'),
(303, 'Michael Johnson', '456 Oak Rd, City C', '2019-02-20'),
(304, 'Emily Davis', '654 Cedar Ln, City D', '2022-05-10'),
(305, 'Sarah Brown', '123 Elm St, City E', '2021-07-25'),
(306, 'William Taylor', '987 Maple Dr, City F', '2020-09-18'),
(307, 'David Lee', '321 Willow St, City G', '2019-11-03'),
(308, 'Sophia Garcia', '567 Cherry Ln, City H', '2022-03-12'),
(309, 'James Martinez', '789 Palm Ave, City I', '2021-05-05'),
(310, 'Olivia Clark', '234 Oak Rd, City J', '2020-12-15');


-- Insert data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book)
VALUES 
(401, 301, 'The History of Time', '2023-06-15', 101),
(402, 302, 'Harry Potter', '2023-05-25', 102),
(403, 303, 'The Catcher in the Rye', '2023-07-10', 103),
(404, 304, '1984', '2023-06-20', 104),
(405, 305, 'To Kill a Mockingbird', '2023-07-12', 105),
(406, 306, 'The Great Gatsby', '2023-05-15', 106),
(407, 307, 'Pride and Prejudice', '2023-06-30', 107),
(408, 308, 'Moby-Dick', '2023-07-05', 108),
(409, 309, 'War and Peace', '2023-06-22', 109),
(410, 310, 'The Odyssey', '2023-07-01', 110);

-- Insert data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2)
VALUES 
(501, 301, 'The History of Time', '2023-06-25', 101),
(502, 302, 'Harry Potter', '2023-06-05', 102),
(503, 303, 'The Catcher in the Rye', '2023-07-15', 103),
(504, 304, '1984', '2023-06-30', 104),
(505, 305, 'To Kill a Mockingbird', '2023-07-18', 105),
(506, 306, 'The Great Gatsby', '2023-06-20', 106),
(507, 307, 'Pride and Prejudice', '2023-07-05', 107),
(508, 308, 'Moby-Dick', '2023-07-10', 108),
(509, 309, 'War and Peace', '2023-07-15', 109),
(510, 310, 'The Odyssey', '2023-07-12', 110);

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';
-- 2. List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;
-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.ISBN_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;
-- 4. Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_books
FROM Books
GROUP BY Category;
-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;
-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_employees
FROM Employee
GROUP BY Branch_no;
-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;
-- 9. Retrieve book_title from book table containing history.
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';
-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
SELECT Branch_no, COUNT(*) AS Total_employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;
-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Branch_no = B.Branch_no
WHERE E.Position = 'Manager';
-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.ISBN_book = B.ISBN
WHERE B.Rental_Price > 25;
-- 









