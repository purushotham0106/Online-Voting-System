<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.ovs.model.*" import="java.util.*" %>
<!DOCTYPE html>
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
	padding: 15px 15px;
	overflow: hidden;
}
ul{
	list-type: none;
	padding: 10px;
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
    background-color: #03a9f4cc;
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
	height: 1000px;
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
	background-color: #03a9f44f;
    border: 2px solid #3F51B5;
	border-radius: 5px;
	padding: 10px 15px;
	font-size: 15px;
	text-align: center;
	margin-right: 50px;
	text-transform:uppercase;
	font-weight:bold;
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
		<h1> Online Voting System</h1>
	</div>
	<div class="head-middle-bottom">
		<ul>
		<li><a href="/OnlineVotingSystem/DeclareElection.jsp">Declare Election</a></li>
		<li><a href="/OnlineVotingSystem/Logout.jsp">Logout</a></li>
		</ul>
	</div>
	</div>
	<div class="main">
	<h3>Candidates Applied for Elections</h3>
	<% ArrayList<Candidate> clist = (ArrayList<Candidate>)request.getAttribute("clist");
	if(clist.size()!=0){
		%>
		<table id="elections">
		<tr>
		<th>Candidate ID</th>
		<th>Candidate Name</th>
		<th>Election ID</th>
		<th>Election Name</th>
		<th>Constituency</th>
		<th>Age</th>
		<th>Voter ID</th>
		<th>Approve</th>
		<th>Reject</th>
		</tr>
		<%for (Candidate cand:clist){%>
		<tr>
		<td><%=cand.getCid()%></td>
		<td><%=cand.getName()%></td>
		<td><%=cand.getElectionId()%></td>
		<td><%=cand.getElectionName()%></td>
		<td><%=cand.getConstituency()%></td>
		<td><%=cand.getAge()%></td>
		<td><%=cand.getVid()%></td>
		<td><form method="post" action="VotingServlet">
		<input type="hidden" name="cid" value="<%=cand.getCid()%>">
		<input type="hidden" name="eid" value="<%=cand.getElectionId()%>">
		<input type="hidden" name="parameter" value="approve">
		<input type="submit" name="ca" value="Approve"></form></td>
		<td><form method="post" action="VotingServlet">
		<input type="hidden" name="cid" value="<%=cand.getCid()%>">
		<input type="hidden" name="eid" value="<%=cand.getElectionId()%>">
		<input type="hidden" name="parameter" value="approve">
		<input type="submit" name="ca" value="Reject"></form></td>
		</tr>
		<%}%></table>
		<%} else{ %><h3>No Candidates available.</h3><%} %>
		<br/><br/>
	<h3>List of Elections to Declare Result</h3>
	<%ArrayList<Election> elist = (ArrayList<Election>)request.getAttribute("elist");
		if(elist.size()!=0){
		%>
		<table id="elections">
		<tr>
		<th>Election ID</th>
		<th>Election Name</th>
		<th>Date</th>
		<th>Constituency</th>
		<th>Declare Result</th>
		</tr>
		<%for (Election elect:elist){%>
		<tr>
		<td><%=elect.getId()%></td>
		<td><%=elect.getName()%></td>
		<td><%=elect.getDate()%></td>
		<td><%=elect.getConstituency()%></td>
		<td><form method="post" action="VotingServlet">
		<input type="hidden" name="eid" value="<%=elect.getId()%>">
		<input type="hidden" name="parameter" value="declare">
		<input type="submit" value="Declare Result"></form></td>
		</tr>
		<%}%></table>
		<%} else{ %><h3>No Election Available to declare result.</h3><%} %>
		<br/><br/>
	<h3>List of Elections to Conduct</h3>
	<%ArrayList<Election> eilist = (ArrayList<Election>)request.getAttribute("eilist");
		if(eilist.size()!=0){
		%>
		<table id="elections">
		<tr>
		<th>Election ID</th>
		<th>Election Name</th>
		<th>Date</th>
		<th>Constituency</th>
		<th>Click here to Contest</th>
		</tr>
		<%for (Election elect:eilist){%>
		<tr>
		<td><%=elect.getId()%></td>
		<td><%=elect.getName()%></td>
		<td><%=elect.getDate()%></td>
		<td><%=elect.getConstituency()%></td>
		<td><form method="post" action="VotingServlet">
		<input type="hidden" name="eid" value="<%=elect.getId()%>">
		<input type="hidden" name="parameter" value="conduct">
		<input type="submit" value="Conduct"></form></td>
		</tr>
		<%}%></table>
		<%} else{ %><h3>No Election Available to Conduct.</h3><%} %>
</div>
 </div>
<div class="footer">
<marquee>copyright@2021 designed by author</marquee>
 </div>
</body>
</html>