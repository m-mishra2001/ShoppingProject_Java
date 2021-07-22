<%@page import="java.sql.PreparedStatement"%>
<%@include file="db.jsp"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String price=request.getParameter("price");
int P=Integer.parseInt(price);
String cat=request.getParameter("cat");
String comp=request.getParameter("comp");

String qr="update product set product_name=?,product_price=?,product_category=?,product_company=? where product_id=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1,name);
ps.setInt(2,P);
ps.setString(3,cat);
ps.setString(4,comp);
ps.setString(5,id);

int i=ps.executeUpdate();
if(i>0){
%>
	<jsp:include page="Show.jsp"></jsp:include>
	<script>window.alert('updated')</script>
<% 
}else{%>
	<jsp:include page="Show.jsp"></jsp:include>
	<script>window.alert(' not updated')</script>
<%}%>

%>