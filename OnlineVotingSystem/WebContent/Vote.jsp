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
	object-fit:contain;
	width:100%;
	height:50%;
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
	background-color: #fff8dc61;
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
		<h1>Online Voting Application</h1>
	</div>
	<div class="head-middle-bottom">
		<form method="post" action="VotingServlet">
		<input type="hidden" name="User" value="Voter"/>
		<input type="hidden" name="elist" value=<%=(ArrayList<Election>)request.getAttribute("elist")%>/>
		<input type="hidden" name="vid" value=<%= request.getAttribute("vid")%>/>
		<input type="hidden" name="vid" value=<%= request.getAttribute("Name")%>/>
		<input id ="nav" type="submit" name="parameter" value="Logout">
		</form>
	</div>
	</div>
	</div>

<div class="main">
<h2>Hello <%=request.getAttribute("Name")%>, Your VoterID is <%=request.getAttribute("vid")%></h2>
<br/><br/>
<h2>Candidates List</h2>
	<% ArrayList<Candidate> clist = (ArrayList)request.getAttribute("clist");
	if(clist.size()!=0){
		%>
		<table id="elections">
		<tr>
		<th>Candidate ID</th>
		<th>Candidate Name</th>
		<th>Election ID</th>
		<th>Election Name</th>
		<th>Party Name</th>
		<th>Constituency</th>
		<th>Click here to Vote</th>
		</tr>
		<%for (Candidate candidate:clist){%>
		<tr>
		<td><%=candidate.getCid()%></td>
		<td><%=candidate.getName()%></td>
		<td><%=candidate.getElectionId()%></td>
		<td><%=candidate.getElectionName()%></td>
		<td><%=candidate.getPartyName()%></td>
		<td><%=candidate.getConstituency()%></td>
		<td><form method="post" action="VotingServlet">
		<input type="hidden" name="cid" value="<%=candidate.getCid()%>">
		<input type="hidden" name="eid" value="<%=request.getAttribute("eid")%>">
		<input type="hidden" name="User" value="Voter"/>
		<input type="hidden" name="elist" value=<%=(ArrayList<Election>)request.getAttribute("elist")%>/>
		<input type="hidden" name="vid" value="<%= request.getAttribute("vid")%>"/>
		<input type="hidden" name="Name" value="<%= request.getAttribute("Name")%>"/>
		<input type="hidden" name="parameter" value="Send OTP">
		<input type="submit" value="Vote"></form></td>
		</tr>
		<%}%></table>
		<%} else{ %><h3>No Election Available for your constituency.</h3><%} %>
</div>
<div class="footer">
<marquee>copyright@2021 designed by author</marquee>
 </div>
</body>
</html>