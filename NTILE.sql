-- https://app.mode.com/editor/haley2401/reports/0c1741835230/queries/043f256d1a0f
-- Mode app
-- explain SELECT * FROM demo.orders xuất thông tin truy vấn lệnh


/* 
Hàm NTILE là một hàm rất có ích nếu bạn chỉ muốn trả lại một nhóm cụ thể trong các bản ghi. 
Dưới đây là một ví dụ khi tôi muốn trả lại chỉ nhóm người có độ tuổi chung bình (Nhóm Age 2) từ ví dụ trên.
SELECT FirstName,
       Age,
       Age AS [Age Group]
FROM
  (SELECT FirstName,
          Age,
          NTILE(3) OVER (
                         ORDER BY Age) AS AgeGroup
   FROM Person) A
WHERE AgeGroup = 2

SELECT
  account_id,
  occurred_at,
  standard_qty,
  NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
FROM
  demo.orders
*/


  SELECT
       account_id,
       occurred_at,
       total_amt_usd,
       NTILE(100) OVER (PARTITION BY account_id ORDER BY total_amt_usd) AS total_percentile
  FROM demo.orders 
 ORDER BY account_id DESC