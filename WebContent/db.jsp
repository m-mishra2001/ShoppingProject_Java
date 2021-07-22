<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="error.jsp" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava","root","");

%>