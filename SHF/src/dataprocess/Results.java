package dataprocess;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;

/**
 * Servlet implementation class Results
 */
@WebServlet("/Results")
public class Results extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Results() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = null;
		PreparedStatement ps = null;

		/*try {

			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection("jdbc:sqlite:C://sqlite/shf.db");
		   	String sql = "select image1 from listings where listingid= 4";
		   	ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next())
			{
				byte barray[] = rs.getBytes("image1");
				response.setContentType("image/png");
				image = response.getOutputStream();
				image.write(barray);
				image.flush();
				image.close();
				
			}

			
			//Image image = new Image("file:photo.jpg", 100, 150, true, true);
			
			RequestDispatcher rd = request.getRequestDispatcher("searchresults.jsp");
			rd.forward(request, response);

			
			
		} catch(Exception e) {
			e.printStackTrace();
		}*/
		
		try {

			
		 	Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection("jdbc:sqlite:C://sqlite/shf.db");
	       	String sql = "select image1 from listings where listingid = 4";
	       	ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			//InputStream is = rs.getBinaryStream("image1");
			OutputStream img;
			if(rs.next())
			{
			byte content[] = rs.getBytes("image1");
			response.setContentType("image/jpg");
			img = response.getOutputStream();
			img.write(content);
			img.flush();
			img.close();
				
			}
			
			//RequestDispatcher rd = request.getRequestDispatcher("searchresults.jsp");
			//rd.forward(request, response);
			
			conn.close();
			ps.close();
		
		} catch(Exception e) {
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
