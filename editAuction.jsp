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
		
		out.println("<html><head><title>User Information Edit Page</title></head>");

	    out.println("<body marginwidth=0 marginheight=0 leftmargin=0 rightmargin=0 topmargin=0 bottommargin=0>");	 

        out.println("<br> <br> <br> <center> <h1> Review and Edit Auction Information! </h1> </center> <br> <br>");

        out.println("<center> <form name=editAuctionForm method=POST action=editAuctionAction.jsp?postID="+postID+"> <table> ");

        out.println("<tr><td> <h3> Title:</td><td> <input type=text name=title  value="+title+" required></h3> </td></tr>");

        out.println(" <tr><td> <h3> Description:</td><td> <input type=text name=description value="+description+" required></h3></td></tr> ");

        out.println(" <tr><td> <h3> Auction End Date <br> (YYYY-MM-DD):</td><td> <input type=text name=endDate value="+endDate+" required></h3></td></tr>");

        out.println(" <tr><td> <h3> Original Price:</td><td> <input type=text name=minPrice value="+minPrice+" required></h3></td></tr>");

        out.println("</table><br><br><input type=Submit value=Update></form></center>");
		
		
		
	 out.println("<center> <form name=deleteAuctionForm method=POST action=deleteAuctionAction.jsp?postID="+postID+"> <input type=Submit value=Delete></form>");
	 out.println("<form method=POST action=homePage.jsp>  <center><input type=Submit value=Back></center></form></body></html>");
	} 
	
	results.close();
	pstmt.close();
	
	
%>