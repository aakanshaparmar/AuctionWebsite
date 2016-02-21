<%@ page import="java.sql.*" %>


<!-- Get Form Elements -->
<%
	String postID = request.getParameter("postID");
	String title = request.getParameter("title");
	String endDate = request.getParameter("endDate");
	String description = request.getParameter("description");
	String minPrice = request.getParameter("minPrice");
	
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
	
	PreparedStatement pstmt = conn.prepareStatement("UPDATE PostTable SET title = ?, description = ?, minPrice = ?, endDate = ? WHERE postID = ? ");

	pstmt.setString(1, title);
	pstmt.setString(2, description);
	pstmt.setString(3, minPrice);
	pstmt.setString(4, endDate);
	pstmt.setString(5, postID);
	
	pstmt.executeUpdate();
	
	String forwardURL = "homePage.jsp";
%>

<jsp:forward page="<%= forwardURL %>" />	