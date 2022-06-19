# PostgreSQL
## Data Types: PostgreSQL – Data Types
%
```text
Boolean
Character Types [ such as char, varchar, and text]
Numeric Types [ such as integer and floating-point number]
Temporal Types [ such as date, time, timestamp, and interval]
UUID [ for storing UUID (Universally Unique Identifiers) ]
Array [ for storing array strings, numbers, etc.]
JSON [ stores JSON data]
hstore [ stores key-value pair]
Special Types [ such as network address and geometric data]
        box: It is used to store rectangular box.
        point: It is used to store geometric pair of numbers.
        lseg: It is used to store line segment.
        point: It is used to store geometric pair of numbers.
        polygon:It is used to store closed geometric.
        inet: It is used to store an IP4 address.
        macaddr: It is used to storea MAC address.```
```
## Data Types: PostgreSQL – Boolean Data Type
%
```text
the “bool” or”boolean” keyword is used to initialize a Boolean data type.
1, yes, y, t, true values are converted to true
0, no, false, f values are converted to false
When queried for these boolean data types are converted and returned according to the following:
t to true
f to false
space to null
The below table depicts all valid literal values for TRUE and FALSE in PostgreSQL:
True	False
true	false
‘t’	    ‘f’
‘true’	‘false’
‘y’	    ‘n’
‘yes’	‘no’
1	    0
CREATE DATABASE bookstore;
INSERT INTO book_availability (book_id, available)
VALUES
    (100, TRUE),
    (200, FALSE),
    (300, 't'),
    (400, '1'),
    (500, 'y'),
    (600, 'yes'),
    (700, 'no'),
    (800, '0');
Example 1:
In this example we will query for all the available books in the bookstore.
SELECT
    *
FROM
    book_availability
WHERE
    available = 'yes';
https://media.geeksforgeeks.org/wp-content/uploads/20200520194031/1522.png
SELECT
    *
FROM
    book_availability
WHERE
    available = 'no';
https://media.geeksforgeeks.org/wp-content/uploads/20200520194114/1531.png
SELECT
    *
FROM
    book_availability
WHERE
    NOT available;
https://media.geeksforgeeks.org/wp-content/uploads/20200520194200/1541.png
```
## Data Types: PostgreSQL – CHAR Data Type
%
```text
PostgreSQL has three character data types namely, CHAR(n), VARCHAR(n), and TEXT. 
CHAR(n) is used for data(string) with a fixed-length of characters with padded spaces.  In case the length of the string is smaller than the value of “n”, then the rest of the remaining spaces are automatically padded. Similarly for a string with a length greater than the value of “n”,  PostgreSQL throws an error.
```
## Data Types: PostgreSQL – VARCHAR Data Type
%
```text
VARCHAR(n) is the variable-length character string.Similar to CHAR(n), it can store “n” length data. But unlike CHAR(n) no padding is done in case the data length is smaller than the value of “n”.
```
## Data Types: PostgreSQL – TEXT Data Type
%
```text
TEXT is the variable-length character string. It can store data with unlimited length.
```
## Data Types: PostgreSQL – NUMERIC Data Type
%
```text
PostgreSQL has 2 types of numbers namely, integers and floating-point numbers. 
1. Integer: 
Small integer
Integer
Serial (SERIAL) works similar to the integers except these are automatically generated in the columns by PostgreSQL.
2. Floating-point number: 
float(n) is used for floating-point numbers with n precision and can have a maximum of 8-bytes.
float8 or real is used to represent 4-byte floating-point numbers.
A real number N(d,p) meaning with d number of digits and p number of decimal points after, are part of numeric or numeric(d, p). These are generally very precise.
```
## Data Types: PostgreSQL – SMALLINT Integer Data Type
%
```text
Small integer (SMALLINT) has a range -32, 768 to 32, 767 and has a size of 2-byte.
```
## Data Types: PostgreSQL – INTEGER Data Type
%
```text
Integer (INT) has a range -2, 147, 483, 648 to 2, 147, 483, 647 and has a size of 4-byte.
```
## Data Types: PostgreSQL – BIGINT Integer Data Type
%
```text
## Data Types: PostgreSQL – Date Data Type
INSERT INTO employees (first_name, last_name, birth_date, hire_date)
VALUES ('Raju', 'Kumar', '1996-12-02', '2020-01-01'),
       ('Nikhil', 'Aggarwal', '1997-08-24', '2019-01-01'),
       ('Anshul', 'Aggarwal', '1994-05-11', '2017-01-01');
<!--  -->
SELECT
    employee_id,
    first_name,
    last_name,
    AGE(birth_date)
FROM
    employees;
Note: In the above example notice the use of AGE() function. To calculate age at the current date in years, months, and days, you use the AGE() function. 
https://media.geeksforgeeks.org/wp-content/uploads/20200522132336/1781.png
```
## Data Types: PostgreSQL – Timestamp Data Type.
%
```text
there is nothing in link  
```
## Data Types: PostgreSQL – UUID Data Type
%
```text
The UUID data type allows you to store Universal Unique Identifiers defined by RFC 4122. The UUID values guarantee a better uniqueness than SERIAL and can be used to hide sensitive data exposed to the public such as values of id in URL. 
```
## Data Types: PostgreSQL – TIME Data Type
%
```text
PostgreSQL provides user with TIME data type that is used to handle time values. It requires 8 bytes of storage and can have precision up to 6 digits. It can range from 00:00:00 to 24:00:00.
HH:MM   
HH:MM:SS
HHMMSS
If precision is required the following format needs to be followed:
MM:SS.pppppp    
HH:MM:SS.pppppp
HHMMSS.pppppp
```
## Data Types: PostgreSQL – Interval Data Type

## Data Types: PostgreSQL – User-defined Data Type

## Data Types: PostgreSQL – Array Data Type

## Data Types: PostgreSQL – hstore Data Type

## Data Types: PostgreSQL – JSON Data Type

## Querying & Filtering Data: PostgreSQL – SELECT
%
```text
The SELECT statement is as complex and flexible as it can get for a query statement. It can be used with various clauses which increases it’s flexibility and use cases to query data from a table.
The various clauses that can be used with the SELECT statement are listed below:
DISTINCT operator: It is used to select distinct rows from a table.
ORDER BY clause: It is used to sort table rows.
WHERE clause: It is used to filter rows from a table. >LIMIT clause: It is used to select a subset of rows from the table.
FETCH clause: It is also used to select subset of rows from the table.
GROUP BY clause: It is used to group different rows into a single group.
HAVING clause: It is used to filter rows from a table with specified attributes or features.
FROM clause: It is used to specify a column in a table.
joins: It is used to join two or more tables together using joins such as INNER JOIN, LEFT JOIN, FULL OUTER JOIN, CROSS JOIN clauses.
Set operators: These operators such as UNION, INTERSECT, and EXCEPT are used to manipulate the different sets of data.
Firstly, we need to specify a particular column or a list of columns from where the data is to be retrieved. Commas are used to separate multiple columns, if a list of column is selected as below:
SELECT select_list1, select_list2, select_list3 FROM table_name;
For selecting all columns from the database, use asterisk(‘*’) as below:
SELECT * FROM table_name;
Secondly, we need to specify the name of the table from which data is to be retrieved, after the FROM keyword.
Example 1:
Using SELECT statement to query data from one column
SELECT first_name FROM customer;
Example 2:
Using SELECT statement to query data from multiple columns
SELECT first_name, email FROM customer;
Example 3:
Using SELECT statement to query data in all columns of a table
SELECT * FROM customer;
Example 4:
Using SELECT statement with expressions
SELECT first_name || ' ' || last_name AS full_name, email FROM customer;
```
## Querying & Filtering Data: PostgreSQL – SELECT DISTINCT clause
%
```text
SELECT statement with the DISTINCT clause to remove duplicates rows from a result set of query data. 
It keeps one row for each group of duplicates. The DISTINCT clause can be used for a single column or for a list of columns. 
Syntax:SELECT DISTINCT column_1 FROM table_name;

If you desire to operate on a list of columns the syntax will somewhat be like below: 

Syntax:SELECT DISTINCT column_1, column_2, column_3 FROM table_name;
Example 1: 
PostgreSQL DISTINCT on one column 

SELECT
    DISTINCT colour_1
FROM
    my_table
ORDER BY
    colour_1;
Output: 

Example 2: 
PostgreSQL DISTINCT on multiple columns 

SELECT
    DISTINCT colour_1,
    colour_2
FROM
    my_table
ORDER BY
    colour_1,
    colour_2;
Output: 

```
## Querying & Filtering Data: PostgreSQL – ORDER BY clause
%
```text
one can use the ORDER BY clause in the SELECT statement to sort the results in the desired manner.
Syntax:
SELECT
column_1,
column_2
FROM
table_name
ORDER BY
column_1 [ASC | DESC],
column_2 [ASC | DESC];
Example 3:
Using PostgreSQL ORDER BY clause to sort rows by expressions. In the below example we will be using the ORDER BY clause with the LENGTH() function to sort the rows by the lengths of the first names of customers. The LENGTH() function accepts a string and returns its length.
SELECT 
    first_name,
    LENGTH(first_name) len
FROM
    customer
ORDER BY 
    LENGTH(first_name) DESC;
```
## Querying & Filtering Data: PostgreSQL – WHERE clause
%
```text
The PostgreSQL WHERE clause is used to filter results returned by the SELECT statement.
Syntax: SELECT select_list FROM table_name WHERE condition;
The WHERE clause appears right after the FROM clause of the SELECT statement
The condition evaluates to true, false, or unknown. It can either be a Boolean expression or a combination of Boolean expressions where AND and OR operators are used.
The WHERE clause can also be used with the UPDATE and DELETE statement to specify rows to be updated or deleted.
Below table provides us with the list of comparison operators valid in PostgreSQL:
Operator	Description
=	Equal
>	Greater than
<	Less than
>=	Greater than or equal to
<=	Less than or equal to
<> or =!	Not equal
AND	Logical AND operator
OR	Logical OR operator
Example 1:
Using WHERE clause with the equal (=) operator. Here we will be using the equal operator in the “customer” table of our sample database.
SELECT
    last_name,
    first_name
FROM
    customer
WHERE
    first_name = 'Kelly';
Output:
Example 2:
Using the WHERE clause with the AND operator. Here we will be using the AND operator in the “customer” table of our sample database.
SELECT
    last_name,
    first_name
FROM
    customer
WHERE
    first_name = 'Kelly'
AND last_name = 'Knott';
Output:
Example 3:
Using the WHERE clause with the OR operator. Here we will be using the OR operator in the “customer” table of our sample database.
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    last_name = 'Cooper' OR 
    first_name = 'Jo';
Output:
Example 4:
Using the WHERE clause with the IN operator. The IN operator is used for string matching. Here we will be using the IN operator in the “customer” table of our sample database.
SELECT
    first_name,
    last_name
FROM
    customer
WHERE 
    first_name IN ('Kelly', 'Jo', ' Alexander');
Output:
Example 5:
Using the WHERE clause with the LIKE operator. The LIKE operator is used to find string matching a particular pattern. Here we will be using the LIKE operator in the “customer” table of our sample database.
SELECT
    first_name,
    last_name
FROM
    customer
WHERE 
    first_name LIKE 'Kath%';
Output:
Example 6:
Using the WHERE clause with the BETWEEN operator. The BETWEEN operator return if a value is in the mentioned range. Here we will be using the BETWEEN operator in the “customer” table of our sample database.
SELECT
    first_name,
    LENGTH(first_name) name_length
FROM
    customer
WHERE 
    first_name LIKE 'K%' AND
    LENGTH(first_name) BETWEEN 3 AND 7
ORDER BY
    name_length;
Output:
Example 7:
Using the WHERE clause with the not equal operator (<>). Here we will be using the <> operator in the “customer” table of our sample database.
SELECT 
    first_name, 
    last_name
FROM 
    customer 
WHERE 
    first_name LIKE 'Bra%' AND 
    last_name <> 'Motley';
```
## Querying & Filtering Data: PostgreSQL – LIMIT clause
%
```text
The PostgreSQL LIMIT clause is used to get a subset of rows generated by a query. It is an optional clause of the SELECT statement.
Syntax: SELECT * FROM table_name LIMIT n;
Now let’s analyze the syntax above:
The above syntax returns “n” no. of query results.
If “n” is skipped or equal to NULL it returns all the query results.
Example 1:
In this example we will be using the LIMIT clause to get the first 10 films ordered by the “film_id” from the “film” table of our sample database.
SELECT
    film_id,
    title,
    rating
FROM
    film
ORDER BY
    film_id
LIMIT 10;
Output:
Example 2:
In this example we will be using the LIMIT clause to get the top 10 expensive films ordered by the “rental_rate” from the “film” table of our sample database.
SELECT
    film_id,
    title,
    rental_rate
FROM
    film
ORDER BY
    rental_rate DESC
LIMIT 10;
```
## Querying & Filtering Data: PostgreSQL – FETCH clause
%
```text
The PostgreSQL FETCH clause has a functionality similar to the PostgreSQL LIMIT clause. It is used to retrieve a portion of rows returned by a query. As the LIMIT clause is not a standard SQL-command, PostgreSQL provides a standard way of fetching a subset of results from a query.
Syntax:
OFFSET start { ROW | ROWS }
FETCH { FIRST | NEXT } [ row_count ] { ROW | ROWS } ONLY
Let’s analyze the above syntax:
ROW and FIRST are synonymous with ROWS and NEXT respectively.
The start is an integer value that is either zero or positive. By default, it is zero.
The row_count is either one or higher. By default, it is one.
As the order of rows stored in the table is unpredictable, one should always use the FETCH clause with the ORDER BY clause to make the result set consistent.
Example 1:
Here we will query the first 10 rows of the film sorted by “title” from the film table of our sample database.
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
FETCH FIRST 10 ROW ONLY;
Output:
Example 2:
Here we will query the first 10 rows of the film after the first five films, sorted by “title” from the film table of our sample database.
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
OFFSET 5 ROWS 
FETCH FIRST 10 ROW ONLY;
```
## Querying & Filtering Data: PostgreSQL – IN operator
%
```text
The PostgreSQL IN operator is used with the WHERE clause to check against a list of values.
The syntax for using IN operator with the WHERE clause to check against a list of values which returns a boolean value depending upon the match is as below:
Syntax: value IN (value1, value2, …)
The syntax for using IN operator to return the matching values in contrast with the SELECT statement is as below:
Syntax: value IN (SELECT value FROM tbl_name);
Example 1:
Here we will make a query for the rental information of customer id 10 and 12, using the WHERE clause and IN operator.
SELECT
 customer_id,
    rental_id,
    return_date
FROM
    rental
WHERE
    customer_id IN (10, 12)
ORDER BY
    return_date DESC;
Output:
Example 2:
Here we will make a query for a list of customer id of customers that has rental’s return date on 2005-05-27.
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            rental
        WHERE
            CAST (return_date AS DATE) = '2005-05-27'
    );
```
## Querying & Filtering Data: PostgreSQL – IS NULL operator
%
```text
The PostgreSQL IS NULL operator is used to check if a value is NULL or not. In the world of database Null either means data is missing or not applicable. Hence, it cannot be compared with any integer or string as this kind of comparison always leads to a Null meaning an unknown result.
Syntax: Value IS NULL;
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Now, let’s look into a few examples.
Example 1:
Here we will make a query to find all the “first_name” and “last_name” of customers that don’t have an “email” in the “customer” table of our sample database.
SELECT
      first_name,
      last_name
FROM
      customer
WHERE
      email IS NULL;
Output:
Example 2:
Here we will make a query to find all the “title” of the films that don’t have a “release_year” in the “film” table of our sample database.
SELECT
      title
FROM
      film
WHERE
      release_year IS NULL;
```
## Querying & Filtering Data: PostgreSQL – LIKE operator
%
```text
The PostgreSQL LIKE operator is used query data using pattern matching techniques. Its result include strings that are case-sensitive and follow the mentioned pattern.
It is important to know that PostgreSQL provides with 2 special wildcard characters for the purpose of patterns matching as below:
Percent ( %) for matching any sequence of characters.
Underscore ( _) for matching any single character.
Syntax: string LIKE pattern;
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Now, let’s look into a few examples.
Example 1:
Here we will make a query to find the customer in the “customer” table by looking at the “first_name” column to see if there is any value that begins with “K” using the LIKE operator in our sample database.
SELECT
    first_name,
        last_name
FROM
    customer
WHERE
    first_name LIKE 'K%';
Output:
Notice few things in the above example, the WHERE clause contains a special expression: the first_name, the LIKE operator, and a string that contains a percent (%) character, which is referred to as a pattern.
Example 2:
Here we will query for customers whose first name begins with any single character, is followed by the literal string “her”, and ends with any number of characters using the LIKE operator in our sample database.
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    first_name LIKE '_her%';
```
## Querying & Filtering Data: PostgreSQL – NOT LIKE operator
%
```text
The PostgreSQL NOT LIKE works exactly opposite to that of the LIKE operator. It is used to data using pattern matching techniques that explicitly excludes the mentioned pattern from the query result set.Its result include strings that are case-sensitive and doesn’t follow the mentioned pattern.
It is important to know that PostgreSQL provides with 2 special wildcard characters for the purpose of patterns matching as below:
Percent ( % ) for matching any sequence of characters.
Underscore ( _ ) for matching any single character.
Syntax: string NOT LIKE pattern;
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Now, let’s look into a few examples.
Example 1:
Here we will make a query to find the customer in the “customer” table by looking at the “first_name” column to see if there is any value that doesn’t begin with “K” using the NOT LIKE operator in our sample database.
SELECT
    first_name,
        last_name
FROM
    customer
WHERE
    first_name NOT LIKE 'K%';
Output:
Example 2:
Here we will query for customers whose first name doesn’t begin with any single character, is not followed by the literal string “her” respectively using the NOT LIKE operator in our sample database.
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    first_name NOT LIKE '_her%';
```
## Querying & Filtering Data: PostgreSQL – BETWEEN operator
%
```text
PostgreSQL BETWEEN operator is used to match a value against a range of values.
Syntax: value BETWEEN low AND high;
Or,
Syntax: value >= low and value;
The BETWEEN operator is used generally with WHERE clause with association with SELECT, INSERT, UPDATE or DELETE statement.
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Example 1:
Here we will query for the payment whose amount is between 3 USD and 5 USD, using the BETWEEN operator in the “Payment” table of our sample database.
SELECT
    customer_id,
    payment_id,
    amount
FROM
    payment
WHERE
    amount BETWEEN 3
AND 5;
Output:
Example 2:
Here we will query for getting the payment whose payment date is between 2007-02-07 and 2007-02-15 using the BETWEEN operator in the “Payment” table of our sample database.
SELECT
    customer_id,
    payment_id,
    amount,
 payment_date
FROM
    payment
WHERE
    payment_date BETWEEN '2007-02-07'
AND '2007-02-15';
Output:
Note: While making date queries the literal date in ISO 8601 format i.e., YYYY-MM-DD should be used in PostgreSQL.
```
## Querying & Filtering Data: PostgreSQL – HAVING clause
%
```text
PostgreSQL has a HAVING clause that is used to eliminate groups of rows that do not meet specific criteria or conditions. Ii generally used in conjunction with the GROUP BY clause to filter group rows that do not satisfy a specified condition.
Syntax:
SELECT
    column_1,
    aggregate_function (column_2)
FROM
    tbl_name
GROUP BY
    column_1
HAVING
    condition;
Now let’s analyze the above syntax:
In the above syntax the aggregate_function represents functions like SUM(), COUNT() etc.
The HAVING clause provides the condition for group rows created by the GROUP BY clause.
The WHERE clause sets the condition fro each row before the GROUP BY clause is applied.
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Example 1:
Here we will query to selects the only customer who has been spending more than 200 USD using the HAVING clause in the “payment” table of our sample database.
SELECT
    customer_id,
    SUM (amount)
FROM
    payment
GROUP BY
    customer_id
HAVING
    SUM (amount) > 200;
Output:
Example 2:
Here we will query to select the stores that has more than 200 customers using the HAVING clause in the “customer” table of our sample database.
SELECT
    store_id,
    COUNT (customer_id)
FROM
    customer
GROUP BY
    store_id
HAVING
    COUNT (customer_id) > 200;
```
## Querying & Filtering Data: PostgreSQL – GROUP BY clause
%
```text
The PostgreSQL GROUP BY clause is used to divide rows returned by SELECT statement into different groups. The speciality of GROUP BY clause is that one can use Functions like SUM() to calculate the sum of items or COUNT() to get the total number of items in the groups.
Syntax:
SELECT 
   column_1, 
   column_2,
   computing_function(column_3)
FROM 
   table_name
GROUP BY 
   column_1,
   column_2;
It is important to note that The GROUP BY clause must exactly appear after the FROM or WHERE clause.
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Example 1:
Here we will query for data from the payment table and group the result by customer id from the “payment” table of our sample database.
SELECT
   customer_id
FROM
   payment
GROUP BY
   customer_id;
Output:
Example 2:
Here we will query to get the amount that each customer has paid till date and use an aggregate function (ie SUM()), to do so and group them by customer_id from the “payment” table of the sample database.
SELECT
    customer_id,
    SUM (amount)
FROM
    payment
GROUP BY
    customer_id;
Output:
Example 3:
here we will make a query to count the number of payment transactions that each staff has been processing, you group the rows in the payment table based on staff_id and use the COUNT() function to get the number of transactions.
SELECT
    staff_id,
    COUNT (payment_id)
FROM
    payment
GROUP BY
    staff_id;
```
## Modifying Data: PostgreSQL – INSERT
%
```text
In PostgreSQL, the INSERT statement is used to add new rows to a database table. As one creates a new database, it has no data initially. PostgreSQL provides the INSERT statement to insert data into the database.
Syntax:
INSERT INTO table(column1, column2, …)
VALUES
    (value1, value2, …);
The below rules must be followed while using the PostgreSQL INSERT statement:
First thing to do is specify the table name followed by the columns where you want to insert the data or rows.
Secondly, you must list a comma-separated value list after the VALUES clause. The value list must be in the same order as the columns list specified after the table name.
Create a database named “company” with the below command:
CREATE DATABASE company;
Add a table of “employee” to show the company hierarchy into the database using the below command:
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) 
    REFERENCES employee (employee_id) 
    ON DELETE CASCADE
);
The value in the manager_id column represents the senior manager who the employee reports to. If it’s Null, he/she doesn’t report to anyone.
Example 1:
Here we will add some employee data to the table using the below command:
INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    manager_id
)
VALUES
    (1, 'Sandeep', 'Jain', NULL),
    (2, 'Abhishek ', 'Kelenia', 1),
    (3, 'Harsh', 'Aggarwal', 1),
    (4, 'Raju', 'Kumar', 2),
    (5, 'Nikhil', 'Aggarwal', 2),
    (6, 'Anshul', 'Aggarwal', 2),
    (7, 'Virat', 'Kohli', 3),
    (8, 'Rohit', 'Sharma', 3);
In the above example we inserted multiple rows to the company database, whereas in this example we will add a single row to the database.
INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    manager_id
)
VALUES
    (9, 'Mohit', 'Verma', 3);
Output:
Now check for the newly added employee using the below command:
SELECT * FROM employee;
Now the overall hierarchy looks like the below image:
```
## Modifying Data: PostgreSQL – Insert multiple rows
%
```text
In general, we use the INSERT statement to insert values in a database. Just an improvised version of the same statement can be used to insert multiple values in various rows of a database as shown in the syntax below:
Syntax :
##When specifying Column Names
Insert into tableName (col1, col2) values (value,value),(value,value),(value,value);
```
## when not specifying Column Names
%
```text
Insert into tableName  values (value,value),(value,value),(value,value);
Approach :
Our database name is geeksforgeeks and the table name is gfg at the beginning there is no data inside the table. For selecting the database we will use query  \c databaseName.
For checking the data inside the table we will use query select *from tableName.
Now for inserting values, we will use the table name and the column names and the records to be inserted will be separated by comma(“‘”).
The query will be Insert into tableName (col1, col2) values (value,value),(value,value),(value,value).
If you want to insert without the column names then the query will be a different one than the above query.
Insert into tableName  values (value,value),(value,value),(value,value) . But one thing should be remembered here that in this case, the order of the values being inserted should be the same as that of in the database and all the mandatory columns must be inserted.
Now again we will check for records inside the table using select*from tableName.
Example 1 :
In this example, we first selected the database using the \c geeksforgeeks command, and then we looked into the database table records then we inserted the multiples record inside the table then again look inside the database tables. The steps followed are to select the database and then look into the table records then insert multiple values and then again look into the table records.
Example 2 :
Here in this example, we will insert the rows without using the column names but one thing to note about this approach is if you are not giving the column names the order of values being inserted will be the same as that of in the table and all the mandatory columns must be filled in the table otherwise there will be an exception. After inserting the data we will again look into the database table.
```
## Modifying Data: PostgreSQL – UPDATE
%
```text
PostgreSQL has an UPDATE statement that is used to update or modify an existing data in the table.
Syntax:
UPDATE table
SET column1 = value1,
    column2 = value2, ...
WHERE
    condition;
Let’s analyze the above syntax:
First step is to specify the table where the changes are supposed to be made.
Then we list the columns whose value is to be updated using the SET clause.
The final step is to determine which rows you want to update exactly using the WHERE clause.
Let’s set up a sample database and table for the demonstration of UPDATE statement.
Create a database named “company” with the below command:
CREATE DATABASE company;
Add a table of “employee” to show the company hierarchy into the database using the below command:
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) 
    REFERENCES employee (employee_id) 
    ON DELETE CASCADE
);
Now add some employee data to the table using the below command:
INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    manager_id
)
VALUES
    (1, 'Sandeep', 'Jain', NULL),
    (2, 'Abhishek ', 'Kelenia', 1),
    (3, 'Harsh', 'Aggarwal', 1),
    (4, 'Raju', 'Kumar', 2),
    (5, 'Nikhil', 'Aggarwal', 2),
    (6, 'Anshul', 'Aggarwal', 2),
    (7, 'Virat', 'Kohli', 3),
    (8, 'Rohit', 'Sharma', 3);
The value in the manager_id column represents the senior manager who the employee reports to. If it’s Null, he/she doesn’t report to anyone.
The overall hierarchy looks like the below image:
Our current tables looks like below:
Now let’s update data in the above mentioned table.
Example 1:
Here we will update the employee “Raju Kumar” name to “Raju Singh” using the UPDATE statement.
UPDATE employee 
SET last_name = 'Singh'
WHERE first_name = 'Raju';
Output:
Example 2:
In the above we made an update to a single row, but here we will make changes to multiple rows. Here we will change the last name of everyone to ‘Gupta’ whose last name is ‘Aggarwal’.
UPDATE employee
SET last_name = 'Gupta'
WHERE last_name = 'Aggarwal';
```
## Modifying Data: PostgreSQL – DELETE
%
```text
To delete data from a table PostgreSQL has a DELETE statement.
Syntax: 
DELETE FROM table
WHERE condition;
The below rules need to be followed while using the DELETE statement:
First, specify the table from which you want to delete data in the DELETE FROM clause.
Second, specify which rows to delete by using the condition in the WHERE clause. The WHERE clause is optional. However, if you omit it, the DELETE statement will delete all rows in the table.
Let’s set up a sample database and table for the demonstration of DELETE statement.
Create a database named “company” with the below command:
CREATE DATABASE company;
Add a table of “employee” to show the company hierarchy into the database using the below command:
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) 
    REFERENCES employee (employee_id) 
    ON DELETE CASCADE
);
Now add some employee data to the table using the below command:
INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    manager_id
)
VALUES
    (1, 'Sandeep', 'Jain', NULL),
    (2, 'Abhishek ', 'Kelenia', 1),
    (3, 'Harsh', 'Aggarwal', 1),
    (4, 'Raju', 'Kumar', 2),
    (5, 'Nikhil', 'Aggarwal', 2),
    (6, 'Anshul', 'Aggarwal', 2),
    (7, 'Virat', 'Kohli', 3),
    (8, 'Rohit', 'Sharma', 3);
The value in the manager_id column represents the senior manager who the employee reports to. If it’s Null, he/she doesn’t report to anyone.
The overall hierarchy looks like the below image:
The current database tables look like below:
Example 1:
Here we will be deleting the employee data whose first name is “Raju”.
DELETE FROM employee
WHERE first_name = 'Raju';
Output:
Example 2:
Here we will delete multiple rows from the “employee” table. We will be deleting the data of the employee named “Abhishek Kelenia” and employees who work under him.
DELETE FROM employee
WHERE last_name = 'Kelenia';
```
## Modifying Data: PostgreSQL – Upsert
%
```text
The UPSERT statement is a DBMS feature that allows a DML statement’s author to either insert a row or if the row already exists, UPDATE that existing row instead. That is why the action is known as UPSERT (simply a mix of Update and Insert).To achieve the functionality of UPSERT, PostgreSQL uses the INSERT ON CONFLICT statement.
Syntax:
INSERT INTO table_name(column_list)  
VALUES(value_list)
ON CONFLICT target action;
If we analyze the above syntax:
The target can be :
(column_name) – any column name.
ON CONSTRAINT constraint_name – where the constraint name could be the name of the UNIQUE constraint.
 WHERE predicate  – a WHERE clause with a boolean condition.
The action can be :
DO NOTHING – If the row already exists in the table, then do nothing.
DO UPDATE SET columnA = valueA, …. WHERE condition – update some fields in the table depending upon the condition.

First, we create a sample table using the below commands to perform examples:
CREATE TABLE employees (
 employee_id serial PRIMARY KEY,
 full_name VARCHAR NOT NULL,
 manager_id INT
);
Then we insert data into our employee table as follows:
INSERT INTO employees (
 employee_id,
 full_name,
 manager_id
)
VALUES
 (1, 'M.S Dhoni', NULL),
 (2, 'Sachin Tendulkar', 1),
 (3, 'R. Sharma', 1),
 (4, 'S. Raina', 1),
 (5, 'B. Kumar', 1),
 (6, 'Y. Singh', 2),
 (7, 'Virender Sehwag ', 2),
 (8, 'Ajinkya Rahane', 2),
 (9, 'Shikhar Dhawan', 2),
 (10, 'Mohammed Shami', 3),
 (11, 'Shreyas Iyer', 3),
 (12, 'Mayank Agarwal', 3),
 (13, 'K. L. Rahul', 3),
 (14, 'Hardik Pandya', 4),
 (15, 'Dinesh Karthik', 4),
 (16, 'Jasprit Bumrah', 7),
 (17, 'Kuldeep Yadav', 7),
 (18, 'Yuzvendra Chahal', 8),
 (19, 'Rishabh Pant', 8),
 (20, 'Sanju Samson', 8);
The table is:
Example 1:
The below query is used to change the name of employee_id 6 (if such an employee exists) from Y. Singh to Yuvraj Singh or insert the record if such an employee does not exist.
insert into employees(employee_id,full_name)
values(6,'Yuvraj Singh')
on conflict(employee_id)
do
update set full_name=EXCLUDED.full_name; 
To check the changes to the table, we use the following query:
select * from employees;
Output:
In this example, we tried to use the UPDATE clause as the action of the INSERT statement to update the name of the employee with ID 6 if the employee exists. 
Example 2:
The below query is used to insert an employee with employee id 18 with the name ‘W. Sundar’ and manager id ‘6’ (if no record exists) but do nothing, in case, such a record is already present in the table.  
insert into employees(employee_id,full_name,manager_id)
values(18,'W. Sundar',6)
on conflict (employee_id)
do nothing;
To check the changes to the table, we use the following query:
select * from employees;
Output:
In this example, nothing was changed in the table because employee with employee id 18 already exists and the action is to do nothing. 
Example 3:
The below query is used to insert an employee with employee id 21 with the name ‘W. Sundar’ and manager id ‘6’ ( if no record exists ) but do nothing, in case, such a record is already present in the table. 
insert into employees(employee_id,full_name,manager_id)
values(21,'W. Sundar',6)
on conflict (employee_id)
do nothing; 
To check the changes to the table, we use the following query:
select * from employees;
Output:
In this example, a new record was inserted into the table as no existing employee was present in the table with employee id 21
```
## Conditionals: PostgreSQL – CASE
%
```text
PostgreSQL has a conditional expression called CASE to form conditional queries. The PostgreSQL CASE expression is the same as IF/ELSE statement in other programming languages. PostgreSQL provides two forms of the CASE expressions.
Syntax:
CASE 
      WHEN condition_1  THEN result_1
      WHEN condition_2  THEN result_2
      [WHEN ...]
      [ELSE result_n]
END
For examples we will be using the sample database (ie, dvdrental).
Example 1:
Here we will work on the film table of the sample database. Suppose you want to assign a price segment to a film with the following logic:
Mass if the rental rate is 0.99
Economic if the rental rate is 1.99
Luxury if the rental rate is 4.99
We will query for number of films in each segment using the below statement:
SELECT
    SUM (
        CASE
        WHEN rental_rate = 0.99 THEN
            1
        ELSE
            0
        END
    ) AS "Mass",
    SUM (
        CASE
        WHEN rental_rate = 2.99 THEN
            1
        ELSE
            0
        END
    ) AS "Economic",
    SUM (
        CASE
        WHEN rental_rate = 4.99 THEN
            1
        ELSE
            0
        END
    ) AS "Luxury"
FROM
    film;
Output:
Example 2:
PostgreSQL provides another form of the CASE expression called simple form as follows:
CASE expression
WHEN value_1 THEN
    result_1
WHEN value_2 THEN
    result_2 
[WHEN ...]
ELSE
    result_n
END;
We can rewrite the general CASE expression using the simple CASE as follows:
SELECT
    SUM (
        CASE rental_rate
        WHEN 0.99 THEN
            1
        ELSE
            0
        END
    ) AS "Mass",
    SUM (
        CASE rental_rate
        WHEN 2.99 THEN
            1
        ELSE
            0
        END
    ) AS "Economic",
    SUM (
        CASE rental_rate
        WHEN 4.99 THEN
            1
        ELSE
            0
        END
    ) AS "Luxury"
FROM
    film;
Output:
The query returns the same result as the first CASE example.
```
## Conditionals: PostgreSQL – COALESCE
%
```text
In PostgreSQL, the COALESCE function returns the first non-null argument. It is generally used with the SELECT statement to handle null values effectively.
Syntax: COALESCE (argument_1, argument_2, …);
The COALESCE function accepts an unlimited number of arguments. It returns the first argument that is not null. If all arguments are null, the COALESCE function will return null. he COALESCE function evaluates arguments from left to right until it finds the first non-null argument. All the remaining arguments from the first non-null argument are not evaluated.
Example:
For the purpose of demonstration let’s first create a table (say, items) using the below statement:
CREATE TABLE items (
    ID serial PRIMARY KEY,
    product VARCHAR (100) NOT NULL,
    price NUMERIC NOT NULL,
    discount NUMERIC
);
There are four fields in the items table:
id: the primary key that identifies the item in the items table.
product: the product name.
price: the price of the product.
discount: the discount of the product.
Now we insert some records into the items table using INSERT statement as follows:
INSERT INTO items (product, price, discount)
VALUES
    ('A', 1000, 10),
    ('B', 1500, 20),
    ('C', 800, 5),
    ('D', 500, NULL);
Finally we query the net prices of the products using the following:
SELECT
    product,
    (price - discount) AS net_price
FROM
    items;
This will lead to the following:
f you look at the fourth row, you will notice that the net price of the product D is null which seems not correct. The issue is the discount of the product D is null, therefore when we take the null value to calculate the net price, PostgreSQL returns null. The get the right price, we need to assume that if the discount is null, it is zero. Then we can use the COALESCE function as follows:
SELECT
    product,
    (price - COALESCE(discount, 0)) AS net_price
FROM
    items;
```
## Conditionals: PostgreSQL – NULLIF() Function
%
```text
PostgreSQL has a NULLIF function to handle null values. The NULLIF function is one of the most common conditional expressions provided by PostgreSQL.
Syntax:NULLIF(argument_1,argument_2);
The NULLIF function returns a null value if argument_1 equals to argument_2, otherwise it returns argument_1.
Example :
First, we create a table named posts as follows:
CREATE TABLE posts (
  id serial primary key,
    title VARCHAR (255) NOT NULL,
    excerpt VARCHAR (150),
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);
Now we insert some sample data to the table as follows:
INSERT INTO posts (title, excerpt, body)
VALUES
      ('test post 1','test post excerpt 1','test post body 1'),
      ('test post 2','','test post body 2'),
      ('test post 3', null ,'test post body 3');
Our aim is to display the posts overview page that shows the title and excerpt of each post. In case the excerpt is not provided, we use the first 40 characters of the post body. We can simply use the following query to get all rows in the posts table.
SELECT
    ID,
    title,
    excerpt
FROM
    posts;
This leads to the following:
nullif
The null value in the excerpt column. To substitute this null value, we can use the COALESCE function as follows:
SELECT
    id,
    title,
    COALESCE (excerpt, LEFT(body, 40))
FROM
    posts;
This will result in the following:
Unfortunately, there is a mix between null value and ” (empty) in the excerpt column. This is why we need to use the NULLIF function:
SELECT
    id,
    title,
    COALESCE (
        NULLIF (excerpt, ''),
        LEFT (body, 40)
    )
FROM
    posts;
Output:
nullif
```
## Conditionals: PostgreSQL – CAST
%
```text
PostgreSQL supports a CAST operator that is used to convert a value of one type to another.
Syntax: CAST ( expression AS target_type );
Let’s analyze the above syntax:
First, specify an expression that can be a constant, a table column, an expression that evaluates to a value.
Then, specify the target data type to which you want to convert the result of the expression.
Example 1:
The following statement converts a string constant to an integer:
SELECT
 CAST ('100' AS INTEGER);
Output:
psql cast
If the expression cannot be converted to the target type, PostgreSQL will raise an error. See the following:
SELECT
 CAST ('10C' AS INTEGER);
This will result to the below-depicted error:
psql cast
Example 2:
This example uses the CAST to convert a string to a date:
SELECT
   CAST ('2020-01-01' AS DATE),
   CAST ('01-OCT-2020' AS DATE);
Output:
psql cast
Example 3:
This example uses the CAST() to convert the string ‘true’, ‘T’ to true and ‘false’, ‘F’ to false:
SELECT 
   CAST('true' AS BOOLEAN),
   CAST('false' as BOOLEAN),
   CAST('T' as BOOLEAN),
   CAST('F' as BOOLEAN);
```
## Control Flow: PostgreSQL – IF Statement
%
```text
PostgreSQL has an IF statement executes `statements` if a condition is true. If the condition evaluates to false, the control is passed to the next statement after the END IF part.
Syntax:
IF condition THEN
   statements;
END IF;
The above conditional statement is a boolean expression that evaluates to either true or false.
Example 1:
In this example, we declare two variables a and b. In the body of the block, we compare the value of a and b using the comparison operator >, < and = in the boolean expressions of the IF statements.
DO $$
DECLARE
  a integer := 10;
  b integer := 20;
BEGIN 
  IF a > b THEN
    RAISE NOTICE 'a is greater than b';
  END IF;
  IF a < b THEN
    RAISE NOTICE 'a is less than b';
  END IF;
  IF a = b THEN
    RAISE NOTICE 'a is equal to b';
  END IF;
END $$;
Output:
Example 2:
DO $$
DECLARE
   a integer := 10;
   b integer := 10;
BEGIN 
  IF a > b THEN 
     RAISE NOTICE 'a is greater than b';
  ELSIF a < b THEN
     RAISE NOTICE 'a is less than b';
  ELSE
     RAISE NOTICE 'a is equal to b';
  END IF;
END $$;
Output:
```
## Control Flow: PostgreSQL – CASE Statement
%
```text
PostgreSQL provides you with CASE statements that allow you to execute a block of code conditionally. There are two forms of the CASE statement: 
Simple CASE statement
Searched CASE statement
Simple CASE statement
Syntax:
CASE search-expression
   WHEN expression_1 [, expression_2, ...] THEN
      when-statements
  [ ... ]
  [ELSE
      else-statements ]
END CASE;
The search-expression is an expression that will evaluate with the expression in each WHEN branch using equality operand (=). If a match found, the when-statements in the corresponding WHEN branch are executed. The subsequent expressions underneath will not be evaluated.
The else-statements in the ELSE branch are executed if no match found. The ELSE branch is optional. If no match found and there is no ELSE branch, PostgreSQL will raise the CASE_NOT_FOUND exception.
Let’s look into some examples in our sample dvdrental database.
Example:
Here we will create a new function named get_price_segment that accepts p_film_id as the argument. Based on the rental rate of the film, it returns the price segment: mass, mainstream, high end. In case the price is not 0.99, 2.99 or 4.99, the function returns unspecified.
CREATE OR REPLACE FUNCTION get_price_segment(p_film_id integer)
   RETURNS VARCHAR(50) AS $$
DECLARE 
    rate   NUMERIC;
    price_segment VARCHAR(50);
BEGIN
      -- get the rate based on film_id
    SELECT INTO rate rental_rate 
    FROM film 
    WHERE film_id = p_film_id;

     CASE rate
    WHEN 0.99 THEN
            price_segment = 'Mass';
    WHEN 2.99 THEN
            price_segment = 'Mainstream';
    WHEN 4.99 THEN
            price_segment = 'High End';
    ELSE
        price_segment = 'Unspecified';
    END CASE;

   RETURN price_segment;
END; $$
LANGUAGE plpgsql;
Now test the get_price_segment() function using the statement:
SELECT get_price_segment(123) AS "Price Segment";
Output:
Searched CASE statement
Syntax:
CASE
    WHEN boolean-expression-1 THEN
      statements
  [ WHEN boolean-expression-2 THEN
      statements
    ... ]
  [ ELSE
      statements ]
END CASE;
The searched CASE statement executes statements based on the result of Boolean expressions in each WHEN clause. PostgreSQL evaluates the Boolean expressions sequentially from top to bottom until one expression is true. Then the evaluation stops and the corresponding statement are executed. The control is passed to the next statement after the END CASE.
In case no true result found, the statements in the ELSE clause are executed. The ELSE clause is optional. If you omit the ELSE clause and there is no true result, PostgreSQL will raise the CASE_NOT_FOUND exception.
Example:
The get_customer_service function accepts p_customer_id as the argument. It first gets the total payment paid by the customer from the payment table. Then based on the total payment, the function uses the searched CASE statement to return the service level platinum, gold, and silver.
CREATE OR REPLACE FUNCTION get_customer_service (p_customer_id INTEGER) 
    RETURNS VARCHAR (25) AS $$ 
DECLARE
 total_payment NUMERIC ; 
        service_level VARCHAR (25) ;
BEGIN
 -- get the rate based on film_id
     SELECT
 INTO total_payment SUM (amount)
     FROM
 payment
     WHERE
 customer_id = p_customer_id ; 

   CASE
      WHEN total_payment > 200 THEN
         service_level = 'Platinum' ;
      WHEN total_payment > 100 THEN
     service_level = 'Gold' ;
      ELSE
         service_level = 'Silver' ;
   END CASE ;
   RETURN service_level ;
END ; $$ LANGUAGE plpgsql;
Now let’s test the above function using the below statement:
SELECT
  148 AS customer,
    get_customer_service (148)
UNION
   SELECT
  178 AS customer,
    get_customer_service (178)
UNION
   SELECT
  81 AS customer,
    get_customer_service (81);
```
## Control Flow: PostgreSQL – Loop Statement
## Control Flow: PostgreSQL – While Loops
## Control Flow: PostgreSQL – For Loops
%
```text

PostgreSQL provides the for loop statements to iterate over a range of integers or over a result set or over the result set of a dynamic query. The different uses of the for loop in PostgreSQL are described below:
1. For loop to iterate over a range of integers
The syntax of the for loop statement to iterate over a range of integers:
[ <<label>> ]
for loop_cnt in [ reverse ] from.. to [ by step ] loop
    statements
end loop [ label ];
If we analyse the above syntax:
An integer variable loop_cnt is created at first, which is accessible inside the loop only. After each iteration, the for loop adds the step to the loop_cnt. However, when we use the reverse option, the for loop subtracts the step from loop_cnt after each iteration.
To specify the lower and upper bound of the range, we use the from and to expressions. Before entering the loop, the for loop evaluates these expressions.
The step that follows the by keyword specifies the iteration step with 1 as the default value. This step expression is evaluated only once.
The following flowchart describes the for loop statement:
Flowchart of For loop
Example 1:
The following code uses the for loop statement to iterate over ten numbers from 1 to 10 and display each of them in each iteration:
do $$
begin
   for cnt in 1..10 loop
    raise notice 'cnt: %', cnt;
   end loop;
end; $$
Output:
Example 2:
The following code uses the for loop statement to iterate over ten numbers from 10 to 1 and display each of them in each iteration:
do $$
begin
   for cnt in reverse 10..1 loop
      raise notice 'cnt: %', cnt;
   end loop;
end; $$
Output:
2. For loop to iterate over a result set
The syntax of the for loop statement to iterate over a result set of a query:
[ <<label>> ]
for target in query loop
    statements
end loop [ label ];
First, we create a sample table using the below commands to perform examples:
CREATE TABLE employees (
  employee_id serial PRIMARY KEY,
  full_name VARCHAR NOT NULL,
  manager_id INT
);
Then we insert data into our employee table as follows:
INSERT INTO employees (
  employee_id,
  full_name,
  manager_id
)
VALUES
  (1, 'M.S Dhoni', NULL),
  (2, 'Sachin Tendulkar', 1),
  (3, 'R. Sharma', 1),
  (4, 'S. Raina', 1),
  (5, 'B. Kumar', 1),
  (6, 'Y. Singh', 2),
  (7, 'Virender Sehwag ', 2),
  (8, 'Ajinkya Rahane', 2),
  (9, 'Shikhar Dhawan', 2),
  (10, 'Mohammed Shami', 3),
  (11, 'Shreyas Iyer', 3),
  (12, 'Mayank Agarwal', 3),
  (13, 'K. L. Rahul', 3),
  (14, 'Hardik Pandya', 4),
  (15, 'Dinesh Karthik', 4),
  (16, 'Jasprit Bumrah', 7),
  (17, 'Kuldeep Yadav', 7),
  (18, 'Yuzvendra Chahal', 8),
  (19, 'Rishabh Pant', 8),
  (20, 'Sanju Samson', 8);
The table is:
Example 3:
The following code uses the for loop statement to iterate over largest 10 employee id:
do
$$
declare
    f record;
begin
    for f in select employee_id, full_name 
           from employees 
           order by employee_id desc, full_name
           limit 10 
    loop 
    raise notice '% - % ', f.employee_id, f.full_name;
    end loop;
end;
$$;
Output:

3. For loop to iterate over the result set of a dynamic query
The syntax of the for loop statement to iterate over a result set of a dynamic query:
[ <<label>> ]
for row in execute query_expression [ using query_param [, ... ] ] 
loop
    statements
end loop [ label ];
If we analyse the above syntax:
The query_expression is an SQL statement.
The using clause is used to pass the query parameters.
Example 4:
The following code shows how to use the for loop statement to loop through a dynamic query. It has the following two configuration variables:
sort_type: 1 to sort by employee id, 2 to sort by length of name
rec_count: is the number of records to query from the table.
do 
$$
 declare
    -- sort by 1: employee_id , 2: length of name 
    sort_type smallint := 1; 
    -- return the number of films
    rec_count int := 10;
    -- use to iterate over the film
    rec record;
    -- dynamic query
    query text;
begin

    query := 'select full_name, employee_id from employees ';

    if sort_type = 1 then
        query := query || 'order by employee_id desc ';
    elsif sort_type = 2 then
      query := query || 'order by length(full_name) desc ';
    else 
       raise 'invalid sort type %s', sort_type;
    end if;
    query := query || ' limit $1';
    for rec in execute query using rec_count
        loop
         raise notice '% - %', rec.employee_id, rec.full_name;
    end loop;
end;
$$
Output:
If we change the sort_type to 2, we’ll get the following output:
```
## Control Flow: PostgreSQL – Exit
%
```text
In PostgreSQL, The EXIT statement is used to terminate all types of loops like unconditional loops, a while loop, or a for loop or terminate a block of code specified by the begin..end keywords.
Using EXIT for loops 
We can use the exit to terminate looping statements using the following syntax:
Syntax:
exit [label] [when condition]
If we analyze the above syntax:
Label: The label is used to signify the loop which we want to exit. It is often used in the case of nested looping. If a label is not present, the current loop is terminated.

Condition: The condition is a simple boolean expression that determines when we want to terminate the loop. When the value of the boolean expression becomes true, the loop is terminated.
Both of the above are optional. We can use exit with a condition like:
exit when cnt < 5;
Without using the condition in exit, we can rewrite the same code using the IF statement as:
if cnt < 5 then
  exit;
end if;
Example:
Suppose we a have loop that is used to print all numbers from 1 to 10. We can use the EXIT statement in the following manner to limit printing the numbers up to 7 only.
do $$
declare
 n integer:= 8;
 cnt integer := 1 ;  
begin
loop  
exit when cnt = n ;
raise notice '%', cnt;  
cnt := cnt + 1 ;  
end loop;  
end; $$;
Output:
In the above example, we terminate our loop as soon as the value of our cnt variable reaches n(here 8) and thus, only values up to 7 are printed.
Using EXIT to exit a block
We can then the exit statement to terminate a block of code specified by the begin..end keywords. In this case, the exit directly passes the flow of the program to after the end keyword, thus ending the current block.
Syntax:
<<block_label>>
BEGIN
   Statements
   EXIT [block_label] [WHEN condition];
   Statements
END block_label;
Using this syntax, we can terminate the block of code prematurely, thus preventing the statements after the exit to be run.
Example:
The following example shows how we can use EXIT to exit a block.
do
$$
begin
 raise notice '%', 'Before block';
 <<normalblock>>  
  begin
 raise notice '%', 'Before exit ; inside block';
   exit normalblock;
    raise notice '%', 'After exit ; inside block';
  end;
  raise notice '%', 'End of block';
end;
$$;
Output:
In the above example, the statement after exit was not printed as the block was terminated using EXIT before the statement. Thus inside the block, only statements before EXIT were executed and after that, the flow simply passes after the block ended.
```
## Control Flow: PostgreSQL – Continue
%
```text
In PostgreSQL ,The continue statement is used to skip the current iteration prematurely and directly move on to the next iteration. The continue statement is used in conjecture with all types of loops including unconditional loops, while loops and for loops.
Syntax:
CONTINUE [ label ] [ WHEN boolean-expression ];
If we analyze the above syntax:
label: If no label is present, the next iteration of the loop starts. That is, all statements remaining in the loop body are skipped, and control returns to the loop control expression.However, if the label is present, it specifies the label of the loop whose execution will be continued.

WHEN condition: It is simply a boolean expression that specifies the condition to skip the current iteration of the loop. If the condition is true, then the current loop iteration will be skipped. However, if it is false, the loop follows the normal flow pattern.
Both the label and WHEN condition is optional and may or may not be used with the continue statement;
Example 1 : 
The following example will be used to display the even numbers from 1 to 10.
do
$$
declare
  cnt int = 0;
begin
 loop
 -- increment of cnt
    cnt = cnt + 1;
 -- exit the loop if cnt > 10
 exit when cnt > 10;
 -- skip the iteration if cnt is an odd number
 continue when mod(cnt,2) = 1;
 -- print out the cnt
 raise notice '%', cnt;
 end loop;
end;
$$;
Output:
In the above example, we use the continue statement to skip the odd numbers by using the fact that the remainder when an odd number is divided by 2 is 1.  
Example 2 :
The following example will be used to display all numbers from 1 to 10 without displaying the number 6.
do
$$
declare
  cnt int = 0;
begin 
 loop
 -- increment of cnt
    cnt = cnt + 1;
 -- exit the loop if cnt > 10
 exit when cnt > 10;
 -- skip the iteration if cnt is an odd number
 continue when cnt = 6;
 -- print out the cnt
 raise notice '%', cnt;
 end loop;
end;
$$;
Output:
In the above example, we use the continue statement to skip the iteration when the value of the cnt variable reaches 6.
```
## Working with JOINS & Schemas: PostgreSQL – Joins
%
```text
A PostgreSQL Join statement is used to combine data or rows from one(self-join) or more tables based on a common field between them. These common fields are generally the Primary key of the first table and Foreign key of other tables.
There are 4 basic types of joins supported by PostgreSQL, namely:
Inner Join
Left Join
Right Join
Full Outer Join
Some special PostgreSQL joins are below:
Natural Join
Cross Join
Self Join
Let’s look into the 4 of the basic Joins in PostgreSQL.For the sake of this article, we will be setting up a sample database with the below commands in our psql shell:
Create a database zoo.
CREATE DATABASE zoo;
Create a table zoo_1.
CREATE TABLE zoo_1 (
    id INT PRIMARY KEY,
    animal VARCHAR (100) NOT NULL
);
Create a table zoo_2.
CREATE TABLE zoo_2 (
    id INT PRIMARY KEY,
    animal VARCHAR (100) NOT NULL
);
Insert data into zoo_1 table.
INSERT INTO zoo_1(id, animal)
VALUES
    (1, 'Lion'),
    (2, 'Tiger'),
    (3, 'Wolf'),
    (4, 'Fox');
Insert data into zoo_2 table.
INSERT INTO zoo_2(id, animal)
VALUES
    (1, 'Tiger'),
    (2, 'Lion'),
    (3, 'Rhino'),
    (4, 'Panther');
Now, we have two tables zoo_1 and zoo_2 with two common animals and four different animals. Let’s also assume zoo_1 is the left table.
Inner Join
The below statement joins the left table with the right table using the values in the “animal” column:
SELECT
    zoo_1.id id_a,
    zoo_1.animal animal_a,
    zoo_2.id id_b,
    zoo_2.animal animal_b
FROM
    zoo_1 
INNER JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;
Output:
As seen in the above output, the inner join returns a result set that contains row in the left table that matches the row in the right table.
The Venn diagram for INNER JOIN is as below:
Left Join
The below statement joins the left table with the right table using left join (or left outer join):
SELECT
    zoo_1.id,
    zoo_1.animal,
    zoo_2.id,
    zoo_2.animal
FROM
    zoo_1
LEFT JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;
Output:
As seen in the output above the left join returns a complete set of rows from the left table with the matching rows if available from the right table. If there is no match, the right side will have null values.
The Venn diagram for a LEFT JOIN is as below:
Right Join
The RIGHT JOIN or RIGHT OUTER JOIN works exactly opposite to the LEFT JOIN. It returns a complete set of rows from the right table with the matching rows if available from the left table. If there is no match, the left side will have null values.
The below statement joins the right table with the left table using the right join (or right outer join):
SELECT
    zoo_1.id,
    zoo_1.animal,
    zoo_2.id,
    zoo_2.animal
FROM
    zoo_1
RIGHT JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;
Output:
The Venn diagram for a RIGHT OUTER JOIN is below:
Full Outer Join
The full outer join or full join returns a result set that contains all rows from both the left and right tables, with the matching rows from both sides where available. If there is no match, the missing side contains null values.
The below statement illustrates the full outer join:
SELECT
    zoo_1.id,
    zoo_1.animal,
    zoo_2.id,
    zoo_2.animal
FROM
    zoo_1
FULL JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;
Output:
The Venn diagram for a FULL OUTER JOIN is below:
```
## Working with JOINS & Schemas: PostgreSQL – LEFT JOIN
%
```text
The PostgreSQL LEFT JOIN returns all the rows of the table on the left side of the join and matching rows for the table on the right side of the join. The rows for which there is no matching row on the right side, the result-set will contain null. LEFT JOIN is also known as LEFT OUTER JOIN.
Syntax:
SELECT table1.column1, table1.column2, table2.column1, ....
FROM table1 
LEFT JOIN table2
ON table1.matching_column = table2.matching_column;
table1: First table.
table2: Second table
matching_column: Column common to both the tables.
Let’s analyze the above syntax:
Firstly, using the SELECT statement we specify the tables from where we want the data to be selected.
Second, we specify the main table.
Third, we specify the table that the main table joins to.
The below Venn Diagram illustrates the working of PostgreSQL LEFT JOIN clause:
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Now, let’s look into a few examples.
Example 1:
Here we will use the LEFT JOIN clause to join the “film” table to the “inventory” table.
SELECT
    film.film_id,
    film.title,
    inventory_id
FROM
    film
LEFT JOIN inventory ON inventory.film_id = film.film_id;
Output:
Example 2:
Here we will use the LEFT JOIN clause to join the “film” table to the “inventory” table and use the WHERE clause to filter out films that are not in the inventory supply.
SELECT
    film.film_id,
    film.title,
    inventory_id
FROM
    film
LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE
    inventory.film_id IS NULL;
```
## Working with JOINS & Schemas: PostgreSQL – INNER JOIN
%
```text
In PostgreSQL the INNER JOIN keyword selects all rows from both the tables as long as the condition satisfies. This keyword will create the result-set by combining all rows from both the tables where the condition satisfies i.e value of the common field will be the same.
Syntax:
SELECT table1.column1, table1.column2, table2.column1, ....
FROM table1 
INNER JOIN table2
ON table1.matching_column = table2.matching_column;
table1: First table.
table2: Second table
matching_column: Column common to both the tables.
Let’s analyze the above syntax:
Firstly, using the SELECT statement we specify the tables from where we want the data to be selected.
Second, we specify the main table.
Third, we specify the table that the main table joins to.
The below Venn Diagram illustrates the working of PostgreSQL INNER JOIN clause:
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Now, let’s look into a few examples.
Example 1:
Here we will be joining the “customer” table to “payment” table using the INNER JOIN clause.
SELECT
    customer.customer_id,
    first_name,
    last_name,
    email,
    amount,
    payment_date
FROM
    customer
INNER JOIN payment ON payment.customer_id = customer.customer_id;
Output:
Example 2:
Here we will be joining the “customer” table to “payment” table using the INNER JOIN clause and sort them with the ORDER BY clause:
SELECT
    customer.customer_id,
    first_name,
    last_name,
    email,
    amount,
    payment_date
FROM
    customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
ORDER BY
    customer.customer_id;
Output:
Example 3:
Here we will be joining the “customer” table to “payment” table using the INNER JOIN clause and filter them with the WHERE clause:
SELECT
    customer.customer_id,
    first_name,
    last_name,
    email,
    amount,
    payment_date
FROM
    customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE
    customer.customer_id = 15;
Output:
Example 4:
Here we will establish the relationship between three tables: staff, payment, and customer using the INNER JOIN clause.
SELECT
    customer.customer_id,
    customer.first_name customer_first_name,
    customer.last_name customer_last_name,
    customer.email,
    staff.first_name staff_first_name,
    staff.last_name staff_last_name,
    amount,
    payment_date
FROM
    customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
INNER JOIN staff ON payment.staff_id = staff.staff_id;
```
## Working with JOINS & Schemas: PostgreSQL – FULL OUTER JOIN
%
```text
The PostgreSQL FULL OUTER JOIN or FULL JOIN creates the result-set by combining the result of both LEFT JOIN and RIGHT JOIN. The result-set will contain all the rows from both the tables. The rows for which there is no matching, the result-set will contain NULL values.
Syntax:
SELECT table1.column1, table1.column2, table2.column1, ....
FROM table1 
FULL JOIN table2
ON table1.matching_column = table2.matching_column;
or,
SELECT table1.column1, table1.column2, table2.column1, ....
FROM table1 
FULL OUTER JOIN table2
ON table1.matching_column = table2.matching_column;
table1: First table.
table2: Second table
matching_column: Column common to both the tables.
The Venn diagram for FULL OUTER JOIN is given below:
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Example 1:
Here we will make a query for all the films and the actors of the movie using the “film” table and “actor” table from our sample database.
SELECT
    title,
    first_name,
        last_name
FROM
    film f
FULL OUTER JOIN actor a 
        ON a.actor_id = f.film_id;
Output:
Example 2:
Here we will make a query for all the films and the language of the movie using the “film” table and “language” table from our sample database.
SELECT
    title,
    name
FROM
    film f
FULL OUTER JOIN language l 
        ON l.language_id = f.film_id;
```
## Working with JOINS & Schemas: PostgreSQL – SELF JOIN
%
```text
PostgreSQL has a special type of join called the SELF JOIN which is used to join a table with itself. It comes in handy when comparing the column of rows within the same table. As, using the same table name for comparison is not allowed in PostgreSQL, we use aliases to set different names of the same table during self-join.
It is also important to note that there is no such keyword as SELF JOIN, but it is achieved with the help of LEFT JOIN, RIGHT JOIN or INNER JOIN using aliases.
Syntax:
SELECT column_list
FROM table_name T1
INNER JOIN table_name T2 ON join_predicate;
or,
Syntax:
SELECT column_list
FROM table_name T1
LEFT JOIN table_name T2 ON join_predicate;
or,
Syntax:
SELECT column_list
FROM table_name T1
RIGHT JOIN Table_name T2 ON join_predicate;
Let’s set up a sample database and table for the demonstration of self-join.
Create a database named “company” with the below command:
CREATE DATABASE company;
Add a table of “employee” to show the company hierarchy into the database using the below command:
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) 
    REFERENCES employee (employee_id) 
    ON DELETE CASCADE
);
Now add some employee data to the table using the below command:
INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    manager_id
)
VALUES
    (1, 'Sandeep', 'Jain', NULL),
    (2, 'Abhishek ', 'Kelenia', 1),
    (3, 'Harsh', 'Aggarwal', 1),
    (4, 'Raju', 'Kumar', 2),
    (5, 'Nikhil', 'Aggarwal', 2),
    (6, 'Anshul', 'Aggarwal', 2),
    (7, 'Virat', 'Kohli', 3),
    (8, 'Rohit', 'Sharma', 3);
The value in the manager_id column represents the senior manager who the employee reports to. If it’s Null, he/she doesn’t report to anyone.
The overall hierarchy looks like the below image:
Now, that we have our database all set, let’s look into some examples of SELF JOIN.
Example 1:
Here we will query for the data of who reports to whom using the same “employee” table twice.
SELECT
    e.first_name || ' ' || e.last_name employee,
    m .first_name || ' ' || m .last_name manager
FROM
    employee e
INNER JOIN employee m ON m .employee_id = e.manager_id
ORDER BY
    manager;
Output:
Example 2:
If you remember our Sample DVD rental database used in previous articles which is explained here and can be downloaded from here, we will be performing self join in the film table of that database. Here we will query for all pairs of films that have the same runtime.
SELECT
    f1.title,
    f2.title,
    f1. length
FROM
    film f1
INNER JOIN film f2 ON f1.film_id <> f2.film_id
AND f1. length = f2. length;
```
## Working with JOINS & Schemas: PostgreSQL – Schema
%
```text
In PostgreSQL, a schema is a namespace that contains named database objects such as tables, views, indexes, data types, functions, and operators.
To access an object of a schema, users need to qualify its name with the schema name as a prefix as shown below:
Syntax: schema_name.object_name
A database can contain one or multiple schemas while each schema belongs to only one database. Two schemas can have different objects that share the same name. For instance, you may have a sales schema that has a staff table and the public schema which also has the staff table. When you refer to the staff table you must qualify it as follows:
public.staff
or,
sales.staff
There are various scenario where schemas need to be used:
Schemas allow users to organize database objects e.g., tables into logical groups to make them more manageable.
Schemas enable multiple users to use one database without interfering with each other.
Public schema
PostgreSQL generates a schema named public for all databases. Whatever object users create without specifying the schema name, PostgreSQL will automatically put it into this public schema. Therefore, the following statements are equal:
CREATE TABLE table_name(...);
and
CREATE TABLE public.table_name(...);
Schemas and Privileges
Users can only access objects in the schemas that they own. It means they cannot access any object in the schemas, which does not belong to them. To enable users to access the objects in the schema that they do not own, you must grant the USAGE privilege to the users on the schema as shown in the following statement:
GRANT USAGE ON SCHEMA schema_name TO user_name;
To allow users to create objects in the schema that they do not own, you need to grant them the CREATE privilege on the schema.
GRANT CREATE ON SCHEMA schema_name TO user_name;
Note: By default, every user has the CREATE and USAGE on the public schema.
Schema Operations
The below operations is allowed by PostgreSQL:
To create a new schema, you use the CREATE SCHEMA statement.
To rename a schema or change its owner, you use the ALTER SCHEMA statement.
To drop a schema, you use the DROP SCHEMA statement.
```
## Working with JOINS & Schemas: PostgreSQL – CREATE SCHEMA
%
```text
PostgreSQL has a CREATE SCHEMA statement that is used to create a new schema in a database.
Syntax:
CREATE SCHEMA [IF NOT EXISTS] schema_name;
Let’s analyze the above syntax:
First, specify the name of the schema after the CREATE SCHEMA keywords. The schema name must be unique within the current database.
Second, optionally use IF NOT EXISTS to conditionally create the new schema only if it does not exist. Attempting to create a new schema that already exists without using the IF NOT EXISTS option will result in an error.
Note: To execute the CREATE SCHEMA statement, you must have the CREATE privilege in the current database.
To create a schema for a user use the following:
Syntax:
CREATE SCHEMA [IF NOT EXISTS] AUTHORIZATION user_name;
Now that we have known the basics of creating a schema in PostgreSQL, let’s jump into some examples.
Example 1:
The following statement uses the CREATE SCHEMA statement to create a new schema named marketing:
CREATE SCHEMA IF NOT EXISTS marketing;
The following statement returns all schemas from the current database:
SELECT 
  * 
FROM 
    pg_catalog.pg_namespace
ORDER BY 
    nspname;
Output:
Example 2:
In this example, we will create a schema for a user (say, Raju). to do show let’s first create a user using the below statement:
CREATE USER Raju WITH ENCRYPTED PASSWORD 'Postgres123';
Now create a schema for the user Raju as follows:
CREATE SCHEMA AUTHORIZATION Raju;
Third, create a new schema that will be owned by Raju:
CREATE SCHEMA IF NOT EXISTS geeksforgeeks AUTHORIZATION Raju;
The following statement returns all schemas from the current database:
SELECT 
  * 
FROM 
    pg_catalog.pg_namespace
ORDER BY 
    nspname;
Output:
```
## Working with JOINS & Schemas: PostgreSQL – DROP SCHEMA
%
```text
PostgreSQL also supports the deletion of a schema and its objects using the DROP SCHEMA statement.
Syntax: DROP SCHEMA [IF EXISTS] schema_name [ CASCADE | RESTRICT ];
Let’s analyze the above syntax:
First, specify the name of the schema from which you want to remove after the DROP SCHEMA keywords.
Second, use the IF EXISTS option to conditionally to delete schema only if it exists.
Third, use CASCADE to delete schema and all of its objects, and in turn, all objects that depend on those objects. If you want to delete schema only when it is empty, you can use the RESTRICT option. By default, PostgreSQL uses RESTRICT.
To execute the DROP SCHEMA statement, you must be the owner of the schema that you want to drop or a superuser. PostgreSQL also allows you to drop multiple schemas at the same time by using a single DROP SCHEMA statement.
Now let’s look into some examples.
Example 1:
This example uses the DROP SCHEMA statement to remove the marketing schema present in our database:
DROP SCHEMA IF EXISTS marketing;
To verify so use the below statement:
SELECT * FROM  pg_catalog.pg_namespace ORDER BY nspname;
Output:
Example 2:
The following example uses the DROP SCHEMA statement to drop multiple schemas gfg and Raju using a single statement:
DROP SCHEMA IF EXISTS gfg, raju;
To verify so use the below statement:
SELECT * FROM  pg_catalog.pg_namespace ORDER BY nspname;
```
## Working with JOINS & Schemas: PostgreSQL – ALTER SCHEMA
%
```text
PostgreSQL has A ALTER SCHEMA statement that is used to modify the definition of an existing schema.
Syntax:
ALTER SCHEMA schema_name
ACTION xyz;
Let’s analyze the above syntax:
First, specify the name of the schema that you want to modify after the ALTER SCHEMA keywords.
Second, specify the operation you need to perform.
ACTION can be any valid PostgreSQL operation like RENAME, DROP etc.
Let’s take some examples of using the ALTER SCHEMA statement to get a better understanding.
Example 1:
This example uses the ALTER SCHEMA statement to rename the schema geeksforgeeks to gfg:
ALTER SCHEMA geeksforgeeks
RENAME TO gfg;
To verify the change use the below statement:
SELECT 
  * 
FROM 
    pg_catalog.pg_namespace
ORDER BY 
    nspname;
Output:
Example 2:
The following example uses the ALTER SCHEMA statement to change the owner of the schema gfg to from Raju to postgres:
ALTER SCHEMA gfg
OWNER TO postgres;
To verify the change use the below statement:
SELECT 
  * 
FROM 
    pg_catalog.pg_namespace
ORDER BY 
    nspname;
```
## Working with Sets: PostgreSQL – UNION operator
%
```text
The PostgreSQL UNION operator is used to combine result sets of multiple queries into a single set of result. It is used to combine result sets of two or more SELECT statements into a single result set.
Syntax:
SELECT
    column_1,
    column_2
FROM
    table_name_1
UNION
SELECT
    column_1,
    column_2
FROM
    table_name_2;
The below rules need to be followed while using a UNION operator:
Both queries must return the same number of columns.
The corresponding columns in the queries must have compatible data types.
Note: The UNION operator removes all duplicate rows from the query set.
Let’s look into some examples of the UNION operator by setting up two sample tables in a sample database(say, sales2020). Let’s say table “sales2020q1” represents the sales of a particular product in the first quarter of 2020 and “sales2020q2” represents the sales in the second quarter of the same year. Now let’s set up the database following the below procedures:
Create the sales2020 database using the below command:
CREATE DATABASE sales2020;
Now add two tables namely sales2020q1 and sales2020q2 to the sales2020 database using the below commands:
CREATE TABLE sales2020q1(
    id SERIAL,
    name VARCHAR(50) NOT NULL,
    amount VARCHAR(50),
    PRIMARY KEY (id)
);
CREATE TABLE sales2020q2(
    id SERIAL,
    name VARCHAR(50) NOT NULL,
    amount VARCHAR(50),
    PRIMARY KEY (id)
);
Insert data into tables using the below commands:
INSERT INTO sales2020q1(name, amount)
VALUES
    ('Raju Kumar', '121232'),
    ('Nikhil Aggarwal', '254789'),
    ('Abhishek Kelenia', '365487');
INSERT INTO sales2020q2(name, amount)
VALUES
    ('Raju Kumar', '457264'),
    ('Nikhil Aggarwal', '365241'),
    ('Abhishek Kelenia', '759864');
Now that our sample database is ready. Let’s implement the UNION operator in a few examples.
Example 1:
Here we will use the UNION operator to combine data from both sales2020q1 and salese2020q2 tables.
SELECT *
FROM
    sales2020q1
UNION
SELECT *
FROM
    sales2020q2;
Output:
Example 2:
Here we will sort the combined result returned by the UNION operator in defending order of “id” by using the ORDER BY clause after combining the data from both sales2020q1 and salese2020q2 tables.
SELECT *
FROM
    sales2020q1
UNION ALL
SELECT *
FROM
    sales2020q2
ORDER BY 
 name ASC,
 amount DESC;
```
## Working with Sets: PostgreSQL – INTERSECT Operator
%
```text
PostgreSQL has an INTERSECT operator that is used to combine two or more result sets returned by the SELECT statement and provide with the common data among the tables into a single result set. 
Syntax:
SELECT
    column_list
FROM
    A
INTERSECT
SELECT
    column_list
FROM
    B;
The below rules must be followed while using the INTERSECT operator with the SELECT statement:  
The number of columns and their order in the SELECT clauses must be the same. 
The data types of the columns must be compatible. 
The Venn diagram of an INTERSECT operator in PostgreSQL is as below: 
Now let’s set up a sample database to observe the implementation of the INTERSECT operator. We will create a sample database for RAW employees(say, raw_agents) and set up three tables namely agent, op_chi (operational in CHINA), and op_pak (operational in Pakistan). To do so follow the below procedures: 
Create the database using the below command: 
CREATE DATABASE raw_agents;
Create table employees, op_CHI and op_PAK using the below commands: 
CREATE TABLE agent(
    agent_id serial PRIMARY KEY,
    agent_name VARCHAR (255) NOT NULL
);
CREATE TABLE op_chi(
    agent_id INT PRIMARY KEY,
    active_date DATE NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES agent (agent_id)
);
CREATE TABLE op_pak(
    agent_id INT PRIMARY KEY,
    active_date DATE NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES agent (agent_id)
);
Insert active date to the tables with the name of agents with the below commands: 
INSERT INTO agent(agent_name)
VALUES
    ('Tiger'),
    ('James Bond'),
    ('Jason Bourne'),
    ('Ethan Hunt'),
    ('Ajit Doval'),
    ('Rowdy Rathore'),
    ('Milkha Singh'),
    ('Tom Hanks'),
    ('Sabana'),
    ('Razia Sultan');
INSERT INTO op_chi
VALUES
    (1, '2000-02-01'),
    (2, '2001-06-01'),
    (5, '2002-01-01'),
    (7, '2005-06-01');
INSERT INTO op_pak
VALUES
    (9, '2000-01-01'),
    (2, '2002-06-01'),
    (5, '2006-06-01'),
    (10, '2005-06-01');
Now that our database is all set, let’s look into some examples. 
Example 1: 
Here we will query for “agent_id” of agents who have been active both in Pakistan and China using the INTERSECT operator. 
SELECT
    agent_id
FROM
    op_CHI
INTERSECT
SELECT
        agent_id
FROM
    op_PAk;
Output: 
Example 2: 
Here we will query for “agent_id” of agents who have been active both in Pakistan and China using the INTERSECT operator and use the ORDER BY clause to sort them by ascending “agent_id”. 
SELECT
    agent_id
FROM
    op_CHI
INTERSECT
SELECT
        agent_id
FROM
    op_PAk
ORDER BY
        agent_id;
```
## Working with Sets: PostgreSQL – EXCEPT Operator
%
```text
In PostgreSQL, the EXCEPT operator is used to return distinct rows from the first (left) query that are not in the output of the second (right) query while comparing result sets of two or more queries.
Syntax:
SELECT column_list
FROM A
WHERE condition_a
EXCEPT 
SELECT column_list
FROM B
WHERE condition_b;
The below rules must be obeyed while using the EXCEPT operator:
The number of columns and their orders must be the same in the two queries.
The data types of the respective columns must be compatible.
The below Venn diagram illustrates the result of EXCEPT operator:
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Example 1:
Here we will query for films that are not in the inventory using EXCEPT operator from data of the “film” and “inventory” tables of our sample database and sort them using ORDER BY clause based on the film title.
SELECT
    film_id,
    title
FROM
    film
EXCEPT
    SELECT
        DISTINCT inventory.film_id,
        title
    FROM
        inventory
    INNER JOIN film ON film.film_id = inventory.film_id
ORDER BY title;
Output:
Example 2:
Here we will query for films that are only in the English Language (ie, language_id = 1) using EXCEPT operator from data of the “film” and “language” tables of our sample database and sort them using the ORDER BY clause based on the film title.
SELECT
    language_id,
    title
FROM
    film
WHERE
        language_id = 1
EXCEPT
    SELECT
        DISTINCT language.language_id,
        name
    FROM
        language
    INNER JOIN film ON film.language_id = language.language_id
ORDER BY title;;
```
## Working with Sets: PostgreSQL – GROUPING SETS
%
```text
In PostgreSQL, the GROUPING SETS are used to generate a result set equivalent to which generated by the UNION ALL of the multiple GROUP BY clauses. A grouping set is a set of columns by which the user group. Typically, a single aggregate query defines a single grouping set. 
Syntax for GROUPING SETS – 

SELECT
    column1,
    column2,
    aggregate_function(column3)
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (column1, column2),
        (column1),
        (column2),
        ()
);
To better understand the concept let’s create a new table and proceed to the examples. 
To create a sample table use the below command: 

CREATE TABLE geeksforgeeks_courses(
    course_name VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (course_name, segment)
);
Now insert some data into it using the below command: 

INSERT INTO geeksforgeeks_courses(course_name, segment, quantity)
VALUES
    ('Data Structure in Python', 'Premium', 100),
    ('Algorithm Design in Python', 'Basic', 200),
    ('Data Structure in Java', 'Premium', 100),
    ('Algorithm Design in Java', 'Basic', 300);
Now that our table is set let’s look into examples. 
Example 1: 
The following query defines a grouping set of the course_name and segment. It returns the number of products sold by brand and segment. 

SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    course_name,
    segment;
Output: 

Example 2: 
The following query finds the number of courses sold by course_name. It defines a grouping set of the course_name: 

SELECT
    course_name,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    course_name;
Output: 

Example 3: 
The following query finds the number of products sold by segment. It defines a grouping set of the segment: 

SELECT
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    segment;
Output: 

Example 4: 
In the following query, we will generate a single result set with the aggregates for all grouping sets. 

SELECT
    GROUPING(course_name) grouping_course,
    GROUPING(segment) grouping_segment,
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    GROUPING SETS (
        (course_name, segment),
        (course_name),
        (segment),
        ()
    )
ORDER BY
    course_name,
    segment;
```
## Working with Sets: PostgreSQL – CUBE
%
```text
In PostgreSQL, CUBE is used to generate multiple grouping sets at once. It is a subclass of the GROUP BY clause and comes in handy while generating multiple grouping sets. A grouping set is a set of columns to which you want to group.
Syntax:
SELECT
    column1,
    column2,
    column3,
    aggregate (column4)
FROM
    table_name
GROUP BY
    CUBE (column1, column2, column3);
Let’s analyze the above syntax:
First, define the CUBE subclause in the the GROUP BY clause of the SELECT statement.
Then in the select list, indicate the columns which you want to analyze and add the aggregation function expressions.
Lastly, in the GROUP BY clause, set the dimension columns within the parentheses of the CUBE subclause.
The query yield all feasible grouping sets based on the dimension columns set in CUBE. The CUBE subclause is a short way to define multiple grouping sets. Normally if the number of columns set in the CUBE is n, then it generates 2n combinations.
To better understand the concept let’s create a new table and proceed to the examples.
To create a sample table use the below command:
CREATE TABLE geeksforgeeks_courses(
    course_name VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (course_name, segment)
);
Now insert some data into it using the below command:
INSERT INTO geeksforgeeks_courses(course_name, segment, quantity)
VALUES
    ('Data Structure in Python', 'Premium', 100),
    ('Algorithm Design in Python', 'Basic', 200),
    ('Data Structure in Java', 'Premium', 100),
    ('Algorithm Design in Java', 'Basic', 300);
Now that our table is set let’s look into examples.
Example 1:
The following query uses the CUBE subclause to generate multiple grouping sets as follows:
SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    CUBE (course_name, segment)
ORDER BY
    course_name,
    segment;
Output:
Example 2:
The following query performs a partial CUBE as follows:
SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    course_name,
    CUBE (segment)
ORDER BY
    course_name,
    segment;
```
## Working with Sets: PostgreSQL – ROLLUP
%
```text
The PostgreSQL ROLLUP belongs to the GROUP BY clause that provides a short cut for defining multiple grouping sets. Multiple columns grouped together forms a group set.
Unlike the CUBE subclause, ROLLUP does not yield all possible grouping sets based on the specified columns. It just makes a subset of those. The ROLLUP presupposes a hierarchy between the input columns and yields all grouping sets that make sense only if the hierarchy is considered. That’s why ROLLUP is usually used to generate the subtotals and the grand total for reports.
Syntax:
SELECT
    column1,
    column2,
    column3,
    aggregate(column4)
FROM
    table_name
GROUP BY
    ROLLUP (column1, column2, column3);
To better understand the concept let’s create a new table and proceed to the examples.
To create a sample table use the below command:
CREATE TABLE geeksforgeeks_courses(
    course_name VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (course_name, segment)
);
Now insert some data into it using the below command:
INSERT INTO geeksforgeeks_courses(course_name, segment, quantity)
VALUES
    ('Data Structure in Python', 'Premium', 100),
    ('Algorithm Design in Python', 'Basic', 200),
    ('Data Structure in Java', 'Premium', 100),
    ('Algorithm Design in Java', 'Basic', 300);
Now that our table is set let’s look into examples.
Example 1:
The following query uses the ROLLUP subclause to find the number of products sold by course_name(subtotal) and by all course_name and segments (total) as follows:
SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    ROLLUP (course_name, segment)
ORDER BY
    course_name,
    segment;
Output:
Example 2:
The following statement performs a partial ROLL UP as follows:
SELECT
    segment,
    course_name,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    segment,
    ROLLUP (course_name)
ORDER BY
    segment,
    course_name;
```
## Subquery & CTEs: PostgreSQL – ANY Operator
%
```text
PostgreSQL has an ANY operator that is used to compare a scalar value with a set of values returned by a subquery.
Syntax: expression operator ANY(subquery)
The below rules must be followed while using PostgreSQL ANY operator:
The subquery must return exactly one column.
The ANY operator must be preceded by one of the following comparison operator =, <=, >, <, > and <>
The ANY operator returns true if any value of the subquery meets the condition, otherwise, it returns false.
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Example 1:
Here we will query for the maximum length of film grouped by film category from the “film” table of our sample database.
SELECT title
FROM film
WHERE length >= ANY(
    SELECT MAX( length )
    FROM film
    INNER JOIN film_category USING(film_id)
    GROUP BY  category_id );
Output:
Example 2:
Here we will query for the films whose category is either Action(category_id = 1) or Drama(category_id = 7) from the “category” table of our sample database.
SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id = ANY(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );
```
## Subquery & CTEs: PostgreSQL – ALL Operator
%
```text
The PostgreSQL ALL operator is used for comparing a value with a list of values returned by a subquery.
Syntax: comparison_operator ALL (subquery)
The below rules need to be followed while using the ALL operator:
The ALL operator always needs to be preceded by a comparison operator(=, !=, <, >, >=, <=).
It must always be followed by a subquery surrounded by parentheses.
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Example 1:
Here we will query for all films whose lengths are greater than the list of the average lengths by using the ALL and greater than operator(>).
SELECT
    film_id,
    title,
    length
FROM
    film
WHERE
    length > ALL (
            SELECT
                ROUND(AVG (length), 2)
            FROM
                film
            GROUP BY
                rating
    )
ORDER BY
    length;
Output:
Example 2:
Here we will query for all films whose rental_rate is less than the list of the average rental_rate by using the ALL and less than operator(<).
SELECT
    film_id,
    title,
    rental_rate
FROM
    film
WHERE
    rental_rate < ALL (
            SELECT
                ROUND(AVG (rental_rate), 2)
            FROM
                film
            GROUP BY
                rating
    )
ORDER BY
    rental_rate;
```
## Subquery & CTEs: PostgreSQL – EXISTS Operator
%
```text
In PostgreSQL, the EXISTS operator is used to test for the existence of rose in a subquery.It is generally used with correlated subqueries. If the subquery returns at least one row, the result of EXISTS is true. In case the subquery returns no row, the result is of EXISTS is false.
Syntax: EXISTS (subquery)
For the sake of this article we will be using the sample DVD rental database, which is explained here and can be downloaded by clicking on this link in our examples.
Example 1:
Here we will query for customers who have at least one payment whose amount is greater than 9 USD using the “customer” and “payment” tables of our sample database.
SELECT first_name,
       last_name
FROM customer c
WHERE EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 9 )
ORDER BY first_name,
         last_name;
Output:
Example 2:
Here we will query for films that are not available in the inventory using the “film” and “inventory” tables of our sample database.
SELECT title
FROM film f
WHERE NOT EXISTS
    (SELECT 1
     FROM inventory i
     WHERE f.film_id = i.film_id )
ORDER BY title;
```
## Subquery & CTEs: PostgreSQL – CTE
%
```text
In PostgreSQL, the CTE(Common Table Expression) is used as a temporary result set that the user can reference within another SQL statement like SELECT, INSERT, UPDATE or DELETE. CTEs are temporary in the sense that they only exist during the execution of the query. CTEs are typically used to simplify complex joins and subqueries in PostgreSQL.
Syntax:
WITH cte_name (column_list) AS (
    CTE_query_definition 
)
statement;
Let’s analyze the above syntax.
The first step is to set the name of the CTE followed by an optional column list.
Then we specify a query that returns the result set within the body of WITH clause. if not specified explicitly then the select list of the CTE_query_definition will become the column list of the CTE.
Finally use the CTE like a table or view in the statement which can be a SELECT, INSERT, UPDATE, or DELETE.
For examples we will be using the sample database (ie, dvdrental).
Example 1:
In this, we will define a common table expression named cte_film using the WITH clause with the film and rental table as follows to determine the length of the films.
WITH cte_film AS (
    SELECT 
        film_id, 
        title,
        (CASE 
            WHEN length < 30 THEN 'Short'
            WHEN length < 90 THEN 'Medium'
            ELSE 'Long'
        END) length    
    FROM
        film
)
SELECT
    film_id,
    title,
    length
FROM 
    cte_film
WHERE
    length = 'Long'
ORDER BY 
    title;
Output:
Example 2:
The following statement illustrates the use of the CTE with the RANK() window function in the film table to rank the films based on their length as follows:
WITH cte_film AS  (
    SELECT film_id,
        title,
        rating,
        length,
        RANK() OVER (
            PARTITION BY rating
            ORDER BY length DESC) 
        length_rank
    FROM 
        film
)
SELECT *
FROM cte_film
WHERE length_rank = 1;
Output:
```
## Subquery & CTEs: PostgreSQL – Deleting Duplicate Rows using Subquery
%
```text
PostgreSQL has various techniques to delete duplicate rows.  Subqueries can be used for the same purpose.
For the purpose of demonstration let’s set up a sample table(say, basket) that stores fruits as follows:
CREATE TABLE basket(
    id SERIAL PRIMARY KEY,
    fruit VARCHAR(50) NOT NULL
);
Now let’s add some data to the newly created basket table.
INSERT INTO basket(fruit) values('apple');
INSERT INTO basket(fruit) values('apple');
INSERT INTO basket(fruit) values('orange');
INSERT INTO basket(fruit) values('orange');
INSERT INTO basket(fruit) values('orange');
INSERT INTO basket(fruit) values('banana');
Now let’s verify the basket table using the below statement:
SELECT * FROM basket;
This should result into below:
Now that we have set up the sample table, we will query for the duplicates using the following:
SELECT
    fruit,
    COUNT( fruit )
FROM
    basket
GROUP BY
    fruit
HAVING
    COUNT( fruit )> 1
ORDER BY
    fruit;
This should lead to the following results:
The following statement uses a subquery to delete duplicate rows and keep the row with the lowest id. 
DELETE FROM basket
WHERE id IN
    (SELECT id
    FROM 
        (SELECT id,
         ROW_NUMBER() OVER( PARTITION BY fruit
        ORDER BY  id ) AS row_num
        FROM basket ) t
        WHERE t.row_num > 1 );
In this example, the subquery returned the duplicate rows except for the first row in the duplicate group. And the outer DELETE statement deleted the duplicate rows returned by the subquery.
If you want to keep the duplicate row with highest id, just change the order in the subquery:
DELETE FROM basket
WHERE id IN
    (SELECT id
    FROM 
        (SELECT id,
         ROW_NUMBER() OVER( PARTITION BY fruit
        ORDER BY  id ) AS row_num
        FROM basket ) t
        WHERE t.row_num > 1 );
In case you want to delete duplicate based on values of multiple columns, here is the query template:
DELETE FROM table_name
WHERE id IN
    (SELECT id
    FROM 
        (SELECT id,
         ROW_NUMBER() OVER( PARTITION BY column_1,
         column_2
        ORDER BY  id ) AS row_num
        FROM table_name ) t
        WHERE t.row_num > 1 );
In this case, the statement will delete all rows with duplicate values in the column_1 and column_2 columns. To verify the above use the below query:
SELECT
    fruit,
    COUNT( fruit )
FROM
    basket
GROUP BY
    fruit
HAVING
    COUNT( fruit )> 1
ORDER BY
    fruit;
```
## Important In-Built Functions: PostgreSQL – AVG() Function
%
```text
PostgreSQL provides an AVG() function to calculate the average value of a set. The AVG() function is one of the most frequently used aggregate functions in PostgreSQL. The AVG() function enables users to calculate the average value of a numeric column.
Syntax: AVG(column)
It can be used with both the SELECT and HAVING clause.
Let’s look into some examples now.
Example 1:
We will be using the payment table in the dvdrental sample database for demonstration. In this example we will query to know the average amount that customers paid, using the AVG() function in the amount column as follows:
SELECT
    to_char(
        AVG (amount),
        '99999999999999999D99'
    ) AS average_amount
FROM
    payment;
Output:
Note: We used the to_char() function to convert the result into a formatted string.
Example 2:
We will be using the payment table in the dvdrental sample database for demonstration. In this example we will query to know the average amount paid by each customer using the command below:
SELECT
    customer.customer_id,
    first_name,
    last_name,
    to_char(
        AVG (amount),
        '99999999999999999D99'
    ) AS average_amount
FROM
    payment
INNER JOIN customer ON customer.customer_id = payment.customer_id
GROUP BY
    customer.customer_id
ORDER BY
    customer_id;
```
## Important In-Built Functions: PostgreSQL – COUNT() Function
%
```text
The COUNT() function is an aggregate function that enables users to get the number of rows that match a particular requirement of a query.
Depending upon the user requirements the COUNT() function can have the following syntaxes:
Syntax: COUNT(*)
Returns: All rows including NULL and Duplicates
Syntax: COUNT(column)
Returns:  All rows except NULL.
Syntax: COUNT(DISTINCT column)
Returns: All rows without NULL and Duplicates
The COUNT() function is used with the SELECT statement.
For examples we will be using the sample database (ie, dvdrental).
Example 1:
In this example we will use the COUNT(*) function to get the number of transactions in the payment table using the command below:
SELECT
   COUNT(*)
FROM
   payment;
Output:
Example 2:
In this example we will query for the distinct amounts which customers paid, using the COUNT(DISTINCT column) function as shown below:
SELECT
    COUNT (DISTINCT amount)
FROM
    payment;
Output:
Example 3:
Here we will be using the COUNT() function to get the details of customers who have made more than 40 payments:
SELECT
    customer_id,
    COUNT (customer_id)
FROM
    payment
GROUP BY
    customer_id
HAVING
    COUNT (customer_id) > 40;
```
## Important In-Built Functions: PostgreSQL – MAX() Function
%
```text
PostgreSQL MAX() function is an aggregate function that returns the maximum value in a set of values.
Syntax: MAX(expression);
The MAX() function can be used with SELECT, WHERE and HAVING clause.
Now let’s look into some examples.For examples we will be using the sample database (ie, dvdrental).
Example 1:
The below query gets us the maximum amount paid by customers in the payment table:
SELECT MAX(amount)
FROM payment;
Output:
Example 2:
The following query gets the largest payment paid by each customer:
SELECT
    customer_id,
    MAX (amount)
FROM
    payment
GROUP BY
    customer_id;
```
## Important In-Built Functions: PostgreSQL – MIN() Function
%
```text
PostgreSQL MIN() function is an aggregate function that returns the minimum value in a set of values.
Syntax: MIN(expression);
The MIN() function can be used with SELECT, WHERE and HAVING clause.
Now let’s look into some examples.For examples we will be using the sample database (ie, dvdrental).
Example 1:
The below query gets us the minimum amount paid by customers in the payment table:
SELECT MIN(amount)
FROM payment;
Output:
Example 2:
The following query gets the smallest payment paid by each customer:
SELECT
    customer_id,
    MIN(amount)
FROM
    payment
GROUP BY
    customer_id;
```
## Important In-Built Functions: PostgreSQL – SUM() Function
%
```text
PostgreSQL provides with a SUM() function that is used to get the addition of values of a numeric column.
Syntax: SUM(column)
The following points needs to be kept in mind while using the above function:
It ignores all NULL values.
If used with DISTINCT operator as SUM(DISTINCT column), it skips duplicate values.
Using SUM() function with SELECT clause returns NULL instead of Zero.
For examples we will be using the sample database (ie, dvdrental).
Example 1:
In this example we will calculate the total amount paid by each customer using the SUM() function and GROUP BY clause as follows:
SELECT
    customer_id,
    SUM (amount) AS total
FROM
    payment
GROUP BY
    customer_id;
Output:
Example 2:
In this example we will query for the top 10 customers who paid the most as follows:
SELECT
    customer_id,
    SUM (amount) AS total
FROM
    payment
GROUP BY
    customer_id
ORDER BY total DESC
LIMIT 10;
```
## Important In-Built Functions: PostgreSQL – FIRST_VALUE Function
%
```text
In PostgreSQL, the FIRST_VALUE() function is used to return the first value in a sorted partition of a result set.
Syntax:
FIRST_VALUE ( expression )  
OVER ( 
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)
Let’s analyze the above syntax:
The expression is responsible for evaluating the values against the value of the first row of a sorted partition of a query result set. It can be an expression, column, or subquery that mush evaluate a single integer value.
 The PARTITION BY clause is used to divides rows in a result set.
The ORDER BY clause is used to sort the rows the query result set in each partition.
The rows_range_clause is used to limits the rows inside the partition by setting up the start and end of the query set partitions.
Example 1:
First, create two tables named Mammals and Animal_groups for the demonstration:
CREATE TABLE Animal_groups (
    animal_id serial PRIMARY KEY,
    animal_name VARCHAR (255) NOT NULL
);
CREATE TABLE Mammals (
    mammal_id serial PRIMARY KEY,
    mammal_name VARCHAR (255) NOT NULL,
    lifespan DECIMAL (11, 2),
    animal_id INT NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES Animal_groups (animal_id)
);
Now insert some data to the table:
INSERT INTO Animal_groups (animal_name)
VALUES
    ('Terrestrial'),
    ('Aquatic'),
    ('Winged');
INSERT INTO Mammals(mammal_name, animal_id, lifespan)
VALUES
    ('Cow', 1, 10),
    ('Dog', 1, 7),
    ('Ox', 1, 13),
    ('Wolf', 1, 11),
    ('Blue Whale', 2, 80),
    ('Dolphin', 2, 5),
    ('Sea Horse', 2, 3),
    ('Octopus', 2, 8),
    ('Bat', 3, 4),
    ('Flying Squirrels', 3, 1),
    ('Petaurus', 3, 2);
The following statement uses the FIRST_VALUE() function to return all mammals and also the mammal which has the lowest lifespan:
SELECT 
    mammal_id,
    mammal_name,
    mammal_id,
    lifespan,
    FIRST_VALUE(mammal_name) 
    OVER(
        ORDER BY lifespan
    ) lowest_lifespan
FROM 
    Mammals;
Output:
Example 2:
The below statement uses the FIRST_VALUE() function to return all mammals grouped by the animal group. And for each animal group, it returns the mammal with the lowest lifespan:
SELECT 
    mammal_id,
    mammal_name,
    mammal_id,
    lifespan,
    FIRST_VALUE(mammal_name) 
    OVER(
    PARTITION BY animal_id
        ORDER BY lifespan
        RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    ) lowest_lifespan
FROM 
    Mammals;
```
## Important In-Built Functions: PostgreSQL – LAST_VALUE Function
%
```text
In PostgreSQL, the LAST_VALUE() function returns the last value in an ordered partition of the query result set .
Syntax:
LAST_VALUE ( expression )  
OVER ( 
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)
Let’s analyze the above syntax:
The expression is single value integer used to evaluated against the value of the last row in an ordered partition of the query result set. It can be an expression, column, or subquery.
The PARTITION BY clause is used to divide the query result into sets.
The ORDER BY clause is used to order the result query set in each partition.
The frame_clause is used to specify the subset of rows in the current partition.
Example 1:
First, create two tables named Mammals and Animal_groups for the demonstration:
CREATE TABLE Animal_groups (
    animal_id serial PRIMARY KEY,
    animal_name VARCHAR (255) NOT NULL
);
CREATE TABLE Mammals (
    mammal_id serial PRIMARY KEY,
    mammal_name VARCHAR (255) NOT NULL,
    lifespan DECIMAL (11, 2),
    animal_id INT NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES Animal_groups (animal_id)
);
Now insert some data to the table:
INSERT INTO Animal_groups (animal_name)
VALUES
    ('Terrestrial'),
    ('Aquatic'),
    ('Winged');
INSERT INTO Mammals(mammal_name, animal_id, lifespan)
VALUES
    ('Cow', 1, 10),
    ('Dog', 1, 7),
    ('Ox', 1, 13),
    ('Wolf', 1, 11),
    ('Blue Whale', 2, 80),
    ('Dolphin', 2, 5),
    ('Sea Horse', 2, 3),
    ('Octopus', 2, 8),
    ('Bat', 3, 4),
    ('Flying Squirrels', 3, 1),
    ('Petaurus', 3, 2);
The following query uses the LAST_VALUE() function to return all Mammals together with the mammal that has the highest lifespan:
SELECT 
    mammal_id,
    mammal_name,
    lifespan,
    LAST_VALUE(mammal_name) 
    OVER(
        ORDER BY lifespan
        RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    ) longest_lifespan
FROM 
    Mammals;
Output:
Example 2:
The following query uses the LAST_VALUE() function to return all mammals together with the mammal with longest lifespan per animal group:
SELECT 
    mammal_id,
    mammal_name,
    animal_id,
    lifespan,
    LAST_VALUE(mammal_name) 
    OVER(
    PARTITION BY animal_id
        ORDER BY lifespan
        RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    ) longest_life
FROM 
    Mammals;
```
## Important In-Built Functions: PostgreSQL – NTH_VALUE Function
%
```text
In PostgreSQL, the NTH_VALUE() function is used to get a value from the nth row in a result set.
Here is the syntax of the NTH_VALUE() function:
Syntax:
NTH_VALUE(expression, offset) 
OVER (
    [PARTITION BY partition_expression]
    [ ORDER BY sort_expression [ASC | DESC]
    frame_clause ]
)
Let’s analyze the above syntax:
The expression is the column from which the query is to be made or an expression on which the NTH_VALUE() function operates on.
The offset is a positive integer that sets the row number according to the first row in the window against the value that the expression evaluates.
The PARTITION BY clause distributes rows of the result set into partitions to which the NTH_VALUE() function applies.
The ORDER BY clause is used for sorting the result of the query.
The frame_clause is used to define the subset (or the frame) of the partition being used.
Example 1:
First, create two tables named grocery and groceries:
CREATE TABLE items(
    group_id serial PRIMARY KEY,
    group_name VARCHAR (100) NOT NULL
);
CREATE TABLE groceries(
    gro_id serial PRIMARY KEY,
    gro_name VARCHAR (100) NOT NULL,
    price DECIMAL (11, 2),
    group_id INT NOT NULL,
    FOREIGN KEY (group_id) REFERENCES grocery (group_id)
);
Now add some data to it:
INSERT INTO groceries (group_name)
VALUES
    ('Cereal'),
    ('Fruit'),
    ('Vegitable');
INSERT INTO groceries (group_name, group_id, price)
VALUES
    ('Wheat', 1, 30),
    ('Rice', 1, 40),
    ('Barley', 1, 50),
    ('Corn', 1, 90),
    ('Apple', 2, 120),
    ('Banana', 2, 70),
    ('Pear', 2, 70),
    ('Mango', 2, 80),
    ('Brinjal', 3, 70),
    ('Capsicum', 3, 150),
    ('Potato', 3, 20);
The below statement uses the NTH_VALUE() function to return all products together with the most expensive product:
SELECT 
    product_id,
    product_name,
    price,
    NTH_VALUE(product_name, 2) 
    OVER(
        ORDER BY price DESC
        RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    )
FROM 
    products;
Output:
Example 2:
The below statement uses the NTH_VALUE() function to return all products with the second most expensive product for each product group:
SELECT 
    product_id,
    product_name,
    price,
    group_id,
    NTH_VALUE(product_name, 2) 
    OVER(
        PARTITION BY group_id
        ORDER BY price DESC
        RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    )
FROM 
    products;
```
## Important In-Built Functions: PostgreSQL – ROW_NUMBER Function
%
```text
In PostgreSQL, the ROW_NUMBER() function is used to assign a unique integer to every row that is returned by a query.
Syntax:
ROW_NUMBER() OVER(
    [PARTITION BY column_1, column_2, …]
    [ORDER BY column_3, column_4, …]
)
Let’s analyze the above syntax:
The set of rows on which the ROW_NUMBER() function operates is called a window.
The PARTITION BY clause is used to divide the query set results. 
The ORDER BY clause inside the OVER clause is used to set the order in which the query result will be displayed.
Example 1:
First, create two tables named mammals and Animal_groups:
CREATE TABLE Animal_groups (
    animal_id serial PRIMARY KEY,
    animal_name VARCHAR (255) NOT NULL
);
CREATE TABLE Mammals (
    mammal_id serial PRIMARY KEY,
    mammal_name VARCHAR (255) NOT NULL,
    lifespan DECIMAL (11, 2),
    animal_id INT NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES Animal_groups (animal_id)
);
Now add some data to it:
INSERT INTO Animal_groups (animal_name)
VALUES
    ('Terrestrial'),
    ('Aquatic'),
    ('Winged');
INSERT INTO Mammals(mammal_name, animal_id, lifespan)
VALUES
    ('Cow', 1, 10),
    ('Dog', 1, 7),
    ('Ox', 1, 13),
    ('Wolf', 1, 11),
    ('Blue Whale', 2, 80),
    ('Dolphin', 2, 5),
    ('Sea Horse', 2, 3),
    ('Octopus', 2, 8),
    ('Bat', 3, 4),
    ('Flying Squirrels', 3, 1),
    ('Petaurus', 3, 2);
In the following query, we change the column in the ORDER BY clause to product_name, the ROW_NUMBER() function assigns the integer values to each row based on the product name order
SELECT
    mammal_id,
    mammal_name,
    animal_id,
    ROW_NUMBER () OVER (
           ORDER BY mammal_name
        )
FROM
    Mammals;
Output:
Example 2:
The following query uses the ROW_NUMBER() function to assign integers to the distinct prices from the products table:
SELECT DISTINCT
    lifespan,
    ROW_NUMBER () OVER (ORDER BY lifespan)
FROM
    Mammals
ORDER BY
    lifespan;
```
## Important In-Built Functions: PostgreSQL – CURRENT_DATE Function
%
```text
The PostgreSQL CURRENT_DATE function returns the current date.
Syntax: CURRENT_DATE
Return value:
The CURRENT_DATE function returns a DATE value that represents the current date.
Example 1:
The following statement shows how to use the CURRENT_DATE function to get the current date:
SELECT CURRENT_DATE;
Output:
Example 2:
The CURRENT_DATE function can be used as a default value of a column. So create a table named delivery for demonstration:
CREATE TABLE delivery(
    delivery_id serial PRIMARY KEY,
    product varchar(255) NOT NULL,
    delivery_date DATE DEFAULT CURRENT_DATE
);
In the delivery table, there is the delivery_date whose default value is the result of the CURRENT_DATE function. Let’s add some data to it.
INSERT INTO delivery(product)
VALUES('Data Structure And Algorithm Edition 1');
Third, verify whether the row was inserted successfully with the current date by using the following:
SELECT * FROM delivery;
```
## Important In-Built Functions: PostgreSQL – CURRENT_TIME Function
%
```text
The PostgreSQL CURRENT_TIME function returns the current time and the currentthe time zone.
Syntax: CURRENT_TIME(precision)
Let’s analyze the above syntax:
The precision argument is used to set the precision of the returned TIMESTAMP type value in fractional seconds precision. By default the function returns a full available precision if not precision data is provided to the function.
The CURRENT_TIME function returns a TIME WITH TIME ZONE value. This value is nothing but the current time with the the current time zone.
Example 1:
The following statement can be used to get the current time:
SELECT CURRENT_TIME;
Output:
Example 2:
The following statement shows the process of using the CURRENT_TIME function with the precision of 2:
SELECT CURRENT_TIME(2);
Output:
Example 3:
The CURRENT_TIME function can also be used as the default value of the TIME columns. To demonstrate this, create a table named log:
CREATE TABLE log (
    log_id SERIAL PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    created_at TIME DEFAULT CURRENT_TIME,
    created_on DATE DEFAULT CURRENT_DATE
);
The log table has the created_at column whose default value is the value returned by the CURRENT_TIME function. Now insert some data to the demo table:
INSERT INTO log( message )
VALUES('Testing the CURRENT_TIME function');
Now verify if the row was inserted into the log table with the created_at column added correctly by using the following query:
SELECT * FROM log;
```
## Important In-Built Functions: PostgreSQL – EXTRACT Function
%
```text
The PostgreSQL EXTRACT() function is used to query for field associated with date and time such as a year, month, and day from a date/time value.
Syntax: EXTRACT(field FROM source)
Let’s analyze the above syntax:
In the above syntax the field argument is used to specify fields that is to be extracted from the date/time value.
The source is generally either a TIMESTAMP type or an INTERVAL type. Depending upon the values passed the type is set. For instance, if we pass a DATE value, the function adapt to a TIMESTAMP type value.
Example 1:
The below statement extracts year from a timestamp:
SELECT EXTRACT(YEAR FROM TIMESTAMP '2020-12-31 13:30:15');
Output:
Example 2:
The below statement extracts the quarter from a timestamp:
SELECT EXTRACT(QUARTER FROM TIMESTAMP '2020-12-31 13:30:15');
Output:
Example 3:
The below statement extracts month from a timestamp:
SELECT EXTRACT(MONTH FROM TIMESTAMP '2020-12-31 13:30:15');
```
## Important In-Built Functions: PostgreSQL- CONCAT Function
%
```text
In PostgreSQL, the CONCAT function is used to concatenate two or more strings into one.
Syntax: CONCAT(string_1, string_2, ...)
Let’s analyze the above syntax:
The CONCAT function accepts a list of string convertible arguments. A string in this context means any of the following data types: char, varchar, or text.
The CONCAT function is variadic meaning that the CONCAT function can accept an array as the argument. Here it is required to mark the array with the VARIADIC keyword. The CONCAT function considers every array element as an argument.
Contrary to the concatenation operator ( || ), the CONCAT function ignores NULL arguments. 
Example 1:
The below statement uses the CONCAT function to concatenate three strings into one:
SELECT
 CONCAT ('Geeks', 'for', 'geeks');
Output:
Example 2:
The following statement concatenates values in the first_name and last_name columns of the actor table in the sample database, ie, dvdrental.
SELECT
    CONCAT  (first_name, ' ', last_name) AS "Full name"
FROM
    actor;
```
## Important In-Built Functions: PostgreSQL – FORMAT Function
%
```text
In PostgreSQL, the FORMAT() function is used to format arguments based on a format string.
Syntax:
FORMAT(format_string [, format_argument [, ....] ])
Let’s analyze the above syntax:
The FORMAT() function is variadic, meaning, users can supply the arguments as an array marked with the VARIADIC keyword.
The FORMAT() function considers the array’s elements as normal arguments and it treats NULL as an array of zero elements.
Arguments
1. format_string
The format_string sets the behaviour of the resulting formatted string. It also has text and format specifiers. In this function, the text arguments are copied directly to the result string and the format specifiers are placeholders for the arguments.
Syntax of the format specifier:
Syntax: %[position][flags][width]type
Note that a format specifier begins with a “%” and it has three optional components position, flags, width, and a required component type.
2. position
It is used to set the argument that is to be inserted in the result string. The position is in the form of n$ where n is the argument index. The first argument starts from 1. The default is the next argument in the list if the position component is not set.
3.  flags
This component is used in conjunction with the width field, for instance, the flags can accept a minus sign (-) that instructs the format specifier’s output to be left-justified.
4. width
It is an optional argument and is used to set the minimum number of characters to use for displaying the format specifier’s output. At this stage, padding can be done to fill up the empty spaces whereas in case the string is smaller than the specified width the result string can be padded left or right with the spaces needed to fill the width. In the exact opposite case, the result string is displayed without any alteration.
The width argument can hold the following values:
A positive integer value.
An asterisk (*) to use the next function argument as the width.
A string of the form *n$ to use the nth function argument as the width.
5. type
It is used to define the type of the output string from the format specifier.
It can hold the following values:
s: It formats the argument value as a string. NULL values are treated as an empty strings.
I: It treats the argument value as an SQL identifier.
L: It makes the argument value as an SQL literal.
I and L are generally used for constructing dynamic SQL statements. The double percentages (%%) can also be used for including the % sign
6. format_arg
As discussed earlier, the users pass a number of format arguments to the FORMAT() function.
Return value
The FORMAT() function returns a formatted string.
Example 1:
The following statement uses the FORMAT() function to format a string:
SELECT FORMAT('Hello, %s', 'Geeks!!');
Output:
Example 2:
The following statement uses the FORMAT() function to construct customer’s full names from first names and last names from the customers table of the sample database, ie, dvdrental:
SELECT 
    FORMAT('%s, %s', last_name, first_name) full_name 
FROM 
    customer;
ORDER BY 
    full_name;
```
## Important In-Built Functions: PostgreSQL – UPPER function
%
```text
In PostgreSQL, the UPPER function is used to convert a string into upper case.
Syntax: UPPER(string_expression)
Like the LOWER function, the UPPER function accepts a string expression or string-convertible expression and converts it to an upper case format. In case the argument is not a string, the user must use the CAST function to explicitly convert it.
Example 1:
The following statement uses the CONCAT function and UPPER function to return the full name of staff in the upper case from the staff table of the
SELECT
    CONCAT (
        UPPER (first_name),
        UPPER (last_name)
    ) as full_name
FROM
    staff;
Output:
Example 2:
The following statement converts a lower case string to an upper case format:
SELECT UPPER('geeksforgeeks');
```
## Important In-Built Functions: PostgreSQL- LOWER function
%
```text
In PostgreSQL, the LOWER function is used to convert a string, an expression, or values in a column to lower case.
Syntax: LOWER(string or value or expression)
Let’s analyze the above syntax:
The LOWER function takes in value with either all uppercase or partial uppercase values or characters and convert them into lower case of the same type.
If the supplied argument is string-convertible, one can make use of the CAST function which converts a non-string value to a string.
Example 1:
The below statement uses LOWER function to get the full names of the films from the Film table of the sample database, ie, dvdrental:
SELECT LOWER(title) from film;
Output:
Example 2:
The below statement converts an upper case string to lower case:
SELECT LOWER('GEEKSFORGEEKS');
```
## Important In-Built Functions: PostgreSQL – REGEXP_MATCHES Function
%
```text
The PostgreSQL REGEXP_MATCHES() function is used to match a POSIX regular expression against a string and subsequently returns the strings that match the pattern.
Syntax:REGEXP_MATCHES(source_string, pattern [, flags])
Let’s analyze the above syntax:
The source is a string from which the regular expression matches and returns the substring.
The pattern is a POSIX regular expression for matching the source string.
The flags argument handles the function when more tha one character matches the pattern.
The REGEXP_MATCHES() function returns the queried string based on the matches.
Example 1:
Suppose, you have a social networking’s post as follows:
'Learning #Geeksforgeeks #geekPower'
The following statement allows you to extract the hashtags such as Geeksforgeeks and geekPower:
SELECT 
    REGEXP_MATCHES('Learning #Geeksforgeeks #geekPower', 
         '#([A-Za-z0-9_]+)', 
        'g');
Output:
Example 2:
This is common for all patterns that can be matched using the Regular Expressions as shown in the below example:
SELECT REGEXP_MATCHES('ABC', '^(A)(..)$', 'g');
```
## Important In-Built Functions: PostgreSQL – REGEXP_REPLACE Function
%
```text
The PostgreSQL REGEXP_REPLACE() function is used to replaces substrings that match a POSIX regular expression with a new substring.
Syntax: REGEXP_REPLACE(source, pattern, replacement_string, [, flags])
Let’s analyze the above syntax:
The source is a string where the search and replace operation in executed.
The pattern is a POSIX regular expression for matching substrings which is to be replaced.
The replacement_string is a string which replaces the substrings using match the regular expression pattern.
The flags argument is used to control the behaviour of the function for matching characters.
The PostgreSQL REGEXP_REPLACE() function returns the final string after the replacement of the original string with the substring.
Example 1:
For instance imagine you have a name of a person in the following format:
first_name last_name
And you want to rearrange the name as follows:
last_name, first_name
To do this, you can use the REGEXP_REPLACE() function as shown below:
SELECT REGEXP_REPLACE('Raju Kumar', '(.*) (.*)', '\2, \1');
Output:
Example 2:
Suppose you have data in the form of a string. This string is mixed with alphabets and digits as follows:
ABC12345xyz
The following query removes all alphabets e.g., A, B, C, etc from the source string:
SELECT REGEXP_REPLACE('ABC12345xyz', '[[:alpha:]]', '', 'g');
```
## Important In-Built Functions: PostgreSQL – REPLACE Function
%
```text
In PostgreSQL, the REPLACE function is used to search and replace all occurrences of a string with a new one.
Syntax: REPLACE(source, old_text, new_text );
Let’s analyze the above syntax:
The source is a string where you want to replace the existing string.
The old_text is the string that is to be searched and subsequently replaced. The old_text can occur multiple times and each of them gets replaced on the function is executed.
The new_text is the new text string that is suppose to replace the old text ( old_text ).
Example 1:
The following statement replaces the substring  ‘tt’ with  ‘xx’ in a URL:
SELECT
    REPLACE (
        'https://www.geeksforgeeks.org',
        'tt',
        'xx'
    );
Output:
Example 2:
The below statement updates the email column to replace the domain ‘sakilacustomer.org’ with ‘geeksforgeek.org’, in the customer table of the sample database, ie, dvdrental:
UPDATE 
   customer
SET 
   email = REPLACE (
      email,
    'sakilacustomer.org',
    'geeksforgeeks.org'
   );
To verify it use the below statement:
SELECT
    first_name,
    last_name,
    email
FROM
    customer;
```
## Important In-Built Functions: Visit PostgreSQL In-Built functions for more.
%
```text
https://www.geeksforgeeks.org/tag/postgresql-function/
```