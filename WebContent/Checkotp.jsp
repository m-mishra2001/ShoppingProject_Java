<%
String otp=request.getParameter("ot");
String ot=(String)session.getAttribute("otp");
if(otp.equals(ot)){
	out.println("correct");
}else{
	out.println("wrong");
}
%>