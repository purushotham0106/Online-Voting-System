<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ovs.model.*" import="java.util.ArrayList" %>

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
	height:80%;
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
	background-color: #fff8dc61;
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
<div class="header">
	<div class="header-middle">
	<div class="head-middle-main">
		<h1> Online Voting Application</h1>
	</div>
	<div class="head-middle-bottom">
		<form method="post" action="VotingServlet">
		<input type="hidden" name="User" value="Voter"/>
		<input type="hidden" name="elist" value=<%=(ArrayList<Election>)request.getAttribute("elist")%>/>
		<input type="hidden" name="vid" value=<%= request.getAttribute("vid")%>/>
		<input type="hidden" name="Name" value=<%= request.getAttribute("Name")%>/>
		<input id ="nav" type="submit" name="parameter" value="Logout">
		</form>
	</div>
	</div>
	</div>
<div class="main">
<!-- 	<img src="/OnlineVotingSystem/page.jpg"/> -->
	<h2>Hello <%=request.getAttribute("Name") %>, Your VoterID is <%=request.getAttribute("vid") %></h2>
<br/><br/>
<h2> You have already voted so, you are not eligible to vote again.</h2>
<img src="data:image/png;base64,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"/>
</div>
<div class="footer">
<marquee>copyright@2021 designed by author</marquee>
 </div>
</body>
</html>