/*
Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.
 

Report for every three line segments whether they can form a triangle.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Triangle table:
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+
Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+
*/
--! triangle theorem is that 2 sides have to be bigger than the 3 sides for every combination
SELECT *,

    CASE
        WHEN 
            (CASE WHEN x + y > z THEN 'yes' END) = 'yes' and
        (CASE WHEN x + z > y THEN 'yes' END) = 'yes' and
        (CASE WHEN z + y > x THEN 'yes' END) = 'yes'
        THEN 'Yes'
        ELSE 'No'
    END as triangle
FROM Triangle;
