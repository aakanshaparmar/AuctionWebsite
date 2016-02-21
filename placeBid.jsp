<%@ page import="java.sql.*" %>

<%
	String postID = request.getParameter("postID");  
%>

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" /> 
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 

<%
	out.println("<html><head>");
	out.println("<link rel=stylesheet type=text/css href=mystyle.css>");
	out.println("<title>Item Details</title></head>");
	out.println("<body> <center> <h1>Item Details </h1> </center> ");
	
	Connection conn = db.getConnection(); 
	PreparedStatement pstmt = conn.prepareStatement("select * from PostTable WHERE postID = ?");
	
	pstmt.setString(1, postID);
	
	ResultSet results = pstmt.executeQuery();
	
	if (results.next()) {
		
		String title = results.getString("title");
		String endDate = results.getString("enddate");
		String description = results.getString("description");
		String minPrice = results.getString("minPrice");
		String owner = results.getString("username");
		String currentBid = results.getString("currentBidPrice");
		String currentBidBy = results.getString("currentBidOwner");
		String userName = user.getUserName();
		
		out.println("<table");
		out.println("<tr><td>Image</td><td>Image</td></tr>");
		out.println("<tr><td>Title</td><td>"+title+"</td></tr>");
		out.println("<tr><td>Description</td><td>"+description+"</td></tr>");
		out.println("<tr><td>Auction End Date</td><td>"+endDate+"</td></tr>");
	    out.println("<tr><td>Owner</td><td>"+owner+"</td></tr>");
		out.println("<tr><td>Original Price</td><td>"+minPrice+"</td></tr>");
		out.println("<tr><td>Current Bid</td><td>"+currentBid+"</td></tr></table><br><br>");
		out.println("<form METHOD=POST action=processing.jsp?postID="+postID+"><h2>Enter New Bid: <input type=text name=newBid></h2> <br>");
		out.println("<input type=submit value=Confirm></form><br><a href=homePage.jsp>Click to Cancel</a>");
		out.println("</body></html>");
	} 
	
	results.close();
	pstmt.close();
	
	
%>