<%@ page import="java.sql.*" %>



<!-- Get Form Elements -->
<%
	String title = request.getParameter("title");
    String description = request.getParameter("description");
	String minPrice = request.getParameter("minPrice");
	String endDate = request.getParameter("enddate");
	String image = request.getParameter("itemImage");
	
%>
	
<!-- Connect to Database -->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" />
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 
	
<%
	Connection conn = db.getConnection(); 
	int noOfPosts = user.getNoOfPosts();
	noOfPosts = noOfPosts+1;
	user.setNoOfPosts(noOfPosts);
	String userName = user.getUserName();
	String currentBidPrice="0";
	
	
	String query = "INSERT INTO PostTable(postID, title, description, photoName, endDate, minPrice, userName, currentBidPrice, currentBidOwner) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(query);
	
	String query1= "SELECT COUNT(*) AS TOTAL FROM PostTable";
	PreparedStatement pstmt1 = conn.prepareStatement(query1);

	ResultSet result = pstmt1.executeQuery();;
	
	
	if(result.next())
	{pstmt.setString(1, result.getString("TOTAL"));}
	pstmt.setString(2, title);
	pstmt.setString(3, description);
	pstmt.setString(4, image);
	pstmt.setString(5, endDate);
	pstmt.setString(6, minPrice);
	pstmt.setString(7, userName);	
	pstmt.setString(8, currentBidPrice);
	pstmt.setString (9,"None");
	
	pstmt.executeUpdate();
	
	
	pstmt.close();
	
	String forwardURL = null;
	forwardURL = "homePage.jsp"; 

%>

	
<jsp:forward page="<%= forwardURL %>" />	