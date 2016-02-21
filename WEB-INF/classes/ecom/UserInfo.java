

package ecom;

public class UserInfo {
	
	String userName;
	String emailID;
	String gender;
	String telNo;
	String address;
	int noOfPosts; 
	String pass;
	boolean loggedIn = false;
	
	public void setUserName(String a) {
		userName = a;
	}
	
	public void setEmailID(String a) {
		emailID = a;
	}
	
	public void setGender(String a) {
		gender = a;
	}
	
	public void setTelNo(String a) {
		telNo = a;
	}
	
	public void setAddress (String a) {
		address = a;
	}
	
	public void setLoggedIn(boolean a) {
		loggedIn = a;	
	}

	public void setNoOfPosts(int a) {
		noOfPosts = a;
	}
	
	public void setPass(String a) {
		pass = a;
	}
		
	public String getUserName() {
		return userName;
	}
	
	public String getEmailID() {
		return emailID;
	}
	
	public String getGender() {
		return gender;
	}
	
	public String getTelNo() {
		return telNo;
	}
	
	public String getAddress() {
		return address;
	}
	
	public boolean getLoggedIn() {
		return loggedIn;
	}

	public int getNoOfPosts() {
		return noOfPosts;
	}
	
	public String getPass() {
		return pass;
	}
	
	
}
