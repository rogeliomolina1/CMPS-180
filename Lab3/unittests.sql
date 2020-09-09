INSERT INTO Trades(exchangeID, symbol, tradeTS, buyerID, price, volume)
  VALUES ('NYSE', 'INL', TIMESTAMP '2019-12-13 04:53:05', 1111, 555.55, 55);

INSERT INTO Trades(exchangeID, symbol, tradeTS, sellerID, price, volume)
  VALUES ('NYSE', 'INL', TIMESTAMP '2019-12-20 04:53:03', 2222, 555.55, 55);

INSERT INTO Trades(exchangeID, symbol, tradeTS, price, volume)
  VALUES ('NASDAQ', 'GOOG', TIMESTAMP '2019-12-13 04:53:03', 555.55, 55);

INSERT INTO Quotes(exchangeID, symbol, quoteTS)
  VALUES ('NASDAQ', 'TSLA', TIMESTAMP '2019-12-23 04:53:03');

UPDATE Quotes
  SET price = price * 1.1
  WHERE price > 5000;

UPDATE Quotes
  SET price = price * -1
  WHERE price < 5000;

UPDATE Trades
  SET price = 2000, volume = 1000
  WHERE price * volume > 2000000;

UPDATE Trades
  SET price = price * -1, volume = volume / 2
  WHERE price * volume < 5000;

UPDATE Trades
  SET buyerID = sellerID, sellerID = buyerID;

UPDATE Trades
  SET buyerID = sellerID
  WHERE buyerID = 1456;

UPDATE Customers
  SET isValidCustomer = TRUE
  WHERE category = 'H';

UPDATE Customers
  SET isValidCustomer = FALSE
  WHERE category = 'H';
