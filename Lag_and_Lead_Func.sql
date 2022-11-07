-- https://app.mode.com/editor/haley2401/reports/0c1741835230/queries/043f256d1a0f
-- Mode app
-- explain SELECT * FROM demo.orders xuất thông tin truy vấn lệnh

SELECT
  account_id
  , standard_sum
  , LAG(standard_sum) OVER (ORDER BY standard_sum) AS pre_sum
  , LAG(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lag_difference
  , LEAD(standard_sum) OVER (ORDER BY standard_sum) AS next_sum
  , LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM
  (
    SELECT
      account_id,
      SUM(standard_qty) AS standard_sum
    FROM
      demo.orders
    GROUP BY
      1
  ) sub