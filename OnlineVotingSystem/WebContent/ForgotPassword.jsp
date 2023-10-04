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
	text-align: center;
	border: 1px solid black;
}
input[type=text],input[type=password]{
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
<script type="text/javascript" >
	function validate(){
		var w = document.vote.cpwd.value;
		var x = document.vote.rpwd.value;

		if(w==null || x==null){
			alert("null values");
			return false;
		}
		if(w==x){
			var form = document.getElementsByName("vote");
			form.submit();
			return true;
		}else{
			alert("Password re-entered doesn't match. Please re-enter the Password.")
			return false;
		}
	}
</script> 
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
		<li><a href="/OnlineVotingSystem/Home.jsp">Home</a></li>
		</ul>
	</div>
	</div>
<div class="main">
<!-- <img src="/OnlineDoctorApplication/page.jpg"/>-->
<h3>Please Change your password</h3> 
<!-- <form name="vote" method="post" action="VotingServlet" onsubmit="return validate()"> -->
<form name="vote" method="post"  action="VotingServlet" onsubmit="return validate()">
		<label for="uname">Username</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="uname" placeholder="UserName" required><br/>
		<label for="pwd">Create Password</label>&nbsp;&nbsp;&nbsp;
		<input type="password" name="cpwd" placeholder="Password" required><br/>
		<label for="pwd">Re-enter Password</label>
		<input type="password" name="rpwd" placeholder="Password" required><br/>
		<input type="hidden" name="parameter" value="frgt pwd">
		<input type="submit" value="Change Password">		
		</form>
</div>
<div class="footer"> 
<marquee>copyright@2021 designed by author</marquee> </div>
</body>
</html>
