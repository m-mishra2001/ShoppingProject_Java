<%@page import="java.sql.PreparedStatement"%>
<%@include file="db.jsp" %>
<%
String email=(String) session.getAttribute("id");
String id=request.getParameter("id");
String name=request.getParameter("name");
String P=request.getParameter("price");
int price=Integer.parseInt(P);
String cat=request.getParameter("cat");
String comp=request.getParameter("comp");
String qr="insert into Cart values(?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, id);
ps.setString(2, name);
ps.setInt(3, price);
ps.setString(4, cat);
ps.setString(5, comp);
ps.setString(6, email);
int i=ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("uhome.jsp");

if(i>0){
	rd.include(request, response);
	out.println("<script>window.alert('sucessfully added to cart');</script>");

}else{
	rd.include(request, response);
	out.println("<script>window.alert('There may be some issue not adeed  to cart');</script>");
} %>

