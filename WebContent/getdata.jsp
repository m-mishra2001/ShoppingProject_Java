<%@page import="java.sql.PreparedStatement"%>
<%@include file="db.jsp" %>
<%
String iname=request.getParameter("iname");
String pid=(String)session.getAttribute("pid");
String qr="update product set iname=? where product_id=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1,iname);
ps.setString(2,pid);
RequestDispatcher rd=request.getRequestDispatcher("Show.jsp");
int i=ps.executeUpdate();
if(i>0){
	rd.include(request,response);
	out.println("<script>window.alert('uploaded')</script>");
}else{
	rd.include(request, response);
	out.println("<script>window.alert(' not uploaded')</script>");
}
%>