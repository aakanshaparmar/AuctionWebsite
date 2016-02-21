<%
	String userName = request.getParameter("username");
    String password = request.getParameter("password");
%>

<!-- Connect to Database -->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" />
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 


<!-- check login credentials -->
<%

String forwardURL = "index.jsp";

%>

<jsp:forward page="<%= forwardURL %>" />	