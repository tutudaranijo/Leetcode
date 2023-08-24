/*
Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.
*/
WITH
    cte
    AS
    
    (
        SELECT *, LEAD(id) Over(ORDER BY id) AS next, -- * Lead is giving you the next id for each row
            LAG(id) OVER(ORDER BY id) AS prev
        --* Lag is giving you the previous id of each row

        FROM Seat
    )
--! creating a case if statement to satisfy the requirements
SELECT CASE WHEN (( id % 2 = 1) and next is not null)THEN NEXT -- * when its odd  and next is null then you want original id
WHEN (id % 2 =0) Then prev -- * if odd then return prev
ELSE id END as id, student
-- * even return next this 
FROM cte
ORDER by id
