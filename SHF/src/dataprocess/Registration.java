package dataprocess;

import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseConnection;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

    	String name =null;

    	name = request.getParameter("name");
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	String confpassword = request.getParameter("confpassword");
    	//HttpSession session = request.getSession(true);

    	System.out.println(name+" "+password+" "+email +" Test");
    	Connection conn = DatabaseConnection.connectDb();	
    	PreparedStatement ps = null;
		try {


	    	//System.out.println(name +" " +email+)
				System.out.println("Entered Registration");
		       	String sql = "insert into user(name,email,password) values(?,?,?)";

		       	ps = conn.prepareStatement(sql);
				
				ps.setString(1,name);
				ps.setString(2,email);
				ps.setString(3,password);
				ps.executeUpdate();	
				
				if(password.equals(confpassword))
				{
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
				}
				else
				{
				RequestDispatcher rd = request.getRequestDispatcher("reg.jsp");
				rd.forward(request, response);				
				}
			
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
		doPost(request, response);
	}

}
