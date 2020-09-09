CREATE OR REPLACE FUNCTION rewardBuyersFunction(theSellerID INTEGER, theCount INTEGER)
RETURNS INTEGER AS $total$
DECLARE
  updates INTEGER := 0;
  howMany INTEGER := 0;
  total INTEGER := 0;
  BEGIN
    PERFORM DISTINCT buyerID, sellerID
      FROM BuyerSellerTotalCost
      WHERE sellerID = theSellerID;
    GET DIAGNOSTICS howMany := ROW_COUNT;
    IF (howMany = 0) THEN
      RETURN total;
    ELSE
      UPDATE TRADES t
        SET volume = volume + 50
        FROM (SELECT *
              FROM BuyerSellerTotalCost
              WHERE sellerID = theSellerID
              ORDER BY totalCost DESC
              LIMIT theCount) b, Customers c
        WHERE b.sellerID = theSellerID
        AND t.sellerID = b.sellerID
        AND b.buyerID = t.buyerID
        AND c.customerID = t.buyerID
        AND c.category = 'H';
      GET DIAGNOSTICS updates := ROW_COUNT;
      total := total + updates;

      UPDATE TRADES t
        SET volume = volume + 20
        FROM (SELECT *
              FROM BuyerSellerTotalCost
              WHERE sellerID = theSellerID
              ORDER BY totalCost DESC
              LIMIT theCount) b, Customers c
        WHERE b.sellerID = theSellerID
        AND t.sellerID = b.sellerID
        AND b.buyerID = t.buyerID
        AND c.customerID = t.buyerID
        AND c.category = 'M';
      GET DIAGNOSTICS updates := ROW_COUNT;
      total := total + updates;

      UPDATE TRADES t
        SET volume = volume + 5
        FROM (SELECT *
              FROM BuyerSellerTotalCost
              WHERE sellerID = theSellerID
              ORDER BY totalCost DESC
              LIMIT theCount) b, Customers c
        WHERE b.sellerID = theSellerID
        AND t.sellerID = b.sellerID
        AND b.buyerID = t.buyerID
        AND c.customerID = t.buyerID
        AND c.category = 'L';
      GET DIAGNOSTICS updates := ROW_COUNT;
      total := total + updates;

      UPDATE TRADES t
        SET volume = volume + 1
        FROM (SELECT *
              FROM BuyerSellerTotalCost
              WHERE sellerID = theSellerID
              ORDER BY totalCost DESC
              LIMIT theCount) b, Customers c
        WHERE b.sellerID = theSellerID
        AND t.sellerID = b.sellerID
        AND b.buyerID = t.buyerID
        AND c.customerID = t.buyerID
        AND c.category <> 'H'
        AND c.category <> 'M'
        AND c.category <> 'L';
      GET DIAGNOSTICS updates := ROW_COUNT;
      total := total + updates;
    END IF;
    RETURN total;
  END;
$total$ LANGUAGE plpgsql;
