package dataprocess;

import java.sql.*;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Listing
 */
@WebServlet("/Listing")
public class Listing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Listing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	String address1 = null;
    	String address2 = null;
    	String city = null;
    	String zipcode = null;
    	String cost = null;
    	String heater = null;
    	String washer = null;
    	String internet = null;
    	String parking = null;
    	String bedrooms = null;
    	String bathrooms = null;
    	String comments = null;
    	String image1 = null;
    	String listingid = null;
    	String username = null;
	    try{	
	    	Connection conn = null;
	       	String sql = "select * from listings where listingid = 4";
	    	

	        Class.forName("org.sqlite.JDBC");
	    	conn = DriverManager.getConnection("jdbc:sqlite:C://sqlite/shf.db");
	       	PreparedStatement ps = conn.prepareStatement(sql);
	       //	String imgLen = "";

		    ResultSet rs = ps.executeQuery();
		    
		    while(rs.next()==true)
			{
		    	username = rs.getString("username");
		    	listingid = rs.getString("listingid");
		    	address1 = rs.getString("address1");
		    	address2 = rs.getString("address2");
		    	city = rs.getString("city");
		    	zipcode = rs.getString("zipcode");
		    	
		    	cost = rs.getString("cost");
		    	heater = rs.getString("heater");
		    	washer = rs.getString("washer");
		    	internet = rs.getString("internet");
		    	parking = rs.getString("parking");
		    	bedrooms = rs.getString("bedrooms");
		    	bedrooms = rs.getString("bathrooms");
		    	comments = rs.getString("comments");
		    	
		    	
			}
		    
		    request.setAttribute("listingid",listingid);
		    request.setAttribute("address1",address1);
		    request.setAttribute("address2",address2);
		    request.setAttribute("city",city);
		    request.setAttribute("zipcode",zipcode);
		    request.setAttribute("cost",cost);
		    request.setAttribute("heater",heater);
		    request.setAttribute("washer",washer);
		    request.setAttribute("internet",internet);
		    request.setAttribute("parking",parking);
		    request.setAttribute("bedrooms",bedrooms);
		    request.setAttribute("bathrooms",bathrooms);
		    request.setAttribute("comments",comments);
		    
		    String sql1 = "select * from user where name = ?";
	       	 ps = conn.prepareStatement(sql1);
	       //	String imgLen = "";
	       	ps.setString(1,username);
		     rs = ps.executeQuery();
		     String contact_no = null;
		     String email = null;
		    
		    while(rs.next()==true)
			{
		    	username = rs.getString("name");
		    	contact_no = rs.getString("contact_no");
		    	address1 = rs.getString("email");
			}
		    request.setAttribute("name",username);
		    request.setAttribute("contact_no",contact_no);
		    request.setAttribute("email",email);
		    
		    request.getRequestDispatcher("listing.jsp").forward(request,response);

			conn.close();
			ps.close();
			rs.close();
	    	
	    }catch (SQLException e)
	    {
	    	e.printStackTrace();
	    
	    } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
