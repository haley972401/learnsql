-- https://app.mode.com/editor/haley2401/reports/0c1741835230/queries/043f256d1a0f
-- Mode app
-- explain SELECT * FROM demo.orders xuất thông tin truy vấn lệnh


SELECT id,
       account_id,
       standard_qty,
       DATE_TRUNC('month', occurred_at) AS month,
       DENSE_RANK() OVER main_window AS dense_rank,
       SUM(standard_qty) OVER main_window AS sum_std_qty,
       COUNT(standard_qty) OVER main_window AS count_std_qty,
       AVG(standard_qty) OVER main_window AS avg_std_qty,
       MIN(standard_qty) OVER main_window AS min_std_qty
FROM demo.orders

WINDOW main_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at))