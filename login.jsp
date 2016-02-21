<%@ page import="java.sql.*" %>


<!-- Get Form Elements -->
<%
	String userName = request.getParameter("username");
    String password = request.getParameter("password");
%>

<!-- Connect to Database -->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" />
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 


<!-- check login credentials -->
<%

    Connection conn = db.getConnection(); 
	
	PreparedStatement pstmt = conn.prepareStatement(
		"select * from UserTable where username=? and password=?");
	
	pstmt.setString(1, userName);
	pstmt.setString(2, password);	
	
	ResultSet results = pstmt.executeQuery();
	
	if (results.next()) {
		user.setLoggedIn(true);
		user.setUserName(results.getString("username"));
		user.setEmailID(results.getString("email_id"));
		user.setGender(results.getString("gender"));
		user.setTelNo(results.getString("telephone_number"));
		user.setAddress(results.getString("address"));
		user.setPass(results.getString("password"));
		user.setNoOfPosts(results.getInt("numberOfPosts"));
	} else {
		user.setLoggedIn(false);
	}
	
	results.close();
	pstmt.close();
	
	String forwardURL = null;
	if (user.getLoggedIn()) {
		forwardURL = "homePage.jsp";
	} else {
		forwardURL = "error.jsp";
	} 

%>

<jsp:forward page="<%= forwardURL %>" />	