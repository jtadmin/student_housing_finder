package database;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection 
{

	public static Connection connectDb()
	{
		Connection conn = null;
		 try {

			        Class.forName("org.sqlite.JDBC");
					conn = DriverManager.getConnection("jdbc:sqlite:C://sqlite/shf.db");				
		     	} 
		    catch ( ClassNotFoundException e )
		    	{
		    	 e.printStackTrace();
		     	}
		    catch (SQLException e)
		    	{
		        	e.printStackTrace();
		        }
		 return conn;

	}
	

}