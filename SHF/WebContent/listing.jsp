<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%
String  search = request.getParameter("search");
System.out.println(search);
%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
   	.checked {
	right: 100px;
    color: orange;
}
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
	    
	    border-collapse: collapse;
	}
	th, td {
	    padding: 5px;
	    text-align: left;
	}
	table#t01 tr:nth-child(all) {
	   background-color: #e6f3ff;
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
                                        <a class="nav-link" href="recentlisting.html">Listings</a>
                                    </li>
                                    <li><a href="addlisting.jsp" class="nav-link"><span class="ti-plus"></span> Add Listing</a></li>
									<li class="nav-item active">
                                    <a id="rcorners1"class="nav-link" href="profile.jsp"><% if(session.getAttribute("name") != null){%><%=session.getAttribute("name")%></a><%}else{%><a class="nav-link" href="reg.jsp">Login<%}%></a>
									</li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--============================= Search Bar =============================-->

	 <section class="main-block light-bg">
	     <div class="container"> 
	     	 <div class="row d-flex justify-content-center">
                  <div class="col-md-10">
                       <form action = "searchresults.jsp" class="form-wrap mt-4" autocomplete="on">
                           <div class="btn-group" role="group" aria-label="Basic example">
                               <input type="text" placeholder="06516" name = "search" class="btn-group1">
                               <button type="submit" class="btn-form"><span class="icon-magnifier search-icon"></span>SEARCH<i class="pe-7s-angle-right"></i></button>
                           </div>
                       </form>
                   </div>
               </div>
	     </div>
	 </section>
<!--//Search Bar -->


			

<!--============================= RECENT LISTING =============================-->
	 <section class="main-block light-bg">
	     <div class="container"> 
	     	<h4 align="center">Listing ID: 0000${listingid}</h4>
	     	<div>
	     	<h3> <br></h3>
	     	Ratings: 
		     	<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
			<h3> <br></h3>
	     	</div>
			   <div class="row">
				<div class="column" style="background-color:#f2f2f2;">
				<table  id = "t01" align="center" style = "width:80%">
				  <tr>
				    <td > <a>Address: ${address1}</a> <a>, ${address2}</a> </td>
				  </tr>
				  <tr>
					<td > Cost: ${cost}/month</td>
				  </tr>
				  <tr>
				    <td > Heater: ${heater} </td>
				  </tr>
				  <tr>
				    <td > Washer & Dryer: ${washer} </td>
				  </tr>
				  <tr>
				    <td > Internet: ${internet} </td>
				  </tr>
				  <tr>
				    <td > Parking: ${parking}</td>
				  </tr>
				  <tr>
				    <td > Number of Bedrooms: ${bedrooms} </td>
				  </tr>
				  <tr>
				    <td > Number of Bathrooms: ${bathrooms} </td>
				  </tr>
				  <tr>
				    <td > Comments: ${comments} </td>
				  </tr>
			</table>
				</div>
				<div class="column" style="background-color:#f2f2f2;">
					<img class="mySlides"  src="http://andrewmarkveety.com/upload/t/two-storey-house-plans-pinoy-eplans-double-story-modern-house-plans.jpeg" style="width:100%">
					<img class="mySlides"  src="http://houzbuzz.com/wp-content/uploads/2016/03/case-cu-etaj-moderne-Two-story-modern-house-plans-1-980x600.jpg" style="width:100%">
				  	<img class="mySlides" src="https://www.google.com/search?safe=off&client=firefox-b-1-ab&tbm=isch&q=house+image&chips=q:house+image,g_4:two+story,g_2:modern&sa=X&ved=0ahUKEwi97vrIpNTaAhVqUN8KHRmsBw4Q4lYIKygA&biw=1504&bih=889&dpr=1.5#imgrc=GmQi2TpOwuvBGM:" style="width:100%">	
				
				  	<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
				  	<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
				  </div>
				</div>
			<div >
			<h1> <br></h1>
			<h5 font = "bold">Contact details of property owner</h5>
			<p>Owner Name: ${name}</p>
			<p>email: ${email}</p>
			<p>Contact Number: ${contact_no}</p>
			</div>
			</div >

	 </section>
		 <!--//END RECENT LISTING -->



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
        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
          showDivs(slideIndex += n);
        }

        function showDivs(n) {
          var i;
          var x = document.getElementsByClassName("mySlides");
          if (n > x.length) {slideIndex = 1}    
          if (n < 1) {slideIndex = x.length}
          for (i = 0; i < x.length; i++) {
             x[i].style.display = "none";  
          }
          x[slideIndex-1].style.display = "block";  
        }
    </script>
</body>

</html>
