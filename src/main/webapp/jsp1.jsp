<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","shanku");
	System.out.println("SUCCESS!");
	String pin=request.getParameter("pin");
	String name=request.getParameter("name");
	String branch=request.getParameter("branch");
	PreparedStatement ps=con.prepareStatement("insert into studentDetails(pin,name,branch)values(?,?,?)");
	ps.setString(1,pin);
	ps.setString(2,name);
	ps.setString(3,branch);
	int j=ps.executeUpdate();
	if(j>0)
		response.sendRedirect("html1.html");
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>