BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  INSERT INTO Customers(customerID, custName, address, category, isValidCustomer)
    SELECT customerID, custName, address, NULL, TRUE
    FROM NewCustomers
    WHERE customerID NOT IN
      (SELECT customerID
      FROM Customers);

  UPDATE Customers c
    SET custName = n.custName,
        address = n.address,
        isValidCustomer = TRUE
    FROM NewCustomers n
    WHERE c.customerID = n.customerID;
COMMIT;
