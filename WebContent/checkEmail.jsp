<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

    <%@include file="db.jsp" %>

<%
String email=request.getParameter("email");
String qr="select * from user where Email=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1,email);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	response.sendRedirect("mailJSP.jsp?email="+email);
}else{
	response.sendRedirect("");
}
%>
