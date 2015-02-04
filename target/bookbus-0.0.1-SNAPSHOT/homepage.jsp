
<!doctype html>
<html lang="en-US">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>Homepage</title>
  <link rel="stylesheet" type="text/css" media="all" href="resources/css/style1.css">
  <script type="text/javascript" src="resources/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
  <script type="text/javascript" charset="utf-8" src="resources/js/jquery.leanModal.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <script type="text/javascript" src="resources/js/jquery.tablesorter.js"></script>
  <script type="text/javascript" src="resources/js/jquery.tablesorter.pager.js"></script>
  

  <style>table,td,th{ font:13px/18px verdana,arial,sans-serif;border:1px solid #ddd;border-collapse:collapse}th{background-color:#e2e4ff;font-weight:bold}</style>
<style>
table.tablesorter {
	font-family:arial;
	background-color: #CDCDCD;
	margin:10px 0pt 15px;
	font-size: 8pt;
	width: 100%;
	text-align: left;
}
table.tablesorter thead tr th, table.tablesorter tfoot tr th {
	background-color: #e6EEEE;
	border: 1px solid #FFF;
	font-size: 8pt;
	padding: 4px;
}
table.tablesorter thead tr .header {
	background-image: url(bg.gif);
	background-repeat: no-repeat;
	background-position: center right;
	cursor: pointer;
}
table.tablesorter tbody td {
	color: #3D3D3D;
	padding: 4px;
	background-color: #FFF;
	vertical-align: top;
}
table.tablesorter tbody tr.odd td {
	background-color:#F0F0F6;
}
table.tablesorter thead tr .headerSortUp {
	background-image: url(asc.gif);
}
table.tablesorter thead tr .headerSortDown {
	background-image: url(desc.gif);
}
table.tablesorter thead tr .headerSortDown, table.tablesorter thead tr .headerSortUp {
background-color: #8dbdd8;
}


</style>

<script>

$(function() {
  $( "#datepicker" ).datepicker();
});


$(document).ready(function() {  
	
$('#topbar').on("click", "#logoutbutton", function(){ 		 
	    
		$.removeCookie('username',{ path: '/' });
		window.location.href="logoutpage.jsp";
		
	});

});

$(document).ready(function(){
    
	    $('#but').click(function(){
	    	alert($.cookie('username'));
	    	console.log("here in homepage");
	    });

	});
	
$(document).ready(function(){ 
    var myCookie = $.cookie('username');
    $( "#datepicker" ).datepicker({
		  dateFormat: "dd/mm/yyyy"
		});
    if (myCookie == null) {
       
       window.location.href = "404.jsp"
    }
    
});

</script>



</head>

<body>
  <div id="topbar">
		
	
	<a href="index.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		 <a href="about.jsp">About</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="howto.jsp">How To</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<a href="contact.jsp">Contact us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="logoutbutton" class="myButton" >Logout</button>
			&nbsp;&nbsp;

   </div>

    <div id="content">
      
      <h1>Enter journey details to Search</h1>
      <br><br><br><br>
     <select id="From" name="Source">
<option value="null">---Select City---</option>
<option value="Ahmedabad">Ahmedabad</option>
<option value="Bangalore">Bangalore</option>
<option value="Chennai">Chennai</option>
<option value="Delhi">Delhi</option>
<option value="Hyderabad">Hyderabad</option>
<option value="Jaipur">Jaipur</option>
<option value="Kanpur">Kanpur</option>
<option value="Kolkata">Kolkata</option>
<option value="Lucknow">Lucknow</option>
<option value="Mumbai">Mumbai</option>
<option value="Pune">Pune</option>
<option value="Surat">Surat</option>	
</select>
   
   <select id="To" name="Destination">
<option value="null">---Select City---</option>
<option value="Ahmedabad">Ahmedabad</option>
<option value="Bangalore">Bangalore</option>
<option value="Chennai">Chennai</option>
<option value="Delhi">Delhi</option>
<option value="Hyderabad">Hyderabad</option>
<option value="Jaipur">Jaipur</option>
<option value="Kanpur">Kanpur</option>
<option value="Kolkata">Kolkata</option>
<option value="Lucknow">Lucknow</option>
<option value="Mumbai">Mumbai</option>
<option value="Pune">Pune</option>
<option value="Surat">Surat</option>	
</select>
   
    Date of Journey: <input type="text" id="datepicker">
    
   <button id = "searchbutton" class="myButton" > Search! </button>
      
    </div>
    
    <br><br>
    <table  style="width:50%" border="2" id = "results"></table>
     
     <div id="pager" class="pager"  visibility: hidden>
	<form>
		<img src="resources/css/first.png" class="first"/>
		<img src="resources/css/prev.png" class="prev"/>
		<input type="text" class="pagedisplay"/>
		<img src="resources/css/next.png" class="next"/>
		<img src="resources/css/last.png" class="last"/>
		<select class="pagesize">
			<option selected="selected"  value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option  value="40">40</option>
		</select>
	</form>
</div>
     





<script>
$("#searchbutton").click(function () {		 
    
	
    var a = $("#From").val();
	//console.log(a);
	var b = $("#To").val();
	var c = $("#datepicker").val();
	if(a == "null" || b == "null" )
	{
			alert('Source or Destination cannot be null');
			return;
		
	}
	if(c == '') { alert("Date cant be null"); return; }
	var Data = {"from":a,"to":b,"doj":c};
	
	 $.ajax({
        
		  type: "POST",
         url: "/bookbus/search",
         contentType: "application/json",
         data:JSON.stringify(Data),
         success: function (data)
         {
       	  		$("#results").empty();
       	  		$("#results").append('<thead><tr><th>Journey ID</th><th>From</th><th>To</th><th>Travels</th><th>DOJ</th><th>Time</th><th>Fare</th></tr></thead><tbody>');		
       	  		if(data == null){ alert('No buses found! Sorry!'); return;  }
       	  		$.each(data,function(k){
   			  
				$("#results").append('<tr><td align="center">' + data[k].id +'</td><td align="center">'+
						data[k].from + '</td><td>' + 
						data[k].to + '</td><td align="center">'+ data[k].travels +'</td><td align="center">'+  data[k].doj+ '</td><td align="center">' + data[k].time+'</td><td align="center">' +data[k].fare+'</td></tr>');
   			  
				});
       	  		
       	  		
       	   		$('#pager').toggle();
       	 		       	  		
       			$("table")
       				.tablesorter({widthFixed: true, widgets: ['zebra']})
       				.tablesorterPager({container: $("#pager")});

       	  		
				
         }
	 });
});


</script>
</body>
</html>
	