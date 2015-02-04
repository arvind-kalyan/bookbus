
<!doctype html>
<html lang="en-US">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>Welcome</title>

  <link rel="stylesheet" type="text/css" media="all" href="resources/css/style1.css">
  <script type="text/javascript" src="resources/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
   <script type="text/javascript" charset="utf-8" src="resources/js/jquery.leanModal.min.js"></script>
 
 <style>
 
 
 body
    {
        background:url(resources/images/a.jpg) no-repeat center center fixed;
        background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        margin: 0;
        padding: 0;
    }
 
 </style>
  

</head>

<body>
  <div id="topbar">
		
	
	<a href="index.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		 <a href="about.jsp">About</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="howto.jsp">How To</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<a href="contact.jsp">Contact us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#loginmodal" class="myButton" id="modaltrigger" >Login</a>
			&nbsp;&nbsp;
			<a href="register.jsp" class="myButton">Register</a>&nbsp;&nbsp;

   </div>
  
  <div id="w">
    <div id="content">
  
      <h1>Welcome to BookBus!</h1>
      <p>	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      
    </div>
   </div>
   <br>
   <img src="resources/images/red.jpg" class="img" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;"/>
   <img src="resources/images/redbus912.jpg" class="img" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;"/> 
   <img src="resources/images/bus_1.jpg" class="img" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;"/>
  
  
  
  
  
  
  
  
  
  
    
  
  
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
	