/*
Table: Employee

+---------------+---------+
| Column Name   |  Type   |
+---------------+---------+
| employee_id   | int     |
| department_id | int     |
| primary_flag  | varchar |
+---------------+---------+
(employee_id, department_id) is the primary key (combination of columns with unique values) for this table.
employee_id is the id of the employee.
department_id is the id of the department to which the employee belongs.
primary_flag is an ENUM (category) of type ('Y', 'N'). If the flag is 'Y', the department is the primary department for the employee. If the flag is 'N', the department is not the primary.
 

Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.

Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-------------+---------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+---------------+--------------+
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |
+-------------+---------------+--------------+
Output: 
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
| 1           | 1             |
| 2           | 1             |
| 3           | 3             |
| 4           | 3             |
+-------------+---------------+
Explanation: 
- The Primary department for employee 1 is 1.
- The Primary department for employee 2 is 1.
- The Primary department for employee 3 is 3.
- The Primary department for employee 4 is 3.
*/
SELECT employee_id,
    MAX(CASE WHEN primary_flag = 'Y' THEN department_id END) AS department_id
FROM Employee
GROUP BY employee_id
HAVING MAX(primary_flag = 'Y') = 1
    OR (MAX(primary_flag = 'N') = 1 AND COUNT(DISTINCT department_id) = 1);



/*
!The COALESCE() function takes the results of the two MAX() functions and returns the first non-null value. If there's a row with primary_flag = 'Y', it will use that department_id. If there's no such row, it will use the department_id where primary_flag = 'N'.
*/

/*
*The HAVING clause filters the results based on the following conditions:
*MAX(primary_flag = 'Y') = 1 ensures that if an employee has a primary department with the 'Y' flag, it's selected.
*(MAX(primary_flag = 'N') = 1 AND COUNT(DISTINCT department_id) = 1) ensures that if an employee has a non-primary department with the 'N' flag and they only belong to one department, that department is selected.
*/