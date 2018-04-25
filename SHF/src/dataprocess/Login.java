package dataprocess;

import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseConnection;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Entered Login ");
		Connection conn = DatabaseConnection.connectDb();
	    try {
	    	response.setContentType("text/html");
	    	//PrintWriter writer = response.getWriter();
	    	
	    	String name = request.getParameter("name").toString();
	    	String password = request.getParameter("password").toString();
	    	HttpSession session = request.getSession(true); 
	    	
	    	String dbname= null;
	    	String dbpassword = null;
	    	
	       	String sql = "select * from user where name=? and password=?";
			

	    	
	       	PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1,name);
				ps.setString(2,password);

				ResultSet rs = ps.executeQuery();
				while(rs.next()==true)
				{
					dbname = rs.getString(2);
					dbpassword = rs.getString(4);
					
					System.out.println("Entered Login " +dbname + " " + password);
					
				}
				if( name.equals(dbname)&&password.equals(dbpassword))
				{
					session.setAttribute("name", name);
				
				
					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.forward(request, response);
				}
				else
				{
				RequestDispatcher rd = request.getRequestDispatcher("reg.jsp");
				rd.forward(request, response);				
				}
				
				conn.close();
				ps.close();
			
			
	     	} 
	    catch (SQLException e)
    	{
        	e.printStackTrace();
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);

	}

	}		

				
							