<%@ page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>  
<%@page import="java.util.Date" %> 
<%@page import= "java.util.Calendar" %>


<!-- Connect to Database -->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" /> 
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 

<%

	
	out.println("<html><head>");
	out.println("<link rel=stylesheet type=text/css href=mystyle.css>");
	out.println("<title>Auction Website</title></head>");
	out.println("<body> <center> <h1> Welcome to the Auction Website! </h1> </center> ");
	out.println(" <div><a href=post.jsp> <button type=button> Click Here to Post a New Auction! </button></a>");
	out.println("<a href=editUser.jsp> <button type=button>Edit user details! </button></a>" );
	out.println("<a href=signOut.jsp> <button type=button>Sign Out! </button></a></div>" );
	out.println("<br><br><center> <h2>  Existing Offers  </h2> </center> <br><br>");
	out.println("<table><tr><th>Image</th><th>Title</th><th>Description</th><th>Auction End Date <br>(yyyy-mm-dd)</th>");
	out.println("<th>Starting Price</th><th>Owner</th><th>Current Bid</th><th>Current Bid By</th><th>Winner</th><th>Actions</th></tr>");
	
	Connection conn = db.getConnection(); 
	
	
	
	PreparedStatement pstmt = conn.prepareStatement("select * from PostTable");
	
	ResultSet results = pstmt.executeQuery();
	
	while (results.next()) {
		
		String title = results.getString("title");
		Date endDate = results.getDate("enddate");
		String description = results.getString("description");
		String minPrice = results.getString("minPrice");
		String owner = results.getString("username");
		String currentBid = results.getString("currentBidPrice");
		String currentBidBy = results.getString("currentBidOwner");
		String userName = user.getUserName();
		String image = results.getString("photoName");
		int postID = results.getInt("postID");
		String winner = results.getString("Winner");
		String actionText;
		
		Date d = new Date();
		
		if(d.after(endDate) && winner==null)
		{
			PreparedStatement pstmt1 = conn.prepareStatement("update PostTable set winner=? where postID=?");
			pstmt1.setString(1, currentBidBy);
			pstmt1.setInt(2, postID);
			pstmt1.executeUpdate();
			winner = currentBidBy;
			pstmt1.close();
		}
		
		
		//Check if own bid or someone elses
		if(owner.equals(userName))
		{
			actionText = "<a href=editAuction.jsp?postID="+postID+"> Click to edit/delete your auction </a>";
		}
		else
		{
			actionText = "<a href=placeBid.jsp?postID="+postID+"> Click to place a bid </a>";
		}
	
		if(winner==null){winner = " "; }
		
		out.println("<tr><td><img src="+image+"></td><td>"+title+"</td><td>"+description+"</td><td>"+endDate+"</td>");
	    out.println("<td>"+minPrice+"</td><td>"+owner+"</td><td>"+currentBid+"</td><td>"+currentBidBy+"</td><td>"+winner+"</td><td>"+actionText+"</td></tr>");
	} 
	
	results.close();
	pstmt.close();
	
	out.println("</table");
	out.println("</body></html>");
	
	
	
%>
