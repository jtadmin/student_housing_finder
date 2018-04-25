package dataprocess;
import java.sql.*;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseConnection;

/**
 * Servlet implementation class AddNewListing
 */
@WebServlet("/AddNewListing")
public class AddNewListing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewListing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Enter to add new listing");

		

		
    	String address1 = request.getParameter("address1");
    	String address2 = request.getParameter("address2");
    	String city = request.getParameter("city");
    	String zipcode = request.getParameter("zipcode");
    	String cost = request.getParameter("cost");
    	String heater = request.getParameter("heater");
    	String washer = request.getParameter("washer");
    	String internet = request.getParameter("internet");
    	String parking = request.getParameter("parking");
    	String bedrooms = request.getParameter("bedrooms");
    	String bathrooms = request.getParameter("bathrooms");
    	String comments = request.getParameter("comments");
    	String image1 = request.getParameter("image1");
    	String username = request.getParameter("username");
    	System.out.println(username);
    	
		File image = new File("C://Users//sriteja//Downloads//"+ image1);
		System.out.println(image);
		FileInputStream fis = new FileInputStream(image);
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte[] buf = new byte[1024];
		for(int readNum; (readNum = fis.read(buf)) != -1;)
		{
			bos.write(buf, 0 , readNum);
		}
		fis.close();

    	Connection conn = DatabaseConnection.connectDb();	
    	PreparedStatement ps = null;
		try {


	    	//System.out.println(name +" " +email+)
				
		       	String sql = "insert into listings(address1, address2, city, zipcode, cost, heater, washer, internet, parking, bedrooms, bathrooms, comments, image1, username) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		       	ps = conn.prepareStatement(sql);
				
				ps.setString(1,address1);
				ps.setString(2,address2);
				ps.setString(3,city);
				ps.setString(4,zipcode);
				ps.setString(5, cost);
				ps.setString(6,heater);
				ps.setString(7, washer);
				ps.setString(8, internet);
				ps.setString(9, parking);
				ps.setString(10, bedrooms);
				ps.setString(11, bathrooms);
				ps.setString(12, comments);
				ps.setBytes(13,bos.toByteArray());
				ps.setString(14, username);

				System.out.println("Failed after setting string");
				ps.executeUpdate();	
				System.out.println("Entered NEW Listing into Database");
				

				RequestDispatcher rd = request.getRequestDispatcher("addedlisting.jsp");
				rd.forward(request, response);

			
	     	} 
	    catch (SQLException e)
    	{
        	e.printStackTrace();
        }
	    finally
	    {
	    	try {
	    		conn.close();
	    		
	    	}
		    catch (SQLException e)
	    	{
	        	e.printStackTrace();
	        }
	    }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
