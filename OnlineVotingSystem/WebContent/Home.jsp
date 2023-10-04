<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Voting System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, intial-scale=1">
<style>
*{
	box-sizing: border-box;
}
.header{
width: 100%;
height: 20%;
 // border: 2px solid red; 
}
.head-right{
width: 100%;
text-align: center;
padding-top: 59px;
float: right;
height: auto;
// border: 1px solid black;
}
.main: after {
	content: "";
	display: table;
	clear: both;
}
.login{
	width: 100%;
	height: 50%;
	border-radius: 10px;
//	border: 2px solid blue;
	background-color: #f2f2f2;
}
.login-left{
    width: 50%;
    height: 100%;
   // border: 1px solid red;
    float: left;
}
.login-right{
    width: 50%;
    height: 100%;
 // border: 1px solid red;
    float: right;
    /* position: absolute; */
}
.login-head{
	text-align: Center;
	padding: 5px;
	font-size: 30px;
//	background-color: #00bcd4b3;
}
.login-form{
	padding-top: 20px;
	text-align: center;
	background-color: #f2f2f2;
}
input[type=text]{
	font-size: 15px;
	width: 50%;
	border: 2px solid blue;
	border-radius: 3px;
	display: inline-block;
	padding: 10px 15px;
	margin: 5px 10px;
}
input[type=password]{
	font-size: 15px;
	width: 50%;
	border: 2px solid blue;
	border-radius: 3px;
	display: inline-block;
	padding: 10px 15px;
	margin: 5px 10px ;
}
/* button{
	background-color: lightblue;
	border: 2px solid blue;
	border-radius: 5px;
	padding: 10px 15px;
	font-size: 15px;
	text-align: center;
} */
input[type=submit]{
	background-color: lightblue;
	border: 2px solid blue;
	border-radius: 5px;
	padding: 10px 15px;
	font-size: 15px;
	text-align: center;
}
.navigation {
    width: 100%;
    height: 10%;
  //  border: 1px solid brown;
    padding: 5px;
    padding-top: 15px;
    text-align: right;
    //position: aqua;
 //   background-color: #d0d3ea;
}
.footer{
     width: 100%;
    height: 30%;
    border: 2px solid blue;
	border-radius: 10px;
    background: #f2f2f2;
}
label{
	font-size: 20px;
	text-align: left;
}
a{
	text-align: center;
	font-size: 20px;
	margin-left: 120px;
}
.Column{
	width: 33.33%;
	height: 90%;
	float: left;
	padding: 20px;
}
.footer-link{
	padding: 5px;
}
h4{
	text-align: center;
}
</style>
</head>
<body background="https://www.smpte.org/sites/default/files/shutterstock_117429307_1.jpg">
<div class="header">
<div class="head-right"><h2>ONLINE VOTING APPLICATION</h2></div>
</div>
<div class="navigation"><marquee><a href="/OnlineVotingSystem/VoterRegistration.jsp">New Registration</a></marquee></div>
<div class="main">
<div class="login">
<div class="login-left">
<div class="login-head">Admin Login</div>
<form class="login-form" method="post" action="VotingServlet">
<label for="user">User Name</label>
<input id="user" type="text" name="username" placeholder="EmailID/Username" required><br/><br/>
<label for="pass">Password</label>
<input id="pass" type="password" name="password" placeholder="Password" required><br/><br/>
<input type="hidden" name="parameter" value="login">
<input type="submit" value="Login"/>
</form>
<a href="/OnlineVotingSystem/ForgotPassword.jsp">Forgot Password</a>
</div>
<div class="login-right">
<div class="login-head">Voter Login</div>
<form class="login-form" method="post" action="VotingServlet">
<label for="user">User Name</label>
<input id="user" type="text" name="username" placeholder="EmailID/Username" required><br/><br/>
<label for="pass">Password</label>
<input id="pass" type="password" name="password" placeholder="Password" required><br/><br/>
<input type="hidden" name="parameter" value="login">
<input type="submit"  value="Login"/>
</form>
<a href="/OnlineVotingSystem/ForgotPassword.jsp">Forgot Password</a>
</div>
</div>
</div>
<div class="footer">
<h4>copyright@2021 designed by author</h4>
</div>
</body>

</html>