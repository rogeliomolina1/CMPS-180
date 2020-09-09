import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the StockMarketApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/


public class RunStockMarketApplication
{
    public static void main(String[] args) {
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver");
    	    // Make the connection.
            // You will need to fill in your real username abd password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps180-db.lt.ucsc.edu/rgmolina",
                                                     "rgmolina",
                                                     "password");

            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the StockMarketApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */

            StockMarketApplication app = new StockMarketApplication(connection);
            int numDiff = 3;
            List<Integer> result = app.getCustomersWhoSoldManyStocks(numDiff);
            System.out.println("Output of getCustomersWhoSoldManyStocks");
            System.out.println("when the parameter numDifferentStocksSold is "+numDiff+".");
            System.out.println(result);
            /*
            * Output of getCustomersWhoSoldManyStocks
            * when the parameter numDifferentStocksSold is 3.
            [1456, 1489, 1854, 9731]
            */

            String exchangeID = "LSE   ";
            int totalUpdates = app.updateQuotesForBrexit(exchangeID);
            System.out.println("Output of updateQuotesForBrexit when theExchangeID is "+exchangeID+".");
            System.out.println(totalUpdates);
            /*
            *Output of updateQuotesForBrexit when theExchangeID is ‘LSE ’
            5
            */

            int theSellerID = 1456;
            int theCount = 2;
            int resultFunc = app.rewardBestBuyers (theSellerID, theCount);
            System.out.println("Output of rewardBestBuyers when theSellerID is "+theSellerID+" and thCount is "+theCount+".");
            System.out.println(resultFunc);
            /*
            *Output of rewardBestBuyers when theSellerID is 1456 and thCount is 2.
            7
            */

            theCount = 4;
            resultFunc = app.rewardBestBuyers (theSellerID, theCount);
            System.out.println("Output of rewardBestBuyers when theSellerID is "+theSellerID+" and thCount is "+theCount+".");
            System.out.println(resultFunc);
            /*
            *Output of rewardBestBuyers when theSellerID is 1456 and thCount is 4.
            8
            */
            /*******************
            * Your code ends here */

    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
