<%@ page import="java.sql.*" %>


<!-- Get Form Elements -->
<%
	String newBid = request.getParameter("newBid");
	String postID = request.getParameter("postID");
	
%>

<!-- Connect to Database -->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" />
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 

<%
	String bidder = user.getUserName();
	
	out.println("<html><head>");
	out.println("<link rel=stylesheet type=text/css href=mystyle.css>");
	out.println("<title>Item Details</title></head>");
	out.println("<body> <center> <h1>Item Details </h1> </center> ");
	
	Connection conn = db.getConnection(); 
	
	PreparedStatement pstmt1 = conn.prepareStatement("SELECT currentBidPrice, minPrice FROM PostTable WHERE postID = ? ");
	pstmt1.setString(1, postID);
	
	ResultSet result = pstmt1.executeQuery();
	
	String oldBid="0";
	String originalBid="0";
	if(result.next())
	{
		oldBid = result.getString("currentBidPrice");
		originalBid=result.getString("minPrice");
	
	}
	
	int a = Integer.parseInt(oldBid);
	int b = Integer.parseInt(newBid);
    int c = Integer.parseInt(originalBid);
	
	if((b>a) && (b>c))
	{
	out.println("YOYOYOY");
	PreparedStatement pstmt = conn.prepareStatement("UPDATE PostTable SET currentBidPrice = ?, currentBidOwner = ? WHERE postID = ? ");

	pstmt.setString(1, newBid);
	pstmt.setString(2, bidder);
	pstmt.setString(3, postID);
	
	pstmt.executeUpdate();
	}
	String forwardURL = "homePage.jsp";
%>

<jsp:forward page="<%= forwardURL %>" />	