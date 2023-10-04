<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ovs.model.*" import="java.util.*" %>

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
	margin-left: 20%;
	margin-right: 20%;
}
.header{
	top: 0px;
	width: 100%;
}
.head-middle{
	width: 60%;
	border: 1px solid green; 
	height: 200px;
}
.head-middle-top{
	width: 100%;
	text-align: right;
	padding: 5px;
	height: 20px;
	border: 1px solid black;
	background-color: #a4afea;
}
.head-middle-main{
	width: 100%;
	text-align: center;
	padding: 15px;
	height: 120px;
	border: 1px solid red;
	background-color: #a4afea;
}
.head-middle-bottom{
	width: 100%;
	padding : 2px;
	height: 50px;
	border: 1px solid blue;
	background-color: #a4afea;
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
	object-fit:contain;
	width:100%;
	height:50%;
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
	border: 2px solid blue;
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
	border: 1px solid red;
	background-color: #a4afea;
}
</style>
</head>
<body>
<div class="header">
	<div class="header-middle">
	<div class="head-middle-top"> </div>
	<div class="head-middle-main">
		<h1> Doctors Online Appointment Portal</h1>
	</div>
	<div class="head-middle-bottom">
		<form method="post" action="VotingServlet">
		<input type="submit" name="param" value="Election List">
		<input type="submit" name="param" value="Announce Result">
		<input type="submit" value="Announce Result"></form>
	</div>
	</div>
<div class="main">
	 <h2>Election Details</h2>
	<% List<Election> elist = (ArrayList<Election>)request.getAttribute("elist");
	if(elist.size()!=0){
		%>
		<table id="elections">
		<tr>
		<th>Election ID</th>
		<th>Election Name</th>
		<th>Date</th>
		<th>Constituency</th>
		<th>Active</th>
		</tr>
		<%for (Election elect:elist){%>
		<tr>
		<td><%=elect.getId()%></td>
		<td><%=elect.getName()%></td>
		<td><%=elect.getDate()%></td>
		<td><%=elect.getConstituency()%></td>
		<td><form method="post" action="VotingServlet">
		<input type="submit" name="param" value="Election List">
		<input type="submit" name="param" value="Announce Result"></form></td>
		</tr>
		<%}%></table>
		<%} else{ %><h3>No Election Available.</h3><%} %>
</div>
 </div>
<div class="footer">
<marquee>copyright@2021 designed by author</marquee>
 </div>
</body>
</html>