-- 1️⃣ CREATE A UNIFIED VIEW FROM INDIVIDUAL TABLES
CREATE OR REPLACE VIEW all_stocks AS
SELECT Date, Open, High, Low, Close, Volume, 'AAPL' AS Name FROM AAPL
UNION ALL
SELECT Date, Open, High, Low, Close, Volume, 'MSFT' AS Name FROM MSFT
UNION ALL
SELECT Date, Open, High, Low, Close, Volume, 'JNJ' AS Name FROM JNJ
UNION ALL
SELECT Date, Open, High, Low, Close, Volume, 'WMT' AS Name FROM WMT
UNION ALL
SELECT Date, Open, High, Low, Close, Volume, 'XOM' AS Name FROM XOM;
-- 👉 Add other companies as needed

-- 2️⃣ LATEST CLOSE PRICE FOR EACH COMPANY
SELECT Name, Date, Close
FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Name ORDER BY Date DESC) AS rn
  FROM all_stocks
) t
WHERE rn = 1
INTO OUTFILE '/var/lib/mysql-files/latest_close.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- 3️⃣ HIGHEST SINGLE-DAY CLOSE PRICE
SELECT Name, Date, Close
FROM all_stocks
ORDER BY Close DESC
LIMIT 1
INTO OUTFILE '/var/lib/mysql-files/highest_close.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- 4️⃣ AVERAGE VOLUME PER COMPANY
SELECT Name, AVG(Volume) AS avg_volume
FROM all_stocks
GROUP BY Name
ORDER BY avg_volume DESC
INTO OUTFILE '/var/lib/mysql-files/avg_volume.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- 5️⃣ YEARLY AVERAGE CLOSE PRICE PER COMPANY
SELECT Name, YEAR(Date) AS year, AVG(Close) AS avg_close
FROM all_stocks
GROUP BY Name, year
ORDER BY Name, year
INTO OUTFILE '/var/lib/mysql-files/yearly_avg_close.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- 6️⃣ BIG DROP DAYS (>5% loss)
SELECT Name, Date, Open, Close, ROUND(((Close - Open)/Open)*100,2) AS pct_change
FROM all_stocks
WHERE ((Close - Open)/Open)*100 <= -5
ORDER BY Date, Name
INTO OUTFILE '/var/lib/mysql-files/big_drops.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- 7️⃣ COMPARE AAPL AND MSFT CLOSE PRICES
SELECT a.Date, a.Close AS AAPL_Close, m.Close AS MSFT_Close
FROM AAPL a
JOIN MSFT m ON a.Date = m.Date
ORDER BY a.Date
INTO OUTFILE '/var/lib/mysql-files/aapl_msft_compare.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';
