/*
* Stewart Dulaney
* CS 60
* Section 4122
* SID: 1545566
*/

/* 
* Problem 1:
* Write the query that will generate a combined list of customers from the tables CUSTOMER AND CUSTOMER_2 that do not include duplicate customer records.
*/
SELECT CUS_LNAME, CUS_FNAME FROM CUSTOMER
UNION
SELECT CUS_LNAME, CUS_FNAME FROM CUSTOMER_2;

/* 
* Problem 2 
* Write the query that will generate a combined list of customers to include duplicate customer records.
*/
SELECT CUS_LNAME, CUS_FNAME FROM CUSTOMER
UNION ALL
SELECT CUS_LNAME, CUS_FNAME FROM CUSTOMER_2;

/* 
* Problem 3 
* Write the query that will show only the duplicate customer records.
*/
SELECT CUS_LNAME, CUS_FNAME FROM CUSTOMER
INTERSECT 
SELECT CUS_LNAME, CUS_FNAME FROM CUSTOMER_2;

/* 
* Problem 4 
* Write the query that will generate only the records that are unique to CUSTOMER_2 table.
*/
SELECT CUS_LNAME, CUS_FNAME FROM CUSTOMER_2
MINUS
SELECT CUS_LNAME, CUS_FNAME FROM CUSTOMER;

/* 
* Problem 5 
* Write the query to show the invoice number, customer number, customer name, invoice data and invoice 
* amount for all customers in the CUSTOMER table with a balance of $1000 or more.
*/
ALTER TABLE INVOICE ADD (INV_AMOUNT NUMBER);
SELECT	INV_NUMBER, CUSTOMER.CUS_CODE, CUS_LNAME, CUS_FNAME, INV_DATE, INV_AMOUNT
FROM	INVOICE INNER JOIN CUSTOMER ON INVOICE.CUS_CODE=CUSTOMER.CUS_CODE
WHERE	CUS_BALANCE>=1000;

/* 
* Problem 6 
* Write the query for all invoices that will show the invoice number, invoice amount, average invoice 
* amount and difference between average invoice amount and actual invoice amount.
*/
SELECT	    INV_NUMBER, INV_AMOUNT, (SELECT AVG(INV_AMOUNT) FROM INVOICE) AS AVG_INV_AMOUNT, (INV_AMOUNT-(SELECT AVG(INV_AMOUNT) FROM INVOICE)) AS DIFFERENCE
FROM	    INVOICE
GROUP BY	INV_NUMBER, INV_AMOUNT;

/* 
* Problem 7 
* Modify the CUSTOMER table to include two new attributes:- CUST_DOB and CUST_AGE. Customer 1000 was 
* born on March 15, 1979 and customer 1001 was born on December 22, 1988. Name the modified table as 
* XX99_CUSTOMER (where XX is your first and last initial, change 99 to your favorite number)
*/
CREATE TABLE SD99_CUSTOMER 
AS (SELECT * FROM CUSTOMER);
ALTER TABLE SD99_CUSTOMER ADD (CUST_DOB DATE) ADD (CUST_AGE NUMBER);
UPDATE SD99_CUSTOMER
SET CUST_DOB = '15-MAR-1979'
WHERE CUS_CODE = 1000;
UPDATE SD99_CUSTOMER
SET CUST_DOB = '22-DEC-1988'
WHERE CUS_CODE = 1001;

/* 
* Problem 8 
* Write the query that will list the names and ages of your customers.
*/
SELECT CUS_LNAME, CUS_FNAME, ROUND((SYSDATE-CUST_DOB)/365) AS AGE
FROM SD99_CUSTOMER;

/* 
* Problem 9 
* Assuming that the CUSTOMER table contains a CUST_AGE attribute, write the query to update the values 
* for this attribute. (Hint:- Use the results of the previous query).
*/
UPDATE SD99_CUSTOMER
SET CUST_AGE = ROUND((SYSDATE-CUST_DOB)/365);


/* 
* Problem 10 
* Write a query that lists the average age of your customers (Assume that the CUSTOMER table has been 
* modified to include the CUST_DOB and the derived CUST_AGE attribute.)
*/
SELECT AVG(CUST_AGE) FROM SD99_CUSTOMER;