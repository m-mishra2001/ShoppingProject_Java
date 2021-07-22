


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="db.jsp" %>
<%

String id=request.getParameter("id");
String qr="delete from product where product_id=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, id);
int i=ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("Show.jsp");
if(i>0){

	
	rd.include(request, response);
	out.println("<script>window.alert('product  deleted')</script>");
}else{
	rd.include(request, response);
	out.println("<script>window.alert('product not deleted')</script>");
}
%>