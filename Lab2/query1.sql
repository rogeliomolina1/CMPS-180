SELECT customerID, custName, address
  FROM Customers
  WHERE isValidCustomer = true
    AND custName Like '%FAKE%';
