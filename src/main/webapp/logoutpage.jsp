
<!doctype html>
<html lang="en-US">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>Welcome</title>

  <link rel="stylesheet" type="text/css" media="all" href="resources/css/style1.css">
  <script type="text/javascript" src="resources/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
   <script type="text/javascript" charset="utf-8" src="resources/js/jquery.leanModal.min.js"></script>
  

</head>

<body>
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
      
      <h1>Goodbye! See you soon</h1>
    
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

$("#addbutton").click(function () {		 
    
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
   		  		 //var currentusr = $.cookie('username');
   		  		 //alert(currentusr);
   		  	     alert('Login Success!');
   		         window.location.href = "homepage.jsp";
   		  }
      });
});

$('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });

</script>
</body>
</html>
	