<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	margin-left: 20%;
	margin-right: 20%;
}
.header{
	top: 0px;
	width: 100%;
}
.head-middle{
	width: 60%;
	/*border: 1px solid green; */
	height: 200px;
}
.head-middle-main{
	width: 100%;
	text-align: center;
	padding: 15px;
	height: 120px;
	background-color: lightblue;
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
.main{
	width: 100%;
	height: auto;
	text-align: center;
	/*padding: 15px;*/
	border: 1px solid black;
}
.login-middle{
    width: 50%;
    height: 100%;
    border: 1px solid red;
    /* position: absolute; */
}
.login-head{
	text-align: center;
	padding: 5px;
	font-size: 30px;
/*	background-color: #00bcd4b3;*/
}
.login-form{
	height:auto;
/*	padding-top: 20px;*/
	text-align: left;
	background-color: #f2f2f2;
}
input[type=number]{
	font-size: 15px;
	width: 40%;
	border: 2px solid blue;
	border-radius: 3px;
	display: inline-block;
	padding: 10px 15px;
	margin: 5px 10px;
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
input[type=date]{
	font-size: 15px;
	width: 40%;
	border: 2px solid blue;
	border-radius: 3px;
	display: inline-block;
	padding: 8px 15px;
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
    border: 2px solid blue;
    border-radius: 5px;
    padding: 10px 15px;
    font-size: 20px;
    text-align: center;
    margin-left: 250px;
    width: 40%;
}
label{
	font-size: 20px;
	text-align: left;
}
.footer{
	width: 100%;
	height: 30px;
	text-align: center;
	padding: 15px;
	border: 1px solid black;
	background-color: lightblue;
}
</style>
 <script type="text/javascript" >
 function validation() {
	    
	    var age = document.ureg.age.value;
	    var ssn = document.ureg.ssn.value;
	    var ph = document.ureg.num.value;
	    var pwd = document.ureg.pwd.value;
	    var name = document.ureg.vname.value;
	    var constt = document.ureg.constituency.value;
	    var uname = document.ureg.uname.value;

	    var letters = /^[a-zA-Z]+$/;
	    var letter = /^[0-9a-zA-Z]+$/;
	    var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;

	    if (isNaN(ph) || ph < 6000000000 || ph > 9999999999) {
	        alert("Invalid Mobile Number.");
	        document.ureg.num.focus();
	        return  false;
	    }
	    
	    if (isNaN(age) || age>99 || age<10) {
	        alert("Invalid Age.");
	        document.ureg.age.focus();
	        return  false;
	    }
	    
	    if(!(pwd.match(passw))) { 
	     alert('Please enter alphanumeric Password with atleast 6 characters and less than 20 characters');
	     document.ureg.pwd.focus();
	     return false;
	    }
	    

	    if(!(name.match(letters)))
	    {
	    alert('Your Name should have only alphabets.');
	    document.ureg.vname.focus();
	    return false;
	    }
	    
	    if(!(constt.match(letters)))
	    {
	    alert('Your Constituency should have only alphabets.');
	    document.ureg.constituency.focus();
	    return false;
	    }
		
	    if(!(uname.match(letter)))
	    {
	    alert('Username should can only be alphanumeric.');
	    document.ureg.uname.focus();
	    return false;
	    }
	    
	    if(!(ssn.match(letter)) || snn.length!=15)
	    {
	    alert('SSN should can only be alphanumeric and length is 10 characters.');
	    document.ureg.ssn.focus();
	    return false;
	    }
	    
	    if(!(uname.length>6 || uname.length<10))
	    {
	    alert('Username should be more than 6 characters and less than 10 characters.');
	    document.ureg.uname.focus();
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
	 </div>
<div class="main">
	<div class="login-right">
	<div class="login-head">Update Your Information</div>
	<form class="login-form" name="ureg" method="post" action="VotingServlet" onsubmit="return validation()">
	<label for="name">Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="user" type="text" name="vname" placeholder="Full Name" required><br/><br/>
	<label for="spec">Constituency</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="specs" type="text" name="constituency" placeholder="Constituency" required><br/><br/>
	<label for="city">Age</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="city" type="number" name="age"  maxlength="3" placeholder="Age" required><br/><br/>
	<label for="gen">Gender</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<select id="gen" name="sex" required>
		<option value="">Select Your Gender</option>
		<option value="Male">Male</option>
		<option value="Female">Female</option>
	</select><br/><br/>
	<label for="city">Social Security Number</label>&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="city" type="text" name="ssn" maxlength="12" placeholder="SSN" required><br/><br/>
	<label for="city">Mobile Number</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="city" type="number"  maxlength="10" name="num" placeholder="Mobile Number" maxlength="10" required><br/><br/>
	<label for="emailid">Email ID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="emailid" type="email" name="email" placeholder="Email id" required><br/><br/>
	<label for="user">Username</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="user" type="text" name="uname" placeholder="Username" required><br/><br/>
	<label for="pass">Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="pass" type="password" name="pwd" placeholder="Password" required><br/><br/>
	<input type="hidden" name="parameter" value="updateVoter"><br/>
	<input type="hidden" name="vid" value="<%=(String)request.getAttribute("vid")%>"><br/>
    <input type="submit" value="Submit" class="bg-primary"/><br/>
	</form>
	<!-- <a href="javascript:alert('Currently this page is not available');">Forgot Password</a> -->
	</div>
 </div>
<div class="footer"> 
<marquee>copyright@2021 designed by author</marquee>
</div>
</body>
</html>