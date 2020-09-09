ALTER TABLE Quotes
  ADD CHECK (price >= 0);

ALTER TABLE Trades
  ADD CONSTRAINT positive_cost
    CHECK (price*volume >= 0);

ALTER TABLE Trades
  ADD CHECK (buyerID <> sellerID);

ALTER TABLE Customers
  ADD CHECK ((isValidCustomer = TRUE AND category = 'H') OR category <> 'H');
