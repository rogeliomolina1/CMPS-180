CREATE VIEW Opening AS
  SELECT price, DATE(quoteTS) AS theDate, symbol
    FROM Quotes
    WHERE quoteTS IN (SELECT MIN(quoteTS)
                      FROM Quotes
                      GROUP BY DATE(quoteTS), symbol);

CREATE VIEW Closing AS
  SELECT price, DATE(quoteTS) AS theDate, symbol
    FROM Quotes
    WHERE quoteTS IN (SELECT MAX(quoteTS)
                      FROM Quotes
                      GROUP BY DATE(quoteTS), symbol);

CREATE VIEW Low AS
  SELECT MIN(price) AS price, DATE(quoteTS) AS theDate, symbol
  FROM Quotes
  GROUP BY DATE(quoteTS), symbol;

CREATE VIEW High AS
  SELECT MAX(price) AS price, DATE(quoteTS) AS theDate, symbol
  FROM Quotes
  GROUP BY DATE(quoteTS), symbol;

CREATE VIEW QuotesSummary AS
  SELECT DISTINCT q.exchangeID, q.symbol, DATE(q.quoteTS) AS theDate, o.price AS openingPrice,
    c.price AS closingPrice, l.price AS lowPrice, h.price AS highPrice
  FROM Quotes q, Opening o, Closing c, Low l, High h
  WHERE q.symbol = o.symbol AND o.symbol = c.symbol AND c.symbol = l.symbol
    AND l.symbol = h.symbol
    AND DATE(q.quoteTS) = o.theDate AND o.theDate = c.theDate AND c.theDate = l.theDate
    AND l.theDate = h.theDate;
