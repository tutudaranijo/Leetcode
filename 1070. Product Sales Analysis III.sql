/*Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.
 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
 

Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

Return the resulting table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+*/
SELECT
    s.product_id,
    MIN(s.year) AS first_year,
    s.quantity,
    s.price
FROM
    Sales s
    JOIN
    Product p ON s.product_id = p.product_id
WHERE
    (s.product_id, s.year
) IN
(
        SELECT
    product_id,
    MIN(year) AS first_year
FROM
    Sales
GROUP BY
            product_id
    )
GROUP BY
    s.product_id, s.year, s.quantity, s.price
/*
!The subquery (s.product_id, s.year) IN (...) is used to filter the rows in the Sales table based on two conditions: product_id and year.
*The subquery in the parentheses is executed first. It is a subquery that aggregates data from the Sales table to find the minimum (first) year for each product. The subquery uses the GROUP BY clause to group rows by product_id and then calculates the minimum year using the MIN(year) function.
*The result of the subquery is a set of rows, each containing a product_id and its corresponding minimum (first) year.
*The outer query then uses the result of the subquery as a filter. It compares each row's (product_id, year) combination in the Sales table to the rows produced by the subquery. If a row in the Sales table matches a (product_id, year) combination from the subquery's result, it is included in the final result set.
*/

