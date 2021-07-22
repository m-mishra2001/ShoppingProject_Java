<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>iSolution</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />

<link href="https://kit-pro.fontawesome.com/releases/v5.15.3/css/pro.min.css" rel="stylesheet">

<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller-700.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
 

</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>
      <div class="logo">
      <h2><a href="index.html">Web <span class="style1">Mart</span></h2>
      <%
HttpSession s=request.getSession();
String id=(String)s.getAttribute("id");
%>
        <h3><span style="background-color:white;border:3px grey solid"> <%=id%></span>
<a href="Logout" style="background-color:white;border:3px grey solid">Logout</a>
<a href="viewCart.jsp"><i class="fas fa-cart-plus" style="font-size:20px"></i></a></h3>

        
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>Home Page</span></a></li>
          <li><a href="support.html"><span>Support</span></a></li>
          <li><a href="about.html"><span>About Us</span></a></li>
          <li><a href="blog.html"><span>Blog</span></a></li>
          <li><a href="contact.html"><span>Contact Us</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /><span><big>Sed condimentum justo sit amet urna ornare euismod.</big><br />
          Tusce nec iaculis risus hasellus nec sem sed tellus malesuada porttitor. Mauris scelerisque feugiat ante in vulputate. Nam sit amet ullamcorper tortor. Phasellus posuere facilisis cursus. Nunc est lorem, dictum at scelerisque sit amet, faucibus et est. Proin mattis ipsum quis arcu aliquam molestie.</span></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /><span><big>Amet urna ornare euismodSed condimentum.</big><br />
          Tusce nec iaculis risus hasellus nec sem sed tellus malesuada porttitor. Mauris scelerisque feugiat ante in vulputate. Nam sit amet ullamcorper tortor. Phasellus posuere facilisis cursus. Nunc est lorem, dictum at scelerisque sit amet, faucibus et est. Proin mattis ipsum quis arcu aliquam molestie.</span></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /><span><big>Sed condimentum justo sit amet urna ornare euismod.</big><br />
          Tusce nec iaculis risus hasellus nec sem sed tellus malesuada porttitor. Mauris scelerisque feugiat ante in vulputate. Nam sit amet ullamcorper tortor. Phasellus posuere facilisis cursus. Nunc est lorem, dictum at scelerisque sit amet, faucibus et est. Proin mattis ipsum quis arcu aliquam molestie.</span></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="db.jsp" %>

<h2 align=center>Our Services</h2>
<%
String qr="select * from product";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
if(rs.next()){
	
	do{String pid=rs.getString("product_id") ;
	String price=rs.getString("product_price") ;
	String name=rs.getString("product_name") ;
	String cat=rs.getString("product_category") ;
	String comp=rs.getString("product_company") ;
    String iname=rs.getString("iname");
		%>
		<div height="500px"   style="background-color:#32427d;border-radius:10px;border:3px #5d6069 solid;display:inline-block;float:left;margin:20px" align="center">
		<img src="<%=iname %>" alt="" width=100px height=100px style="margin-top:10px	" /><br></br>
		Product Name:=<%=rs.getString("product_name") %><br>
		Product Price:=<%=rs.getString("product_price") %><br>
	    Product Category:=<%=rs.getString("product_category") %><br>
	    Product Company:=<%=rs.getString("product_company") %><br>
	    
	    <a href="https://www.paypal.com/signin">Buy Now</a> 
	   <form action="Cart.jsp" method="post">
	   <input type="hidden" name="id" value="<%=pid %>" >
	   <input type="hidden" name="name" value="<%=name %>" >
	   <input type="hidden" name="price" value="<%=price %>" >
	   <input type="hidden" name="cat" value="<%=cat %>" >
	   <input type="hidden" name="comp" value="<%=comp %>" >
	   <input type="submit" value="add to cart">
	   </form>
		</div>
		
		
		
		<%
	}while(rs.next());
	
}


%>



      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
		
		
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&copy; Copyright <a href="#">MyWebSite</a>.</p>
      <p class="rf">Design by Dream <a href="http://www.dreamtemplate.com/">Web Templates</a></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div>


</body>
</html>
