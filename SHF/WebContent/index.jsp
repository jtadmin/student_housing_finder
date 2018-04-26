<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Colorlib">
    <meta name="description" content="#">
    <meta name="keywords" content="#">
    <!-- Page Title -->
    <title>Student Housing Listing</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="css/simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="css/set1.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
       <style>
    img {
    display: block;
    margin-left: auto;
    margin-right: auto;
	}
    #rcorners1 {
    border-radius: 25px;
    border: 3px solid #ff6666;
    padding: 20x; 
    width: 150px;
    height: 50px; 
    text-align: center;
	}
	table {
	    width:100%;
	}
	table, th, td {
	    border: 1px solid black;
	    border-collapse: collapse;
	}
	th, td {
	    padding: 15px;
	    text-align: left;
	}
	table#t01 tr:nth-child(even) {
	    background-color: #eee;
	}
	table#t01 tr:nth-child(odd) {
	   background-color: #e6f3ff;
	}

	}
	</style>
</head>

<body>

    <!--============================= HEADER =============================-->
    <div class="nav-menu">
        <div class="bg transition">
            <div class="container-fluid fixed">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="index.html"><img src="images/logo.png" />Student Housing Finder</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-menu"></span>
              </button>
                            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                <ul class="navbar-nav">
            
                                    <li class="nav-item active">
                                        <a class="nav-link" href="home.jsp">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="recentlisting.jsp">Listings</a>
                                    </li>
                                    <li><a href="addlisting.jsp" class="nav-link"><span class="ti-plus"></span> Add Listing</a></li>
									<li class="nav-item active">
                                    <a id ="rcorners1" class="nav-link" href="reg.jsp">Login/Register</a>
									</li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- SLIDER -->
    <section class="slider d-flex align-items-center">
        <!-- <img src="images/slider.jpg" class="img-fluid" alt="#"> -->
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-md-12">
                    <div class="slider-title_box">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="slider-content_wrap">
                                    <h1>Welcome to Student Housing Finder</h1>
                                    <h5>Let's uncover the best housing options...</h5>
                                </div>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-10">
                                <form action = "searchresults.jsp" autocomplete = "on" class="form-wrap mt-4">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <input type="text" name = "search" placeholder="06516" class="btn-group1">
                                        <button type="submit" class="btn-form"><span class="icon-magnifier search-icon"></span>SEARCH<i class="pe-7s-angle-right"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--// SLIDER -->
<!--============================= RECENT LISTING =============================-->
	 <section class="main-block light-bg">
	     <div class="container"> 
	     	<h3 align="center">Recent Listings</h3>
			<table  id = "t01" align="center" style = "width:80%">
			
    <%
    try{	
    	Connection conn = null;
       	String sql = "select * from listings";
    	

        Class.forName("org.sqlite.JDBC");
    	conn = DriverManager.getConnection("jdbc:sqlite:C://sqlite/shf.db");
       	PreparedStatement ps = conn.prepareStatement(sql);
       	
    	int count = 0;
	    ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
		%>
		  <tr>
		    <td > <input type="hidden" name="indv" value="<%=rs.getString("address1")%>"><a href = "listing.jsp" >Address: <%=rs.getString("address1") %>, </a><a><%=rs.getString("city") %></a> </td>
		    <td rowspan="2"><img class = align-items-center" src = "<%=rs.getString("image2")%>" width="350" height="200" ></td>
		  </tr>
		  <tr>
		    <td > Cost: <%=rs.getString("cost") %>/month </td>
		  </tr>
		<%	
		 count++;
		if(count==10)
			break;
		}
    	
    }catch (SQLException e)
    {
    	e.printStackTrace();
    
    }
    	
    		
    %>
   				
			</table>
	     </div>
	 </section>
		 <!--//END RECENT LISTING -->

    <!--============================= ADD LISTING =============================-->
    <section class="main-block light-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="add-listing-wrap">
                        <h3>Do you have a room or house to rent or share?</h3>
                        <p>List your property here...</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="addlisting.jsp" class="btn btn-danger"><span class="ti-plus"></span> ADD LISTING</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END ADD LISTING -->

    <!--============================= FOOTER =============================-->
    <footer class="main-block dark-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <p>Copyright &copy; 2018 Student Housing Finder. All rights reserved | James Travers, Sri Teja Chinnam, Sheth Dhwani, Donald </a></p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <ul>
                            <li><a href="#"><span class="ti-facebook"></span></a></li>
                            <li><a href="#"><span class="ti-twitter-alt"></span></a></li>
                            <li><a href="#"><span class="ti-instagram"></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--//END FOOTER -->




    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <script>
        $(window).scroll(function() {
            // 100 = The point you would like to fade the nav in.

            if ($(window).scrollTop() > 100) {

                $('.fixed').addClass('is-sticky');

            } else {

                $('.fixed').removeClass('is-sticky');

            };
        });
    </script>
</body>

</html>
