<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Voting Application</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	minDate: 8, // 0 days offset = today
    });
    $( "#datepicker1" ).datepicker({
    	minDate: 5, // 0 days offset = today
    });
  } );
  </script>
<style>
*{
	box-sizing: border-box;
}
 .bg-gra-01 {
  background: -webkit-gradient(linear, left bottom, left top, from(#fbc2eb), to(#a18cd1));
  background: -webkit-linear-gradient(bottom, #fbc2eb 0%, #a18cd1 100%);
  background: -moz-linear-gradient(bottom, #fbc2eb 0%, #a18cd1 100%);
  background: -o-linear-gradient(bottom, #fbc2eb 0%, #a18cd1 100%);
  background: linear-gradient(to top, #fbc2eb 0%, #a18cd1 100%);
}
.bg-gra-02 {
  background: -webkit-gradient(linear, left bottom, right top, from(#fc2c77), to(#6c4079));
  background: -webkit-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
  background: -moz-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
  background: -o-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
  background: linear-gradient(to top right, #fc2c77 0%, #6c4079 100%);
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
	background-color: #03a9f4a3;
	border: 1px solid black;
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
	height: 600px;
	text-align: center;
	padding: 15px;
	border: 1px solid black;
	background-color: #f2f2f2;
}
.login-middle{
    width: 50%;
    height: 100%;
    border: 1px solid red;
    /* position: absolute; */
}
.login-head{
	text-align: left;
	padding: 5px;
	font-size: 30px;
//	background-color: #00bcd4b3;
}
.login-form{
	padding-top: 20px;
	text-align: left;
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
input[type=text]{
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
	background-color: lightblue;
	border: 2px solid blue;
	border-radius: 5px;
	padding: 10px 15px;
	font-size: 15px;
	text-align: center;
	margin-right: 50px;
}
label{
	font-size: 20px;
	text-align: left;
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
		var w = document.reg.age.value;
		if(w<18){
			alert("Minimun age for an individual to register for voting is 18years.");
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
	<div class="login-head" style="text-align:center;">Declare Election</div>
	<form class="login-form" name="reg" method="post" action="VotingServlet">
	<label for="name">Election Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="user" type="text" name="ename" placeholder="Election Name" required><br/><br/>
	<label for="spec">Constituency</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="specs" type="text" name="constituency" placeholder="Constituency" required><br/><br/>
	<label for="pass">Nomination Date</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input name="ndate" placeholder="Selected date" type="text" name="ndate" id="datepicker1" required><br/><br/>
	<label for="pass">Election Date</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input placeholder="Selected date" type="text" name="date" id="datepicker" required><br/><br/>
	<input type="hidden" name="parameter" value="addElection">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" class="btn btn-lg btn-primary">Submit</button>
	</form>
	</div>
 </div>
<div class="footer"> </div>
</body>
</html>