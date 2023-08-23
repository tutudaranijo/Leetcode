/*
Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the primary key for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
 

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

The query result format is in the following example.

 

Example 1:

Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.
*/
SELECT e1.employee_id, e1.name, COUNT(e2.employee_id) as reports_count, ROUND(AVG(e2.age)) as average_age
FROM Employees e1
    LEFT JOIN Employees e2 ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id, e1.name
HAVING reports_count >= 1
ORDER BY e1.employee_id;

/*
! The query uses a LEFT JOIN to connect the Employees table with itself. This allows us to join the employees with their respective managers based on the employee_id and reports_to columns.
*In the SELECT clause:
*e1.employee_id and e1.name are selected for the manager's information.
*COUNT(e2.employee_id) calculates the number of employees who report directly to the manager.
*ROUND(AVG(e2.age)) calculates the average age of employees who report to the manager and rounds it to the nearest integer.
*The GROUP BY clause groups the results by the manager's employee_id and name.
*The HAVING clause filters out managers who don't have any direct reports (reports_count < 1).
*The ORDER BY clause sorts the result by employee_id.

*/