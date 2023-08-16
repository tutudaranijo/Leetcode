/* Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
In SQL, id is the primary key for this table.
This table contains information about the temperature on a certain day.
 

Find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30). */

/*
! Your going to use a self join Weather w1 and Weather w2 are aliases for the same table. We are using them to reference the table with different aliases so that we can distinguish between the current day's data (w1) and the previous day's data (w2) when joining.
*w1.recordDate refers to the recordDate column in the w1 alias, which represents the current day's data.
*w2.recordDate refers to the recordDate column in the w2 alias, which represents the previous day's data.
*DATE_ADD(w2.recordDate, INTERVAL 1 DAY) calculates the date that is one day after the w2.recordDate, effectively representing the next day after the date in w2. This is used to match consecutive days in the join.
*ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY) is the condition for the join. It ensures that the rows from w1 and w2 being joined correspond to consecutive days. Essentially, it's checking if the recordDate in w1 matches the date that is one day after the recordDate in w2.
*/
SELECT w1.id
FROM Weather w1
JOIN Weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
