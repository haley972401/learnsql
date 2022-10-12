--SQL to build schema
IF OBJECT_ID( 'tempdb..#Employee' ) IS NOT NULL
DROP TABLE #Employee;

CREATE TABLE #Employee (name varchar(10), salary int);

INSERT INTO #Employee VALUES ('Rick', 3000);
INSERT INTO #Employee VALUES ('John', 4000);
INSERT INTO #Employee VALUES ('Shane', 3000);
INSERT INTO #Employee VALUES ('Peter', 5000);
INSERT INTO #Employee VALUES ('Jackob', 7000);
INSERT INTO #Employee VALUES ('Sid', 1000);

SELECT e.*,
       row_number() OVER (ORDER BY salary DESC) row_number,
       rank() OVER (ORDER BY salary DESC) rank,
       dense_rank() OVER (ORDER BY salary DESC) dense_rank,
FROM Employee e


--Output: 
+--------+--------+------------+------+------------+
|  name  | salary | row_number | rank | dense_rank |
+--------+--------+------------+------+------------+
| Jackob |  7000  |      1     |   1  |      1     |
| Peter  |  5000  |      2     |   2  |      2     |
| John   |  4000  |      3     |   3  |      3     |
| Shane  |  3000  |      4     |   4  |      4     |
| Rick   |  3000  |      5     |   4  |      4     |
| Sid    |  1000  |      6     |   6  |      5     |
+--------+--------+------------+------+------------+


