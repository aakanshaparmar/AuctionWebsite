<%@ page import="java.sql.*" %>

<%
	
    String password = request.getParameter("password");
	String emailID	= request.getParameter("emailid");
	String gender = request.getParameter("gender");
	String telno = request.getParameter("telNo");
	String address = request.getParameter("address");
	
%>

<!-- Connect to Database -->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" /> 
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 

<%

    Connection conn = db.getConnection(); 
	
	String userName = user.getUserName();
	
	String query = "UPDATE UserTable SET password = ?, email_id = ?, gender = ?, telephone_number = ?, address = ? WHERE username= ?";
	PreparedStatement pstmt = conn.prepareStatement(query);

	pstmt.setString(1, password);
	pstmt.setString(2, emailID);
	pstmt.setString(3, gender);
	pstmt.setString(4, telno);
	pstmt.setString(5, address);
	pstmt.setString(6, userName);
	
	
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