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
 try
    {
    
	 Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","shanku");
     Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("select * from mytable");
     ResultSetMetaData rm=rs.getMetaData();
     int col=rm.getColumnCount();
     while(rs.next())
     {
    	 out.print("<style>");
    	 out.print(".table1{border:2px solid red;}");
    	 out.print("</style>");
        out.print("<html><body><table class='table1'>"); 
        out.print("<tr class='tr1'>");
      
      for(int i=1;i<=col;i++)
       {
    	 
         out.print("<td class='td1'>"+rs.getString(i)+"</td>");
          
        }
      out.print("</tr>");
      out.println("</table></body></html>");
     }
	rs.close();
	st.close();
	con.close();
     }
   catch(Exception e)
   { 
   }%>
</body>
</html>