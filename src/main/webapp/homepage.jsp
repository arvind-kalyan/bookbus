
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
  <link rel="stylesheet" type="text/css" href="resources/css/component.css">  
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">
  <script src="resources/js/bootstrap.min.js"></script>
<style>table,td,th{ font:13px/18px verdana,arial,sans-serif;border:1px solid #ddd;border-collapse:collapse}th{background-color:#e2e4ff;font-weight:bold}</style>

<style>
.pager{

  left: 560px;
  padding-top: 370px;
  position:relative;
  
}
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

#seatstable{
	
	word-wrap:break-word;
	width:auto;

}

</style>

<script>

  var seatsCount;

$(function() {
  $( "#datepicker" ).datepicker();
});

$(document).ready(function(){
	    
	
	$('#seatstable').on('click', "button", function (){             // button click inside seatstable for selecting seats

			if(seatsCount == 0) return;
			//alert($(this).css('color'));
			if($(this).css('color') == 'red') {   $(this).css('color','black'); seatsCount+=1;}
			$(this).css('color','red');
			seatsCount--;

	    });
	
	
	
	
		$('#topbar').on("click", "#logoutbutton", function(){ 		 
	    
				$.removeCookie('username',{ path: '/' });
				window.location.href="logoutpage.jsp";
		
		});
	    var myCookie = $.cookie('username');
	    $('.pager').hide();
	    $( "#datepicker" ).datepicker({
			  dateFormat: "dd/mm/yyyy"
			});
	    if (myCookie == null) {
	       
	       window.location.href = "404.jsp"
	    }
	    $('#results').on('click', "button", function (){
			
	    	/* $(document).on("click", "#basicModal", function (e) { */
				
				 cell = $(this).parent().prev().prev().prev().prev().prev().prev().prev();	
				 var from = $(this).parent().prev().prev().prev().prev().prev().prev().text();
				 var to = $(this).parent().prev().prev().prev().prev().prev().text();
				 var travels = $(this).parent().prev().prev().prev().prev().text();
				 var doj = $(this).parent().prev().prev().prev().text();
				 var time = $(this).parent().prev().prev().text();
				 var cost = $(this).parent().prev().text();
				 //cell2 = $(this).parent().prev().prev().prev();
				 //cell3 = $(this).parent().prev().prev().prev().prev();
				 var x = cell.text();
				 //alert(x);
				 $("#bookId").val(x);
				 $('#basicModal').modal('show');
				 document.getElementById("hd").innerHTML = "<u>Bus Details : </u>";
				document.getElementById("jid").innerHTML = "<b>Journey ID :</b> "+ x +" | <b>From : <b>"+from+ " | <b>To : </b>"+to+" | <b>by</b> "+travels+" | <b>Date of Journey : </b>"+doj+" | <b>at</b> "+time+" | <b>Cost :</b> Rs. "+cost;
		    });
			
	    $('#NoSeats').on("click",function() {
	    	  
	    		var seats = $('#noseats').val();
	    		seatsCount = seats;
	    		$('#noseats').val("");
	    		$('#seatstable').append('<thead><tr><th align="center"></th><th align="center">1</th><th align="center">2</th><th align="center"> </th><th align="center">3</th><th align="center">4</th></tr></thead><tbody>'+
	    		'<tr><td>1</td><td><button id="mod" value="1" class="editbtn" style="width: 100%;"> SEAT 1 </button></td><td><button id="mod" value="2"  class="editbtn" style="width: 100%;"> SEAT 2</button></td><td>....</td><td><button id="mod" class="editbtn" value="3"  style="width: 100%;"> SEAT 3 </button></td><td><button id="mod" class="editbtn"  value="4" style="width: 100%;"> SEAT 4</button></td></tr>'+
	    		'<tr><td>2</td><td><button id="mod"  value="5" class="editbtn" style="width: 100%;"> SEAT 5 </button></td><td><button id="mod" value="6" class="editbtn" style="width: 100%;"> SEAT 6</button></td><td>....</td><td><button id="mod" class="editbtn" value="7" style="width: 100%;"> SEAT 7</button></td><td><button id="mod" class="editbtn"  value="8" style="width: 100%;"> SEAT 8</button></td></tr>'+
	    		'<tr><td>3</td><td><button id="mod"  value="9" class="editbtn" style="width: 100%;"> SEAT 9</button></td><td><button id="mod" value="10" class="editbtn" style="width: 100%;"> SEAT 10</button></td><td>....</td><td><button id="mod" class="editbtn" value="11" style="width: 100%;"> SEAT 11</button></td><td><button id="mod" class="editbtn"  value="12" style="width: 100%;"> SEAT 12</button></td></tr>'+
	    		'<tr><td>4</td><td><button id="mod" value="13"  class="editbtn" style="width: 100%;"> SEAT 13</button></td><td><button id="mod" value="14" class="editbtn" style="width: 100%;"> SEAT 14</button></td><td>....</td><td><button id="mod" class="editbtn" value="15" style="width: 100%;"> SEAT 15</button></td><td><button id="mod" class="editbtn"  value="16" style="width: 100%;"> SEAT 16</button></td></tr>'+
	    		'<tr><td>5</td><td><button id="mod" value="17"  class="editbtn" style="width: 100%;"> SEAT 17</button></td><td><button id="mod" value="18" class="editbtn" style="width: 100%;"> SEAT 18</button></td><td>....</td><td><button id="mod" class="editbtn" value="19" style="width: 100%;"> SEAT 19</button></td><td><button id="mod" class="editbtn"  value="20" style="width: 100%;"> SEAT 20</button></td></tbody></tr>');
	    		
	    	
	    	 
	    	/*  $('#seatstable').append('<thead><tr><th>Location</th> <th>Points</th><th>Mean</th></tr> </thead> <tbody>'+
	  '<tr><td><button id="mod" class="editbtn" style="width: 100%;"> SEAT </button></td><td>3</td><td><button id="mod" class="editbtn" style="width: 100%;"> SEAT </button></td> </tr><tr><td><button id="mod" class="editbtn" style="width: 100%;"> SEAT </button></td><td>5</td><td><button id="mod" class="editbtn" style="width: 100%;"> SEAT </button></td></tr>');
	    	           	    	  */
	    	}); 

});

</script>
</head>
<body>
  <div id="topbar">

	     <a href="index.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		 <a href="about.jsp">About</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		 <a href="howto.jsp">How To</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		 <a href="contact.jsp">Contact us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <button id="logoutbutton" class="myButton" >Logout</button>&nbsp;&nbsp;

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
	
<div id="pager" class="pager">
	<form>
		<img src="resources/css/first.png" class="first"/>
		<img src="resources/css/prev.png" class="prev"/>
		<input type="text" class="pagedisplay"/>
		<img src="resources/css/next.png" class="next"/>
		<img src="resources/css/last.png" class="last"/>
		<select class="pagesize">
			<option selected="selected"  value="5">5</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option  value="30">30</option>
		</select>
	</form>
</div>

<br><br>
<table  style="width:70%" border="1" id = "results"></table>

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&amp;times;</button>
            <h4 class="modal-title" id="myModalLabel">Select Seats</h4>
            </div>
            <div class="modal-body">
               <h3 id="hd"></h3>
               <p id="jid"> </p>                       
           Enter no. of seats : <input id="noseats"> &nbsp; <input type="submit" value="OK" class="button" id="NoSeats"/> <br>
           <table  style="width:10%" id = "seatstable"></table> 
            <br><br><br><br><br><br><br><br><br>
           
           
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">OK to proceed to Booking</button>
        </div>
    </div>
  </div>
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
       	  		$("#results").append('<thead><tr><th>Journey ID</th><th>From</th><th>To</th><th>Travels</th><th>DOJ</th><th>Time</th><th>Fare</th><th>Ticket</th></tr></thead><tbody>');		
       	  		if(data == null){ alert('No buses found! Sorry!'); return;  }
       	  		$.each(data,function(k){
   			  
				$("#results").append('<tr><td align="center">' + data[k].id +'</td><td align="center">'+
						data[k].from + '</td><td>' + 
						data[k].to + '</td><td align="center">'+ data[k].travels +'</td><td align="center">'+  data[k].doj+ '</td><td align="center">' + data[k].time+'</td><td align="center">' +data[k].fare+'<td  align="center" > <button id="viewseats" class="btn btn-6 btn-6a">View Seats</button>'+'</td></tr>');
   			  
				});
       	  		
       		//	$("table")
       		//		.tablesorter({widthFixed: true, widgets: ['zebra']})
       		//		.tablesorterPager({container: $("#pager")});

       			//$('#pager').show();
				
         }
	 });
});


</script>
</body>
</html>
	