<%@ page import="java.sql.*" %>

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" /> 
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" /> 

<%

String password = user.getPass();
String email = user.getEmailID();
String gender = user.getGender();
String telNo= user.getTelNo();
String address = user.getAddress();


out.println("<html><head><title>User Information Edit Page</title></head>");

out.println("<body marginwidth=0 marginheight=0 leftmargin=0 rightmargin=0 topmargin=0 bottommargin=0>");

out.println("<br> <br> <br> <center> <h1> Review and Edit User Information! </h1> </center> <br> <br>");

out.println("<center> <form name=editUserForm method=POST action=editUserAction.jsp> <table> ");

out.println("<tr><td> <h3> Password:</td><td> <input type=password name=password value="+password+" required></h3> </td></tr>");

out.println(" <tr><td> <h3> Email Address:</td><td> <input type=text name=emailid value="+email+" required></h3></td></tr> ");

out.println(" <tr><td> <h3> Gender:</td><td> <input type=text name=gender value="+gender+" required></h3></td></tr>");

out.println(" <tr><td> <h3> Telephone Number:</td><td> <input type=text name=telNo value="+telNo+" required></h3></td></tr>");

out.println("<tr><td> <h3> Address:</td><td> <input type=text name=address value="+address+" required></h3></td></tr> ");

out.println("</table><br><br><input type=Submit value=Update></form></center>");

out.println("<form method=POST action=homePage.jsp>  <center><input type=Submit value=Back></center></form>");

out.println("<form method=POST action=signOut.jsp> <center> <input type=Submit value=SignOut></center</form></body></html>");


%>