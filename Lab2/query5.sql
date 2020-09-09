SELECT DISTINCT t.exchangeID, s.stockName, c1.custName AS buyerName, c2.custName AS sellerName
  FROM Trades t, Stocks s, Customers c1, Customers c2
  WHERE t.tradeTS < '2018-01-01 12:00:00'
  AND t.exchangeID = s.exchangeID
  AND t.symbol = s.symbol
  AND c1.customerID = t.buyerID
  AND c1.custName = (SELECT custName
                      FROM Customers
                      WHERE t.buyerID = customerID)
  AND c2.custName IN (SELECT custName
                      FROM Customers
                      WHERE t.sellerID = customerID);
