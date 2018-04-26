<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >

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
    </style>
	 <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style2.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
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
                                  	<li class="nav-item active">
                                    <a id="rcorners1"class="nav-link" href="profile.jsp"><% if(session.getAttribute("name") != null){%><%=session.getAttribute("name")%></a><%}else{%><a class="nav-link" href="reg.jsp">Login<%}%></a>
                                    <% if(session.getAttribute("name") != null){%><a id="rcorners1" class="nav-link" href="profile.jsp"><%=session.getAttribute("name")%></a><%}else{%><a id="rcorners1" class="nav-link" href="reg.jsp">Login<%}%></a>
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

    <!-- SLIDER -->

            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <div id="wrapper">
                          <div id="login" class="animate form">
                            <form  action="AddNewListing" autocomplete="on" enctype = "multipart/form-data"> 
                                <h1> Add your Listing </h1> 
                                <p> 
                                    <input type="hidden" name="username" value="<%=session.getAttribute("name")%>">
                                </p>
                                <p> 
                                    <label >Address Line1</label>
                                    <input name="address1" required="required" type="text" placeholder="15 lol street" />
                                </p>
								<p> 
                                    <label >Apartment No</label>
                                    <input name="address2" required="required" type="text" placeholder="20" />
                                </p>

								<p> 
                                    <label >City</label>
                                    <input name="city" required="required" type="text" placeholder="West Haven" />
                                </p>
								<p> 
                                    <label >Zipcode</label>
                                    <input name="zipcode" required="required" type="text" placeholder="00011" />

								<p> 
								<p> 
                                    <label >Cost per month</label>
                                    <input name="cost" required="required" type="text" placeholder="$1100" />
								<p> 
								<p style = "text-align:center" >
								<Label>Facilities Provided </Label>
								</p>
                                    <label >Heater</label>	
									        <select id="country" name="heater">
												<option value="null"></option>
											  <option value="Yes">Yes</option>
											  <option value="No">no</option>
											</select>
                                </p>
								<p> 
                                    <label >Washer/Dryer</label>
									        <select id="washer" name="washer">
											  <option value="null"></option>
											  <option value="Yes">Yes</option>
											  <option value="No">no</option>
											</select>
                                </p>
								<p> 
                                    <label >Internet</label>
									        <select id="internet" name="internet">
											  <option value="null"></option>
											  <option value="Yes">Yes</option>
											  <option value="No">no</option>
											</select>
                                </p>
                                <p>
                                    <label >Parking</label>
									        <select id="parking" name="parking">
											  <option value="null"></option>
											  <option value="Yes">Yes</option>
											  <option value="No">no</option>
											</select>
                                </p>
								<p> 
                                    <label >Number of Bedrooms</label>
									        <select id="washdry" name="bedrooms">
											  <option value="null"></option>	
											  <option value="1">1</option>
											  <option value="2">2</option>
											  <option value="3">3</option>
											  <option value="4">4</option>
											  <option value="5">5</option>
											</select>
                                </p>
								<p> 
                                    <label >Number of Bathrooms</label>
									        <select id="washdry" name="bathrooms">
											  <option value="null"></option>
											  <option value="1">1</option>
											  <option value="2">2</option>
											  <option value="3">3</option>
											</select>
                                </p>
                                <p>
                                    <label>Comments</label>
    								<input id="comments" name="comments" placeholder="Comments..." style="height:50px"></input>
                                </p>
                                <p>
                                    <label>Picture </label>
    								<input type="file" name="image1" style ="color:black" ></input>
                                </p>
                                <p class="signin button" style ="align-items-center"> 
									<input type="submit" value="Add Listing"/> 
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
    </body>
</html>