<%@ page import="java.sql.*" %>


<!-- Get Form Elements -->
<%
	String userName = request.getParameter("username");
    String password = request.getParameter("password");
	String emailID	= request.getParameter("emailid");
	String gender = request.getParameter("gender");
	String telno = request.getParameter("telNo");
	String address = request.getParameter("address");
	String numberOfPosts = "0";
%>

<!-- Connect to Database -->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" /> 
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 


<!-- check login credentials -->

<%

    Connection conn = db.getConnection(); 
	
	String query = "INSERT INTO UserTable(username, password, email_id, gender, telephone_number, address, numberOfPosts) values(?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(query);

	pstmt.setString(1, userName);
	pstmt.setString(2, password);
	pstmt.setString(3, emailID);
	pstmt.setString(4, gender);
	pstmt.setString(5, telno);
	pstmt.setString(6, address);
	pstmt.setString(7, numberOfPosts);
	
	pstmt.executeUpdate(); 
	
	user.setLoggedIn(true);
	user.setUserName(userName);
	user.setEmailID(emailID);
	user.setGender(gender);
	user.setTelNo(telno);
	user.setAddress(address);
	user.setPass(password);
	
	
	pstmt.close(); 
	
	String forwardURL = null;
	forwardURL = "homePage.jsp";
	

%>

<jsp:forward page="<%= forwardURL %>" />	