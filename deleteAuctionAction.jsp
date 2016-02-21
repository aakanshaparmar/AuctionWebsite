<%@ page import="java.sql.*" %>


<!-- Get Form Elements -->
<%
	String postID = request.getParameter("postID");
	
%>

<!-- Connect to Database -->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" />
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 

<%
	Connection conn = db.getConnection(); 
	PreparedStatement pstmt = conn.prepareStatement("DELETE FROM PostTable WHERE postID = ? ");

	pstmt.setString(1, postID);
	
	pstmt.executeUpdate();
	
	String forwardURL = "homePage.jsp";
%>

<jsp:forward page="<%= forwardURL %>" />	