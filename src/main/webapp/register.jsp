
<!doctype html>
<html lang="en-US">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>Welcome</title>

  <link rel="stylesheet" type="text/css" media="all" href="resources/css/style1.css">
  <link rel="stylesheet" type="text/css" href="resources/css/component.css">
  <script type="text/javascript" src="resources/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
   <script type="text/javascript" charset="utf-8" src="resources/js/jquery.leanModal.min.js"></script>
 <style>
 
 .errpass{
   float:left;
 } 
 
 body
    {
        background:url(resources/images/bg.jpg) no-repeat center center fixed;
        background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        margin: 0;
        padding: 0;
    }
 
 </style>

</head>

<body background="resources/images/bg.png">
  <div id="topbar">
		
	
	<a href="index.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		 <a href="about.jsp">About</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="howto.jsp">How To</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<a href="contact.jsp">Contact us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#loginmodal" class="myButton" id="modaltrigger" >Login</a>
			&nbsp;&nbsp;
			<a href="register.jsp" class="myButton">Register</a>

   </div>
   
  <div id="w">
    <div id="content">
      <h1>Enter the registration details below: </h1>
      	Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:	 <input type="text" class="textbox" id="Name"><br>
   
   Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:	 <input type="text" class="textbox" id="Age"><br>
   
    Email ID&nbsp;&nbsp; :	 <input type="text" class="textbox" id="Email"><br>
    Password &nbsp;:	 <input type="password" class="textbox" id="Pass1">  <div id="errpass"></div>
    <br>
   
   Confirm Password :	 <input type="password" class="textbox" id="Pass2"><br>
   <button id = "regbutton" class="btn btn-2 btn-2h" > REGISTER </button>
      
    </div>
  </div>
  <div id="loginmodal" style="display:none;">
    <h1>User Login</h1>
      
      Username: &nbsp; <input type="text" class="textbox" id="username">
      <br><br>
      Password: &nbsp; <input type="password" class= "textbox" id="password" >
      <br><br>
      <button id = "addbutton" class="myButton" style="width:200;height:200"> GO </button>
  
  </div>
<script type="text/javascript">

$(document).ready(function(){
    
    $('#modaltrigger').click(function(){
    	var x = $.cookie('username');
    	if(x != null) window.location.href="homepage.jsp";
    	
    });

});


$("#regbutton").click(function () {		 
    
    var uname = $("#Name").val();
    var uage = $("#Age").val();
    var uemail = $("#Email").val();
    var upass1 = $("#Pass1").val();
    var upass2 = $("#Pass2").val();
    if(uname == ''  || uage == '' || uemail == '' || upass1 == '')
    	{
    	
    	$("#Name").val("");
        $("#Age").val("");
        $("#Email").val("");
        $("#Pass1").val("");
        $("#Pass2").val("");
        alert('All fields are required');
        return;
    	
    	}
    if(upass1 != upass2)
    {
    	document.getElementById('errpass').innerHTML = 'passwords do not match!!';    	
    }
    else
    {
    	
    	$("#Name").val("");
        $("#Age").val("");
        $("#Email").val("");
        $("#Pass1").val("");
        $("#Pass2").val("");
		
        var regData = {"name":uname,"age":uage,"email":uemail,"pass":upass1};
    	
   	 $.ajax({
           
   		  type: "POST",
            url: "/bookbus/regsubmit",
            contentType: "application/json",
            data:JSON.stringify(regData),

        }).done(function (data) {
        	
        	alert("Registration success! click on the Login button to log in to the website")
        	
         });

    }
		
	
});

$("#addbutton").click(function () {		 
    
	var x = $.cookie('username');
	if(x!= null){ window.location.href="homepage.jsp"; }
    var a = $("#username").val();
	//console.log(a);
	var b = $("#password").val();	
	var Data = {"name":a,"pass":b};
	
	 $.ajax({
        
		  type: "POST",
         url: "/bookbus/loginsubmit",
         contentType: "application/json",
         data:JSON.stringify(Data),

     }).done(function (data) {
   	  
   	  if(data == 'FAILURE'){ $('#loginmodal').html('wrong username and/or password'); }
   	  else
   		  {	      
   		  		 $.cookie('username',a,{path:'/'});
   		  		 var currentusr = $.cookie('username');
   		  		/*  alert(currentusr); */
   		  	     alert('Login Success!');
   		         window.location.href = "homepage.jsp";
   		  }
      });
});

$('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });

</script>
</body>
</html>
	