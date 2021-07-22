<%@page import="java.sql.PreparedStatement"%>
<%@include file="db.jsp" %>
<%
String email=(String)session.getAttribute("id");
String pid=request.getParameter("pid");
String qr="delete from cart where id=? and Email=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1,pid);
ps.setString(2,email);
int i=ps.executeUpdate();
if(i>0){
	response.sendRedirect("viewCart.jsp");
}else{
	response.sendRedirect("viewCart.jsp");
}
%>