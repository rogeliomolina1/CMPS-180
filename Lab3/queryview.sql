SELECT e.exchangeName, s.stockName, COUNT(q.symbol) AS numHighClosings
  FROM Exchanges e, Stocks s, QuotesSummary q
  WHERE q.closingPrice = q.highPrice
    AND e.exchangeID = q.exchangeID
    AND s.symbol = q.symbol
    AND s.exchangeID = q.exchangeID
    GROUP BY q.symbol, e.exchangeName, s.stockName
    HAVING COUNT (q.symbol) > 1;


/*
exchangename       |   stockname   | numhighclosings
-------------------------+---------------+-----------------
New York Stock Exchange | Cloudera,Inc. |               3
New York Stock Exchange | HP Enterprise |               2
(2 rows)
 */

DELETE FROM Quotes
  WHERE exchangeID = 'NYSE' AND
  symbol = 'CLDR' OR
  exchangeID = 'NASDAQ' AND
  symbol = 'ANF';

/*
exchangename       |   stockname   | numhighclosings
-------------------------+---------------+-----------------
New York Stock Exchange | HP Enterprise |               2
(1 row)
 */

SELECT e.exchangeName, s.stockName, COUNT(q.symbol) AS numHighClosings
  FROM Exchanges e, Stocks s, QuotesSummary q
  WHERE q.closingPrice = q.highPrice
    AND e.exchangeID = q.exchangeID
    AND s.symbol = q.symbol
    AND s.exchangeID = q.exchangeID
    GROUP BY q.symbol, e.exchangeName, s.stockName
    HAVING COUNT (q.symbol) > 1;
