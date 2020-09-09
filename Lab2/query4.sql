SELECT DISTINCT t.exchangeID, t.symbol, t.buyerID,
                t.price * t.volume AS theCost, c.category
  FROM Customers c, Trades t
  WHERE t.price * t.volume >= 5000
  AND t.buyerID = c.customerID
  AND c.isValidCustomer = true
  AND c.category IS NOT NULL;
