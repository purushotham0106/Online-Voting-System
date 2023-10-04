<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Voting Application</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
*{
	box-sizing: border-box;
}
body{
	margin-left: 10%;
	margin-right: 10%;
}
.header{
	top: 0px;
	width: 100%;
}
.head-middle{
	width: 70%;
	height: 200px;
}
.head-middle-main{
	width: 100%;
	text-align: center;
	padding: 15px;
	height: 120px;
	border: 1px solid black;
	background-color: #00bcd4c7;
}
.head-middle-bottom{
	width: 100%;
	padding : 2px;
	height: 50px;
	border: 1px solid black;
	background-color: lightblue;
}
.head-middle-bottom input[type=submit]{
	width: 15%;
	text-align: center;
	display: inline !important;	
	font-size: 15px !important;
	background-color: lightblue !important;
	border: 0px solid blue !important;
	border-radius: 0px !important;
	padding: 10px 15px;
	overflow: hidden;
}
ul{
	list-type: none;
	padding: 0;
	margin: 0;
	overflow: hidden;
}
li{
	display: inline;
}
li a{
	text-decoration: none;
	text-align: left;
	color: black;
	padding: 20px;	
	font-size: 20px;
}
img{
	object-fit:fill;
	width:100%;
	height:70%;
}
#elections {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#elections td, #request th {
  border: 1px solid #ddd;
  padding: 8px;
}

#elections tr:nth-child(even){background-color: #f2f2f2;}

#elections tr:hover {background-color: #ddd;}

#elections th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #00BCD4;
  border: 1px solid #ddd;
}
.link{
	text-align: center;
	text-decoration: none;
	color: blue;
	font-size: 25px;
}
.main{
	width: 100%;
	height: 500px;
	text-align: center;
	border: 1px solid black;
	background-color: #fff8dc61;
}
input[type=text]{
	font-size: 15px;
	width: 40%;
	border: 2px solid blue;
	border-radius: 3px;
	display: inline-block;
	padding: 10px 15px;
	margin: 5px 10px;
}
select{
	font-size: 15px;
	width: 40%;
	border: 2px solid blue;
	border-radius: 3px;
	display: inline-block;
	padding: 10px 15px;
	margin: 5px 10px;
}
input[type=submit]{
	background-color: lightblue;
	border: 2px solid #00BCD4;
	border-radius: 5px;
	padding: 10px 15px;
	font-size: 15px;
	text-align: center;
	margin-right: 50px;
}
.footer{
	width: 100%;
	height: 50px;
	text-align: center;
	padding: 15px;
	border: 1px solid black;
	background-color: lightblue;
}
</style>
</head>
<body>
<div class="header"> </div>
	<div class="header-middle">
	<div class="head-middle-top"> </div>
	<div class="head-middle-main">
		<h1>Online Voting Application</h1>
	</div>
	<div class="head-middle-bottom">
		<ul>
		<li><a href="/OnlineVotingSystem/Logout.jsp">Login</a></li>
		</ul>
	</div>
	</div>
<div class="main">
<!-- <img src="/OnlineDoctorApplication/page.jpg"/>-->
<h3>You have Successfully Voted for Candidate <%=request.getAttribute("cid")%> for the Election <%=request.getAttribute("eid")%> with your voter ID <%=request.getAttribute("vid")%></h3>
<br/> 
<h4>Thank You.Please wait for the Result.</h4>
<img src="data:image/png;base64,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"/>
</div>
<div class="footer"> 
<marquee>copyright@2021 designed by author</marquee> </div>
</body>
</html>
