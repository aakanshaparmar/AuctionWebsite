<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
	<link href="style.css" rel="stylesheet" type="text/css"></link>
	<title>Post New Auction</title>
</head>


<body marginwidth="0" marginheight="0" leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
	<br>
	<br>
	<center> <h1> Enter Details of the Auction! </h1> </center>
	
	<br>
	<br>
	<center><form name="postAuctionForm" method="POST" action="postingAuction.jsp" >
	<table>
	<tr> 
		<td> <h3> Enter Title of Item:</td>
		<td> <input type="text" name="title" value="" required></h3> </td>
	</tr>
	<tr>
	    <td> <h3> Enter a Description:</td>
		<td> <input type="text" name="description" value="" required></h3> </td>
	</tr>
	<tr>
	    <td> <h3> Enter Auction End Date (YYYY-MM-DD) :</td>
		<td> <input type="text" name="enddate" value="" required></h3> </td>
	</tr>
	<tr>
	    <td> <h3> Enter Minimum Price for Item:</td>
		<td> <input type="text" name="minPrice" value="" required></h3></td>
	</tr>
	<tr>
		 <td> <h3> Upload Image: </td>
		<td> <input type="file" name="itemImage"></h3></td>
	</tr>
    </table>
	<br>
	<br>
	<input type="Submit" value="Next">
</form>
<form name="backForm" method="POST" action="homePage.jsp" >
<input type="Submit" value="Back"></form>
<form name="signOutForm" method="POST" action="signOut.jsp" >
<input type="Submit" value="Sign Out"></form>
</center>

</body>

</html>